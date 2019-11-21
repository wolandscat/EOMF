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
			item_values, set_item_names
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


