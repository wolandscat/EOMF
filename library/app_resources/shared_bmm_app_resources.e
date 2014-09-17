note
	component:   "Eiffel Object Modelling Framework"
	description: "Shared application resources for any BMM application"
	keywords:    "test, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SHARED_BMM_APP_RESOURCES

inherit
	SHARED_APP_RESOURCES

feature -- Definitions

	Default_rm_schema_directory: STRING
			-- default directory of Reference Model schema files; same as full path to app + "/rm_schemas";
			-- contains schema files in .dadl format e.g.
			-- .../rm_schemas/openehr_rm_102.bmm
		once ("PROCESS")
			Result := file_system.pathname (application_startup_directory, "rm_schemas")
		end

feature -- Application Switches

	rm_schemas_load_list: LIST [STRING]
			-- list of RM schemas to use
		do
			Result := app_cfg.string_list_value ("/rm_schemas/load_list")
			Result.compare_objects
		ensure
			value_comparison: Result.object_comparison
			no_empty_items: Result.for_all (agent (s: STRING): BOOLEAN do Result := attached s and then not s.is_empty end)
		end

	set_rm_schemas_load_list (a_schema_list: LIST [STRING])
			-- set rm_schemas(s)
		require
			a_schema_list_valid: not a_schema_list.is_empty
		do
			app_cfg.put_value ("/rm_schemas/load_list", a_schema_list)
		end

	rm_schema_directory: STRING
			-- Path of directory where RM schemas are found - note: this should be writable.
		do
			Result := app_cfg.string_value_env_var_sub ("/file_system/rm_schema_directory")
		end

	set_rm_schema_directory (a_path: STRING)
			-- Set the path of directory where RM schemas are found
		require
			path_not_empty: not a_path.is_empty
		do
			app_cfg.put_value ("/file_system/rm_schema_directory", a_path)
		end

end



