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
	BMM_EFFECTIVE_TYPE

create
	make, make_function, make_parameterless_function, make_procedure, make_parameterless_procedure

feature -- Initialisation

	make (a_args: detachable BMM_TUPLE_TYPE; a_result_type: detachable BMM_TYPE)
		do
			argument_types := a_args
			result_type := a_result_type
		end

	make_function (a_args: BMM_TUPLE_TYPE; a_result_type: BMM_TYPE)
		do
			argument_types := a_args
			result_type := a_result_type
		end

	make_parameterless_function (a_result_type: BMM_TYPE)
		do
			result_type := a_result_type
		end

	make_procedure (a_args: BMM_TUPLE_TYPE)
		do
			argument_types := a_args
		end

	make_parameterless_procedure
		do
		end

feature -- Identification

	type_name: STRING
			-- output a type of the form '<[T1, T2, ...], R>'
		do
			create Result.make_from_string (type_base_name)
			Result.append (Generic_left_delim.out)

			-- arguments part
			if attached argument_types then
				Result.append (argument_types.type_name)
			end

			-- result part
			if attached result_type then
				Result.append (Tuple_separator.out + " " + result_type.type_name)
			end

			Result.append (Generic_right_delim.out)
		end

	entity_metatype: STRING
		do
			Result := Entity_metatype_signature
		end

feature -- Access

	type_base_name: STRING
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
				Result.append (result_type.flattened_type_list)
			end
		end

	subtypes: ARRAYED_SET [STRING]
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
			a_dup_argument_types: like argument_types
			a_dup_result_type: like result_type
		do
			if attached argument_types then
				a_dup_argument_types := argument_types.create_duplicate
			end
			if attached result_type then
				a_dup_result_type := result_type.create_duplicate
			end
			create Result.make (a_dup_argument_types, a_dup_result_type)
		end

end


