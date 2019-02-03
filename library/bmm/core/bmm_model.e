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
				if attached {BMM_ENUMERATION [BMM_VALUE]} class_defs_csr.item as enum_type then
					Result.extend (enum_type.name)
				end
			end
		ensure
			Result.object_comparison
		end

	any_class_definition: BMM_SIMPLE_CLASS
			-- retrieve the class definition corresponding to the top `Any' class
		do
			if attached {BMM_SIMPLE_CLASS} class_definition (any_type) as class_def then
				Result := class_def
			else
				create Result.make (any_type, "Root class of type system", True)
			end
		end

	any_type_definition: BMM_SIMPLE_TYPE
			-- generate a BMM_SIMPLE_TYPE instance corresponding to the top `Any' class
		do
			create Result.make (any_class_definition)
		end

	class_definition (a_class_name: STRING): BMM_CLASS
			-- retrieve the class definition corresponding to `a_type_name' (which may contain a generic part)
		require
			Type_name_valid: has_class_definition (a_class_name)
		do
			check attached class_definitions.item (type_name_to_class_key (a_class_name)) as class_def then
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

	enumeration_definition (a_type_name: STRING): BMM_ENUMERATION [BMM_VALUE]
			-- retrieve the enumeration definition corresponding to `a_type_name'
		require
			Type_name_valid: has_enumeration_definition (a_type_name)
		local
			fake_int_enum_def: BMM_ENUMERATION_INTEGER
			fake_str_enum_def: BMM_ENUMERATION_STRING
		do
			check attached {BMM_ENUMERATION [BMM_VALUE]} class_definition (a_type_name) as enum_def then
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
			check attached property_definition_at_path (a_type_name, a_prop_path) as prop_def then
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

	property_definition_at_path (a_type_name, a_prop_path: STRING): BMM_PROPERTY
			-- retrieve the property definition for `a_prop_path' in flattened class corresponding to `a_type_name'
		require
			Type_name_valid: has_class_definition (a_type_name)
			Property_path_valid: has_property_path (a_type_name, a_prop_path)
		local
			an_og_path: OG_PATH
		do
			create an_og_path.make_pure_from_string (a_prop_path)
			an_og_path.start
			Result := class_definition (type_name_to_class_key (a_type_name)).property_definition_at_path (an_og_path)
		end

	class_definition_at_path (a_type_name, a_prop_path: STRING): BMM_CLASS
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
			Result := class_definition (type_name_to_class_key (a_type_name)).class_definition_at_path (an_og_path)
		end

	type_substitutions (a_type_name: STRING): ARRAYED_SET [STRING]
			-- obtain names of all possible type substitutions of `a_type_name' in the model
			-- including generic types.
			-- TODO: incomplete
		require
			Type_name_valid: has_type_class_definition (a_type_name)
		local
			class_def: BMM_CLASS
			type_name: BMM_TYPE_NAME
			base_classes: ARRAYED_SET [STRING]
		do
			check attached class_definition (a_type_name) as cd then
				class_def := cd
			end

			if attached create_type_name_from_string (a_type_name) as tn then
				type_name := tn
			end

			base_classes := class_def.all_descendants
			base_classes.extend (class_def.name)
			if type_name.is_generic then
				create Result.make (0)
				Result.compare_objects
				across base_classes as base_classes_csr loop
					--
					-- TODO: implementation
					--
				end
			else
				Result := base_classes
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
			Result := has_class_definition (a_class_name) and then attached {BMM_ENUMERATION [BMM_VALUE]} class_definition (a_class_name)
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
			Result := attached {BMM_ENUMERATION [BMM_VALUE]} class_definition (a_class_name)
		end

	is_descendant_of (a_class_name, a_parent_class_name: STRING): BOOLEAN
			-- True if `a_class_name' is a descendant in the model of `a_parent_class_name'
		require
			Sub_class_valid: has_class_definition (a_class_name)
			Parent_class_valid: has_class_definition (a_parent_class_name)
		do
			Result := class_definition (type_name_to_class_key (a_class_name)).all_ancestor_types.has (a_parent_class_name.as_upper)
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
				Result := class_definition (type_name_to_class_key (a_type_name)).has_property_path (an_og_path)
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
				prop_conf_type := property_definition (a_bmm_type_name, a_bmm_property_name).bmm_type.base_class.type.type_name

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
				end
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

	create_bmm_type_from_bmm_type_name (a_type_name: BMM_TYPE_NAME): BMM_DEFINED_TYPE
			-- create a new BMM_TYPE from a bmm type already known in the system
		require
			Valid_name: not a_type_name.is_formal_type_parameter
		do
			if attached {BMM_GENERIC_CLASS} type_class_definition (a_type_name.as_string) as gen_class_def then
				Result := create_bmm_generic_type_from_bmm_type_name (a_type_name)
			else
				create {BMM_SIMPLE_TYPE} Result.make (class_definition (a_type_name.name))
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
		end

end


