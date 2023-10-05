note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Model of a BMM schema (along with what is inherited from BMM_SCHEMA_CORE). A single BMM_SCHEMA 
				 represents one class model. It may be assembled from multiple schema files, represented in some 
				 syntax or persistent format.
				 ]"
	keywords:    "model, UML"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2009- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_MODEL

inherit
	BMM_PACKAGE_CONTAINER
		undefine
			default_create
		redefine
			add_package
		end

	BMM_MODEL_METADATA
		redefine
			default_create
		end

	SHARED_MESSAGE_DB
		export
			{NONE} all
		undefine
			default_create
		end

	BMM_BUILTINS
		export
			{NONE} all
		undefine
			default_create
		end

create
	make, default_create

feature -- Definitions

	Default_model_name: STRING = "Unknown"

feature -- Initialisation

	default_create
		do
			make (Default_rm_pubisher, Default_rm_release, Default_model_name, create {DEFAULT_BMM_SCHEMA})
		end

	make (a_rm_publisher, a_rm_release, a_model_name: STRING; a_source_schema: BMM_SCHEMA)
		require
			valid_rm_publisher: not a_rm_publisher.is_empty
			valid_rm_release: not a_rm_release.is_empty
			valid_model_name: not a_model_name.is_empty
		do
			rm_publisher := a_rm_publisher
			rm_release := a_rm_release
			model_name := a_model_name
			source_schema := a_source_schema
		end

feature -- Identification

	model_name: STRING
			-- name of this model

	model_id: STRING
			-- derived name of model, based on model publisher, model name, model release
		do
			Result := create_schema_id (rm_publisher, model_name, rm_release)
		end

