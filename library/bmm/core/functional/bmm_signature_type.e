note
	component:   "Eiffel Object Modelling Framework"
	description: "Meta-type representing a signature."
	keywords:    "model, BMM"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_SIGNATURE

inherit
	BMM_DEFINED_TYPE

create
	make

feature -- Identification

	type_name: STRING
			-- output a type of the form '<[T1, T2, ...], R>'
		do
			create Result.make_from_string (base_type_name)
			Result.append (Generic_left_delim.out)

			-- arguments part
			Result.append (Tuple_separator.out)
			if attached argument_types then
				Result.append (argument_types.type_name)
			end

			-- result part
			if attached result_type then
				Result.append (Tuple_separator.out + " " + result_type.type_name)
			end

			Result.append (Generic_right_delim.out)
		end

feature -- Access

	base_type_name: STRING
			-- Name of base type
		once
			create Result.make_from_string("Signature")
		end

	argument_types: detachable BMM_TUPLE_TYPE
			-- types in the tuple type

	result_type: detachable BMM_TYPE
			-- return type

	flattened_type_list: ARRAYED_LIST [STRING]
			-- completely flattened list of type names, flattening out all generic parameters
			-- note that for this type, we throw away the container_type because we are tring to match
			-- the type of an object as being a valid member of the container, e.g. ELEMENT in List<ELEMENT>
		do
			create Result.make(0)
			if attached argument_types then
				Result.append (argument_types.flattened_type_list)
			end
			if attached result_type then
				Result.extend (result_type.flattened_type_list)
			end
		end

	subtypes: ARRAYED_SET [STRING]
		do
			create Result.make(0)
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


