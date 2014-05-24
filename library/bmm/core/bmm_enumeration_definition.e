note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Definition of an enumeration type. In the BMM system, an 'enumeration' type is understood
				 as an underlying basic type and a set of named constants of that type. It is designed so 
				 that the default type is Integer, and the default constants are numbered 0, 1, ...
				 Optional model elements can be specified to override the values and / or the type.
				 ]"
	keywords:    "model, object"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2009- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_ENUMERATION_DEFINITION

inherit
	BMM_CLASS_DEFINITION
		redefine
			type_category
		end

feature -- Access

	item_names: ARRAYED_LIST [STRING]
			-- the list of names of the enumeration. If no values are supplied, the
			-- integer values 0, 1, 2, ... are assumed
		attribute
			create Result.make (0)
			Result.compare_objects
		end

	item_values:  ARRAYED_LIST [ANY]
			-- OPTIONAL list of item integer values; must be of same length as `item_names'
		attribute
			create Result.make (0)
		end

	type_category: STRING
			-- generate a type category of main target type from Type_cat_xx values
		do
			Result := Type_cat_enumeration
		end

feature -- Modification

	set_item_names (a_names: like item_names)
			-- set the list of names of the enumeration. If no values are supplied, the
		local
			i: INTEGER
		do
			across a_names as names_csr loop
				item_names.extend (names_csr.item)
				item_values.extend (i)
				i := i + 1
			end
		end

	set_item_values (a_values: like item_values)
			-- set list of item integer values; must be of same length as `item_names'
		require
			a_values.count = item_names.count
		do
			item_values := a_values
		end

end


