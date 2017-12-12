note
	component:   "Eiffel Object Modelling Framework"
	description: "Structured representation of a type name, which may be generic."
	keywords:    "BMM, model, UML"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2017 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_TYPE_NAME

inherit
	BMM_DEFINITIONS
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

create
	make_simple, make_formal_parameter, make_formal_parameter_constrained

feature {NONE} -- Initialisation

	make_simple (a_name: STRING)
			-- make in simple form
		require
			a_name.count > 1
		do
			name := a_name
			create generic_parameters.make (0)
		ensure
			Name_set: name = a_name
		end

	make_formal_parameter (a_name: STRING)
			-- make as formal generic parameter
		require
			a_name.count = 1
		do
			name := a_name
			create generic_parameters.make (0)
		ensure
			Name_set: name = a_name
			Correct_type: is_formal_type_parameter
			Is_open: is_open
		end

	make_formal_parameter_constrained (a_name: STRING; a_constrainer: BMM_TYPE_NAME)
			-- make as constrained formal generic parameter
		require
			a_name.count = 1
		do
			name := a_name
			create generic_parameters.make (0)
			constrainer_type := a_constrainer
		ensure
			Name_set: name = a_name
			Correct_type: is_formal_type_parameter
			Is_open: is_open
		end

feature -- Access

	name: STRING
			-- name of this segment

	generic_parameters: ARRAYED_LIST [BMM_TYPE_NAME]
			-- List of generic parameters

	constrainer_type: detachable BMM_TYPE_NAME
			-- type constrainer for formal parameter type

feature -- Status Report

	is_simple: BOOLEAN
			-- True if this is a simple type name
		do
			Result := generic_parameters.is_empty and not is_formal_type_parameter
		end

	is_generic: BOOLEAN
			-- True if this is a generic type name
		do
			Result := not generic_parameters.is_empty
		end

	is_formal_type_parameter: BOOLEAN
			-- True if this is a formal type parameter
		do
			Result := name.count = 1
		end

	is_open: BOOLEAN
			-- True if this is an open type
		do
			Result := is_formal_type_parameter or else
				across generic_parameters as gen_parms_csr some gen_parms_csr.item.is_open end
		end

	is_constrained: BOOLEAN
		do
			Result := attached constrainer_type
		end

	is_generic_class_signature: BOOLEAN
			-- True if can be used as a generic class signature
		do
			Result := is_generic and then
				across generic_parameters as gen_parms_csr all gen_parms_csr.item.is_formal_type_parameter end
		end

	is_generic_type_signature: BOOLEAN
			-- True if can be used as a generic type, i.e. any amount of nesting, and no constrainers
		do
			Result := is_generic and then
				across generic_parameters as gen_parms_csr all
					gen_parms_csr.item.is_simple or
					(gen_parms_csr.item.is_formal_type_parameter and not gen_parms_csr.item.is_constrained) or
					gen_parms_csr.item.is_generic_type_signature
				end
		end

	is_type_signature: BOOLEAN
			-- True if can be used as a type signature
		do
			Result := is_simple or
				is_formal_type_parameter and not is_constrained or
				is_generic and then
					across generic_parameters as gen_parms_csr all
						gen_parms_csr.item.is_simple or
						(gen_parms_csr.item.is_formal_type_parameter and not gen_parms_csr.item.is_constrained) or
						gen_parms_csr.item.is_generic_type_signature
					end
		end

	is_valid: BOOLEAN
			-- True if is one of, in order:
			--	* a simple type name
			--	* a type parameter name, with possible constraining
			--	* a generic class name. which has no nesting in the parameters
			-- 	* a generic type name, which may have open types, but no constrainers
		do
			Result := is_simple or else
				is_formal_type_parameter or else
				is_generic_class_signature or else
				is_generic_type_signature
		end

feature -- Modification

	add_generic_parameter (a_param: BMM_TYPE_NAME)
		do
			generic_parameters.extend (a_param)
		end

	set_generic_parameters (a_params: ARRAYED_LIST[BMM_TYPE_NAME])
		require
			Params_not_empty: not a_params.is_empty
		do
			generic_parameters := a_params
		end

	set_type_constrainer (a_constrainer: BMM_TYPE_NAME)
			-- make as constrained formal generic parameter
		require
			is_formal_type_parameter
		do
			constrainer_type := a_constrainer
		end

feature -- Output

	as_string: STRING
			-- output in default string form (without spaces)
		do
			Result := as_type_string (False)
		end

	as_display_string: STRING
			-- output in default string form (without spaces)
		do
			Result := as_type_string (True)
		end

	as_type_string (with_spaces: BOOLEAN): STRING
			-- output in string form with or without spaces
		do
			create Result.make_from_string (name)
			if is_generic then
				Result.append_character (Generic_left_delim)
				across generic_parameters as gen_parms_csr loop
					Result.append (gen_parms_csr.item.as_type_string (with_spaces))
					if not gen_parms_csr.is_last then
						Result.append_character (generic_separator)
						if with_spaces then
							Result.append_character (' ')
						end
					end
				end
				Result.append_character (Generic_right_delim)
			end
		end

	as_type_signature (with_spaces: BOOLEAN): STRING
			-- output in string form with or without spaces as a type signature,
			-- which includes constrainer types
		do
			create Result.make_from_string (name)
			if is_generic then
				Result.append_character (Generic_left_delim)
				across generic_parameters as gen_parms_csr loop
					Result.append (gen_parms_csr.item.as_type_signature (with_spaces))
					if not gen_parms_csr.is_last then
						Result.append_character (generic_separator)
						if with_spaces then
							Result.append_character (' ')
						end
					end
				end
				Result.append_character (Generic_right_delim)
			elseif attached constrainer_type as att_const_type then
				Result.append_character (generic_constraint_delimiter)
				if with_spaces then
					Result.append_character (' ')
				end
				Result.append (att_const_type.as_type_string (with_spaces))
			end
		end

	as_string_list: ARRAYED_LIST [STRING]
			-- output type as a list of atomic type names
		do
			create Result.make(0)
			Result.compare_objects
			Result.extend (name)
			if is_generic then
				across generic_parameters as gen_parms_csr loop
					Result.append (gen_parms_csr.item.as_string_list)
				end
			end
		ensure
			Result_object_comparison: Result.object_comparison
		end

	generic_parameters_type_list: ARRAYED_LIST [STRING]
			-- for a generic type name, extract the parameter type name(s) (which could themselves be generic)
			-- and put them into a list.
			-- Example: for "Hash <List <String>, Integer>", return a list with contents:
			--	"List <String>", "Integer"
		require
			is_generic
		do
			create Result.make(0)
			Result.compare_objects
			if is_generic then
				across generic_parameters as gen_parms_csr loop
					Result.extend (gen_parms_csr.item.as_string)
				end
			end
		ensure
			Result_object_comparison: Result.object_comparison
		end

invariant
    Formal_parameter_validity: not (is_formal_type_parameter and is_generic)

end


