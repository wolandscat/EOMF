note
	component:   "Eiffel Object Modelling Framework"
	description: "Definition of ODIN persistent form of an instance of BMM_ENUMERATION_INTEGER"
	keywords:    "model, UML"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_BMM_ENUMERATION_INTEGER

inherit
	P_BMM_ENUMERATION
		redefine
			item_values, bmm_class, populate_bmm_class_enumeration
		end

feature -- Access (persisted)

	item_values: detachable ARRAYED_LIST [INTEGER]
			-- OPTIONAL list of item values; must be of same length as `item_names'

feature -- Access

	bmm_class: detachable BMM_ENUMERATION_INTEGER
		note
			option: transient
		attribute
		end

feature {NONE} -- Implementation

	populate_bmm_class_enumeration (a_bmm_enum_class: like bmm_class)
			-- add remaining model elements to `bmm_class'
		local
			bmm_item_values: ARRAYED_LIST[BMM_INTEGER_VALUE]
		do
			if attached item_values as iv then
				create bmm_item_values.make (0)
				across iv as vals_csr loop
					bmm_item_values.extend (create {BMM_INTEGER_VALUE}.make_value(vals_csr.item))
				end
				a_bmm_enum_class.set_item_values (bmm_item_values)
			end
		end

end

