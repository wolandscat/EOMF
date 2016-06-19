note
	component:   "Eiffel Object Modelling Framework"
	description: "String-based enumeration type."
	keywords:    "string, enumeration"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_ENUMERATION_STRING

inherit
	BMM_ENUMERATION [STRING]
		redefine
			set_item_names, underlying_type_name
		end

create
	make

feature -- Identification

	underlying_type_name: STRING
			-- redefined to remove _8, _16, _32 from Eiffel internal types
		once
			Result := "STRING"
		end

feature -- Modification

	set_item_names (a_names: like item_names)
			-- set the list of names of the enumeration. If no values are supplied, the
		do
			precursor (a_names)
			item_values.append (item_names)
		end

end


