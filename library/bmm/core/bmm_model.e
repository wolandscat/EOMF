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

	BMM_SCHEMA_CORE
		redefine
			make, default_create
		end

	SHARED_MESSAGE_DB
		export
			{NONE} all
		undefine
			default_create
		end

create
	make, default_create

feature -- Initialisation

	default_create
		do
			make ("unknown", "unknown", "unknown")
		end

	make (a_rm_publisher, a_schema_name, a_rm_release: STRING)
		do
			precursor (a_rm_publisher, a_schema_name, a_rm_release)
		end

feature -- Access

	class_definitions: HASH_TABLE [BMM_CLASS, STRING]
			-- All classes in this model, including for used generic types, keyed by type name
			-- upper case, no spaces.
			-- Generate a key from a type name using `type_name_to_class_key'
		attribute
			create Result.make (0)
		end

	primitive_types: ARRAYED_SET [STRING]
			-- list of keys in `class_definitions' of items marked as primitive types, as defined in input schema
		do
			create Result.make (0)
			Result.compare_objects
			across class_definitions as class_defs_csr loop
				if class_defs_csr.item.is_primitive_type then
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
				if attached {BMM_ENUMERATION [COMPARABLE]} class_defs_csr.item as enum_type then
					Result.extend (enum_type.name)
				end
			end
		ensure
			Result.object_comparison
		end

	any_class_definition: BMM_CLASS
			-- retrieve the class definition corresponding to the top `Any' class
		do
			if attached class_definition (any_type) as class_def then
				Result := class_def
			else
				create Result.make (any_type, "Root class of type system", True)
			end
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

	enumeration_definition (a_type_name: STRING): BMM_ENUMERATION [COMPARABLE]
			-- retrieve the enumeration definition corresponding to `a_type_name'
		require
			Type_name_valid: has_enumeration_definition (a_type_name)
		local
			fake_int_enum_def: BMM_ENUMERATION_INTEGER
			fake_str_enum_def: BMM_ENUMERATION_STRING
		do
			check attached {BMM_ENUMERATION [COMPARABLE]} class_definition (a_type_name) as enum_def then
				Result := enum_def
			end
		end

	property_definition (a_type_name, a_prop_name: STRING): BMM_PROPERTY [BMM_TYPE]
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

	property_definition_at_path (a_type_name, a_prop_path: STRING): BMM_PROPERTY [BMM_TYPE]
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

	all_ancestor_classes_of (a_class_name: STRING): ARRAYED_LIST [STRING]
			-- return all ancestor types of `a_class_name' up to root class (usually 'ANY', 'Object' or something similar)
			-- does  not include current class. Returns empty list if none.
		require
			Type_valid: has_class_definition (a_class_name)
		do
			Result := class_definition (a_class_name).all_ancestors
		end

feature -- Status Report

	candidate_generic_type_name (a_type_string: STRING): BOOLEAN
			-- is `a_type_string' a possible new generic type in the current model, but not yet known?
		require
			valid_generic_type_name (a_type_string)
		do
			if not known_type_name (a_type_string) and attached create_type_name_from_string (a_type_string) as att_type_name and then att_type_name.is_generic then
				Result := across att_type_name.as_string_list as types_csr all
					formal_generic_parameter_name (types_csr.item) or known_type_name (types_csr.item)
				end
			end
		end

	known_type_name (a_type_name: STRING): BOOLEAN
			-- True if `a_type_name' is already concretely known in the system, including if it is
			-- generic - in which case, it already has a BMM_GENERIC_CLASS_EFFECTIVE created for it
		require
			Type_valid: not a_type_name.is_empty
		do
			Result := class_definitions.has (type_name_to_class_key (a_type_name))
		end

	has_class_definition (a_type_name: STRING): BOOLEAN
			-- True if `a_type_name' has a class definition or is a primitive type in the model. Note that a_type_name
			-- could be a generic type string; only the root class is considered
		require
			Type_valid: not a_type_name.is_empty
		do
			Result := class_definitions.has (type_name_to_class_key (a_type_name))
		end

	has_enumeration_definition (a_type_name: STRING): BOOLEAN
			-- True if `a_type_name' has a class definition or is a primitive type in the model. Note that a_type_name
			-- could be a generic type string; only the root class is considered
		require
			Type_valid: not a_type_name.is_empty
		do
			Result := has_class_definition (a_type_name) and then attached {BMM_ENUMERATION [COMPARABLE]} class_definition (a_type_name)
		end

	has_property (a_type_name, a_prop_name: STRING): BOOLEAN
			-- True if `a_type_name'  (which contain a generic part) has an property named `a_prop_name'
		require
			Type_name_valid: has_class_definition (a_type_name)
			Property_valid: not a_prop_name.is_empty
		do
			Result := class_definition (a_type_name).has_property(a_prop_name)
		end

	is_primitive_type (a_type_name: STRING): BOOLEAN
		require
			has_class_definition (a_type_name)
		do
			Result := class_definition (a_type_name).is_primitive_type
		end

	is_enumerated_type (a_type_name: STRING): BOOLEAN
		require
			has_class_definition (a_type_name)
		local
			bmm_class_def: BMM_CLASS
		do
			bmm_class_def := class_definition (a_type_name)
			Result := attached {BMM_ENUMERATION_INTEGER} bmm_class_def or
				attached {BMM_ENUMERATION_STRING} bmm_class_def
		end

	is_descendant_of (a_class, a_parent_class: STRING): BOOLEAN
			-- True if `a_class' is a descendant in the model of `a_parent_class'
			-- Use `type_conforms_to' for full type names
		require
			Sub_class_valid: has_class_definition (a_class)
			Parent_class_valid: has_class_definition (a_parent_class)
		do
			Result := class_definition (a_class).all_ancestors.has (a_parent_class.as_upper)
		end

	has_property_path (an_obj_type, a_prop_path: STRING): BOOLEAN
			-- is `a_prop_path' possible based on this reference model? Path format must be standard forward-slash
			-- delimited path, or Xpath. Any predicates (i.e. [] sections) in an Xpath will be ignored.
		local
			an_og_path: OG_PATH
		do
			create an_og_path.make_pure_from_string (a_prop_path)
			an_og_path.start
			if has_class_definition (an_obj_type) then
				Result := class_definition (an_obj_type).has_property_path (an_og_path)
			end
		end