feature -- Access

	source_schema: BMM_SCHEMA
			-- source serialised form of model, usuall a file(s)

	class_definitions: STRING_TABLE [BMM_CLASS]
			-- All classes in this model, including for used generic types,
			-- keyed by type name, no spaces.
			-- Generate a key from a type name using `type_name_to_class_key`
		attribute
			create Result.make_caseless (100)
		end

	primitive_types: ARRAYED_SET [STRING]
			-- list of keys in `class_definitions' of items marked as primitive types, as defined in input schema
		do
			create Result.make (0)
			Result.compare_objects
			across class_definitions as class_defs_csr loop
				if class_defs_csr.item.is_primitive then
					Result.extend (class_defs_csr.item.name)
				end
			end
		ensure
			Result.object_comparison
		end

	enumeration_types: ARRAYED_SET [STRING]
			-- list of keys in `class_definitions' of items that are enumeration types, as defined in input schema
		do
			create Result.make (0)
			Result.compare_objects
			across class_definitions as class_defs_csr loop
				if attached {BMM_ENUMERATION} class_defs_csr.item as enum_type then
					Result.extend (enum_type.name)
				end
			end
		ensure
			Result.object_comparison
		end

	any_class_definition: BMM_SIMPLE_CLASS
			-- retrieve the class definition corresponding to the top `Any' class
		do
			if attached {BMM_SIMPLE_CLASS} class_definition (Any_type_name) as class_def then
				Result := class_def
			else
				Result := Any_class
			end
		end

	any_type_definition: BMM_SIMPLE_TYPE
			-- generate a BMM_SIMPLE_TYPE instance corresponding to the top `Any' class
		do
			create Result.make (any_class_definition)
		end

	class_definition (a_type_name: STRING): BMM_CLASS
			-- retrieve the class definition corresponding to `a_type_name' (which may contain a generic part)
		require
			Type_name_valid: has_class_definition (a_type_name)
		do
			check attached class_definitions.item (type_name_to_class_key (a_type_name)) as class_def then
				Result := class_def
			end
		end

	type_class_definition (a_type_name: STRING): BMM_CLASS
			-- retrieve the class definition corresponding to `a_type_name'. If it contains a generic part,
			-- this will be removed if it is a fully open generic name, otherwise it will remain intact
		require
			Type_name_valid: has_type_class_definition (a_type_name)
		do
			check attached class_definitions.item (type_name_to_class_key (a_type_name)) as class_def then
				Result := class_def
			end
		end

	enumeration_definition (a_type_name: STRING): BMM_ENUMERATION
			-- retrieve the enumeration definition corresponding to `a_type_name'
		require
			Type_name_valid: has_enumeration_definition (a_type_name)
		local
			fake_int_enum_def: BMM_ENUMERATION_INTEGER
			fake_str_enum_def: BMM_ENUMERATION_STRING
		do
			check attached {BMM_ENUMERATION} class_definition (a_type_name) as enum_def then
				Result := enum_def
			end
		end

	property_definition (a_type_name, a_prop_name: STRING): BMM_PROPERTY
			-- retrieve the property definition for `a_prop_name' in flattened class corresponding to `a_type_name'
		require
			Type_name_valid: has_class_definition (a_type_name)
			Property_valid: has_property (a_type_name, a_prop_name)
		do
			check attached class_definition (type_name_to_class_key (a_type_name)).flat_properties.item (a_prop_name) as prop_def then
				Result := prop_def
			end
		end

	property_object_multiplicity (a_type_name, a_prop_path: STRING): MULTIPLICITY_INTERVAL
			-- return the effective child object multiplicity of the property definition at `a_prop_path' in flattened class
			-- corresponding to `a_type_name'.
			-- Multiplicity is computed as the possible numeric range of child instances under this property at run time, i.e.
			--  if the property is a container:
			--		0 .. cardinality.upper
			--  elseif the property is single-valued:
			--		existence
		require
			Type_name_valid: has_class_definition (a_type_name)
			Property_valid: has_property_path (a_type_name, a_prop_path)
		do
			check attached property_at_path (a_type_name, a_prop_path) as prop_def then
				Result := prop_def.object_multiplicity
			end
		end

	effective_property_type (a_type_name, a_prop_name: STRING): STRING
			-- determine the effective property type for `a_prop_name' in flattened class corresponding to `a_type_name'
			-- same as property_definition.type, except if a_type_name is generic
		require
			Type_name_valid: has_class_definition (a_type_name)
			Property_valid: has_property (a_type_name, a_prop_name)
		do
			Result := class_definition (type_name_to_class_key (a_type_name)).effective_property_type (a_prop_name)
		end

	property_at_path (a_type_name, a_prop_path: STRING): BMM_PROPERTY
			-- retrieve the property definition for `a_prop_path' in flattened class corresponding to `a_type_name'
		require
			Type_name_valid: has_class_definition (a_type_name)
			Property_path_valid: has_property_path (a_type_name, a_prop_path)
		local
			an_og_path: OG_PATH
		do
			create an_og_path.make_pure_from_string (a_prop_path)
			an_og_path.start
			Result := do_property_at_path (class_definition (type_name_to_class_key (a_type_name)), an_og_path)
		end

	class_at_path (a_type_name, a_prop_path: STRING): BMM_CLASS
			-- retrieve the class definition for the class that owns the terminal attribute in `a_prop_path'
			-- in flattened class corresponding to `a_type_name'
		require
			Type_name_valid: has_class_definition (a_type_name)
			Property_path_valid: has_property_path (a_type_name, a_prop_path)
		local
			an_og_path: OG_PATH
		do
			create an_og_path.make_pure_from_string (a_prop_path)
			an_og_path.start
			Result := do_class_at_path (class_definition (type_name_to_class_key (a_type_name)), an_og_path)
		end

	type_substitutions (a_type: BMM_TYPE): ARRAYED_SET [STRING]
			-- obtain names of all possible type substitutions of `a_type' in the model
		require
			Type_name_valid: has_type_class_definition (a_type.type_name)
		do
			if attached {BMM_CONTAINER_TYPE} a_type as cont_type then
				Result := container_type_substitutions (cont_type)
			elseif attached {BMM_PARAMETER_TYPE} a_type as bmm_param_type then
				Result := type_substitutions (bmm_param_type.effective_type)
			else
				check attached {BMM_MODEL_TYPE} a_type as entity_type then
					Result := entity_type_substitutions (entity_type)
				end
			end
		end

	suppliers (a_type_name: STRING): ARRAYED_SET [STRING]
			-- list of names of immediate supplier classes, including concrete generic parameters,
			-- concrete descendants of abstract statically defined types, and inherited suppliers.
			-- (where generics are unconstrained, no class name is added, since logically it would be
			-- 'ANY' and this can always be assumed anyway)
			-- This list includes primitive types
		require
			Type_name_valid: has_class_definition (a_type_name)
		local
			bmm_class: BMM_CLASS
			ftl: ARRAYED_LIST [STRING]
		do
			bmm_class := class_definition (type_name_to_class_key (a_type_name))
			if attached bmm_class.suppliers as sc then
				Result := sc
			else
				create Result.make(0)
				Result.compare_objects

				-- get the types of all the properties (including inherited)
				across bmm_class.flat_properties as props_csr loop
					-- get the statically defined type(s) of the property (could be >1 due to generics)
					ftl := props_csr.item.bmm_type.flattened_type_list
					Result.merge (ftl)
					-- now get the descendant types, since these could be bound at runtime
					across ftl as gen_types_csr loop
						across class_definition (gen_types_csr.item).immediate_descendants as imm_descs_csr loop
							Result.extend (imm_descs_csr.item.name)
						end
					end
				end

				if attached {BMM_GENERIC_CLASS} bmm_class as bmm_gen_class then
					-- get the types defined in formal generics
					ftl := bmm_gen_class.type.flattened_type_list
					ftl.go_i_th (1)
					ftl.remove
					Result.merge (ftl)
				end

				bmm_class.set_suppliers (Result)
			end
		end

	suppliers_non_primitive (a_type_name: STRING): ARRAYED_SET [STRING]
			-- same as `suppliers' minus primitive types, as defined in input schema
		require
			Type_name_valid: has_class_definition (a_type_name)
		local
			bmm_class: BMM_CLASS
		do
			bmm_class := class_definition (type_name_to_class_key (a_type_name))
			if attached bmm_class.suppliers_non_primitive as snp then
				Result := snp
			else
				create Result.make (0)
				Result.compare_objects
				Result.merge (suppliers (a_type_name))
				Result.subtract (primitive_types)
				bmm_class.set_suppliers_non_primitive (Result)
			end
		end

	supplier_closure (a_type_name: STRING): ARRAYED_SET [STRING]
			-- list of names of all classes in full supplier closure, including concrete generic parameters;
			-- (where generics are unconstrained, no class name is added, since logically it would be
			-- 'ANY' and this can always be assumed anyway)
			-- This list includes primitive types.
		require
			Type_name_valid: has_class_definition (a_type_name)
		local
			bmm_class: BMM_CLASS
			imm_suppliers: ARRAYED_SET [STRING]
		do
			bmm_class := class_definition (type_name_to_class_key (a_type_name))
			if attached bmm_class.supplier_closure as scc then
				Result := scc
			else
				closure_types_done.wipe_out
				closure_types_done.extend (bmm_class.name)
				create Result.make(0)
				bmm_class.set_supplier_closure (Result)
				Result.compare_objects
				imm_suppliers := suppliers (a_type_name)
				Result.merge (imm_suppliers)
				across imm_suppliers as suppliers_csr loop
					if not closure_types_done.has (suppliers_csr.item) then
						Result.merge (supplier_closure (suppliers_csr.item))
						closure_types_done.extend (suppliers_csr.item)
					end
				end
			end
		end

