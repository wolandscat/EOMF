note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Object containing rules for controlling XML serialisation of a apecific information type, 
				 e.g. 'ARCHETYPE', via DT graphs. Designed to be populated by reading an ODIN file.
				 ]"
	keywords:    "serialisation, XML"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "openEHR AWB project <http://www.openehr.org/issues/browse/AWB>"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class XML_SERIALISATION_RULES

inherit
	DT_TYPES
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

create
	make

feature -- Definitions

	Default_doc_tag: STRING = "UNKNOWN_DOCUMENT_TYPE"

	Default_doc_version: STRING = "1.0"

	Default_doc_encoding: STRING = "utf-8"

	Default_doc_header: STRING = "[
<?xml version="1.0" encoding="utf-8"?>
<$doc_tag xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns="http://schemas.openehr.org/v1">
	]"

	Default_doc_namespaces: HASH_TABLE [STRING, STRING]
		once
			create Result.make (0)
			Result.put ("http://www.w3.org/2001/XMLSchema-instance", "xmlns:xsi")
			Result.put ("http://www.w3.org/2001/XMLSchema", "xmlns:xsd")
			Result.put ("http://openehr.org/schemas/v1", "xmlns")
		end

feature -- Initialisation

	make
		do
			create im_class_rules.make (0)
			doc_version := Default_doc_version.twin
			doc_encoding := Default_doc_encoding.twin
			create doc_default_namespace.make_empty
			create doc_other_namespaces.make (0)
		end

feature -- Access (persistent features from .cfg file)

	im_class_rules: HASH_TABLE [XML_IM_CLASS_SERIALISATION_RULES, STRING]
			-- set of rules to do with IM class, keyed by class name to which they apply; this
			-- could include rules for more than one ancestor of a given class, so to get the
			-- full set of rules for type T, a 'flat' set has to be generated - done in `im_class_rules_by_type'

	doc_version: STRING
			-- version of XML

	doc_encoding: STRING
			-- encoding of XML

	doc_default_namespace: STRING
			-- default namespace declarations

	doc_other_namespaces: HASH_TABLE [STRING, STRING]
			-- root node namespace declarations

feature -- Access

	im_class_flat_rules_by_type: HASH_TABLE [detachable XML_IM_CLASS_SERIALISATION_RULES, STRING]
			-- set of rules to do with IM class, based on `im_class_rules' but with
			-- entry for every concrete type requested through `rules_for_type' that
			-- conforms to a type in `im_class_rules'
		attribute
			create Result.make (0)
		end

	rules_for_type (a_type_name: STRING): detachable XML_IM_CLASS_SERIALISATION_RULES
			-- get rules for `a_type_name', including any rules defined for a precursor
			-- FIXME: does not yet merge rules found for multiple precursors of a given type
		local
			type_tid, rule_type_tid: INTEGER
		do
			if im_class_flat_rules_by_type.has (a_type_name) then
				Result := im_class_flat_rules_by_type.item (a_type_name)
			else
				-- we do the creation here, because this object may have been read from a text file
				-- and there is no guarantee of make having been run. A slightly cleaner approach
				-- would be to make it DT_CONVERTIBLE and then a make routine can be called on it
				type_tid := dt_dynamic_type_from_string (a_type_name)

				-- go through all the rules, since the type we are looking for might inherit
				-- from more than one of them.
				across im_class_rules as class_rules_csr loop
					rule_type_tid := dt_dynamic_type_from_string (class_rules_csr.key)
					if rule_type_tid >= 0 and then type_conforms_to (type_tid, rule_type_tid) then
						if not im_class_flat_rules_by_type.has (a_type_name) then
							im_class_flat_rules_by_type.put (class_rules_csr.item.deep_twin, a_type_name)
						elseif attached im_class_flat_rules_by_type.item (a_type_name) as att_rules_for_type then
							att_rules_for_type.merge (class_rules_csr.item)
						else
							im_class_flat_rules_by_type.force (class_rules_csr.item.deep_twin, a_type_name)
						end
					end
				end

				if not im_class_flat_rules_by_type.has (a_type_name) then
					im_class_flat_rules_by_type.put (Void, a_type_name)
				else
					Result := im_class_flat_rules_by_type.item (a_type_name)
				end
			end
		end

end


