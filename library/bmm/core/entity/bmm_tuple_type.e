note
	component:   "Eiffel Object Modelling Framework"
	description: "Parent of type meta-types that correspond to defined types, rather than formal type parameters."
	keywords:    "model, BMM"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_TUPLE_TYPE

inherit
	BMM_EFFECTIVE_TYPE
	ITERATION_CURSOR [BMM_TYPE]

create
	make

feature -- Initialisation

	make (a_types: LIST[BMM_TYPE])
		do
			item_types := a_types
		end

feature -- Identification

	type_name: STRING
			-- output a type of the form 'Tuple[T1, T2, ...]'
		do
			create Result.make_from_string (type_base_name)

			Result.append (Tuple_left_delim.out)
			across item_types as item_types_csr loop
				if not item_types_csr.is_first then
					Result.append (Tuple_separator.out + " ")
				end
				Result.append (item_types_csr.item.type_name)
			end
			Result.append (Tuple_right_delim.out)
		end

	entity_metatype: STRING
		do
			Result := Entity_metatype_tuple
		end

feature -- Access

	type_base_name: STRING
			-- Name of base type
		once
			create Result.make_from_string("Tuple")
		end

	item_types: LIST[BMM_TYPE]
			-- types in the tuple type
		attribute
			create {ARRAYED_LIST[BMM_TYPE]} Result.make (0)
		end

	flattened_type_list: ARRAYED_LIST [STRING]
			-- completely flattened list of type names, flattening out all generic parameters
			-- note that for this type, we throw away the container_type because we are tring to match
			-- the type of an object as being a valid member of the container, e.g. ELEMENT in List<ELEMENT>
		do
			create Result.make (0)
			across item_types as item_types_csr loop
				Result.extend (item_types_csr.item.type_name)
			end
		end

	subtypes: ARRAYED_SET [STRING]
			-- TODO: implement
		do
			create Result.make(0)
		end

    properties: STRING_TABLE [BMM_PROPERTY]
			-- list of all properties defined by this entity, keyed by property name
		do
			create Result.make(0)
		end

    flat_properties: STRING_TABLE [BMM_PROPERTY]
			-- list of all properties of an instance of this entity, keyed by property name
		do
			create Result.make(0)
		end

feature -- Iteration

	item: BMM_TYPE
		do
			Result := item_types.item
		end

	after: BOOLEAN
		do
			Result := item_types.after
		end

	forth
		do
			item_types.forth
		end

feature -- Status Report

	is_abstract: BOOLEAN = False

	is_primitive: BOOLEAN = True

	has_subtypes: BOOLEAN
		do
			Result := False
		end

feature -- Factory

	create_duplicate: like Current
			-- create a copy of this type object, with common references to BMM_CLASS objects
		local
			item_types_dup: ARRAYED_LIST[BMM_TYPE]
		do
			create item_types_dup.make (0)
			across item_types as item_types_csr loop
				item_types_dup.extend (item_types_csr.item.create_duplicate)
			end
			create Result.make (item_types_dup)
		end

end