feature -- Status Report

	candidate_generic_type_name (a_type_string: STRING): BOOLEAN
			-- is `a_type_string' a possible new generic type in the current model, but not yet known?
			-- TODO: implement proper conformance checking
		require
			valid_generic_type_name (a_type_string)
		do
			if not has_type_class_definition (a_type_string) and attached create_type_name_from_string (a_type_string) as att_type_name and then att_type_name.is_generic then
				Result := across att_type_name.as_string_list as types_csr all
					formal_generic_parameter_name (types_csr.item) or has_type_class_definition (types_csr.item)
				end
			end
		end

	has_type_class_definition (a_type_name: STRING): BOOLEAN
			-- True if `a_type_name' is already concretely known in the system, including if it is
			-- generic, which may be open, partially open or closed.
		require
			Type_valid: not a_type_name.is_empty
		do
			Result := class_definitions.has (type_name_to_class_key (a_type_name))
		end

	has_class_definition (a_class_name: STRING): BOOLEAN
			-- True if `a_class_name' has a class definition or prmitive type in the model.
		require
			Type_valid: not a_class_name.is_empty
		do
			Result := class_definitions.has (type_name_to_class_key (a_class_name))
		end

	has_enumeration_definition (a_class_name: STRING): BOOLEAN
			-- True if `a_class_name' has an enumeration class definition in the model.
		require
			Type_valid: not a_class_name.is_empty
		do
			Result := has_class_definition (a_class_name) and then attached {BMM_ENUMERATION} class_definition (a_class_name)
		end

	has_property (a_type_name, a_prop_name: STRING): BOOLEAN
			-- True if `a_type_name'  (which may contain a generic part) has a property named `a_prop_name'
		require
			Type_name_valid: has_type_class_definition (a_type_name)
			Property_valid: not a_prop_name.is_empty
		do
			Result := class_definition (type_name_to_class_key (a_type_name)).has_property (a_prop_name)
		end

	is_primitive_type (a_class_name: STRING): BOOLEAN
		require
			has_class_definition (a_class_name)
		do
			Result := class_definition (type_name_to_class_key (a_class_name)).is_primitive
		end

	is_enumerated_type (a_class_name: STRING): BOOLEAN
		require
			has_class_definition (a_class_name)
		do
			Result := attached {BMM_ENUMERATION} class_definition (a_class_name)
		end

	is_descendant_of (a_class_name, a_parent_class_name: STRING): BOOLEAN
			-- True if `a_class_name' is a descendant in the model of `a_parent_class_name'
		require
			Sub_class_valid: has_class_definition (a_class_name)
			Parent_class_valid: has_class_definition (a_parent_class_name)
		do
			Result := across class_definition (type_name_to_class_key (a_class_name)).all_ancestor_classes as anc_class_csr some
							anc_class_csr.item.is_case_insensitive_equal (a_parent_class_name)
						end
		end

	has_property_path (a_type_name, a_prop_path: STRING): BOOLEAN
			-- is `a_prop_path' possible based on this reference model? Path format must be standard forward-slash
			-- delimited path, or Xpath. Any predicates (i.e. [] sections) in an Xpath will be ignored.
		local
			an_og_path: OG_PATH
		do
			create an_og_path.make_pure_from_string (a_prop_path)
			an_og_path.start
			if has_class_definition (type_name_to_class_key (a_type_name)) then
				Result := do_has_property_path (class_definition (type_name_to_class_key (a_type_name)), an_og_path)
			end
		end

feature -- Conformance

	ms_conformant_property_type (a_bmm_type_name, a_bmm_property_name, a_ms_property_type: STRING): BOOLEAN
			-- True if `a_ms_property_type' is a valid 'MS' dynamic type for `a_property' in BMM type `a_bmm_type_name'
			-- 'MS' conformance means 'model-semantic' conformance, which abstracts away container types like
			-- List<>, Set<> etc and compares the dynamic type with the relation target type in the UML sense,
			-- i.e. regardless of whether there is single or multiple containment
		require
			Property_valid: has_type_class_definition (a_bmm_type_name) and has_property (a_bmm_type_name, a_bmm_property_name)
		local
			prop_conf_type: STRING
		do
			if has_type_class_definition (a_ms_property_type) then
				-- get the type name of the property effective type
				-- i.e. type name minus any container type part, and formal gen parm converted to constraint type
				prop_conf_type := property_definition (a_bmm_type_name, a_bmm_property_name).bmm_type.effective_type.type_name

				-- adjust for case where candidate type is not generic, but bmm_property type is - test on non-generic version
				if valid_generic_type_name (prop_conf_type) and not valid_generic_type_name (a_ms_property_type) then
					check attached create_type_name_from_string (prop_conf_type) as att_tn then
						prop_conf_type := type_name_to_class_key (att_tn.name)
					end
				end
				Result := type_conforms_to (a_ms_property_type, prop_conf_type)
			end
		end

	type_conforms_to (a_desc_type, an_anc_type: STRING): BOOLEAN
			-- check conformance of `a_desc_type' to `an_anc_type'; the types may be generic, and may contain open
			-- generic parameters like 'T' etc. These are replaced with their apporpriate constrainer types, or Any
			-- during the conformance testing process.
			-- Conformance is found if:
			--	* [base class test] types are non-generic, and either type names are identical, or else `a_desc_type' has `an_anc_type' in its ancestors
			--	* both types are generic and pass base class test; number of generic params matches, and each generic parameter type, after 'open parameter'
			--	  substitution, recursively passes `type_name_conforms_to' test
			--	* descendant type is generic and ancestor type is not, and they pass base classes test
		local
			desc_type_gen_params, anc_type_gen_params: ARRAYED_LIST[STRING]
			desc_base_class, anc_base_class, desc_type_gen_type, anc_type_gen_type: STRING
		do
			if attached create_type_name_from_string (a_desc_type) as desc_type_name and
				attached create_type_name_from_string (an_anc_type) as anc_type_name
			then
				desc_base_class := desc_type_name.name
				anc_base_class := anc_type_name.name
				if desc_base_class.is_case_insensitive_equal (anc_base_class) or else class_definition (desc_base_class).has_ancestor_class (anc_base_class)  then
					if valid_generic_type_name (a_desc_type) and attached {BMM_GENERIC_CLASS} class_definition (desc_base_class) as desc_bmm_gen_class then

						-- in the case of both being generic, we need to compare generics
						-- to start with, the number of generics must match
						if valid_generic_type_name (an_anc_type) and attached {BMM_GENERIC_CLASS} class_definition (anc_base_class) as anc_bmm_gen_class then
							desc_type_gen_params := desc_type_name.generic_parameters_type_list
							anc_type_gen_params := anc_type_name.generic_parameters_type_list
							if desc_type_gen_params.count = anc_type_gen_params.count then
								from
									desc_type_gen_params.start
									anc_type_gen_params.start
									Result := True
								until
									desc_type_gen_params.off or not Result
								loop
									-- first we convert any open generic parameters to their conformance types
									-- We assume type names of 1 letter are open parameters
									if formal_generic_parameter_name (desc_type_gen_params.item) then
										desc_type_gen_type := desc_bmm_gen_class.generic_parameter_conformance_type (desc_type_gen_params.item)
									else
										desc_type_gen_type := desc_type_gen_params.item
									end
									if formal_generic_parameter_name (anc_type_gen_params.item) then
										anc_type_gen_type := anc_bmm_gen_class.generic_parameter_conformance_type (anc_type_gen_params.item)
									else
										anc_type_gen_type := anc_type_gen_params.item
									end

									-- now do the test
									Result := type_conforms_to (desc_type_gen_type, anc_type_gen_type)

									desc_type_gen_params.forth
									anc_type_gen_params.forth
								end
							end

						-- Conforms - case where anc type is not provided in generic form, but desc is
						-- e.g. Interval<Integer> conforms to Interval
						else
							Result := True
						end

					-- in the following case, the descendant type is not generic, so the ancestor type cannot be either, for conformance
					else
						Result := not valid_generic_type_name (an_anc_type)
					end

				-- check for well-known exceptions, including mathematical type promotions
				else
					Result := type_convertible_to (a_desc_type, an_anc_type)
				end
			end
		end

	type_convertible_to (a_desc_type, an_anc_type: STRING): BOOLEAN
			-- check possibility of `a_desc_type' to be converted to `an_anc_type' by native means,
			-- primarily mathematical type promotion
		do
			if is_integer_type (a_desc_type) and (is_real_type (an_anc_type) or is_integer_type (an_anc_type)) then
				Result := True
			end
		end

