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
			item_values, set_item_names, item_value_literals
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

	item_value_literals:  ARRAYED_LIST [INTEGER]
			-- list of literal form of item values; must be of same length as `item_names'
		do
			create Result.make (0)
			across item_values as item_val_csr loop
				Result.extend (item_val_csr.item.value)
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


