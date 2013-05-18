note
	component:   "Eiffel Object Modelling Framework"
	description: "Type reference based on a generic class, e.g. 'HashTable <List <Packet>, String>'"
	keywords:    "model, UML"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2009- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_GENERIC_TYPE_REFERENCE

inherit
	BMM_TYPE_REFERENCE

create
	make

feature -- Initialisation

	make (a_root_type: BMM_CLASS_DEFINITION)
		do
			root_type := a_root_type
			create generic_parameters.make (0)
		end

feature -- Access

	root_type: BMM_CLASS_DEFINITION
			-- root type

	generic_parameters: ARRAYED_LIST [BMM_TYPE_SPECIFIER]
			-- generic parameters of the root_type in this type specifier
			-- The order must match the order of the owning class's formal generic parameter declarations

	semantic_class: BMM_CLASS_DEFINITION
			-- the 'design' type of this property, ignoring containers, multiplicity etc.
		do
			Result := root_type
		end

	flattened_type_list: ARRAYED_LIST [STRING]
			-- completely flattened list of type names, flattening out all generic parameters
			-- Note: can include repeats, e.g. HASH_TABLE <STRING, STRING> => HASH_TABLE, STRING, STRING
		do
			create Result.make(0)
			Result.compare_objects
			Result.extend (root_type.name)
			across generic_parameters as gen_parm_csr loop
				Result.append (gen_parm_csr.item.flattened_type_list)
			end
		end

	type_category: STRING
			-- generate a type category of main target type from Type_cat_xx values
		local
			has_abstract_gen_parms: BOOLEAN
		do
			across generic_parameters as gen_parm_csr loop
				if not gen_parm_csr.item.type_category.is_equal (Type_cat_concrete_class) then
					has_abstract_gen_parms := True
				end
			end
			if root_type.is_abstract and has_abstract_gen_parms then
				Result := Type_cat_abstract_class
			elseif has_type_substitutions then
				Result := Type_cat_concrete_class_supertype
			else
				Result := Type_cat_concrete_class
			end
		end

	type_substitutions: ARRAYED_SET [STRING]
			-- FIXME: just generate permutations of one generic parameter for now
		local
			root_sub_type_list, gen_param_sub_type_list: ARRAYED_SET [STRING]
		do
			root_sub_type_list := root_type.type_substitutions
			if root_sub_type_list.is_empty then
				root_sub_type_list.extend (root_type.name)
			end

			gen_param_sub_type_list := generic_parameters.first.type_substitutions
			if gen_param_sub_type_list.is_empty then
				gen_param_sub_type_list.extend (generic_parameters.first.as_type_string)
			end

			create Result.make (0)
			across root_sub_type_list as sub_type_csr loop
				across gen_param_sub_type_list as gen_parm_csr loop
					Result.extend (sub_type_csr.item + generic_left_delim.out + gen_parm_csr.item + generic_right_delim.out)
				end
			end
		end

feature -- Status Report

	has_type_substitutions: BOOLEAN
		do
			Result := root_type.has_type_substitutions or else across generic_parameters as gen_parms_csr some gen_parms_csr.item.has_type_substitutions end
		end

feature -- Modification

	add_generic_parameter (a_gen_parm: attached BMM_TYPE_SPECIFIER)
		do
			generic_parameters.extend (a_gen_parm)
		end

feature -- Output

	as_type_string: STRING
			-- full name of the type including generic parameters
		do
			create Result.make_empty
			Result.append (root_type.name)
			Result.append_character (Generic_left_delim)
			across generic_parameters as gen_parms_csr loop
				Result.append (gen_parms_csr.item.as_type_string)
				if gen_parms_csr.cursor_index < generic_parameters.count then
					Result.append_character (generic_separator)
				end
			end
			Result.append_character (Generic_right_delim)
		end

end


