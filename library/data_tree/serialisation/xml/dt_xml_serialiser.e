note
	component:   "Eiffel Object Modelling Framework"
	description: "Serialise Data Tree structure to any tagged format"
	keywords:    "serialisation, XML"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class DT_XML_SERIALISER

inherit
	DT_SERIALISER
		redefine
			make, reset
		end

	DT_STRING_UTILITIES
		export
			{NONE} all
		end

	SHARED_XML_RULES
		export
			{NONE} all
		end

create
	make

feature -- Definitions

	Default_doc_tag: STRING = "UNKNOWN_DOCUMENT_TYPE"

	Default_doc_version: STRING = "1.0"

	Default_doc_encoding: STRING = "utf-8"

	Standard_doc_namespaces: HASH_TABLE [STRING, STRING]
		once
			create Result.make (0)
			Result.put ("http://www.w3.org/2001/XMLSchema-instance", "xmlns:xsi")
			Result.put ("http://www.w3.org/2001/XMLSchema", "xmlns:xsd")
		end

	Doc_type_attribute_name: STRING = "artefact_type"

feature -- Initialisation

	make (a_profile: SERIALISATION_PROFILE)
			-- set profile
		do
			precursor (a_profile)
			create xml_ns_list.make (0)
			create xml_printer.make_null
			xml_printer.set_indent ("    ")
		end

