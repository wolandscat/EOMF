note
	component:   "Eiffel Object Modelling Framework"
	description: "Definition of ODIN persistent form of an instance of BMM_ENUMERATION_DEFINITION"
	keywords:    "model, UML"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_BMM_ENUMERATION

inherit
	P_BMM_CLASS
		redefine
			bmm_class, create_bmm_class, populate_bmm_class
		end

feature -- Access (persisted)

	item_names: ARRAYED_LIST [STRING]
			-- the list of names of the enumeration. If no values are supplied, the
			-- integer values 0, 1, 2, ... are assumed
		attribute
			create Result.make (0)
			Result.compare_objects
		end

	item_values: detachable ARRAYED_LIST [ANY]
			-- OPTIONAL list of item values; must be of same length as `item_names'

feature -- Access

	bmm_class: detachable BMM_ENUMERATION
		note
			option: transient
		attribute
		end

feature -- Factory

	create_bmm_class
			-- add remaining model elements from `bmm_class'
		local
			bmm_class_def: attached like bmm_class
		do
			create bmm_class_def.make (name, documentation, is_abstract)
			bmm_class_def.set_source_schema_id (source_schema_id)
			bmm_class := bmm_class_def
		end

	populate_bmm_class (a_bmm_model: BMM_MODEL)
			-- add remaining model elements to `bmm_class'
		do
			precursor (a_bmm_model)
			if attached bmm_class then
				bmm_class.set_item_names (item_names)
				populate_bmm_class_enumeration (bmm_class)
			end
		end

feature {NONE} -- Implementation

	populate_bmm_class_enumeration (a_bmm_enum_class: like bmm_class)
			-- add remaining model elements to `bmm_class'
		local
			bmm_item_values: ARRAYED_LIST[BMM_LITERAL_VALUE]
		do
			if attached item_values as iv then
				create bmm_item_values.make (0)
				across iv as vals_csr loop
					bmm_item_values.extend (create {BMM_LITERAL_VALUE}.make_value(vals_csr.item))
				end
				a_bmm_enum_class.set_item_values (bmm_item_values)
			end
		end

end

