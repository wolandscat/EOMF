note
	component:   "Eiffel Object Modelling Framework"
	description: "Access to service interface to object model"
	keywords:    "ADL, archetype, reference model"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_MODEL_ACCESS

inherit
	ANY_VALIDATOR

	KL_SHARED_FILE_SYSTEM
		export
			{NONE} all;
			{ANY} file_system
		end

	BMM_MESSAGES_IDS
		export
			{NONE} all
		end

	BMM_DEFINITIONS
		export
			{NONE} all
		end

	EXCEPTIONS
		export
			{NONE} all
		end

create
	make

feature -- Definitions

	Max_inclusion_depth: INTEGER = 10
			-- maximum number of levels of schema inclusion

feature {NONE} -- Initialisation

	make
		do
			reset
			create {ARRAYED_LIST[STRING]} schema_directories.make (0)
			exception_encountered := False
			create all_schemas.make_caseless(0)
			create candidate_schemas.make_caseless(0)
			create bmm_models.make_caseless (0)
			create matching_bmm_models.make_caseless (0)
			create schema_inclusion_map.make_caseless(0)
			create {ARRAYED_LIST[STRING]} schemas_load_list.make(0)
			schemas_load_list.compare_objects
		end

feature -- Initialisation

	initialise_with_load_list (schema_dirs: LIST [STRING]; a_schemas_load_list: LIST [STRING])
			-- initialise with a specific schema load list, usually a sub-set of schemas that will be
			-- found in the directory `an_absolute_dir'
		require
			Rm_dir_valid: across schema_dirs as sch_csr all file_system.directory_exists (sch_csr.item) end
		do
			make
			schema_directories := schema_dirs
			schemas_load_list.append (a_schemas_load_list)
			reload_schemas
		ensure
			Schemas_dir_set: schema_directories = schema_dirs
		end

	initialise_all (schema_dirs: LIST [STRING])
			-- initialise with all schemas found in the directory `schema_dirs'
		do
			initialise_with_load_list (schema_dirs, create {ARRAYED_LIST [STRING]}.make(0))
		end