feature -- Factory

	create_bmm_type_from_name (a_type_string: STRING): BMM_TYPE
			-- create a new BMM_TYPE from a valid type name string
		require
			Valid_name: has_type_class_definition (a_type_string)
		do
			check attached create_type_name_from_string (a_type_string) as att_tn then
				Result := create_bmm_type_from_bmm_type_name (att_tn)
			end
		end

	create_bmm_generic_type_from_name (a_type_string: STRING): BMM_GENERIC_TYPE
			-- create a new BMM_GENERIC_TYPE from a valid type name string
		require
			Valid_name: candidate_generic_type_name (a_type_string)
		do
			check attached create_type_name_from_string (a_type_string) as att_tn then
				Result := create_bmm_generic_type_from_bmm_type_name (att_tn)
			end
		end

feature -- Modification

	add_class_definition (a_class_def: BMM_CLASS; a_package_def: BMM_PACKAGE)
			-- add `a_class_def' to this schema, in package `a_package_def', which must exist in the schema
		require
			Valid_class: not has_class_definition (a_class_def.name)
			Valid_package: recursive_has_package (a_package_def)
		do
			class_definitions.put (a_class_def, type_name_to_class_key (a_class_def.name))
			a_package_def.add_class (a_class_def)
			a_class_def.set_bmm_model (Current)
		ensure
			Class_added: class_definition (a_class_def.name) = a_class_def
			Schema_set_in_class: a_class_def.bmm_model = Current
		end

	add_package (a_pkg: BMM_PACKAGE)
		do
			precursor (a_pkg)
			a_pkg.set_bmm_schema (Current)
			a_pkg.do_recursive_packages (agent (a_bmm_pkg: BMM_PACKAGE) do a_bmm_pkg.set_bmm_schema (Current) end)
		ensure then
			Schema_set_in_package: a_pkg.bmm_model = Current
		end

