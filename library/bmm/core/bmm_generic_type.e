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
			make, base_class, type_signature
		end

create
	make

feature -- Initialisation

	make (a_class: like base_class)
		do
			precursor (a_class)
			create generic_parameters.make (0)
		end

feature -- Identification

	type_name: STRING
			-- full name of the type including generic parameters
		do
			create Result.make_empty
			Result.append (base_class.name)
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
			create Result.make_from_string (base_class.name)
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

	base_class: BMM_GENERIC_CLASS
			-- the base class of this type

	generic_parameters: ARRAYED_LIST [BMM_TYPE]
			-- generic parameters of the root_type in this type specifier
			-- The order must match the order of the owning class's formal generic parameter declarations

	flattened_type_list: ARRAYED_LIST [STRING]
			-- completely flattened list of type names, flattening out all generic parameters
			-- e.g. "HASH_TABLE <LINKED_LIST <STRING>, STRING>" => <<"HASH_TABLE", "LINKED_LIST", "STRING", "STRING">>
		do
			create Result.make (0)
			Result.compare_objects
			Result.extend (base_class.name)

			across generic_parameters as gen_parm_csr loop
				Result.append (gen_parm_csr.item.flattened_type_list)
			end
		end

	type_substitutions: ARRAYED_SET [STRING]
			-- generate all possible type substitutions of this type
		local
			sub_type_lists: ARRAYED_LIST [ARRAYED_SET [STRING]]
			permutations: ARRAYED_LIST [ARRAYED_LIST [STRING]]
			perm_count, i, rep, rpt, rep_count, rpt_count, occ_count, rep_len, perm: INTEGER
			tstr: STRING
		do
			-- build list of permutation sets
			create sub_type_lists.make (0)
			sub_type_lists.extend (base_class.all_descendants.deep_twin)
			sub_type_lists.last.extend (base_class.name)
			perm_count := sub_type_lists.last.count

			across generic_parameters as gen_parms_csr loop
				sub_type_lists.extend (gen_parms_csr.item.type_substitutions)
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
			Result := base_class.is_abstract or else
				across generic_parameters as gen_parm_csr some
					not gen_parm_csr.item.is_abstract
				end
		end

	has_type_substitutions: BOOLEAN
		do
			Result := base_class.has_descendants or else
				across generic_parameters as gen_parms_csr some
					gen_parms_csr.item.has_type_substitutions
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

feature -- Modification

	add_generic_parameter (a_gen_parm: BMM_TYPE)
		do
			generic_parameters.extend (a_gen_parm)
		end

	set_base_class (an_eff_gen_class: BMM_GENERIC_CLASS_EFFECTIVE)
			-- overwrite `base_class' with the effective version that has substituted
			-- properties according to type parameter substitutions
		local
			class_to_move: detachable BMM_CLASS
		do
			-- first, check current base_class's immediate descendants, which may include a class
			-- that has the current type as an ancestor; if so, we need to move that class ref
			-- to the immediate_descendants of the new base_class, i.e. `an_eff_gen_class`.

			across base_class.immediate_descendants as old_descs_csr loop
				if old_descs_csr.item.ancestors.has_item (Current) then
					class_to_move := old_descs_csr.item
				end
			end
			if attached class_to_move then
				base_class.immediate_descendants.prune (class_to_move)
				an_eff_gen_class.immediate_descendants.extend (class_to_move)
			end

			-- now set the new base class.
			base_class := an_eff_gen_class
		end

end