feature -- Conformance

	ms_conformant_property_type (a_bmm_type_name, a_bmm_property_name, a_ms_property_type: STRING): BOOLEAN
			-- True if `a_ms_property_type' is a valid 'MS' dynamic type for `a_property' in BMM type `a_bmm_type_name'
			-- 'MS' conformance means 'model-semantic' conformance, which abstracts away container types like
			-- List<>, Set<> etc and compares the dynamic type with the relation target type in the UML sense,
			-- i.e. regardless of whether there is single or multiple containment
		require
			Property_valid: has_class_definition (a_bmm_type_name) and has_property (a_bmm_type_name, a_bmm_property_name)
		local
			prop_conf_type: STRING
		do
			if has_class_definition (a_ms_property_type) then
				prop_conf_type := property_definition (a_bmm_type_name, a_bmm_property_name).bmm_type.base_class.type_name

				-- adjust for case where candidate type is not generic, but bmm_property type is - just test on non-generic version
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
				if desc_base_class.is_case_insensitive_equal (anc_base_class) or else class_definition (desc_base_class).has_ancestor (anc_base_class)  then
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

	is_archetype_data_value_type (a_type: STRING): BOOLEAN
			-- True if `has_archetype_data_value_parent_class' and then root type of `a_type'
			-- conforms to `archetype_data_value_parent_class'
			-- FIXME: remove from BMM at some point
		do
			if attached archetype_data_value_parent_class as advp_class  then
				Result := type_conforms_to (a_type, advp_class)
			end
		end

feature -- Factory

	create_bmm_type_from_name (a_type_string: STRING): BMM_TYPE
			-- create a new BMM_TYPE from a valid type name string
		require
			Valid_name: known_type_name (a_type_string)
		do
			check attached create_type_name_from_string (a_type_string) as att_tn then
				Result := create_bmm_type_from_bmm_type_name (att_tn)
			end
		end

	create_bmm_generic_type_from_name (a_type_string: STRING): BMM_TYPE
			-- create a new BMM_TYPE from a valid type name string
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

	add_generic_type_definition (a_class_def: BMM_GENERIC_CLASS_EFFECTIVE)
			-- add `a_class_def' to this schema
		require
			Valid_class: not has_class_definition (a_class_def.type_name)
		do
			class_definitions.put (a_class_def, type_name_to_class_key (a_class_def.type_name))
			a_class_def.set_bmm_model (Current)
		ensure
			Class_added: class_definition (a_class_def.type_name) = a_class_def
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

	set_archetype_parent_class (a_class_name: STRING)
		require
			has_class_definition (a_class_name)
		do
			archetype_parent_class := a_class_name
		end

	set_archetype_data_value_parent_class (a_class_name: STRING)
		require
			has_class_definition (a_class_name)
		do
			archetype_data_value_parent_class := a_class_name
		end

	set_archetype_visualise_descendants_of (a_class_name: STRING)
		require
			has_class_definition (a_class_name)
		do
			archetype_visualise_descendants_of := a_class_name
		end

	post_process
			-- post-processing
		do
			compute_effective_types
		end

	compute_effective_types
			-- compute BMM_GENERIC_CLASS_EFFECTIVE instances from open BMM_GENERIC_CLASS instances
		local
			gen_bmm_type: BMM_GENERIC_TYPE
			gen_class_eff: BMM_GENERIC_CLASS_EFFECTIVE
			gen_prop: BMM_PROPERTY[BMM_GENERIC_TYPE]
			generic_type_properties: HASH_TABLE [ARRAYED_LIST[BMM_PROPERTY[BMM_GENERIC_TYPE]], STRING]
		do
			-- Record any closed or part-closed generic types found among properties; this creates the
			-- Hash table `generic_type_properties', which contains BMM_PROPERTY instances
			-- that point to BMM_GENERIC_TYPEs that have as their base_class a BMM_GENERIC_CLASS.
			-- We don't bother with fully open generic types, i.e. with type sig of the form
			-- TYPE <T, U, V>, since the properties in question already point to the correct
			-- BMM_GENERIC_CLASS instance.
			create generic_type_properties.make (0)
			across class_definitions as class_def_csr loop
				across class_def_csr.item.generic_properties as gen_props_csr loop
					gen_bmm_type := gen_props_csr.item.bmm_type
					if not generic_type_properties.has (gen_bmm_type.type_name) then
						generic_type_properties.put (create {ARRAYED_LIST[BMM_PROPERTY[BMM_GENERIC_TYPE]]}.make (0), gen_bmm_type.type_name)
					end
					generic_type_properties.item (gen_bmm_type.type_name).extend (gen_props_csr.item)
				end
			end

			-- Now cycle through these properties and generate new BMM_GENERIC_CLASS_EFFECTIVE instances
			-- that reuse all the elements of the BMM_GENERIC_CLASS parent, except with open properties
			-- replaced with the relevant closed form
			across generic_type_properties as gen_type_prop_lists_csr loop
				-- process the first item in the list at this key, i.e. some type like "DV_INTERVAL<TIME>"
				gen_prop := gen_type_prop_lists_csr.item.first

				add_effective_type (gen_prop.bmm_type)
				check attached {BMM_GENERIC_CLASS_EFFECTIVE} class_definition (gen_prop.bmm_type.type_name) as att_gce then
					gen_class_eff := att_gce
				end

				-- Now replace the bmm_type.base_class of all properties in the list
				across gen_type_prop_lists_csr.item as bmm_props_csr loop
					bmm_props_csr.item.bmm_type.set_base_class (gen_class_eff)
				end
			end
		end

	add_effective_type (a_gen_type: BMM_GENERIC_TYPE)
			-- add a new BMM_GENERIC_TYPE_EFFECTIVE into the system corresponding to `a_generic_type'
			-- and add to `class_definitions'
		require
			Type_is_generic: candidate_generic_type_name (a_gen_type.type_name)
			Type_not_already_created: not known_type_name (a_gen_type.type_name)
		local
			gen_eff_class: BMM_GENERIC_CLASS_EFFECTIVE
		do
			create gen_eff_class.make (a_gen_type)
			add_generic_type_definition (gen_eff_class)
		ensure
			Type_created: has_class_definition (a_gen_type.type_name)
		end

	add_effective_type_from_name (a_gen_type_name: STRING)
			-- add a new BMM_GENERIC_TYPE_EFFECTIVE into the system corresponding to `a_generic_type'
			-- and add to `class_definitions'
		require
			Type_is_generic: candidate_generic_type_name (a_gen_type_name)
			Type_not_already_created: not known_type_name (a_gen_type_name)
		do
			check attached {BMM_GENERIC_TYPE} create_bmm_generic_type_from_name (a_gen_type_name) as gen_type then
				add_effective_type (gen_type)
			end
		ensure
			Type_created: has_class_definition (a_gen_type_name)
		end

feature -- Statistics

	generate_statistics
		local
			arch_parent_key, data_value_parent_key: detachable STRING
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

			if attached archetype_parent_class as ap_class then
				arch_parent_key := ap_class + " classes"
				statistics_table.put (0, arch_parent_key)
			end
			if attached archetype_data_value_parent_class as adv_class then
				data_value_parent_key := adv_class + " classes"
				statistics_table.put (0, data_value_parent_key)
			end
			across class_definitions as class_defs_csr loop
				statistics_table.force (statistics_table.item (class_count_key) + 1, class_count_key)
				if class_defs_csr.item.is_primitive_type then
					statistics_table.force (statistics_table.item (primitive_key) + 1, primitive_key)
				end
				if class_defs_csr.item.is_abstract then
					statistics_table.force (statistics_table.item (abstract_key) + 1, abstract_key)
				end
				if attached {BMM_GENERIC_CLASS} class_defs_csr.item as bmm_gen_class then
					statistics_table.force (statistics_table.item (generic_key) + 1, generic_key)
				end
				if attached archetype_parent_class as ap_class and attached arch_parent_key as ap_key then
					if class_defs_csr.item.has_ancestor (ap_class) then
						statistics_table.force (statistics_table.item (ap_key) + 1, ap_key)
					end
				end
				if attached archetype_data_value_parent_class as adv_class and attached data_value_parent_key as dvp_key then
					if class_defs_csr.item.has_ancestor (adv_class) then
						statistics_table.force (statistics_table.item (dvp_key) + 1, dvp_key)
					end
				end
			end
		end

	statistics_table: HASH_TABLE [INTEGER, STRING]
		attribute
			create Result.make (0)
		end

feature {NONE} -- Implementation

	package_count: INTEGER

	type_name_to_class_key (a_type_name: STRING): STRING
			-- convert a type name which might have a generic part to a key for the primary
			-- class definitions index. Removes spaces; upper case.
		require
			Type_valid: not a_type_name.is_empty
		do
			Result := a_type_name.as_upper
			Result.prune_all (' ')
		ensure
			Upper_case: Result ~ Result.as_upper
		end

	create_bmm_type_from_bmm_type_name (a_type_name: BMM_TYPE_NAME): BMM_TYPE
			-- create a new BMM_TYPE from a bmm type already known in the sytem
		require
			Valid_name: not a_type_name.is_formal_type_parameter
		local
			open_type: BMM_OPEN_TYPE
			gen_parm_def: BMM_GENERIC_PARAMETER
			gen_type: BMM_GENERIC_TYPE
		do
			if attached {BMM_GENERIC_CLASS} class_definition (a_type_name.as_string) as gen_class_def then
				create gen_type.make (gen_class_def)
				Result := gen_type
				across a_type_name.generic_parameters as gen_types_csr loop
					if gen_types_csr.item.is_formal_type_parameter then
						check attached gen_class_def.generic_parameters.item (gen_types_csr.item.name) as att_gpd then
							gen_parm_def := att_gpd
						end
						create open_type.make (gen_parm_def)
						gen_type.add_generic_parameter (open_type)
					else
						gen_type.add_generic_parameter (create_bmm_type_from_bmm_type_name (gen_types_csr.item))
					end
				end
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
			open_type: BMM_OPEN_TYPE
			gen_parm_def: BMM_GENERIC_PARAMETER
			gen_class_def: BMM_GENERIC_CLASS
		do
			check attached {BMM_GENERIC_CLASS} class_definition (a_type_name.name) as gcd then
				gen_class_def := gcd
			end
			create Result.make (gen_class_def)
			across a_type_name.generic_parameters as gen_types_csr loop
				if gen_types_csr.item.is_formal_type_parameter then
					check attached gen_class_def.generic_parameters.item (gen_types_csr.item.name) as att_gpd then
						gen_parm_def := att_gpd
					end
					create open_type.make (gen_parm_def)
					Result.add_generic_parameter (open_type)
				else
					Result.add_generic_parameter (create_bmm_type_from_bmm_type_name (gen_types_csr.item))
				end
			end
		end

end


