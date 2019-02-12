note
	component:   "Eiffel Object Modelling Framework"
	description: "Integer-based enumeration type."
	keywords:    "integer, enumeration"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2009 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_ENUMERATION_INTEGER

inherit
	BMM_ENUMERATION[BMM_INTEGER_VALUE]
		redefine
			set_item_names
		end

create
	make

feature -- Modification

	set_item_names (a_names: like item_names)
			-- set the list of names of the enumeration. If no values are supplied,
			-- default integer values starting from 0 are generated
		local
			i: INTEGER
		do
			precursor (a_names)
			across item_names as names_csr loop
				item_values.extend (create {BMM_INTEGER_VALUE}.make (i))
				i := i + 1
			end
		end

end