feature -- Modification

	start_complex_object_node (a_node: DT_COMPLEX_OBJECT; depth: INTEGER)
			-- start serialising an DT_COMPLEX_OBJECT_NODE
		local
			xml_ns: XML_NAMESPACE
			xml_elem, xml_root_elem: XML_ELEMENT
		do
			if not checked_for_rules or xml_rules_out_of_date then
				if xml_rules.serialisation_rules.has (a_node.im_type_name) and attached xml_rules.serialisation_rules.item (a_node.im_type_name) as att_rules then
					serialisation_rules := att_rules
				else
					create serialisation_rules.make
				end
				checked_for_rules := True
			end

			-- if we are on the root node, output the XML header
			if a_node.is_root then
				create xml_ns_list.make (0)

				-- standard namespaces
				across Standard_doc_namespaces as ns_csr loop
					create xml_ns.make (ns_csr.key, ns_csr.item)
					xml_ns_list.put (xml_ns, ns_csr.key)
				end

				-- rules file namespaces
				across serialisation_rules.doc_other_namespaces as ns_csr loop
					create xml_ns.make (ns_csr.key, ns_csr.item)
					xml_ns_list.force (xml_ns, ns_csr.key)
				end

				-- default namespace
				create xml_default_ns.make ("", serialisation_rules.doc_default_namespace)

				-- root element
				if a_node.has_attribute (Doc_type_attribute_name) and then attached a_node.attribute_node (Doc_type_attribute_name) as att_dt_attr
					and then att_dt_attr.child_count > 0 and then attached {DT_PRIMITIVE_OBJECT} att_dt_attr.first_child as dt_p_o
				then
					doc_tag_value := dt_p_o.value.out
				else
					doc_tag_value := default_doc_tag
				end
				create xml_root_elem.make_root (xml_document, doc_tag_value, xml_default_ns)
				xml_nodes.extend ([xml_root_elem, create {ARRAYED_LIST [DT_ATTRIBUTE]}.make (0)])
				-- add the other namespaces as attributes
				across xml_ns_list as ns_csr loop
					xml_root_elem.add_unqualified_attribute (ns_csr.key, ns_csr.item.uri)
				end
				if attached xml_attrs_for_dt_complex_object (a_node) as att_xml_attrs then
					across att_xml_attrs as xml_attrs_csr loop
						xml_root_elem.add_unqualified_attribute (xml_attrs_csr.key, xml_attrs_csr.item)
					end
				end

			-- only output object if it's inside a container, otherwise it was output due to the attribute above
			elseif attached a_node.parent as att_dt_attr and then att_dt_attr.is_container_type then
				-- output the starting tag with attributes
				create xml_elem.make_last (xml_nodes.item.node, att_dt_attr.im_attr_name, xml_default_ns)
				xml_nodes.extend ([xml_elem, create {ARRAYED_LIST [DT_ATTRIBUTE]}.make (0)])
				if attached xml_attrs_for_dt_complex_object (a_node) as att_xml_attrs then
					across att_xml_attrs as xml_attrs_csr loop
						xml_elem.add_unqualified_attribute (xml_attrs_csr.key, xml_attrs_csr.item)
					end
				end
			end
		end

	end_complex_object_node (a_node: DT_COMPLEX_OBJECT; depth: INTEGER)
			-- end serialising an DT_COMPLEX_OBJECT_NODE
		local
			xmlns_generator: XML_XMLNS_GENERATOR
		do
			if a_node.is_root then
				-- OUTPUT DOCUMENT
				xml_printer.set_output_to_string_32
				create xmlns_generator.set_next (xml_printer)
				xml_document.process_to_events (xmlns_generator)
				if attached xml_printer.last_output as att_xml_text then
					last_result.append (att_xml_text)
				end
			elseif attached a_node.parent as att_dt_attr and then att_dt_attr.is_container_type then
				xml_nodes.remove
			end
		end

	start_attribute_node (a_node: DT_ATTRIBUTE; depth: INTEGER)
			-- start serialising an DT_ATTRIBUTE_NODE
		local
			xml_attrs: detachable HASH_TABLE [STRING, STRING]
			xml_elem: XML_ELEMENT
		do
			if not xml_nodes.item.xml_attrs.has (a_node) then
				-- don't output tag if a container type, since tags come out with each object rather than
				-- the attribute in that case
				if not a_node.is_container_type and not (attached {DT_PRIMITIVE_OBJECT_LIST} a_node.first_child or
					attached {DT_PRIMITIVE_OBJECT_INTERVAL_LIST} a_node.first_child or
					attached {DT_OBJECT_REFERENCE_LIST} a_node.first_child)
				then
					-- if we are on single-valued node, look at child, and see if there are
					-- any rules for that type in the rule set for the overall context
					create xml_elem.make_last (xml_nodes.item.node, a_node.im_attr_name, xml_default_ns)
					xml_nodes.extend ([xml_elem, xml_nodes.item.xml_attrs])
					if attached {DT_COMPLEX_OBJECT} a_node.first_child as dt_obj and then attached xml_attrs_for_dt_complex_object (dt_obj) as att_xml_attrs then
						across att_xml_attrs as xml_attrs_csr loop
							xml_elem.add_unqualified_attribute (xml_attrs_csr.key, xml_attrs_csr.item)
						end
					end
				end
			end
		end

	end_attribute_node (a_node: DT_ATTRIBUTE; depth: INTEGER)
			-- end serialising an DT_ATTRIBUTE_NODE
		do
			if not xml_nodes.item.xml_attrs.has (a_node) then
				if not a_node.is_container_type and not (attached {DT_PRIMITIVE_OBJECT_LIST} a_node.first_child or
					attached {DT_PRIMITIVE_OBJECT_INTERVAL_LIST} a_node.first_child or
					attached {DT_OBJECT_REFERENCE_LIST} a_node.first_child)
				then
					xml_nodes.remove
				end
			end
		end

	start_primitive_object (a_node: DT_PRIMITIVE_OBJECT; depth: INTEGER)
			-- start serialising a DT_PRIMITIVE_OBJECT
		local
			xml_elem: XML_ELEMENT
			xml_val: XML_CHARACTER_DATA
		do
			if attached a_node.parent as parent_dt_attr and then not xml_nodes.item.xml_attrs.has (parent_dt_attr) then
				-- generate an XML tag if object in a container
				if parent_dt_attr.is_container_type then
					create xml_elem.make_last (xml_nodes.item.node, parent_dt_attr.im_attr_name, xml_default_ns)
					if attached xml_attrs_for_dt_primitive_object (a_node) as att_xml_attrs then
						across att_xml_attrs as xml_attrs_csr loop
							xml_elem.add_unqualified_attribute (xml_attrs_csr.key, xml_attrs_csr.item)
						end
					end
				else
					xml_elem := xml_nodes.item.node
				end
				create xml_val.make_last (xml_elem, a_node.as_serialised_string (agent primitive_value_to_xml_string, Void))
			end
		end

	end_primitive_object (a_node: DT_PRIMITIVE_OBJECT; depth: INTEGER)
			-- end serialising a DT_PRIMITIVE_OBJECT
		do
		end

	start_primitive_object_list (a_node: DT_PRIMITIVE_OBJECT_LIST; depth: INTEGER)
			-- start serialising an DT_PRIMITIVE_OBJECT_LIST
		local
			seq: SEQUENCE [ANY]
		do
			-- generate an XML tag if object in a container
			if attached a_node.parent as att_dt_attr then
				seq := a_node.value
				from seq.start until seq.off loop
					add_primitive_value_xml_element (xml_nodes.item.node, att_dt_attr.im_attr_name, seq.item)
					seq.forth
				end
			end
		end

	end_primitive_object_list (a_node: DT_PRIMITIVE_OBJECT_LIST; depth: INTEGER)
			-- end serialising an DT_PRIMITIVE_OBJECT_LIST
		do
		end

	start_primitive_object_interval (a_node: DT_PRIMITIVE_OBJECT_INTERVAL; depth: INTEGER)
			-- start serialising a DT_PRIMITIVE_OBJECT_INTERVAL
		do
			-- generate an XML tag if object in a container
			if attached a_node.parent as att_dt_attr and then att_dt_attr.is_container_type then
				add_primitive_interval_to_xml_element (xml_nodes.item.node, att_dt_attr.im_attr_name, a_node.value)
			end

		end

	end_primitive_object_interval (a_node: DT_PRIMITIVE_OBJECT_INTERVAL; depth: INTEGER)
			-- end serialising a DT_PRIMITIVE_OBJECT_INTERVAL
		do
		end

	start_primitive_object_interval_list (a_node: DT_PRIMITIVE_OBJECT_INTERVAL_LIST; depth: INTEGER)
			-- start serialising a DT_PRIMITIVE_OBJECT_INTERVAL_LIST
		do
			if attached a_node.parent as att_dt_attr then
				across a_node.value as ivl_csr loop
					add_primitive_interval_to_xml_element (xml_nodes.item.node, att_dt_attr.im_attr_name, ivl_csr.item)
				end
			end
		end

	end_primitive_object_interval_list (a_node: DT_PRIMITIVE_OBJECT_INTERVAL_LIST; depth: INTEGER)
			-- end serialising a DT_OBJECT_SIMPLE
		do
		end

	start_object_reference (a_node: DT_OBJECT_REFERENCE; depth: INTEGER)
			-- start serialising a DT_OBJECT_REFERENCE
		local
			xml_elem: XML_ELEMENT
			xml_val: XML_CHARACTER_DATA
		do
			if attached a_node.parent as att_dt_attr and then att_dt_attr.is_container_type then
				create xml_elem.make_last (xml_nodes.item.node, att_dt_attr.im_attr_name, xml_default_ns)
			else
				xml_elem := xml_nodes.item.node
			end
			create xml_val.make_last (xml_elem, a_node.value.as_string)
		end

	end_object_reference (a_node: DT_OBJECT_REFERENCE; depth: INTEGER)
			-- end serialising a DT_OBJECT_REFERENCE
		do
		end

	start_object_reference_list (a_node: DT_OBJECT_REFERENCE_LIST; depth: INTEGER)
			-- start serialising a DT_OBJECT_REFERENCE_LIST
		local
			xml_parent_node: XML_ELEMENT
			xml_elem: XML_ELEMENT
			xml_val: XML_CHARACTER_DATA
		do
			-- generate an XML tag if object in a container
			if attached a_node.parent as att_dt_attr then
				xml_parent_node := xml_nodes.item.node
				across a_node.value as refs_csr loop
					create xml_elem.make_last (xml_parent_node, att_dt_attr.im_attr_name, xml_default_ns)
					create xml_val.make_last (xml_elem, refs_csr.item.as_string)
				end
			end
		end

	end_object_reference_list (a_node: DT_OBJECT_REFERENCE_LIST; depth: INTEGER)
			-- end serialising a DT_OBJECT_REFERENCE_LIST
		do
		end

