note
	component:   "Eiffel Object Modelling Framework"
	description: "Definition of ODIN persistent form of an instance of BMM_ENUMERATION_DEFINITION"
	keywords:    "model, UML"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_BMM_ENUMERATION[G->COMPARABLE]

inherit
	P_BMM_CLASS
		redefine
			bmm_class_definition, create_bmm_class_definition, populate_bmm_class_definition
		end

feature -- Access (persisted)

	item_names: ARRAYED_LIST [STRING]
			-- the list of names of the enumeration. If no values are supplied, the
			-- integer values 0, 1, 2, ... are assumed
		attribute
			create Result.make (0)
			Result.compare_objects
		end

	item_values: detachable ARRAYED_LIST [G]
			-- OPTIONAL list of item values; must be of same length as `item_names'

feature -- Access

	bmm_class_definition: detachable BMM_ENUMERATION[G]
		note
			option: transient
		attribute
		end

feature -- Factory

	create_bmm_class_definition
			-- add remaining model elements from `' to `bmm_class_definition'
		local
			bmm_class_def: attached like bmm_class_definition
		do
			create bmm_class_def.make (name, documentation, is_abstract)
			bmm_class_def.set_source_schema_id (source_schema_id)
			bmm_class_definition := bmm_class_def
		end

	populate_bmm_class_definition (a_bmm_schema: BMM_SCHEMA)
			-- add remaining model elements to `bmm_enumeration_definition'
		do
			precursor (a_bmm_schema)
			if attached bmm_class_definition as bmm_enum_def then
				bmm_enum_def.set_item_names (item_names)
				if attached item_values as iv then
					bmm_enum_def.set_item_values (iv)
				end
			end
		end

end

