note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Persistent form of BMM_SCHEMA, normally materialised from ODIN file format. Multiple P_BMM_SCHEMAs may include each other, 
				 consequently, a single BMM_SCHEMA is in general the result multiple P_BMM_SCHEMAs that have been merged together.
				 ]"
	keywords:    "Basic meta-model"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_BMM_SCHEMA

inherit
	BMM_SCHEMA_CORE

	P_BMM_PACKAGE_CONTAINER

	DT_CONVERTIBLE
		redefine
			finalise_dt
		end

	ANY_VALIDATOR
		redefine
			ready_to_validate
		end

	BMM_MESSAGES_IDS
		export
			{NONE} all
		end

feature -- Definitions

	State_created: INTEGER = 1

	State_validated_created: INTEGER = 2

	State_includes_pending: INTEGER = 3

	State_includes_processed: INTEGER = 4

	Max_add_attempts: INTEGER = 10

feature -- Initialisation

	make_dt (make_args: detachable ARRAY[ANY])
			-- make in a safe way for DT building purposes
		do
			reset
			state := State_created
			create archetype_rm_closure_packages.make (0)
			archetype_rm_closure_packages.compare_objects
		end

feature -- Access (attributes from schema)

	bmm_version: detachable STRING
			-- version of BMM model, enabling schema evolution reasoning
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	includes: HASH_TABLE [BMM_INCLUDE_SPEC, STRING]
			-- inclusion list, in the form of a hash of individual include specifications,
			-- each of which at least specifies the id of another schema, and may specify
			-- a namespace via which types from the included schemas are known in this schema
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make (0)
		end

	primitive_types: HASH_TABLE [P_BMM_CLASS, STRING]
			-- types like Integer, Boolean etc
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make (0)
		end

	class_definitions: HASH_TABLE [P_BMM_CLASS, STRING]
			-- constructed classes
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make (0)
		end

feature -- Access (Attributes from schema load post-processing)

	state: INTEGER
			-- state machine state for this schema
		note
			option: transient
		attribute
		end

	canonical_packages: HASH_TABLE [P_BMM_PACKAGE, STRING]
			-- package structure in which all top-level qualified package names like xx.yy.zz have been
			-- expanded out to a hierarchy of BMM_PACKAGE objects
		do
			if attached canonical_packages_cache as cpc then
				Result := cpc
			else
				create Result.make (0)
				canonical_packages_cache := Result
			end
		end

	canonical_packages_item (a_pkg_name: STRING): P_BMM_PACKAGE
		do
			check attached canonical_packages.item (a_pkg_name) as att_pkg then
				Result := att_pkg
			end
		end

	bmm_model: BMM_MODEL
		do
			check attached bmm_model_cache as att_mod then
				Result := att_mod
			end
		end

	includes_to_process: ARRAYED_LIST [STRING]
			-- list of includes to process during setup
		do
			if attached includes_to_process_cache as ipc then
				Result := ipc
			else
				create Result.make (0)
				Result.compare_objects
				includes_to_process_cache := Result
			end
		end

	bmm_version_from_schema: BOOLEAN
			-- True if the bmm_version attribute was actually set in the schema; False means
			-- the `assumed_bmm_version' value is used instead. This flag enables the situation to
			-- be reported properly during schema validation.
		note
			option: transient
		attribute
		end

	ancestors_index: HASH_TABLE [ARRAYED_SET [STRING], STRING]
			-- index of all ancestors of each class
			-- key is UPPER case
		do
			if attached ancestors_index_cache as aic then
				Result := aic
			else
				create Result.make (0)
				ancestors_index_cache := Result
			end
		end

feature -- Access

	class_definition (a_class_name: STRING): P_BMM_CLASS
			-- class definition corresponding to `a_class_name'
		require
			Class_valid: has_class_definition (a_class_name)
		local
			a_key: STRING
			fake_int_enum: P_BMM_ENUMERATION_INTEGER
			fake_str_enum: P_BMM_ENUMERATION_STRING
		do
			a_key := a_class_name.as_upper
			if primitive_types.has (a_key) and attached primitive_types.item (a_key) as att_prim_type then
				Result := att_prim_type
			else
				check attached class_definitions.item (a_key) as att_class_def then
					Result := att_class_def
				end
			end
		end

	primitive_type (a_class_name: STRING): P_BMM_CLASS
			-- class definition corresponding to `a_class_name'
		require
			Class_valid: has_primitive_type (a_class_name)
		do
			check attached primitive_types.item (a_class_name.as_upper) as att_type then
				Result := att_type
			end
		end

feature -- Status Report

	has_class_definition (a_class_name: STRING): BOOLEAN
			-- True if `a_class_name' has a class definition or is a primitive type in the model. Note that a_type_name
			-- could be a generic type string; only the root class is considered
		require
			Class_valid: not a_class_name.is_empty
		local
			a_key: STRING
		do
			a_key := a_class_name.as_upper
			Result := primitive_types.has (a_key) or class_definitions.has (a_key)
		end

	has_primitive_type (a_class_name: STRING): BOOLEAN
			-- True if `a_class_name' is a primitive type in the model. Note that a_type_name
			-- could be a generic type string; only the root class is considered
		require
			Class_valid: not a_class_name.is_empty
		do
			Result := primitive_types.has (a_class_name.as_upper)
		end

	has_canonical_package_path (a_path: STRING): BOOLEAN
			-- True if there is a package at the path `a_path' under this package
		local
			pkg_names: LIST [STRING]
			pkg_csr: P_BMM_PACKAGE_CONTAINER
		do
			pkg_names := a_path.as_upper.split (Package_name_delimiter)
			pkg_names.start
			if canonical_packages.has (pkg_names.item) and then attached canonical_packages_item (pkg_names.item) as pkg then
				pkg_csr := pkg
				from pkg_names.forth until pkg_names.off or not pkg_csr.packages.has (pkg_names.item) loop
					if attached pkg_csr.packages.item (pkg_names.item) as pkg2 then
						pkg_csr := pkg2
					end
					pkg_names.forth
				end
				Result := pkg_names.off
			end
		end