feature -- Statistics

	generate_statistics (ancestor_classes: LIST[STRING])
			-- generate statistics:
			-- 	  * abstract classes
			--	  * primitive classes
			-- 	  * generic classes
			--	For any class name in `ancestor_classes`, the count of children
		local
			anc_key: STRING
			class_count_key, primitive_key, abstract_key, generic_key, package_key: STRING
		do
			statistics_table.wipe_out
			package_key := "Package count"
			package_count := 0
			do_recursive_packages (
				agent (a_pkg: BMM_PACKAGE)
					do
						package_count :=  package_count + 1
					end
			)
			statistics_table.put (package_count, package_key)

			class_count_key := "Classes"
			statistics_table.put (0, class_count_key)

			primitive_key := "Primitive classes"
			statistics_table.put (0, primitive_key)

			abstract_key := "Abstract classes"
			statistics_table.put (0, abstract_key)

			generic_key := "Generic classes"
			statistics_table.put (0, generic_key)

			across class_definitions as class_defs_csr loop
				statistics_table.force (statistics_table.item (class_count_key) + 1, class_count_key)
				if class_defs_csr.item.is_primitive then
					statistics_table.force (statistics_table.item (primitive_key) + 1, primitive_key)
				end
				if class_defs_csr.item.is_abstract then
					statistics_table.force (statistics_table.item (abstract_key) + 1, abstract_key)
				end

				if attached {BMM_GENERIC_CLASS} class_defs_csr.item as bmm_gen_class then
					statistics_table.force (statistics_table.item (generic_key) + 1, generic_key)
				end

				across ancestor_classes as ancs_csr loop
					create anc_key.make_from_string (ancs_csr.item + " classes")
					if class_defs_csr.item.has_ancestor (anc_key) then
						statistics_table.force (statistics_table.item (anc_key) + 1, anc_key)
					end
				end
			end
		end

	statistics_table: HASH_TABLE [INTEGER, STRING]
		attribute
			create Result.make (0)
		end

