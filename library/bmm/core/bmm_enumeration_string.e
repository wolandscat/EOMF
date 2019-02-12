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
	BMM_ENUMERATION [BMM_STRING_VALUE]
		redefine
			set_item_names
		end

create
	make

feature -- Modification

	set_item_names (a_names: like item_names)
			-- set the list of names of the enumeration. If no values are supplied, the
			-- names are used as values
		do
			precursor (a_names)
			item_values.append (item_names)
		end

end


