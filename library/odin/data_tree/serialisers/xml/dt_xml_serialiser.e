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
			reset
		end

	XML_TOOLS
		export
			{NONE} all
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

feature -- Modification

	start_complex_object_node (a_node: DT_COMPLEX_OBJECT; depth: INTEGER)
			-- start serialising an DT_COMPLEX_OBJECT_NODE
		local
			doc_attr_name, doc_hdr: STRING
		do
			if not checked_for_rules and not attached serialisation_rules or xml_rules_out_of_date then
				if xml_rules.serialisation_rules.has (a_node.im_type_name) then
					serialisation_rules := xml_rules.serialisation_rules.item (a_node.im_type_name)
				else
					create serialisation_rules.make
				end
				checked_for_rules := True
			end

			-- if we are on the root node, output the XML header
			if a_node.is_root then
				if attached serialisation_rules.doc_header then
					doc_hdr := serialisation_rules.doc_header.twin
					if attached serialisation_rules.doc_tag then
						if serialisation_rules.doc_tag.item (1) = '$' then
							doc_attr_name := serialisation_rules.doc_tag.substring (2, serialisation_rules.doc_tag.count)
							if a_node.has_attribute (doc_attr_name) and then
								a_node.attribute_node (doc_attr_name).child_count > 0 and then
								attached {DT_PRIMITIVE_OBJECT} a_node.attribute_node (doc_attr_name).first_child as dt_p_o
							then
								doc_tag_value := dt_p_o.value.out
							else
								doc_tag_value := doc_attr_name
							end
						else
							doc_tag_value := serialisation_rules.doc_tag
						end
					else
						doc_tag_value := serialisation_rules.default_doc_tag
					end
					doc_hdr.replace_substring_all ("$doc_tag", doc_tag_value)
					last_result.append (doc_hdr + format_item(FMT_NEWLINE))
				else
					last_result.append (xml_tag_start (serialisation_rules.default_doc_tag, Void) + format_item (FMT_NEWLINE))
				end

			-- only output object-level tag for object inside a container
			elseif a_node.parent.is_container_type then
				-- output the starting tag with attributes
				last_result.append (create_indent (depth//2) + xml_tag_start (a_node.parent.im_attr_name,
					xml_attrs_for_dt_complex_object (a_node)) + format_item (FMT_NEWLINE))
			end
		end

	end_complex_object_node (a_node: DT_COMPLEX_OBJECT; depth: INTEGER)
			-- end serialising an DT_COMPLEX_OBJECT_NODE
		local
			doc_ftr: STRING
		do
			if a_node.is_root then
				-- if we are on the root node, output the XML footer
				if attached serialisation_rules.doc_footer then
					doc_ftr := serialisation_rules.doc_footer.twin
					doc_ftr.replace_substring_all ("$doc_tag", doc_tag_value)
					last_result.append (doc_ftr)
				else
					last_result.append (create_indent(depth//2))
					last_result.append (xml_tag_start (serialisation_rules.default_doc_tag, Void))
				end
				last_result.append (format_item(FMT_NEWLINE))

			-- end tag for items in a container
			elseif a_node.parent.is_container_type then
				last_result.append (create_indent(depth//2) + xml_tag_end (a_node.parent.im_attr_name) + format_item(FMT_NEWLINE))
			end
		end

	start_attribute_node (a_node: DT_ATTRIBUTE; depth: INTEGER)
			-- start serialising an DT_ATTRIBUTE_NODE
		local
			xml_attrs: detachable HASH_TABLE [STRING, STRING]
		do
			if dt_attr_nodes_to_ignore.has (a_node) then
				ignoring_dt_objects := True
			else
				-- don't output tag if a container type, since tags come out with each object rather than
				-- the attribute in that case
				if not a_node.is_container_type and not attached {DT_PRIMITIVE_OBJECT_LIST} a_node.first_child then
					-- if we are on single-valued node, look at child, and see if there are
					-- any rules for that type in the rule set for the overall context
					if attached {DT_COMPLEX_OBJECT} a_node.first_child as dt_obj then
						xml_attrs := xml_attrs_for_dt_complex_object (dt_obj)
					end
					last_result.append (create_indent (depth//2) + xml_tag_start (a_node.im_attr_name, xml_attrs) +
						format_item(FMT_NEWLINE))
				end
			end
		end

	end_attribute_node (a_node: DT_ATTRIBUTE; depth: INTEGER)
			-- end serialising an DT_ATTRIBUTE_NODE
		do
			if dt_attr_nodes_to_ignore.has (a_node) then
				ignoring_dt_objects := False
				dt_attr_nodes_to_ignore.prune (a_node)
			else
				if not a_node.is_container_type and not attached {DT_PRIMITIVE_OBJECT_LIST} a_node.first_child then
					-- output an indent unless a primitive type (in which case, tags are inline)
					if not last_object_primitive then
						last_result.append (create_indent (depth//2))
					end
					-- output the tag
					last_result.append (xml_tag_end (a_node.im_attr_name) + format_item(FMT_NEWLINE))
				end
				last_object_primitive := False
			end
		end

	start_primitive_object (a_node: DT_PRIMITIVE_OBJECT; depth: INTEGER)
			-- start serialising a DT_PRIMITIVE_OBJECT
		do
			if not ignoring_dt_objects then
				-- generate an XML tag if object in a container
				if a_node.parent.is_container_type then
					-- output indent + tag
					last_result.append (create_indent (depth//2) + xml_tag_start (a_node.parent.im_attr_name, xml_attrs_for_dt_primitive_object (a_node)))
				else
					last_result.remove_tail (format_item (FMT_NEWLINE).count)
				end
				last_result.append (a_node.as_serialised_string (agent primitive_value_to_simple_string, agent xml_quote))
				last_object_primitive := True
			end
		end

	end_primitive_object (a_node: DT_PRIMITIVE_OBJECT; depth: INTEGER)
			-- end serialising a DT_PRIMITIVE_OBJECT
		do
			if a_node.parent.is_container_type then
				last_result.append (xml_tag_end (a_node.parent.im_attr_name) + format_item(FMT_NEWLINE))
			end
		end

	start_primitive_object_list (a_node: DT_PRIMITIVE_OBJECT_LIST; depth: INTEGER)
			-- start serialising an DT_PRIMITIVE_OBJECT_LIST
		do
			-- generate an XML tag if object in a container
			last_result.append (a_node.as_serialised_string (
				agent primitive_value_to_xml_tagged_string (a_node.parent.im_attr_name, depth//2, ?),
				Void,
				Void,
				agent xml_quote))
			last_object_primitive := True
		end

	end_primitive_object_list (a_node: DT_PRIMITIVE_OBJECT_LIST; depth: INTEGER)
			-- end serialising an DT_PRIMITIVE_OBJECT_LIST
		do
		end

	start_primitive_object_interval (a_node: DT_PRIMITIVE_OBJECT_INTERVAL; depth: INTEGER)
			-- start serialising a DT_PRIMITIVE_OBJECT_INTERVAL
		local
			str: STRING
		do
			-- generate an XML tag if object in a container
			if a_node.parent.is_container_type then
				last_result.append (create_indent (depth//2) + xml_tag_start (a_node.parent.im_attr_name, Void))
			end

			-- generate value as a multi-line text
			str := primitive_interval_to_xml_tagged_string (a_node.value)
			last_result.append (indented (str, create_indent (depth//2 + 1)))
		end

	end_primitive_object_interval (a_node: DT_PRIMITIVE_OBJECT_INTERVAL; depth: INTEGER)
			-- end serialising a DT_PRIMITIVE_OBJECT_INTERVAL
		do
			if a_node.parent.is_container_type then
				last_result.append (create_indent (depth//2) + xml_tag_end (a_node.parent.im_attr_name) + format_item (FMT_NEWLINE))
			end
		end

	start_primitive_object_interval_list (a_node: DT_PRIMITIVE_OBJECT_INTERVAL_LIST; depth: INTEGER)
			-- start serialising a DT_OBJECT_SIMPLE
		do
			across a_node.value as ivl_csr loop
				-- don't bother with the first one because it already came out due to the parent attribute (XML containers!)
				if not ivl_csr.is_first then
					last_result.append (create_indent (depth//2) + xml_tag_start (a_node.parent.im_attr_name, Void) + format_item (FMT_NEWLINE))
				end
				last_result.append (indented (primitive_interval_to_xml_tagged_string (ivl_csr.item), create_indent (depth//2 + 1)))

				-- don't bother with the last one because it will come out due to the parent attribute (XML containers!)
				if not ivl_csr.is_last then
					last_result.append (create_indent (depth//2) + xml_tag_end (a_node.parent.im_attr_name) + format_item (FMT_NEWLINE))
				end
			end
		end

	end_primitive_object_interval_list (a_node: DT_PRIMITIVE_OBJECT_INTERVAL_LIST; depth: INTEGER)
			-- end serialising a DT_OBJECT_SIMPLE
		do
		end

	start_object_reference (a_node: DT_OBJECT_REFERENCE; depth: INTEGER)
			-- start serialising a DT_OBJECT_REFERENCE
		do
			start_object_leaf (a_node, depth)
			last_object_primitive := True
		end

	end_object_reference (a_node: DT_OBJECT_REFERENCE; depth: INTEGER)
			-- end serialising a DT_OBJECT_REFERENCE
		do
			if a_node.parent.is_container_type then
				last_result.append (xml_tag_end (a_node.parent.im_attr_name) + format_item(FMT_NEWLINE))
			end
		end

	start_object_reference_list (a_node: DT_OBJECT_REFERENCE_LIST; depth: INTEGER)
			-- start serialising a DT_OBJECT_REFERENCE_LIST
		do
			start_object_leaf (a_node, depth)
			last_object_primitive := True
		end

	end_object_reference_list (a_node: DT_OBJECT_REFERENCE_LIST; depth: INTEGER)
			-- end serialising a DT_OBJECT_REFERENCE_LIST
		do
			if a_node.parent.is_container_type then
				last_result.append (xml_tag_end (a_node.parent.im_attr_name) + format_item(FMT_NEWLINE))
			end
		end

feature -- Commands

	reset
			-- set up serialiser
		do
			precursor
			checked_for_rules := False
			serialisation_rules := Void
			ignoring_dt_objects := False
		end

feature {NONE} -- Implementation

	serialisation_rules: detachable XML_SERIALISATION_RULES
			-- serialisation rules for the type of the root object being processed here

	last_object_primitive: BOOLEAN
			-- True if last object traversed was a DT_PRIMITIVE_XX object

	ignoring_dt_objects: BOOLEAN
			-- True if currently ignoring DT objects; only applies to primitive objects under single-value attributes

	checked_for_rules: BOOLEAN
			-- flag to indicate that a check was done for XML rules at beginning of run (i.e. at
			-- entry into root DT object)

	doc_tag_value: STRING
			-- document level tag string
		attribute
			create Result.make_empty
		end

	start_object_leaf (a_node: DT_OBJECT_LEAF; depth: INTEGER)
			-- start serialising a DT_OBJECT_LEAF
		do
			-- generate an XML tag if object in a container
			if a_node.parent.is_container_type then
				last_result.append (create_indent (depth//2) + xml_tag_start (a_node.parent.im_attr_name, Void))
			else
				last_result.remove_tail (format_item (FMT_NEWLINE).count)
			end
			last_result.append (a_node.as_string)
		end

	xml_attrs_for_dt_complex_object (a_dt_obj: DT_COMPLEX_OBJECT): detachable HASH_TABLE [STRING, STRING]
			-- generate XML attribute table for `a_dt_obj' based on XML rules, if any found
		do
			if attached serialisation_rules.rules_for_type (a_dt_obj.im_type_name) as type_rules then
				create Result.make (0)

				-- put the IM type name in the XML attributes
				if type_rules.output_dt_im_type_name_as_xml_attr then
					if a_dt_obj.is_typed then
						Result.put (a_dt_obj.im_type_name, "im:type")
					end
				end

				-- put the DT node id in the result for ids that are not just numbers (numbers are generated in
				-- the DT structure for any LIST structure, i.e. where there are no available keys).
				-- Currently just do this if there is a rule of any kind, without checking any details.
				if a_dt_obj.is_addressable and not a_dt_obj.id.is_integer then
					Result.put (a_dt_obj.id, "id")
				end

				-- for each rule of type 'convert object value to XML attribute', see if the attribute exists
				-- and if so, construct the appropriate XML attribute information to put into the tag, below
				across type_rules.convert_to_xml_attr_attr_names as cvt_names_csr loop
					if a_dt_obj.has_attribute (cvt_names_csr.item) and then
						attached a_dt_obj.attribute_node (cvt_names_csr.item) as dt_attr and then attached {DT_PRIMITIVE_OBJECT} dt_attr.first_child as dt_po
					then
						dt_attr_nodes_to_ignore.extend (dt_attr)
						Result.put (dt_po.value.out, cvt_names_csr.item)
					end
				end
			end
		end

	xml_attrs_for_dt_primitive_object (a_dt_obj: DT_PRIMITIVE_OBJECT): detachable HASH_TABLE [STRING, STRING]
			-- generate XML attribute table for `a_dt_obj' based on XML rules, if any found
		do
			if attached serialisation_rules.rules_for_type (a_dt_obj.im_type_name) as type_rules then
				create Result.make (0)

				-- put the DT node id in the result for ids that are not just numbers (numbers are generated in
				-- the DT structure for any LIST structure, i.e. where there are no available keys).
				-- Currently just do this if there is a rule of any kind, without checking any details.
				if a_dt_obj.is_addressable and not a_dt_obj.id.is_integer then
					Result.put (a_dt_obj.id, "id")
				end

--				-- put the IM type name in the result
--				if type_rules.output_dt_im_type_name_as_xml_attr then
--					if a_dt_obj.is_typed then
--						Result.put (a_dt_obj.im_type_name, "im:type")
--					end
--				end
			end
		end

	dt_attr_nodes_to_ignore: ARRAYED_LIST [DT_ATTRIBUTE]
		once
			create Result.make (0)
		end

	primitive_value_to_xml_tagged_string (a_tag: STRING; an_indent: INTEGER; a_prim_val: ANY): STRING
			-- generate a XML-tagged string containing `a_prim_val'
		do
			create Result.make_empty
			Result.append (create_indent (an_indent) + xml_tag_start (a_tag, Void))
			Result.append (primitive_value_to_simple_string (a_prim_val))
			Result.append (xml_tag_end (a_tag) + format_item(FMT_NEWLINE))
		end

	primitive_interval_to_xml_tagged_string (value: INTERVAL[PART_COMPARABLE]): STRING
			-- generate a structured, tagged form of this object
			-- FIXME: the 'to_reference' in the below should not be required, but BOOLEAN does not conform to ANY when it is an agent argument!
		do
			create Result.make(0)
			if value.lower_unbounded then
				Result.append (xml_tag_start ("lower_unbounded", Void))
				Result.append (primitive_value_to_simple_string (value.lower_unbounded))
				Result.append (xml_tag_end ("lower_unbounded"))
				Result.append ("%N")
			elseif attached value.lower as val_l then
				Result.append (xml_tag_start ("lower", Void))
				Result.append (primitive_value_to_simple_string (val_l))
				Result.append (xml_tag_end ("lower"))
				Result.append ("%N")
				if not value.lower_included then
					Result.append (xml_tag_start ("lower_included", Void))
					Result.append (primitive_value_to_simple_string (value.lower_included))
					Result.append (xml_tag_end ("lower_included"))
					Result.append ("%N")
				end
			end
			if value.upper_unbounded then
				Result.append (xml_tag_start ("upper_unbounded", Void))
				Result.append (primitive_value_to_simple_string (value.upper_unbounded))
				Result.append (xml_tag_end ("upper_unbounded"))
				Result.append ("%N")
			elseif attached value.upper as val_u and not value.is_point then
				Result.append (xml_tag_start ("upper", Void))
				Result.append (primitive_value_to_simple_string (val_u))
				Result.append (xml_tag_end ("upper"))
				Result.append ("%N")
				if not value.upper_included then
					Result.append (xml_tag_start ("upper_included", Void))
					Result.append (primitive_value_to_simple_string (value.upper_included.to_reference))
					Result.append (xml_tag_end ("upper_included"))
					Result.append ("%N")
				end
			end
		end

end