feature -- Commands

	reset
			-- set up serialiser
		local
			xml_decl: XML_DECLARATION
		do
			precursor
			checked_for_rules := False
			create serialisation_rules.make

			-- set up boilerplate parts of XML document
			create xml_decl.make_in_document (xml_document, Default_doc_version, Default_doc_encoding, False)
		end

feature {NONE} -- Implementation

	xml_printer: XML_INDENT_PRETTY_PRINT_FILTER

	xml_default_ns: XML_NAMESPACE
		attribute
			create Result.make_default
		end

	xml_ns_list: HASH_TABLE [XML_NAMESPACE, STRING]

	xml_document: XML_DOCUMENT
			-- generated XML document used to create final serialised output
		attribute
			create Result.make
		end

	xml_nodes: ARRAYED_STACK [TUPLE [node: XML_ELEMENT; xml_attrs: ARRAYED_LIST [DT_ATTRIBUTE]]]
		attribute
			create Result.make (0)
		end

	serialisation_rules: XML_SERIALISATION_RULES
			-- serialisation rules for the type of the root object being processed here
		attribute
			create Result.make
		end

	checked_for_rules: BOOLEAN
			-- flag to indicate that a check was done for XML rules at beginning of run (i.e. at
			-- entry into root DT object)

	doc_tag_value: STRING
			-- document level tag string
		attribute
			create Result.make_empty
		end

	xml_attrs_for_dt_complex_object (a_dt_obj: DT_COMPLEX_OBJECT): detachable HASH_TABLE [STRING, STRING]
			-- generate XML attribute table for `a_dt_obj' based on XML rules, if any found
		do
			create Result.make (0)

			-- put the DT node id in the result for ids that are not just numbers (numbers are generated in
			-- the DT structure for any LIST structure, i.e. where there are no available keys).
			if a_dt_obj.is_addressable and not a_dt_obj.id.is_integer then
				Result.put (a_dt_obj.id, "id")
			end

			if attached serialisation_rules.rules_for_type (a_dt_obj.im_type_name) as type_rules then

				-- put the IM type name in the XML attributes
				if type_rules.output_dt_im_type_name_as_xml_attr then
					if a_dt_obj.is_typed then
						Result.put (a_dt_obj.im_type_name, xsi_type_marker)
					end
				end

				-- for each rule of type 'convert object value to XML attribute', see if the attribute exists
				-- and if so, construct the appropriate XML attribute information to put into the tag, below
				across type_rules.convert_to_xml_attr_attr_names as cvt_names_csr loop
					if a_dt_obj.has_attribute (cvt_names_csr.item) and then
						attached a_dt_obj.attribute_node (cvt_names_csr.item) as dt_attr and then attached {DT_PRIMITIVE_OBJECT} dt_attr.first_child as dt_po
					then
						-- however, don't output booleans with value 'false'
						if not (attached {BOOLEAN} dt_po.value as att_bool and then not att_bool) then
							Result.put (dt_po.as_serialised_string (agent primitive_value_to_xml_string, Void), cvt_names_csr.item)
						end
						xml_nodes.item.xml_attrs.extend (dt_attr)
					end
				end
			end
		end

	xml_attrs_for_dt_primitive_object (a_dt_obj: DT_PRIMITIVE_OBJECT): detachable HASH_TABLE [STRING, STRING]
			-- generate XML attribute table for `a_dt_obj' based on XML rules, if any found
		do