feature -- Comparison

	property_conforms_to (a_child_prop, a_parent_prop: P_BMM_PROPERTY): BOOLEAN
			-- True if `a_child_prop' conforms to `a_parent_prop' such that it could be used to override it; same types are not considered conforming
		do
			-- True if `a_parent_prop' type is Any
			if attached {P_BMM_SINGLE_PROPERTY} a_parent_prop as a_parent_single_prop and then attached a_parent_single_prop.type_def as att_parent_td
				and then att_parent_td.type.same_string (any_type)
			then
				Result := True

			-- property names are the same
			elseif a_child_prop.name.same_string (a_parent_prop.name) then
				if attached {P_BMM_SINGLE_PROPERTY} a_child_prop as a_child_single_prop and attached {P_BMM_SINGLE_PROPERTY} a_parent_prop as a_parent_single_prop then
					if attached a_child_single_prop.type_def as att_child_td and attached a_parent_single_prop.type_def as att_parent_td then
						Result := type_strictly_conforms_to (att_child_td.type, att_parent_td.type)
					end

				elseif attached {P_BMM_SINGLE_PROPERTY_OPEN} a_parent_prop then
					if attached {P_BMM_SINGLE_PROPERTY_OPEN} a_child_prop then
						Result := False
					elseif attached {P_BMM_SINGLE_PROPERTY} a_child_prop then
						Result := True
						-- FIXME: proper type conformance to constraining generic type needs to be checked here
					end

				elseif attached {P_BMM_CONTAINER_PROPERTY} a_child_prop as a_child_cont_prop and attached {P_BMM_CONTAINER_PROPERTY} a_parent_prop as a_parent_cont_prop then
					if attached a_child_cont_prop.type_def as att_child_td and attached a_parent_cont_prop.type_def as att_parent_td then
						Result := type_strictly_conforms_to (att_child_td.as_type_string, att_parent_td.as_type_string)
					end

				elseif attached {P_BMM_GENERIC_PROPERTY} a_child_prop as a_child_gen_prop and attached {P_BMM_GENERIC_PROPERTY} a_parent_prop as a_parent_gen_prop then
					if attached a_child_gen_prop.type_def as att_child_td and attached a_parent_gen_prop.type_def as att_parent_td then
						Result := type_strictly_conforms_to (att_child_td.as_type_string, att_parent_td.as_type_string)
					end
				end
			end
		end

	type_conforms_to (type_1, type_2: STRING): BOOLEAN
			-- check conformance of type 1 to type 2 for substitutability; each type may be generic
		local
			tlist1, tlist2: ARRAYED_LIST[STRING]
		do
			tlist1 := type_name_as_flat_list (type_1)
			tlist2 := type_name_as_flat_list (type_2)
			Result := True
			from
				tlist1.start
				tlist2.start
			until
				tlist1.off or tlist2.off or not Result or not has_class_definition (tlist1.item) or not has_class_definition (tlist2.item)
			loop
				Result := Result and (tlist1.item.is_equal (tlist2.item) or else (ancestors_index.has (tlist1.item.as_upper) and then
					attached ancestors_index.item (tlist1.item.as_upper) as att_anc_idx and then att_anc_idx.has (tlist2.item)))
				tlist1.forth
				tlist2.forth
			end
		end

	type_strictly_conforms_to (type_1, type_2: STRING): BOOLEAN
			-- check conformance of type 1 to type 2 for redefinition; each type may be generic
		do
			Result := not type_same_as (type_1, type_2) and then type_conforms_to (type_1, type_2)
		end

	type_same_as (type_1, type_2: STRING): BOOLEAN
			-- check if type 1 and type 2 are identical; each type may be generic
		do
			Result := type_name_as_flat_list (type_1).is_equal (type_name_as_flat_list (type_2))
		end

feature {SCHEMA_DESCRIPTOR, REFERENCE_MODEL_ACCESS} -- Schema Processing

	validate_created
			-- do some basic validation post initial creation
			-- 1. check that package structure is regular:
			--    a) only top-level packages can have qualified names
			--    b) no top-level package name can be a direct parent or child of another
			--		 (child package must be declared under the parent)
			-- 2. check that all classes are mentioned in the package structure
			-- 3. check that all models refer to valid packages
		require
			state = State_created
		local
			pkg_names: ARRAY [STRING]
		do
			-- check top-level names - package names cannot contain each other and be siblings
			pkg_names := packages.current_keys
			across packages as packages_csr loop
				if pkg_names.there_exists (
					agent (nm, pkg_name: STRING): BOOLEAN
						do
							Result := not pkg_name.same_string (nm) and then
								(pkg_name.starts_with (nm) or nm.starts_with (pkg_name))
						end (?, packages_csr.item.name)
					)
				then
					add_error (ec_BMM_PKGTL, <<schema_id>>)
				end
			end

			-- check no duplicate properties in any class
			do_all_classes (
				agent (a_class_def: P_BMM_CLASS)
					local
						prop_list: ARRAYED_SET [STRING]
					do
						create prop_list.make (0)
						prop_list.compare_objects
						across a_class_def.properties as props_csr loop
							if prop_list.has (props_csr.item.name) then
								add_error (ec_BMM_PRDUP, <<schema_id, a_class_def.name, props_csr.item.name>>)
							else
								prop_list.extend (props_csr.item.name)
							end
						end
					end
			)

			-- validate package & class structure
			do_recursive_packages (
				agent (a_pkg: P_BMM_PACKAGE)
					do
						-- check for lower-down qualified names
						if not packages.has_item (a_pkg) and a_pkg.name.has (package_name_delimiter) then
							add_error (ec_BMM_PKGQN, <<schema_id, a_pkg.name>>)
						end

						-- check if all classes mentioned in each package exist in the local schema
						across a_pkg.classes as classes_csr loop
							if classes_csr.item.is_empty then
								add_error (ec_BMM_PKGCE, <<schema_id, a_pkg.name>>)
							elseif not has_class_definition (classes_csr.item) then
								add_error (ec_BMM_PKGCL, <<schema_id, classes_csr.item, a_pkg.name>>)
							end
						end
					end
			)

			if passed then
				add_info (ec_bmm_schema_info_loaded, << schema_id, primitive_types.count.out, class_definitions.count.out >>)
				state := State_validated_created
			end
		end

	load_finalise
			-- Finalisation work:
			-- 1. convert packages to canonical form, i.e. full hierarchy with no packages with names like aa.bb.cc
			-- 2. set up include processing list
		require
			state = State_validated_created
		local
			child_pkg: P_BMM_PACKAGE
			pkg_csr: like packages
			child_pkg_key: STRING
		do
			-- top-level package canonicalisation: the result is that in each P_BMM_SCHEMA, the
			-- attribute `canonical_packages' contains the mergeable structure
			across packages as top_packages_csr loop
				if attached top_packages_csr.item as top_pkg then
					if top_pkg.name.has (package_name_delimiter) then
						-- iterate over qualified name, inserting new packages for each of these names.
						-- E.g. 'rm.composition.content' causes three new packages 'rm', 'composition'
						-- and 'content' to be created and linked, with the 'rm' one being put in
						-- `canonical_packages'
						pkg_csr := canonical_packages
						child_pkg := top_pkg
						across top_pkg.name.split (Package_name_delimiter) as child_pkg_names_csr loop
							child_pkg_key := child_pkg_names_csr.item.as_upper
							if pkg_csr.has (child_pkg_key) and then attached pkg_csr.item (child_pkg_key) as cp then
								child_pkg := cp
							else
								create child_pkg.make (child_pkg_names_csr.item)
								pkg_csr.put (child_pkg, child_pkg_key)
							end
							pkg_csr := child_pkg.packages
						end

						-- now we need to make the final package in the chain created above contain
						-- the same references as the original package with the qualified name
						child_pkg.make_from_other (top_pkg)
					else
						-- just create a reference in the canonical packages; note that this precludes
						-- the situation where top-level packages like 'rm' and 'rm.composition.content'
						-- co-exist - this would be bad structure
						canonical_packages.put (top_pkg, top_pkg.name.as_upper)
					end
				end
			end

			-- set up the includes processing list
			if includes.is_empty then
				state := State_includes_processed
			else
				across includes as includes_csr loop
					includes_to_process.extend (includes_csr.item.id)
				end
				state := State_includes_pending
			end
		end

	merge (included_schema: P_BMM_SCHEMA)
			-- merge in class and package definitions from `included_schema', except where the current schema already has
			-- a definition for the given type or package
		require
			Loaded: state = State_includes_pending
			Other_valid: includes_to_process.has (included_schema.schema_id)
		do
			-- archetype parent class: only merge if nothing already in the higher-level schema
			if attached included_schema.archetype_parent_class and not attached archetype_parent_class then
				archetype_parent_class := included_schema.archetype_parent_class
			end
			-- archetype data value parent class: only merge if nothing already in the higher-level schema
			if attached included_schema.archetype_data_value_parent_class and not attached archetype_data_value_parent_class then
				archetype_data_value_parent_class := included_schema.archetype_data_value_parent_class
			end
			-- archetype closures
			archetype_rm_closure_packages.merge (included_schema.archetype_rm_closure_packages)

			-- primitive types
			across included_schema.primitive_types as other_prim_types_csr loop
				-- note that `put' only puts the class defintion from the included schema only if the current one does not already
				-- have a definition for that class name. Since higher-level schemas are processed first, any over-rides they
				-- contain will stay, with the classes being overridden being ignored - which is the desired behaviour.
				if primitive_types.has (other_prim_types_csr.key) then
					if primitive_type (other_prim_types_csr.key).uid /= other_prim_types_csr.item.uid then
						primitive_type (other_prim_types_csr.key).set_is_override
					end
				else
					primitive_types.put (other_prim_types_csr.item.deep_twin, other_prim_types_csr.key)
				end
			end

			-- classes
			across included_schema.class_definitions as other_classes_csr loop
				-- note that `put' only puts the class definition from the included schema only if the current one does not already
				-- have a definition for that class name. Since higher-level schemas are processed first, any over-rides they
				-- contain will stay, with the classes being overridden being ignored - which is the desired behaviour.
				if class_definitions.has (other_classes_csr.key) then
					if class_definition (other_classes_csr.key).uid /= other_classes_csr.item.uid then
						class_definition (other_classes_csr.key).set_is_override
					end
				else
					class_definitions.put (other_classes_csr.item.deep_twin, other_classes_csr.key)
				end
			end

			-- packages
			-- merge from included_schema.packages, because that's where the proper hierarchically structured packages are
			across included_schema.canonical_packages as included_pkgs_csr loop
				if canonical_packages.has (included_pkgs_csr.key) then
					canonical_packages_item (included_pkgs_csr.key).merge (included_pkgs_csr.item)
				else
					canonical_packages.put (included_pkgs_csr.item.deep_twin, included_pkgs_csr.key)
				end
			end

			-- remove included_schema schema from remaining list of included schemas to process
			includes_to_process.prune_all (included_schema.schema_id)
			if includes_to_process.is_empty then
				state := State_includes_processed
			end
		end

	ready_to_validate: BOOLEAN
		do
			Result := state = State_includes_processed
		end

	validate
			-- main validation prior to generation of BMM_SCHEMA; access to `all_schemas' allows errors to be allocated to
			-- correct schema
		local
			package_classes: HASH_TABLE [STRING, STRING]
			class_names: ARRAYED_LIST [STRING]
		do
			-- compute ancestors index:
			-- pass 1: add class direct ancestors
			do_all_classes (
				agent (a_class_def: P_BMM_CLASS)
					local
						anc_list: ARRAYED_SET [STRING]
					do
						create anc_list.make (0)
						anc_list.compare_objects
						anc_list.merge (a_class_def.ancestors)
						ancestors_index.put (anc_list, a_class_def.name.as_upper)
					end
			)
			-- pass 2: add indirect ancestors
			do_all_classes (
				agent (a_class_def: P_BMM_CLASS)
					local
						anc_list_copy: ARRAYED_SET [STRING]
					do
						if attached ancestors_index.item (a_class_def.name.as_upper) as anc_list then
							anc_list_copy := anc_list.deep_twin -- create a copy for iteration purposes
							across anc_list_copy as anc_copy_csr loop
								if ancestors_index.has (anc_copy_csr.item.as_upper) and then attached ancestors_index.item (anc_copy_csr.item.as_upper) as iter_anc_list then
									anc_list.merge (iter_anc_list)
								end
							end
						end
					end
			)

			-- check that RM shema release is valid
			if not valid_standard_version (rm_release) then
				add_error (ec_BMM_RMREL, <<schema_id, rm_release>>)
			end

			-- check archetype parent class in list of class names
			if attached archetype_parent_class as apc and then not has_class_definition (apc) then
				add_error (ec_BMM_ARPAR, <<schema_id, apc>>)
			end

			-- check that all models refer to declared packages
			across archetype_rm_closure_packages as pkgs_csr loop
				if not has_canonical_package_path (pkgs_csr.item) then
					add_error (ec_BMM_MDLPK, <<schema_id, pkgs_csr.item>>)
				end
			end

			-- check that no duplicate class names are found in packages
			create package_classes.make (0)
			across canonical_packages as pkgs_csr loop
				pkgs_csr.item.do_recursive_classes (
					agent (a_pkg: P_BMM_PACKAGE; a_class_name: STRING; pkg_class_list: HASH_TABLE [STRING, STRING])
						local
							cname: STRING
						do
							cname := a_class_name.as_lower
							if pkg_class_list.has (cname) and then attached pkg_class_list.item (cname) as cl_item then
								add_error (ec_BMM_CLPKDP, <<schema_id, a_class_name, a_pkg.name, cl_item>>)
							else
								pkg_class_list.put (a_pkg.name, cname)
							end
						end (?, ?, package_classes)
				)
			end

			-- check that every class is in a package
			create class_names.make (0)
			class_names.compare_objects
			do_all_classes (
				agent (a_class_def: P_BMM_CLASS; pkg_class_list: HASH_TABLE [STRING, STRING]; class_name_list: ARRAYED_LIST [STRING])
					local
						cname: STRING
					do
						cname := a_class_def.name.as_lower
						if not pkg_class_list.has (cname) then
							add_error (ec_BMM_PKGID, <<schema_id, a_class_def.name>>)
						elseif class_name_list.has (cname) then
							add_error (ec_BMM_CLDUP, <<schema_id, a_class_def.name>>)
						else
							class_name_list.extend (cname)
						end
					end (?, package_classes, class_names)
			)

			-- for all classes, validate all properties
			do_all_classes (agent (a_class_def: P_BMM_CLASS) do validate_class (a_class_def) end)
		end

	validate_class (a_class_def: P_BMM_CLASS)
		do
			-- check that all ancestors exist
			across a_class_def.ancestors as ancs_csr loop
				if ancs_csr.item.is_empty then
					add_validity_error (a_class_def.source_schema_id, ec_BMM_ANCE, <<a_class_def.source_schema_id, a_class_def.name>>)
				elseif not has_class_definition (ancs_csr.item) then
					add_validity_error (a_class_def.source_schema_id, ec_BMM_ANC, <<a_class_def.source_schema_id, a_class_def.name, ancs_csr.item>>)
				end
			end

			-- check that all generic parameter.conforms_to_type exist
			if not has_errors then
				if a_class_def.is_generic and attached a_class_def.generic_parameter_defs as att_gen_parm_defs then
					across att_gen_parm_defs as gen_param_defs_csr loop
						if attached gen_param_defs_csr.item.conforms_to_type as conf_type and then not has_class_definition (conf_type) then
							add_validity_error (a_class_def.source_schema_id, ec_bmm_gpct,
								<<a_class_def.source_schema_id, a_class_def.name, gen_param_defs_csr.item.name, conf_type>>)
						end
					end
				end
			end

			-- validate the properties
			if not has_errors then
				across a_class_def.properties as props_csr loop
					validate_property (a_class_def, props_csr.item)
				end
			end

		end

	validate_property (a_class_def: P_BMM_CLASS; a_prop_def: P_BMM_PROPERTY)
		local
			gen_parm_refs: ARRAYED_LIST [P_BMM_TYPE]
			gen_parm_actual_open_count: INTEGER
			gen_root_type: P_BMM_CLASS
		do
			-- first check if any property replicates a property from a parent class
			across a_class_def.ancestors as ancs_csr loop
				if attached class_definition (ancs_csr.item) as anc_class and then anc_class.properties.has (a_prop_def.name) and then
					attached anc_class.properties.item (a_prop_def.name) as anc_prop and then not
					property_conforms_to (a_prop_def, anc_prop)
				then
					add_validity_error (a_class_def.source_schema_id, ec_BMM_PRNCF,
						<<a_class_def.source_schema_id, a_class_def.name, a_prop_def.name, ancs_csr.item>>)
				end
			end

			if attached {P_BMM_SINGLE_PROPERTY} a_prop_def as a_single_prop_def then
				check attached a_single_prop_def.type_def as att_type_def then
					if (att_type_def.type.is_empty or else not has_class_definition (att_type_def.type)) then
						add_validity_error (a_class_def.source_schema_id, ec_BMM_SPT,
							<<a_class_def.source_schema_id, a_class_def.name, a_single_prop_def.name, att_type_def.type>>)
					end
				end

			elseif attached {P_BMM_SINGLE_PROPERTY_OPEN} a_prop_def as a_single_prop_def_open then
				check attached a_single_prop_def_open.type_def as att_type_def then
					if not a_class_def.is_generic or else (attached a_class_def.generic_parameter_defs as att_gen_parm_defs and then not att_gen_parm_defs.has (att_type_def.type)) then
						add_validity_error (a_class_def.source_schema_id, ec_BMM_SPOT,
							<<a_class_def.source_schema_id, a_class_def.name, a_single_prop_def_open.name, att_type_def.type>>)
					end
				end

			elseif attached {P_BMM_CONTAINER_PROPERTY} a_prop_def as a_cont_prop_def then
				if attached a_cont_prop_def.type_def as att_type_def then
					if not has_class_definition (att_type_def.container_type) then
						add_validity_error (a_class_def.source_schema_id, ec_BMM_CPCT,
							<<a_class_def.source_schema_id, a_class_def.name, a_cont_prop_def.name, att_type_def.container_type>>)
					elseif attached att_type_def.type_ref as att_type_ref then
						-- loop through types inside container type
						across att_type_ref.flattened_type_list as types_csr loop
							if not has_class_definition (types_csr.item) then
								if a_class_def.is_generic then -- it might be a formal parameter, to be matched against those of enclosing class
									check attached a_class_def.generic_parameter_defs as att_gen_parm_defs then
										if not att_gen_parm_defs.has (types_csr.item) then
											add_validity_error (a_class_def.source_schema_id, ec_BMM_GPGPU,
												<<a_class_def.source_schema_id, a_class_def.name, a_cont_prop_def.name, a_class_def.name, types_csr.item>>)
										end
									end
								else
									add_validity_error (a_class_def.source_schema_id, ec_BMM_CPTV,
										<<a_class_def.source_schema_id, a_class_def.name, a_cont_prop_def.name, types_csr.item>>)
								end
							end
						end
					else
						-- Report?
					end
				else
					add_validity_error (a_class_def.source_schema_id, ec_BMM_CPT,
						<<a_class_def.source_schema_id, a_class_def.name, a_cont_prop_def.name>>)
				end

				if not attached a_cont_prop_def.cardinality then
					add_validity_info (a_class_def.source_schema_id, ec_BMM_CPTNC,
						<<a_class_def.source_schema_id, a_class_def.name, a_cont_prop_def.name>>)
				end

			elseif attached {P_BMM_GENERIC_PROPERTY} a_prop_def as a_gen_prop_def then
				if attached a_gen_prop_def.type_def as gen_type_def then
					if not has_class_definition (gen_type_def.root_type) then
						add_validity_error (a_class_def.source_schema_id, ec_BMM_GPRT,
							<<a_class_def.source_schema_id, a_class_def.name, a_gen_prop_def.name, gen_type_def.root_type>>)
					else
						-- check that all actual generic parameters are either defined classes, or open
						gen_parm_refs := gen_type_def.generic_parameter_refs
						gen_root_type := class_definition (gen_type_def.root_type)
						if attached gen_root_type.generic_parameter_defs as root_formal_parms then
							-- the root class is generic, but actual and formal params count don't match
							if gen_parm_refs.count /= root_formal_parms.count then
								add_validity_error (a_class_def.source_schema_id, ec_BMM_GPBPC,
									<<a_class_def.source_schema_id, a_class_def.name, a_gen_prop_def.name, gen_parm_refs.count.out, root_formal_parms.count.out, gen_root_type.name>>)
							else
								gen_parm_actual_open_count := 0
								across gen_parm_refs as gen_parms_csr loop
									if attached {P_BMM_SINGLE_PROPERTY_OPEN} gen_parms_csr.item then
										gen_parm_actual_open_count := gen_parm_actual_open_count + 1
									end
									across gen_parms_csr.item.flattened_type_list as gen_parm_types_csr loop
										if not has_class_definition (gen_parm_types_csr.item) then
											-- it might be a formal parameter, to be matched against those of enclosing class
											if a_class_def.is_generic then
												check attached a_class_def.generic_parameter_defs as att_gen_parm_defs then
													if not att_gen_parm_defs.has (gen_parm_types_csr.item) then
														add_validity_error (a_class_def.source_schema_id, ec_BMM_GPGPU,
															<<a_class_def.source_schema_id, a_class_def.name, a_gen_prop_def.name, a_class_def.name, gen_parm_types_csr.item>>)
													end
												end
											else
												add_validity_error (a_class_def.source_schema_id, ec_BMM_GPGPT,
													<<a_class_def.source_schema_id, a_class_def.name, a_gen_prop_def.name, gen_parm_types_csr.item>>)
											end
										end
									end
								end

								-- check that the number of open generic parameters in the property matches the number in the containing class
								if attached a_class_def.generic_parameter_defs as formal_parms then
									if gen_parm_actual_open_count > formal_parms.count then
										add_validity_error (a_class_def.source_schema_id, ec_BMM_GPOPC,
											<<a_class_def.source_schema_id, a_class_def.name, a_gen_prop_def.name>>)
									end
								end
							end
						else
							-- root class is not even generic
							add_validity_error (a_class_def.source_schema_id, ec_BMM_GPRTNG,
								<<a_class_def.source_schema_id, a_class_def.name, a_gen_prop_def.name, gen_root_type.name>>)
						end
					end
				else
					add_validity_error (a_class_def.source_schema_id, ec_BMM_GPT,
						<<a_class_def.source_schema_id, a_class_def.name, a_gen_prop_def.name>>)
				end
			end
		end

feature -- Factory

	create_bmm_model
			-- generate a BMM_MODEL object
		require
			state = State_includes_processed
		local
			new_rm: BMM_MODEL
		do
			--------- PASS 1 ----------
			create new_rm.make (rm_publisher, schema_name, rm_release)
			bmm_model_cache := new_rm
			new_rm.set_schema_author (schema_author)
			if not schema_contributors.is_empty then
				new_rm.set_schema_contributors (schema_contributors)
			end
			new_rm.set_schema_lifecycle_state (schema_lifecycle_state)
			new_rm.set_schema_revision (schema_revision)
			new_rm.set_schema_description (schema_description)

			-- packages - add package structure only, no classes yet
			across canonical_packages as pkgs_csr loop
				pkgs_csr.item.create_bmm_package_definition
				if attached pkgs_csr.item.bmm_package_definition as pkg_def then
					new_rm.add_package (pkg_def)
				end
			end

			-- now add classes. We do this in such a way that all ancestors of a class
			-- are added before the class itself.
			across canonical_packages as pkgs_csr loop
				pkgs_csr.item.do_recursive_classes (agent add_bmm_schema_class_definition)
			end

			-- set the archetype root class
			if attached archetype_parent_class as apc then
				new_rm.set_archetype_parent_class (apc)
			end
			-- set the archetype data value root class
			if attached archetype_data_value_parent_class as advp then
				new_rm.set_archetype_data_value_parent_class (advp)
			end
			-- set the archetype data value root class
			if attached archetype_visualise_descendants_of as avd then
				new_rm.set_archetype_visualise_descendants_of (avd)
			end
			-- add RM closure packages - clone because merging will change the structure in the BMM_SCHEMA
			new_rm.set_archetype_rm_closure_packages (archetype_rm_closure_packages.deep_twin)

			--------- PASS 2 ----------
			-- populate BMM_CLASS objects
			do_all_classes_in_order (
				agent (a_class_def: P_BMM_CLASS; an_rm: BMM_MODEL)
					do
						a_class_def.populate_bmm_class (an_rm)
					end (?, new_rm))
		end

	add_bmm_schema_class_definition (a_pkg: P_BMM_PACKAGE; a_class_name: STRING)
			-- create the BMM_CLASS object, add it to the BMM_SCHEMA;
			-- set its source_schema_id; set its primitive_type flag; its BMM_SCHEMA link will also be set
		do
			if attached class_definition (a_class_name) as p_class_def then
				p_class_def.create_bmm_class
				if attached p_class_def.bmm_class as bmm_class_def and attached a_pkg.bmm_package_definition as pkg_def then
					if primitive_types.has (a_class_name.as_upper) then
						bmm_class_def.set_primitive_type
					end
					if p_class_def.is_override then
						bmm_class_def.set_is_override
					end
					bmm_model.add_class_definition (bmm_class_def, pkg_def)
				end
			end
		end

	missed_class_count: INTEGER

feature {DT_OBJECT_CONVERTER} -- Persistence

	persistent_attributes: detachable ARRAYED_LIST[STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		do
		end

	finalise_dt
			-- Finalisation work:
			-- 1. Do name case conversion on primitive classes
		local
			keys: ARRAY [STRING]
			i: INTEGER
		do
			-- set bmm_version if not found in schema
			if attached bmm_version then
				bmm_version_from_schema := True
			else
				bmm_version := Assumed_bmm_version
			end

			-- has to be done in two gos, because changing keys messs with the table structure
			-- if done in one pass			
			keys := primitive_types.current_keys
			from i := 1 until i > keys.count loop
				primitive_types.replace_key (keys.item(i).as_upper, keys.item(i))
				i := i + 1
			end

			keys := class_definitions.current_keys
			from i := 1 until i > keys.count loop
				if not keys.item(i).is_equal (keys.item(i).as_upper) then
					class_definitions.replace_key (keys.item(i).as_upper, keys.item(i))
				end
				i := i + 1
			end

			-- set all packages keys to upper case
			correct_packages_keys

			-- assign unique ids to all class objects, to enable collision detection during merging
			do_all_classes (
				agent (a_class_def: P_BMM_CLASS)
					do
						a_class_def.set_uid (uid_counter.item)
						uid_counter.put (uid_counter.item + 1)
						a_class_def.set_source_schema_id (schema_id)
					end
			)
		end

feature {REFERENCE_MODEL_ACCESS} -- Implementation

	schema_error_table: HASH_TABLE [ERROR_ACCUMULATOR, STRING]
			-- set of error accumulators for other schemas, keyed by schema id
		do
			if attached schema_error_table_cache as set then
				Result := set
			else
				create Result.make (0)
				schema_error_table_cache := Result
			end
		end

feature {NONE} -- Implementation

	uid_counter: CELL [INTEGER]
		once
			create Result.put (1)
		end

	do_all_classes (action: PROCEDURE [ANY, TUPLE [P_BMM_CLASS]])
			-- do some action to all primitive type and class objects
			-- process in any order
		do
			across primitive_types as prim_types_csr loop
				action.call ([prim_types_csr.item])
			end
			across class_definitions as class_defs_csr loop
				action.call ([class_defs_csr.item])
			end
		end

	do_all_classes_in_order (action: PROCEDURE [ANY, TUPLE [P_BMM_CLASS]])
			-- do some action to all primitive type and class objects
			-- process in breadth first order of inheritance tree
		local
			attempts, missed_count: INTEGER
			visited_classes: ARRAYED_LIST [STRING]
		do
			create visited_classes.make (0)
			visited_classes.compare_objects
			from missed_count := 1 until missed_count = 0 or else attempts > max_add_attempts loop
				missed_count := 0
				across primitive_types as prim_types_csr loop
					if not visited_classes.has (prim_types_csr.item.name.as_upper) then
						if prim_types_csr.item.ancestors.is_empty or else
							across prim_types_csr.item.ancestors as ancs_csr all visited_classes.has (ancs_csr.item.as_upper) end
						then
							action.call ([prim_types_csr.item])
							visited_classes.extend (prim_types_csr.item.name.as_upper)
						else
							missed_count := missed_count + 1
						end
					end
				end
				attempts := attempts + 1
			end
			attempts := 0
			from missed_count := 1 until missed_count = 0 or else attempts > max_add_attempts loop
				missed_count := 0
				across class_definitions as class_defs_csr loop
					if not visited_classes.has (class_defs_csr.item.name.as_upper) then
						if class_defs_csr.item.ancestors.is_empty or else
							across class_defs_csr.item.ancestors as ancs_csr all visited_classes.has (ancs_csr.item.as_upper) end
						then
							action.call ([class_defs_csr.item])
							visited_classes.extend (class_defs_csr.item.name.as_upper)
						else
							missed_count := missed_count + 1
						end
					end
				end
				attempts := attempts + 1
			end
		end

	add_validity_error (source_schema_id, a_key: STRING; args: ARRAY [STRING])
			-- append an error with key `a_key' and `args' array to the `errors' string to the
			-- error list for schema with `a_schema_id'
		do
			if source_schema_id.same_string (schema_id) then
				add_error (a_key, args)
			else
				if not schema_error_table.has (source_schema_id) then
					schema_error_table.put (create {ERROR_ACCUMULATOR}.make, source_schema_id)
				end
				check attached schema_error_table.item (source_schema_id) as att_schema_err then
					att_schema_err.add_error (a_key, args, "")
				end
				add_error (ec_BMM_INCERR, <<schema_id, source_schema_id>>)
			end
		end

	add_validity_warning (source_schema_id, a_key: STRING; args: ARRAY [STRING])
			-- append a warning with key `a_key' and `args' array to the `errors' string to the
			-- error list for schema with `a_schema_id'
		do
			if source_schema_id.same_string (schema_id) then
				add_warning (a_key, args)
			else
				if not schema_error_table.has (source_schema_id) then
					schema_error_table.put (create {ERROR_ACCUMULATOR}.make, source_schema_id)
				end
				check attached schema_error_table.item (source_schema_id) as att_schema_err then
					att_schema_err.add_warning (a_key, args, "")
				end
			end
		end

	add_validity_info (source_schema_id, a_key: STRING; args: ARRAY [STRING])
			-- append an info message with key `a_key' and `args' array to the `errors' string to the
			-- error list for schema with `a_schema_id'
		do
			if source_schema_id.same_string (schema_id) then
				add_info (a_key, args)
			else
				if not schema_error_table.has (source_schema_id) then
					schema_error_table.put (create {ERROR_ACCUMULATOR}.make, source_schema_id)
				end
				check attached schema_error_table.item (source_schema_id) as att_schema_err then
					att_schema_err.add_info (a_key, args, "")
				end
			end
		end

	schema_error_table_cache: detachable HASH_TABLE [ERROR_ACCUMULATOR, STRING]
			-- set of error accumulators for other schemas, keyed by schema id
		note
			option: transient
		attribute
		end

	ancestors_index_cache: detachable HASH_TABLE [ARRAYED_SET [STRING], STRING]
			-- index of all ancestors of each class
		note
			option: transient
		attribute
		end

	includes_to_process_cache: detachable ARRAYED_LIST [STRING]
			-- list of includes to process during setup
		note
			option: transient
		attribute
		end

	canonical_packages_cache: detachable HASH_TABLE [P_BMM_PACKAGE, STRING]
		note
			option: transient
		attribute
		end

	bmm_model_cache: detachable BMM_MODEL
		note
			option: transient
		attribute
		end

end


