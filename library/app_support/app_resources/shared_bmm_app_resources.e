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

	rm_schemas_load_list: ARRAYED_LIST [STRING]
			-- list of RM schemas to use
		do
			Result := app_cfg.string_list_value ("/rm_schemas/load_list")
			Result.compare_objects
		ensure
			value_comparison: Result.object_comparison
			no_empty_items: not across Result as sch_csr some sch_csr.item.is_empty end
		end

	set_rm_schemas_load_list (a_schema_list: ARRAYED_LIST [STRING])
			-- set rm_schemas(s)
		require
			a_schema_list_valid: not a_schema_list.is_empty
		do
			app_cfg.put_string_list_value ("/rm_schemas/load_list", a_schema_list)
		end

	rm_schema_directories: ARRAYED_LIST [STRING]
			-- Locations where RM schemas are found - note: this should be writable.
		local
			old_path: STRING
		do
			Result := app_cfg.string_list_value ("/rm_schema_directories")
			Result.compare_objects

			-- FIXME: for a few versions starting at 2.0.6.2813, scrape up the old single path variable 
			old_path := app_cfg.string_value ("/file_system/rm_schema_directory")
			if Result.is_empty and not old_path.is_empty then
				Result.extend (old_path)
				app_cfg.remove_resource ("/file_system/rm_schema_directory")
			end
		ensure
			value_comparison: Result.object_comparison
			no_empty_items: not across Result as sch_csr some sch_csr.item.is_empty end
		end

	set_rm_schema_directories (a_paths: ARRAYED_LIST [STRING])
			-- Set locations where RM schemas are found
		require
			paths_not_empty: not across a_paths as path_csr some path_csr.item.is_empty end
		do
			app_cfg.put_string_list_value ("/rm_schema_directories", a_paths)
		end

	add_rm_schema_directory (a_path: STRING)
			-- Add location where RM schemas are found
		require
			path_not_empty: not a_path.is_empty and not rm_schema_directories.has (a_path)
		local
			dir_list: ARRAYED_LIST [STRING]
		do
			dir_list := rm_schema_directories
			dir_list.extend (a_path)
			set_rm_schema_directories (dir_list)
		end

end

