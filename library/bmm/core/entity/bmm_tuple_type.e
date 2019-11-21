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
	BMM_DEFINED_TYPE
	ITERATION_CURSOR [BMM_TYPE]

create
	make

feature -- Identification

	type_name: STRING
			-- formal string form of the type as per UML
		do
			create Result.make_from_string("Tuple")
		end

feature -- Access

	item_types: LIST[BMM_TYPE]
			-- types in the tuple type

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

	is_abstract: BOOLEAN
			-- generate a type category of main target type from Type_cat_xx values
		do
			Result := False
		end

	has_subtypes: BOOLEAN
		do
			Result := False
		end

feature -- Factory

	create_duplicate: like Current
			-- create a copy of this type object, with common references to BMM_CLASS objects
		do
			create Result.make (defining_class)
			if attached inheritance_precursor as ip then
				Result.set_inheritance_precursor (ip)
			end
		end

end


