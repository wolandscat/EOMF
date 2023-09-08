note
	component:   "Eiffel Object Modelling Framework"
	description: "String-based enumeration type."
	keywords:    "string, enumeration"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_ENUMERATION_STRING

inherit
	BMM_ENUMERATION
		redefine
			item_values, set_item_names, has_value
		end

create
	make

feature -- Access

	item_values:  ARRAYED_LIST [BMM_STRING_VALUE]
			-- OPTIONAL list of item values; must be of same length as `item_names'
		attribute
			create Result.make (0)
			Result.compare_objects
		end

feature -- Status Report

	has_value (v: ANY): BOOLEAN
			-- True if `item_values` has an item whose internal value is equal to `v`
		do
			check attached {STRING} v as str then
				Result := across item_values as item_values_csr some
					item_values_csr.item.value.is_case_insensitive_equal (str)
				end
			end
		end

feature -- Modification

	set_item_names (a_names: like item_names)
			-- set the list of names of the enumeration. If no values are supplied, the
			-- names are used as values
		do
			precursor (a_names)
			across item_names as names_csr loop
				item_values.extend (create {BMM_STRING_VALUE}.make_value (names_csr.item))
			end
		end

end


