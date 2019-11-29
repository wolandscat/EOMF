note
	component:   "Eiffel Object Modelling Framework"
	description: "Type reference based on a generic class, e.g. 'HashTable <List <Packet>, String>'"
	keywords:    "model, UML"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2009- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_GENERIC_TYPE

inherit
	BMM_MODEL_TYPE
		redefine
			make, defining_class, type_signature, has_formal_generic_type, substitute_formal_generic_type
		end

create
	make

feature -- Initialisation

	make (a_class: like defining_class)
		do
			precursor (a_class)
			create generic_parameters.make (0)
		end

feature -- Identification

	type_name: STRING
			-- full name of the type including generic parameters
		do
			create Result.make_empty
			Result.append (defining_class.name)
			Result.append_character (Generic_left_delim)
			across generic_parameters as gen_parms_csr loop
				Result.append (gen_parms_csr.item.type_name)
				if not gen_parms_csr.is_last then
					Result.append_character (generic_separator)
				end
			end
			Result.append_character (Generic_right_delim)
		end

	type_signature: STRING
			-- Signature form of the type, which for generics includes generic parameter constrainer types
			-- E.g. "Interval<T:Ordered>"
		do
			create Result.make_from_string (defining_class.name)
			Result.append_character (generic_left_delim)
			across generic_parameters as gen_parms_csr loop
				Result.append (gen_parms_csr.item.type_signature)
				if not gen_parms_csr.is_last then
					Result.append_character (generic_separator)
				end
			end
			Result.append_character (generic_right_delim)
		end

feature -- Access

	defining_class: BMM_GENERIC_CLASS
			-- the base class of this type

	generic_parameters: ARRAYED_LIST [BMM_UNITARY_TYPE]
			-- generic parameters of the root_type in this type specifier
			-- The order must match the order of the owning class's formal generic parameter declarations

	flattened_type_list: ARRAYED_LIST [STRING]
			-- completely flattened list of type names, flattening out all generic parameters
			-- e.g. "HASH_TABLE <LINKED_LIST <STRING>, STRING>" => <<"HASH_TABLE", "LINKED_LIST", "STRING", "STRING">>
		do
			create Result.make (0)
			Result.compare_objects
			Result.extend (defining_class.name)

			across generic_parameters as gen_parm_csr loop
				Result.append (gen_parm_csr.item.flattened_type_list)
			end
		end

	generic_substitutions: STRING_TABLE [BMM_DEFINED_TYPE]
			-- list of generic parameter substitutions, keyed by formal parameter name, e.g. 'T', 'U'
		do
			create Result.make_caseless (0)
			defining_class.generic_parameters.start
			across generic_parameters as gen_parms_csr loop
				-- if this is not a formal generic parameter, record a substitution
				if not attached {BMM_PARAMETER_TYPE} gen_parms_csr.item then
					check attached {BMM_DEFINED_TYPE} gen_parms_csr.item as bmm_def_type then
						Result.put (bmm_def_type, defining_class.generic_parameters.item_for_iteration.name)
					end
				end
				defining_class.generic_parameters.forth
			end
		end

feature -- Status Report

	is_abstract: BOOLEAN
			-- generate a type category of main target type from Type_cat_xx values
		do
			Result := defining_class.is_abstract or else
				across generic_parameters as gen_parm_csr some
					not gen_parm_csr.item.is_abstract
				end
		end

	has_subtypes: BOOLEAN
		do
			Result := defining_class.has_descendants or else
				across generic_parameters as gen_parms_csr some
					gen_parms_csr.item.has_subtypes
				end
		end

	is_partially_closed: BOOLEAN
			-- True if there is at least one substituted parameter in this type
		do
			Result :=
				across generic_parameters as gen_parms_csr some
					not attached {BMM_PARAMETER_TYPE} gen_parms_csr.item
				end
		end

	is_closed: BOOLEAN
			-- True if parameters are subsituted in this type
		do
			Result :=
				across generic_parameters as gen_parms_csr all
					not attached {BMM_PARAMETER_TYPE} gen_parms_csr.item
				end
		end

	has_formal_generic_type (a_gen_type_name: STRING): BOOLEAN
			-- True if there is any occurrence of `a_gen_type_name` in the type structure
		do
			Result :=
				across generic_parameters as gen_parms_csr some
					attached {BMM_PARAMETER_TYPE} gen_parms_csr.item as formal_param and then
						formal_param.name.is_equal (a_gen_type_name) or
						gen_parms_csr.item.has_formal_generic_type (a_gen_type_name)
				end
		end

feature -- Factory

	create_duplicate: like Current
			-- create a copy of this type object, with common references to BMM_CLASS objects
		do
			create Result.make (defining_class)
			across generic_parameters as gen_parms_csr loop
				Result.add_generic_parameter (gen_parms_csr.item.create_duplicate)
			end
		end

feature -- Modification

	substitute_formal_generic_type (a_gen_type_name: STRING; a_sub_type: BMM_DEFINED_TYPE)
			-- substitute any occurrence of `a_gen_type_name` in the type structure
			-- with `a_sub_type`
		do
			across generic_parameters as gen_parms_csr loop
				if attached {BMM_PARAMETER_TYPE} gen_parms_csr.item then
					generic_parameters.go_i_th (gen_parms_csr.cursor_index)
					generic_parameters.replace (a_sub_type)
				else
					gen_parms_csr.item.substitute_formal_generic_type (a_gen_type_name, a_sub_type)
				end
			end
		end

	add_generic_parameter (a_gen_parm: BMM_UNITARY_TYPE)
		do
			generic_parameters.extend (a_gen_parm)
		end

end