--			if attached serialisation_rules.rules_for_type (a_dt_obj.im_type_name) as type_rules then

				-- put the DT node id in the result for ids that are not just numbers (numbers are generated in
				-- the DT structure for any LIST structure, i.e. where there are no available keys).
				-- Currently just do this if there is a rule of any kind, without checking any details.
				if a_dt_obj.is_addressable and not a_dt_obj.id.is_integer then
					create Result.make (0)
					Result.put (a_dt_obj.id, "id")
				end

--				-- put the IM type name in the result
--				if type_rules.output_dt_im_type_name_as_xml_attr then
--					if a_dt_obj.is_typed then
--						Result.put (a_dt_obj.im_type_name, xsi_type_marker)
--					end
--				end
--			end
		end

	add_primitive_value_xml_element (a_parent_xml_elem: XML_ELEMENT; a_tag: STRING; a_prim_val: ANY)
			-- generate a XML-tagged string containing `a_prim_val'
		local
			xml_elem: XML_ELEMENT
			xml_val: XML_CHARACTER_DATA
		do
			create xml_elem.make_last (a_parent_xml_elem, a_tag, xml_default_ns)
			create xml_val.make_last (xml_elem, primitive_value_to_xml_string (a_prim_val))
		end

	add_primitive_interval_to_xml_element (a_parent_xml_elem: XML_ELEMENT; a_tag: STRING; value: INTERVAL[PART_COMPARABLE])
			-- generate XML structure for an interval of form
			-- <parent_elem>
			--		<a_tag lower_unbounded="false" lower_included="true">
			--			<lower>xxxxx<lower>
			--		</a_tag>
			-- </parent_elem>
		local
			xml_top_elem, xml_elem: XML_ELEMENT
			xml_val: XML_CHARACTER_DATA
		do
			create xml_top_elem.make_last (a_parent_xml_elem, a_tag, xml_default_ns)
			if value.lower_unbounded then
				xml_top_elem.add_unqualified_attribute ("lower_unbounded", primitive_value_to_xml_string (value.lower_unbounded))
			elseif attached value.lower as val_l then
				create xml_elem.make_last (xml_top_elem, "lower", xml_default_ns)
				create xml_val.make_last (xml_elem, primitive_value_to_xml_string (val_l))
				if not value.lower_included then
					xml_top_elem.add_unqualified_attribute ("lower_included", primitive_value_to_xml_string (value.lower_included))
				end
			end
			if value.upper_unbounded then
				xml_top_elem.add_unqualified_attribute ("upper_unbounded", primitive_value_to_xml_string (value.upper_unbounded))
			elseif attached value.upper as val_u and not value.is_point then
				create xml_elem.make_last (xml_top_elem, "upper", xml_default_ns)
				create xml_val.make_last (xml_elem, primitive_value_to_xml_string (val_u))
				if not value.upper_included then
					xml_top_elem.add_unqualified_attribute ("upper_included", primitive_value_to_xml_string (value.upper_included))
				end
			end
		end

	primitive_value_to_xml_string (a_prim_val: ANY): STRING
			-- generate a basic string
		do
			-- FIXME: duration.out does not exist in Eiffel, and in any case would not be ISO8601-compliant
			if attached {BOOLEAN} a_prim_val as a_bool then
				Result := a_prim_val.out.as_lower
			else
				Result := primitive_value_out (a_prim_val)
			end
		end

end


