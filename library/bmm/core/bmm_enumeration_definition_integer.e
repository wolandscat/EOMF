note
	component:   "Eiffel Object Modelling Framework"
	description: "Integer-based enumeration type."
	keywords:    "integer, enumeration"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2009- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_ENUMERATION_DEFINITION_INTEGER

inherit
	BMM_ENUMERATION_DEFINITION
		redefine
			item_values, set_item_names
		end

create
	make

feature -- Access

	item_values: ARRAYED_LIST [INTEGER]
			-- OPTIONAL list of item integer values; must be of same length as `item_names'
		attribute
			create Result.make (0)
		end

feature -- Modification

	set_item_names (a_names: like item_names)
			-- set the list of names of the enumeration. If no values are supplied, the
		local
			i: INTEGER
		do
			precursor (a_names)
			across item_names as names_csr loop
				item_values.extend (i)
				i := i + 1
			end
		end

end


