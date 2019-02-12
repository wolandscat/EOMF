note
	component:   "Eiffel Object Modelling Framework"
	description: "Integer-based enumeration type."
	keywords:    "integer, enumeration"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_ENUMERATION_INTEGER

inherit
	BMM_ENUMERATION
		redefine
			item_values, has_value, set_item_names
		end

create
	make

feature -- Access

	item_values:  ARRAYED_LIST [BMM_INTEGER_VALUE]
			-- OPTIONAL list of item values; must be of same length as `item_names'
		attribute
			create Result.make (0)
			Result.compare_objects
		end

feature -- Status Report

	has_value (v: INTEGER): BOOLEAN
			-- True if `item_values` has an item whose internal value is equal to `v`
		do
			Result := across item_values as item_values_csr some
				item_values_csr.item.value = v
			end
		end

feature -- Modification

	set_item_names (a_names: like item_names)
			-- set the list of names of the enumeration. If no values are supplied,
			-- default integer values starting from 0 are generated
		local
			i: INTEGER
		do
			precursor (a_names)
			across item_names as names_csr loop
				item_values.extend (create {BMM_INTEGER_VALUE}.make_value (i))
				i := i + 1
			end
		end

end


