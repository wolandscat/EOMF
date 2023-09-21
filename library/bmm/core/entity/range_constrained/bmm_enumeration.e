note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Definition of an enumeration type. In the BMM system, an 'enumeration' type is understood
				 as an underlying basic type and a set of named constants of that type. It is designed so 
				 that the default type is Integer, and the default constants are numbered 0, 1, ...
				 Optional model elements can be specified to override the values and / or the type.
				 ]"
	keywords:    "model, object"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2009- openEHR Foundation <http://www.openehr.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_ENUMERATION

inherit
	BMM_SIMPLE_CLASS
		redefine
			entity_metatype
		end

create
	make

feature -- Identification

	entity_metatype: STRING
		do
			Result := Entity_metatype_enumeration
		end

feature -- Access

	item_names: ARRAYED_LIST [STRING]
			-- the list of names of the enumeration. If no values are supplied, the
			-- integer values 0, 1, 2, ... are assumed
		attribute
			create Result.make (0)
			Result.compare_objects
		end

	item_values:  ARRAYED_LIST [BMM_PRIMITIVE_VALUE]
			-- OPTIONAL list of item values; must be of same length as `item_names'
		attribute
			create Result.make (0)
		end

	item_value_literals:  ARRAYED_LIST [ANY]
			-- list of literal form of item values; must be of same length as `item_names'
		do
			create Result.make (0)
			across item_values as item_val_csr loop
				Result.extend (item_val_csr.item.value)
			end
		end

	name_map: HASH_TABLE [STRING, STRING]
			-- map of item_values (string form) to item_names
		do
			create Result.make (0)
			across item_names as names_csr loop
				Result.put (names_csr.item, item_values.i_th (names_csr.cursor_index).value_literal)
			end
		end

	underlying_type_name: STRING
			-- name of type on which enumeration is based, i.e. its ancestor
		do
			check ancestors.count = 1 then
				ancestors.start
				Result := ancestors.item_for_iteration.type_name
			end
		end

feature -- Status Report

	has_value (v: ANY): BOOLEAN
			-- True if `item_values` has an item whose internal value is equal to `v`
		do
			Result := across item_values as item_values_csr some
				item_values_csr.item.value = v
			end
		end

feature -- Modification

	set_item_names (a_names: like item_names)
			-- set the list of names of the enumeration. If no values are supplied, the
		do
			across a_names as names_csr loop
				item_names.extend (names_csr.item)
			end
		end

	set_item_values (a_values: like item_values)
			-- set list of item integer values; must be of same length as `item_names'
		require
			a_values.count = item_names.count
		do
			item_values := a_values
			item_values.compare_objects
		end

end