feature {BMM_MODEL_ACCESS} -- Implementation

	post_process
			-- post-processing
		do

		end

feature {NONE} -- Implementation

	package_count: INTEGER

	type_name_to_class_key (a_type_name: STRING): STRING
			-- convert a type name which might have a generic part to a class name key for the
			-- class definitions index; removes any generic part.
		require
			Type_valid: not a_type_name.is_empty
		do
			if a_type_name.has (generic_left_delim) then
				Result := a_type_name.substring (1, a_type_name.index_of (generic_left_delim, 1) - 1)
			else
				Result := a_type_name
			end
			Result.prune_all (' ')
		ensure
			No_spaces: not Result.has (' ')
		end

	create_bmm_type_from_bmm_type_name (a_type_name: BMM_TYPE_NAME): BMM_EFFECTIVE_TYPE
			-- create a new BMM_TYPE from a bmm type already known in the system
		require
			Valid_name: not a_type_name.is_formal_type_parameter
		do
			if attached {BMM_GENERIC_CLASS} type_class_definition (a_type_name.as_string) as gen_class_def then
				Result := create_bmm_generic_type_from_bmm_type_name (a_type_name)
			else
				check attached {BMM_SIMPLE_CLASS} class_definition (a_type_name.name) as simple_class_def then
					create {BMM_SIMPLE_TYPE} Result.make (simple_class_def)
				end
			end
		end

	create_bmm_generic_type_from_bmm_type_name (a_type_name: BMM_TYPE_NAME): BMM_GENERIC_TYPE
			-- create a new BMM_TYPE from a generic type name, not yet in the system but a
			-- valid candidate
		require
			Valid_name: not a_type_name.is_formal_type_parameter
			Has_base_class: has_class_definition (a_type_name.name)
		local
			gen_parm_def: BMM_PARAMETER_TYPE
			gen_class_def: BMM_GENERIC_CLASS
		do
			check attached {BMM_GENERIC_CLASS} type_class_definition (a_type_name.name) as gcd then
				gen_class_def := gcd
			end
			create Result.make (gen_class_def)
			if a_type_name.is_generic then
				across a_type_name.generic_parameters as gen_types_csr loop
					if gen_types_csr.item.is_formal_type_parameter then
						check attached gen_class_def.generic_parameters.item (gen_types_csr.item.name) as att_gpd then
							gen_parm_def := att_gpd
						end
						Result.add_generic_parameter (gen_parm_def)
					else
						Result.add_generic_parameter (create_bmm_type_from_bmm_type_name (gen_types_csr.item))
					end
				end
			-- else we got the name of a generic class, but without the generic params part
			else
				across gen_class_def.generic_parameters as gen_parms_csr loop
					Result.add_generic_parameter (gen_parms_csr.item)
				end
			end
		end

	entity_type_substitutions (an_entity_type: BMM_MODEL_TYPE): ARRAYED_SET [STRING]
			-- generate all possible type substitutions of a generic type
		local
			base_class_list: ARRAYED_LIST[STRING]
			sub_types_table: HASH_TABLE[ARRAYED_LIST [ARRAYED_SET [STRING]], STRING]
			gen_parm_sub_types: ARRAYED_LIST [ARRAYED_SET [STRING]]
			permutations: HASH_TABLE[ARRAYED_LIST [ARRAYED_LIST[STRING]], STRING]
			perm_count, gen_parm_perm_count, i, rep, rpt, rep_count, rpt_count, occ_count, rep_len, perm: INTEGER
			perm_counts: HASH_TABLE[INTEGER, STRING]
			tstr: STRING
			base_bmm_class: BMM_CLASS
			perms_this_class: ARRAYED_LIST [ARRAYED_LIST [STRING]]
		do
			-- find set of base classes of descendants `an_entity_type`;
			-- NOTE: not all have to be generic!
			base_class_list := an_entity_type.defining_class.all_descendants.deep_twin
			base_class_list.extend (an_entity_type.defining_class.name)

			-- set up generic permutations data structure, keyed by base class names
			create sub_types_table.make (0)
			create perm_counts.make(0)
			across base_class_list as base_classes_csr loop
				create gen_parm_sub_types.make (0)
				sub_types_table.put (gen_parm_sub_types, base_classes_csr.item)
				gen_parm_perm_count := 1

				base_bmm_class := class_definition (base_classes_csr.item)

				-- we need to iterate across the open gen parms of the subtype;
				-- this might be different from the parent, if there was inheritance
				-- from a partly closed form of the `an_entity_type`
				-- So we need to match on open param name
				if attached {BMM_GENERIC_CLASS} base_bmm_class as base_bmm_gen_class then
					across base_bmm_gen_class.generic_parameters as base_class_gen_parms_csr loop
						-- if an_entity_type is generic, and has an open formal type of same name as this
						-- gen param of this subtype base class, OR if an_entity_type is simple
						-- then generate the subtypes of this gen param from the open param of this
						-- subtype base class, since it could have a narrower constraint
						if attached {BMM_GENERIC_TYPE} an_entity_type as a_gen_type and then
							a_gen_type.has_formal_generic_type (base_class_gen_parms_csr.key.as_string_8) or else
							attached {BMM_SIMPLE_TYPE} an_entity_type
						then
							gen_parm_sub_types.extend (type_substitutions (base_class_gen_parms_csr.item.effective_type))
							gen_parm_sub_types.last.extend (base_class_gen_parms_csr.item.effective_type.type_name)
							gen_parm_perm_count := gen_parm_perm_count * gen_parm_sub_types.last.count

						-- an_entity_type has an actual parameter type in this position
						-- and we should use that to generate the subtypes of this gen param position
						elseif attached {BMM_GENERIC_TYPE} an_entity_type as a_gen_type and then
							a_gen_type.generic_substitutions.has (base_class_gen_parms_csr.key)
						then
							check attached a_gen_type.generic_substitutions.item (base_class_gen_parms_csr.key) as gen_subtype then
								gen_parm_sub_types.extend (type_substitutions (gen_subtype))
								gen_parm_sub_types.last.extend (gen_subtype.type_base_name)
								gen_parm_perm_count := gen_parm_perm_count * gen_parm_sub_types.last.count
							end
						end
					end
				end
				perm_counts.put (gen_parm_perm_count, base_classes_csr.item)
			end

			-- generate permutation matrix for each base class
			create permutations.make (base_class_list.count)
			across sub_types_table as sub_types_table_csr loop
				rpt_count := 1
				rep_len := 1
				gen_parm_sub_types := sub_types_table_csr.item

				perm_count := perm_counts.item (sub_types_table_csr.key)
				create perms_this_class.make (perm_count)
				permutations.put (perms_this_class, sub_types_table_csr.key)
				from i := 1 until i > perm_count loop
					perms_this_class.extend (create {ARRAYED_LIST [STRING]}.make (gen_parm_sub_types.count))
					i := i + 1
				end

				across gen_parm_sub_types as gen_parm_sub_types_csr loop
					occ_count := perm_count // gen_parm_sub_types_csr.item.count
					rep_count := occ_count // rpt_count
					rep_len := rep_len * gen_parm_sub_types_csr.item.count
					from rep := 1 until rep > rep_count loop
						across gen_parm_sub_types_csr.item as types_csr loop
							from rpt := 1 until rpt > rpt_count loop
								perm := (rep-1) * rep_len + (types_csr.cursor_index - 1) * rpt_count + rpt
								perms_this_class.i_th (perm).extend (types_csr.item)
								rpt := rpt + 1
							end
						end
						rep := rep + 1
					end
					rpt_count := rpt_count * gen_parm_sub_types_csr.item.count
				end
			end

			-- output the type strings
			create Result.make (0)
			Result.compare_objects
			across permutations as perms_csr loop
				perms_this_class := perms_csr.item
				across perms_this_class as perms_this_class_csr loop
					create tstr.make_from_string (perms_csr.key)
					if not perms_this_class_csr.item.is_empty then
						tstr.append (generic_left_delim.out)
						across perms_this_class_csr.item as types_csr loop
							tstr.append (types_csr.item)
							if not types_csr.is_last then
								tstr.append (generic_separator.out + " ")
							end
						end
						tstr.append (generic_right_delim.out)
					end
					Result.extend (tstr)
				end
			end
		end

	container_type_substitutions (a_cont_type: BMM_CONTAINER_TYPE): ARRAYED_SET [STRING]
		local
			cont_sub_type_list, item_sub_type_list, index_sub_type_list: ARRAYED_LIST [STRING]
		do
			cont_sub_type_list := a_cont_type.container_class.all_descendants.deep_twin
			cont_sub_type_list.extend (a_cont_type.container_class.name)

			item_sub_type_list := type_substitutions (a_cont_type.unitary_type)

			create Result.make (0)

			if attached {BMM_INDEXED_CONTAINER_TYPE} a_cont_type as indexed_cont_type then
				index_sub_type_list := indexed_cont_type.index_type.defining_class.all_descendants.deep_twin
				index_sub_type_list.extend (indexed_cont_type.index_type.defining_class.name)
				across cont_sub_type_list as cont_sub_types_csr loop
					across item_sub_type_list as item_sub_types_csr loop
						across index_sub_type_list as index_sub_types_csr loop
							Result.extend (cont_sub_types_csr.item + generic_left_delim.out + index_sub_types_csr.item +
								Generic_separator.out + item_sub_types_csr.item + generic_right_delim.out)
						end
					end
				end
			else
				across cont_sub_type_list as cont_sub_types_csr loop
					across item_sub_type_list as item_sub_types_csr loop
						Result.extend (cont_sub_types_csr.item + generic_left_delim.out + item_sub_types_csr.item + generic_right_delim.out)
					end
				end
			end
		end

	do_has_property_path (a_bmm_class: BMM_CLASS; a_path: OG_PATH): BOOLEAN
			-- is `a_path' possible based on this reference model?
			-- note that the internal cursor of the path is used to know how much to read - from cursor to end (this allows
			-- recursive evaluation)
		local
			a_path_pos: INTEGER
			i: INTEGER
		do
			a_path_pos := a_path.items.index
			if a_bmm_class.has_property (a_path.item.attr_name) and then attached a_bmm_class.flat_properties.item (a_path.item.attr_name) as flat_prop then
				check attached class_definition (flat_prop.bmm_type.effective_type.type_base_name) as prop_class_def then
					a_path.forth
					if not a_path.off then
						Result := do_has_property_path (prop_class_def, a_path)
					else
						Result := True
					end
				end
			else -- look in the descendants
				from i := 1 until i > a_bmm_class.immediate_descendants.count or Result loop
					Result := do_has_property_path (a_bmm_class.immediate_descendants.i_th(i), a_path)
					i := i + 1
				end
			end
			a_path.go_i_th (a_path_pos)
		end

	do_property_at_path (a_bmm_class: BMM_CLASS; a_prop_path: OG_PATH): BMM_PROPERTY
			-- retrieve the property definition for `a_prop_path' in flattened class
			-- note that the internal cursor of the path is used to know how much to
			-- read - from cursor to end (this allows recursive evaluation)
		local
			a_path_pos: INTEGER
			i: INTEGER
			found: BOOLEAN
			bmm_prop: detachable BMM_PROPERTY
		do
			a_path_pos := a_prop_path.items.index
			if a_bmm_class.has_property (a_prop_path.item.attr_name) then
				check attached a_bmm_class.flat_properties.item (a_prop_path.item.attr_name) as fp then
					Result := fp
				end
				a_prop_path.forth
				if not a_prop_path.off and then attached class_definition (Result.bmm_type.effective_type.type_base_name) as prop_class_def then
					Result := do_property_at_path (prop_class_def, a_prop_path)
				end
			else -- look in the descendants
				from i := 1 until i > a_bmm_class.immediate_descendants.count or found loop
					if do_has_property_path (a_bmm_class.immediate_descendants.i_th(i), a_prop_path) then
						bmm_prop := do_property_at_path (a_bmm_class.immediate_descendants.i_th(i), a_prop_path)
						found := True
					end
					i := i + 1
				end
				check attached bmm_prop as bp then
					Result := bp
				end
			end
			a_prop_path.go_i_th (a_path_pos)
		end

	do_class_at_path (a_bmm_class: BMM_CLASS; a_prop_path: OG_PATH): BMM_CLASS
			-- retrieve the class definition for the class containing the terminal property in `a_prop_path' in flattened class
			-- note that the internal cursor of the path is used to know how much to read - from cursor to end (this allows
			-- recursive evaluation)
		local
			a_path_pos: INTEGER
			i: INTEGER
			found: BOOLEAN
			bmm_prop: detachable BMM_PROPERTY
			bmm_class: detachable BMM_CLASS
		do
			a_path_pos := a_prop_path.items.index
			if a_bmm_class.has_property (a_prop_path.item.attr_name) then
				check attached a_bmm_class.flat_properties.item (a_prop_path.item.attr_name) as fp then
					bmm_prop := fp
					Result := a_bmm_class
				end
				a_prop_path.forth
				if not a_prop_path.off and then attached class_definition (bmm_prop.bmm_type.effective_type.type_name) as prop_class_def then
					Result := do_class_at_path (prop_class_def, a_prop_path)
				end
			else -- look in the descendants
				from i := 1 until i > a_bmm_class.immediate_descendants.count or found loop
					if do_has_property_path (a_bmm_class.immediate_descendants.i_th(i), a_prop_path) then
						bmm_class := do_class_at_path (a_bmm_class.immediate_descendants.i_th(i), a_prop_path)
						found := True
					end
					i := i + 1
				end
				check attached bmm_class as att_bmm_class then
					Result := att_bmm_class
				end
			end
			a_prop_path.go_i_th (a_path_pos)
		end

	closure_types_done: ARRAYED_SET [STRING]
			-- list of types for which supplier_closure has already been called, used to avoid doing rework
		attribute
			create Result.make (0)
			Result.compare_objects
		end

end


