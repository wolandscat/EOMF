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
	BMM_DEFINED_TYPE
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
			-- E.g. Interval<T:Ordered>
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

	generic_substitutions: STRING_TABLE [BMM_UNITARY_TYPE]
			-- list of generic parameter substitutions, keyed by formal parameter name, e.g. 'T', 'U'
		do
			create Result.make_caseless (0)
			defining_class.generic_parameters.start
			across generic_parameters as gen_parms_csr loop
				-- if this is not a formal generic parameter, record a substitution
				if not attached {BMM_PARAMETER_TYPE} gen_parms_csr.item then
					Result.put (gen_parms_csr.item, defining_class.generic_parameters.item_for_iteration.name)
				end
				defining_class.generic_parameters.forth
			end
		end

	subtypes: ARRAYED_SET [STRING]
			-- generate all possible type substitutions of this type
		local
			sub_type_lists: ARRAYED_LIST [ARRAYED_SET [STRING]]
			permutations: ARRAYED_LIST [ARRAYED_LIST [STRING]]
			perm_count, i, rep, rpt, rep_count, rpt_count, occ_count, rep_len, perm: INTEGER
			tstr: STRING
		do
			-- build list of permutation sets
			create sub_type_lists.make (0)
			sub_type_lists.extend (defining_class.all_descendants.deep_twin)
			sub_type_lists.last.extend (defining_class.name)
			perm_count := sub_type_lists.last.count

			across generic_parameters as gen_parms_csr loop
				sub_type_lists.extend (gen_parms_csr.item.subtypes)
				if sub_type_lists.last.is_empty then
					sub_type_lists.last.extend (gen_parms_csr.item.type_name)
				end
				perm_count := perm_count * sub_type_lists.last.count
			end

			-- generate permutations
			create permutations.make (perm_count)
			from i := 1 until i > perm_count loop
				permutations.extend (create {ARRAYED_LIST [STRING]}.make (sub_type_lists.count))
				i := i + 1
			end

			rpt_count := 1
			rep_len := 1
			across sub_type_lists as type_lists_csr loop
				occ_count := perm_count // type_lists_csr.item.count
				rep_count := occ_count // rpt_count
				rep_len := rep_len * type_lists_csr.item.count
				from rep := 1 until rep > rep_count loop
					across type_lists_csr.item as types_csr loop
						from rpt := 1 until rpt > rpt_count loop
							perm := (rep-1) * rep_len + (types_csr.cursor_index - 1) * rpt_count + rpt
							permutations.i_th (perm).extend (types_csr.item)
							rpt := rpt + 1
						end
					end
					rep := rep + 1
				end
				rpt_count := rpt_count * type_lists_csr.item.count
			end

			-- output the type strings
			create Result.make (0)
			Result.compare_objects
			across permutations as perms_csr loop
				create tstr.make_empty
				tstr.append (perms_csr.item.first + generic_left_delim.out)
				across perms_csr.item as types_csr loop
					if not types_csr.is_first then
						tstr.append (types_csr.item)
						if not types_csr.is_last then
							tstr.append (generic_separator.out + " ")
						end
					end
				end
				tstr.append (generic_right_delim.out)
				Result.extend (tstr)
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