feature -- Access

	schema_directories: LIST [STRING]
			-- List of directories where all the schemas loaded here are found

	all_schemas: STRING_TABLE [BMM_SCHEMA_DESCRIPTOR]
			-- all schemas found and loaded from `schema_directory'
			-- Keyed by schema_id, i.e.
			-- 		model_publisher '_' schema_name '_' model_release
			-- e.g. openehr_rm_1.0.3, openehr_test_1.0.1, iso_13606-1_2008
			-- This is the same key as BMM_SCHEMA.schema_id
			-- Does not include schemas that failed to parse (i.e. SCHEMA_ACCESS.passed = False)

	all_schemas_item (a_schema_id: READABLE_STRING_GENERAL): BMM_SCHEMA_DESCRIPTOR
		do
			check attached all_schemas.item (a_schema_id) as att_item then
				Result := att_item
			end
		end

	candidate_schemas: STRING_TABLE [BMM_SCHEMA_DESCRIPTOR]
			-- includes only fully validated schemas

	bmm_models: STRING_TABLE [BMM_MODEL]
			-- All validated models, generated from fully merged source schemas. Table is keyed by model_id,
			-- i.e. model_publisher '_' model_name '_' model_release, e.g. "openehr_ehr_1.0.4"

	matching_bmm_models: STRING_TABLE [BMM_MODEL]
			-- Validated models, keyed by model_id, or any shortened form. Populated on demand.

	model_descriptors_by_publisher: STRING_TABLE [ARRAYED_LIST [BMM_SCHEMA_DESCRIPTOR]]
			-- all models keyed by publisher; this includes non-valid schemas
			-- so they can be displayed and edited by the user
			-- keyed by schema.publisher name
		local
			publisher_schemas: ARRAYED_LIST [BMM_SCHEMA_DESCRIPTOR]
			model_publisher: STRING
		do
			create Result.make_caseless (0)
			across all_schemas as schemas_csr loop
				if schemas_csr.item.is_top_level then
					check attached schemas_csr.item.meta_data.item (metadata_rm_publisher) as pub then
						model_publisher :=  pub
					end
					if not Result.has (model_publisher) then
						create publisher_schemas.make (0)
						Result.put (publisher_schemas, model_publisher)
					else
						check attached Result.item (model_publisher) as pub_schs then
							publisher_schemas := pub_schs
						end
					end
					publisher_schemas.extend (schemas_csr.item)
				end
			end
		end

	bmm_model (a_model_key: STRING): BMM_MODEL
			-- Return ref model containing the model-class key `a_model_key`, e.g. "openEHR_EHR_1.0.4",
			-- or a non-or partly-versioned form, e.g. "openEHR_EHR_1.0", "openEHR_EHR_1", "openEHR_EHR" etc
			-- In each case, the most recent match in terms of matching versions is returned.
		require
			has_bmm_model (a_model_key)
		do
			if attached bmm_models.item (a_model_key) as mod then
				Result := mod
			else
				check attached matching_bmm_models.item (a_model_key) as mod then
					Result := mod
				end
			end
		end

	schemas_load_list: LIST [STRING]
			-- initial load list for this session, set during initialisation. This may initially be empty
			-- or contain invalid entries; it will be modified to correctly list the actual schemas found

	schemas_load_list_string: STRING
			-- generate a list of schema names as a string, for use in error reporting
		do
			create Result.make_empty
			across schemas_load_list as schemas_list_csr loop
				if schemas_list_csr.cursor_index > 1 then
					Result.append (", ")
				end
				Result.append (schemas_list_csr.item)
			end
		end

	load_count: INTEGER
			-- load counter so other parts of the application can see if anything has changed

	exception_encountered: BOOLEAN
			-- set to True if any processing failed

feature -- Status Report

	has_schema_directory: BOOLEAN
			-- true if there is a valid schema directory set
		do
			Result := not schema_directories.is_empty
		end

	has_bmm_model (a_model_key: STRING): BOOLEAN
			-- True if there is a schema containing the qualified package key `a_model_key`, e.g. "openEHR_EHR_1.0.4",
			-- or a non-or partly-versioned form, e.g. "openEHR_EHR_1.0", "openEHR_EHR_1", "openEHR_EHR" etc
		local
			cand_model_id: detachable STRING
			cand_ver, new_ver: STRING
		do
			Result := bmm_models.has (a_model_key)
			if not Result then
				cand_ver := "0.0.0"
				across bmm_models.current_keys as model_ids_csr loop
					if model_ids_csr.item.substring (1, a_model_key.count).is_case_insensitive_equal (a_model_key) then
						new_ver := schema_id_version (model_ids_csr.item.as_string_8)
						if version_less_than (cand_ver, new_ver) then
							cand_model_id := model_ids_csr.item.as_string_8
							cand_ver := new_ver
						end
					end
				end

				if attached cand_model_id then
					Result := True
					matching_bmm_models.put (bmm_model (cand_model_id), a_model_key)
				end
			end
		end

	found_valid_models: BOOLEAN
			-- True if any Reference Model schemas were found
		do
			Result := not bmm_models.is_empty
		end

	load_attempted: BOOLEAN
			-- has any attempt been made to load schemas? Useful for other parts of the system to base
			-- preconditions on
		do
			Result := load_count > 0
		end

feature -- Validation

	validate
		do
		end

feature -- Commands

	set_schema_load_list (a_schemas_load_list: LIST [STRING])
		do
			schemas_load_list.wipe_out
			schemas_load_list.append (a_schemas_load_list)
		ensure
			Schemas_load_list_set: schemas_load_list.is_equal (a_schemas_load_list)
		end

	reload_schemas
			-- reload schemas from current schema dir
		do
			reset
			load_schema_descriptors
			if not has_errors then
				load_schemas
			end
		end

feature {NONE} -- Implementation

	schema_inclusion_map: STRING_TABLE [ARRAYED_LIST [STRING]]
			-- map of inclusions among schemas found in the directory; structure:
			-- {key = schema_id; {list of schemas that 'include' key}}
			-- Schemas not included by other schemas have NO ENTRY in this list
			-- this is detected and used to populate `top_level_schemas'

	load_schema_descriptors
			-- initialise `rm_schema_metadata_table' by finding all the schema files in the directory tree of `schema_directory'
			-- and for each one, doing a fast parse to obtain the descriptive meta-data found in the first few lines
		require
			has_schema_directory
		local
			dir: KL_DIRECTORY
			bmm2_file_repo: FILE_REPOSITORY
		do
			if not exception_encountered then
				all_schemas.wipe_out
				across schema_directories as sch_dir_csr loop
					create dir.make (sch_dir_csr.item)
					if not (dir.exists and dir.is_readable) then
						add_error (ec_bmm_schema_dir_not_valid, <<sch_dir_csr.item>>)
					elseif dir.is_empty then
						add_error (ec_bmm_schema_dir_contains_no_schemas, <<sch_dir_csr.item>>)
					else
						create bmm2_file_repo.make (sch_dir_csr.item, bmm2_schema_file_match_regex)
						across bmm2_file_repo.matching_paths as paths_csr loop
							process_schema_file (paths_csr.item)
						end
						if all_schemas.is_empty then
							add_error (ec_bmm_schema_dir_contains_no_schemas, <<sch_dir_csr.item>>)
						end
					end
				end
			end
		rescue
			exception_encountered := True
			add_error (ec_bmm_schema_unknown_exception, Void)
			retry
		end

	process_schema_file (a_schema_file_path: STRING)
			-- read in the schema `a_schema_file_path'
		local
			dmp: ODIN_MINI_PARSER
			sd: P_BMM_SCHEMA_DESCRIPTOR
		do
			create dmp
			dmp.extract_attr_values (a_schema_file_path, Schema_fast_parse_attrs)
			if dmp.last_parse_valid then
				dmp.last_parse_content.put (a_schema_file_path, Metadata_schema_path)
				create sd.make (dmp.last_parse_content)

				-- check for two schema files purporting to be the exact same schema (including release)
				if sd.errors.has_errors then
					add_error (ec_bmm_schema_load_failure, <<sd.schema_id, sd.errors.as_string>>)
				elseif all_schemas.has (sd.schema_id) then
					add_warning (ec_bmm_schema_duplicate_schema_found, <<sd.schema_id, a_schema_file_path>>)
				else
					all_schemas.put (sd, sd.schema_id)
				end
			else
				add_warning (ec_bmm_schema_rm_missing, <<a_schema_file_path, dmp.last_parse_fail_reason>>)
			end
		end

	load_schemas
			-- populate the rm_schemas table by reading in schemas either specified in the 'rm_schemas_load_list'
			-- config variable, or by reading all schemas found in the schema directory
		local
			i: INTEGER
			finished: BOOLEAN
			schema_desc: BMM_SCHEMA_DESCRIPTOR
		do
			if not exception_encountered then
				-- populate the rm_schemas table first
				bmm_models.wipe_out
				matching_bmm_models.wipe_out
				schema_inclusion_map.wipe_out
				candidate_schemas.wipe_out

				if not all_schemas.is_empty then
					-- reset all schemas error logs
					across all_schemas as all_schemas_csr loop
						all_schemas_csr.item.reset
					end

					-- set list of schemas to load; used later to determine what to put in `top_level_schemas'
					if not schemas_load_list.is_empty then
						from schemas_load_list.start until schemas_load_list.off loop
							if not all_schemas.has (schemas_load_list.item) then
								add_warning (ec_bmm_schema_invalid_load_list, <<schemas_load_list.item>>)
								schemas_load_list.remove
							else
								schemas_load_list.forth
							end
						end
					else
						create {ARRAYED_LIST[STRING]} schemas_load_list.make (0)
						schemas_load_list.compare_objects
						across all_schemas.current_keys as schema_ids_csr loop
							schemas_load_list.extend (schema_ids_csr.item.as_string_8)
						end
						add_warning (ec_bmm_schemas_no_load_list_found, Void)
					end

					-- initial load of all schemas, which populates `schema_inclusion_map';
					across all_schemas as all_schemas_csr loop
						if all_schemas_csr.item.passed then
							load_schema_include_closure (all_schemas_csr.key.as_string_8)
							if all_schemas_csr.item.errors.has_warnings then
								add_warning (ec_bmm_schema_passed_with_warnings, <<all_schemas_csr.key.as_string_8, all_schemas_csr.item.errors.as_string>>)
							end
						else
							add_error (ec_bmm_schema_basic_validation_failed, <<all_schemas_csr.key.as_string_8, all_schemas_csr.item.errors.as_string>>)
							if not all_schemas_csr.item.is_bmm_compatible then
								add_error (ec_bmm_schema_version_incompatible_with_tool, <<all_schemas_csr.key.as_string_8, Bmm_internal_version>>)
							end
						end
					end

					-- propagate errors found so far
					across all_schemas as all_schemas_csr loop
						if not all_schemas_csr.item.passed then
							merge_validation_errors (all_schemas_csr.item)
						end
					end

					-- Copy all SCHEMA_DESCRIPTORs validated to this point to `validated_schemas'
					-- we do this in a separate pass, because each iteration of the previous loop can result in a closure
					-- of schemas being loaded
					across all_schemas as all_schemas_csr loop
						if all_schemas_csr.item.passed then
							candidate_schemas.put (all_schemas_csr.item, all_schemas_csr.key)
						end
					end

					-- Now we process the include relations on the P_BMM top-level schemas, creating fully populated schemas
					from i := 1 until finished or i > Max_inclusion_depth loop
						finished := True
						across schema_inclusion_map as map_csr loop
							if candidate_schemas.has (map_csr.key) and then attached candidate_schemas_item (map_csr.key).bmm_schema as included_schema then
								-- only process current schema if its lower level includes have already been copied into it,
								-- or if it had no includes, since only then is it ready to be itself included in the next one up the chain
								-- If this included schema is in this state, merge its contents into each schema that includes it
								if included_schema.state = {P_BMM_SCHEMA}.State_includes_processed then
									-- iterate over the schemas that include `included_schema' and process the inclusion
									across map_csr.item as schemas_csr loop
										if candidate_schemas.has (schemas_csr.item) and then attached candidate_schemas_item (schemas_csr.item).bmm_schema as including_schema then
											if including_schema.state = {P_BMM_SCHEMA}.State_includes_pending and
												including_schema.includes_to_process.has (included_schema.schema_id)
											then
												-- DO THE MERGE
												including_schema.merge (included_schema)
												add_info (ec_bmm_schema_merged_schema, <<included_schema.schema_id, candidate_schemas_item (schemas_csr.item).schema_id>>)
												finished := False
											end
										else
											add_error (ec_bmm_schema_including_schema_not_valid, <<map_csr.key.as_string_8>>)
										end
									end
								end
							else
								add_error (ec_bmm_schema_included_schema_not_found, <<map_csr.key.as_string_8>>)
							end
						end
						i := i + 1
					end

					-- By this point the P_BMM schemas have been merged, and the top-level P_BMM schemas can be validated
					-- This will cause each schema to potentially create errors to do with included schemas as well as itself
					-- These errors then need to be integrated with the original schemas, so as to be reported correctly
					across candidate_schemas as schemas_csr loop
						schema_desc := schemas_csr.item
						if schema_desc.is_top_level and schemas_load_list.has (schema_desc.schema_id) then
							if schema_desc.passed and attached schema_desc.bmm_schema as att_p_schema and then att_p_schema.ready_to_validate then
								-- validate the schema & if passed, put it into `top_level_schemas'
								schema_desc.validate_merged
								merge_validation_errors (schema_desc)
								if schema_desc.passed then
									-- now we create a BMM_MODEL from a fully merged P_BMM_SCHEMA
									schema_desc.create_model
									if attached schema_desc.bmm_model as att_model then
										att_model.post_process
										bmm_models.extend (att_model, att_model.model_id)
										if schema_desc.errors.has_warnings then
											add_warning (ec_bmm_schema_passed_with_warnings, <<schema_desc.schema_id, schema_desc.errors.as_string>>)
										end
									else
										add_error (ec_bmm_schema_post_merge_create_fail, <<schema_desc.schema_id, schema_desc.errors.as_string>>)
									end
								else
									add_error (ec_bmm_schema_post_merge_validate_fail, <<schema_desc.schema_id, schema_desc.errors.as_string>>)
								end
							end
						end
					end
				end

				load_count := load_count + 1
			end

		rescue
			exception_encountered := True
			if assertion_violation and attached original_class_name as ocn and attached original_recipient_name as orn and attached exception_trace as et then
				add_error (ec_bmm_schema_assertion_violation, <<ocn + "." + orn + "%N" + et>>)
			else
				add_error (ec_bmm_schema_unknown_exception, Void)
			end
			retry
		end

	load_schema_include_closure (a_schema_id: STRING)
			-- process the include directives for a given schema & build the `schema_inclusion_map' reverse reference table
		local
			includers: ARRAYED_SET[STRING]
			target_schema: BMM_SCHEMA_DESCRIPTOR
		do
			target_schema := all_schemas_item (a_schema_id)
			target_schema.load
			if target_schema.passed then
				target_schema.validate_includes (all_schemas)
				if target_schema.passed and attached target_schema.bmm_schema as att_p_schema then
					add_info (ec_bmm_schema_info_loaded, <<a_schema_id, att_p_schema.primitive_types_count.out, att_p_schema.class_definitions_count.out>>)
					across att_p_schema.includes as includes_csr loop
						if not schema_inclusion_map.has (includes_csr.item.id) then
							create includers.make (0)
							schema_inclusion_map.put (includers, includes_csr.item.id)
						end
						schema_inclusion_map_item (includes_csr.item.id).extend (a_schema_id)
						if not all_schemas.has (includes_csr.item.id) then
							load_schema_include_closure (includes_csr.item.id)
						end
					end
				else
					add_error (ec_bmm_schema_includes_valiidation_failed, <<a_schema_id, target_schema.errors.as_string>>)
				end
			else
				add_error (ec_bmm_schema_load_failure, <<a_schema_id, target_schema.errors.as_string>>)
			end
		end

	merge_validation_errors (sd: BMM_SCHEMA_DESCRIPTOR)
			-- merge all errors recorded during validation of `sd' - this includes errors that
			-- may be for included schemas, so we use the inclusion map to mark all schemas
			-- up the hierarchy with the knock-on effect of these errors
		local
			err_table: HASH_TABLE [ERROR_ACCUMULATOR, STRING]
			errors_to_propagate: BOOLEAN
			targ_sd, client_sd: BMM_SCHEMA_DESCRIPTOR
		do
			if attached sd.bmm_schema as att_p_schema then
				err_table := att_p_schema.schema_error_table
				across err_table as err_table_csr loop
					-- merge errors into the offending schema error accumulator
					all_schemas_item (err_table_csr.key).merge_errors (err_table_csr.item)

					-- iterate through all schemas including err_table.key_for_iteration, except for `sd' since it will already have been marked
					-- Note that there will be an entry in err_table for warnings as well as errors, so we have to process these properly
					if schema_inclusion_map.has (err_table_csr.key) then
						schema_inclusion_map_item (err_table_csr.key).do_all (
							agent (a_client_schema, a_source_schema: STRING; err_accum: ERROR_ACCUMULATOR)
								do
									if err_accum.has_errors then
										all_schemas_item (a_client_schema).add_error (ec_BMM_INCERR, <<a_client_schema, a_source_schema>>)
									else
										all_schemas_item (a_client_schema).add_warning (ec_BMM_INCWARN, <<a_client_schema, a_source_schema>>)
									end
								end (?, err_table_csr.key, err_table_csr.item)
						)
					end
				end
			end

			-- propagate a BMM_INCERR or BMM_INCWARN to all schemas in the inclusion hierarchy from source schemas
			from errors_to_propagate := True until not errors_to_propagate loop
				errors_to_propagate := False
				across schema_inclusion_map as schema_inclusion_map_csr loop
					targ_sd := all_schemas_item (schema_inclusion_map_csr.key)
					if not targ_sd.passed or else targ_sd.errors.has_warnings then
						across schema_inclusion_map_csr.item as client_schemas_csr loop
							client_sd := all_schemas_item (client_schemas_csr.item)
							if client_sd.passed and not client_sd.errors.has_warnings then
								if not targ_sd.passed then
									client_sd.add_error (ec_BMM_INCERR, <<client_schemas_csr.item, schema_inclusion_map_csr.key.as_string_8>>)
								else
									client_sd.add_warning (ec_BMM_INCWARN, <<client_schemas_csr.item, schema_inclusion_map_csr.key.as_string_8>>)
								end
								errors_to_propagate := True
							end
						end
					end
				end
			end
		end

	candidate_schemas_item (a_schema_id: READABLE_STRING_GENERAL): BMM_SCHEMA_DESCRIPTOR
		do
			check attached candidate_schemas.item (a_schema_id) as att_item then
				Result := att_item
			end
		end

	schema_inclusion_map_item (a_schema_id: READABLE_STRING_GENERAL): ARRAYED_LIST [STRING]
		do
			check attached schema_inclusion_map.item (a_schema_id) as att_item then
				Result := att_item
			end
		end

end



