note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 This application demonstrates loading a set of BMM (basic meta-model) schemas into memory and
				 accessing them using the BMM classes.
				 ]"
	keywords:    "BMM, reflection, meta-model"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	SHARED_TEST_ENV

inherit
	GLOBAL_ERROR_REPORTING_LEVEL

	SHARED_MODEL_ACCESS

	SHARED_BMM_APP_RESOURCES
		redefine
			Application_developer_name, Default_application_name
		end

	GENERAL_MESSAGES_IDS
		export
			{NONE} all
		end

	BMM_MESSAGES_IDS
		export
			{NONE} all
		end

	BMM_DEFINITIONS
		export
			{NONE} all
		end

	ANY_VALIDATOR
		rename
			validate as Initialise_app,
			ready_to_validate as ready_to_initialise_app
		redefine
			ready_to_initialise_app
		end

feature -- Definitions

	Application_developer_name: STRING = "openEHR"
			-- usually the company or organisation name of the application vendor.

	Default_application_name: STRING = "adl_workbench"

feature -- Initialization

	bmm_env_setup
			-- Run application.
		once
			-- add in EOMF error message DB to main message DB
			message_db.add_table (create {DT_MESSAGES_DB}.make)
			message_db.add_table (create {ODIN_MESSAGES_DB}.make)
			message_db.add_table (create {BMM_MESSAGES_DB}.make)
			message_db.add_table (create {GENERAL_MESSAGES_DB}.make)

			if ready_to_initialise_app then
				initialise_app
				if has_errors then
					io.put_string (error_strings)
					io.put_string ("Check .cfg gile " + app_cfg.file_path + "%N")
				end
			end
		end

	rm_schema: BMM_MODEL
		do
			Result := bmm_model_cache.item
		end

	output_schema_info
		local
			schema_id: STRING
			schema_meta_data: HASH_TABLE [STRING, STRING]
		do
			-- create row containing widgets for: check column, name column, status column, edit button column
			across models_access.all_schemas as rm_schemas_csr loop
				schema_id := rm_schemas_csr.key
				schema_meta_data := rm_schemas_csr.item.meta_data

				-- column 1 - check box to indicate loaded; only on top-level schemas
				if rm_schemas_csr.item.is_top_level then
					io.put_string ("SCHEMA* ")
				else
					io.put_string ("SCHEMA  ")
				end
				io.put_character ('%T')

				-- column 2 - RM schema name
				io.put_string (schema_id)
				io.put_character ('%T')

				-- column 3 - lifecycle state
				if schema_meta_data.has (Metadata_schema_lifecycle_state) and then attached
					schema_meta_data.item (Metadata_schema_lifecycle_state) as att_md
				then
					io.put_string (att_md)
				else
					io.put_string ("(unknown)")
				end
				io.put_character ('%T')

				-- column 4 - validated

				if rm_schemas_csr.item.passed then
					io.put_string ("validated")
				else
					io.put_string ("failed: " + rm_schemas_csr.item.error_strings)
				end
				io.put_string ("%N%N")

			end
		end

	initialise_app
		local
			dead_schema_dirs: ARRAYED_LIST [STRING]
		once
			-- set error reporting level in billboard and all error accumulator objects
			set_global_error_reporting_level (error_reporting_level)

			-- set up the RM schemas
			if rm_schema_directories.is_empty then
				add_rm_schema_directory (Default_rm_schema_directory)
			end
			create dead_schema_dirs.make (0)
			dead_schema_dirs.compare_objects

			-- get rid of any non-existent schema directories
			across rm_schema_directories as sch_dirs loop
				if not file_system.directory_exists (sch_dirs.item) then
					add_warning (ec_bmm_schema_dir_not_valid, <<sch_dirs.item>>)
					dead_schema_dirs.extend (sch_dirs.item)
				else
					io.put_string ("Schemas found in ==================== " + sch_dirs.item + " ====================%N")
				end
			end
			across dead_schema_dirs as dead_sch_csr loop
				rm_schema_directories.prune_all (dead_sch_csr.item)
			end

			models_access.initialise_with_load_list (rm_schema_directories, rm_schemas_load_list)
			-- rm_schemas_access.initialise_all (rm_schema_directories)
			output_schema_info

			if models_access.has_errors then
				add_error (Ec_general_error, <<models_access.error_strings>>)
			elseif not models_access.found_valid_models then
				add_error (ec_bmm_schemas_config_not_valid, <<models_access.schemas_load_list_string>>)
			end
		end

feature -- Status Report

	ready_to_initialise_app: BOOLEAN
		do
			Result := not App_cfg.errors.has_errors
		end

feature {NONE} -- Implementation

	bmm_model_cache: CELL [BMM_MODEL]
		once
			create Result.put (create {BMM_MODEL}.default_create)
		end

end
