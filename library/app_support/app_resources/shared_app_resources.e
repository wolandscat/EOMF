note
	component:   "Eiffel Object Modelling Framework"
	description: "Shared application resources for any ADL application, GUI or non-GUI"
	keywords:    "resources, application"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SHARED_APP_RESOURCES

inherit
	SHARED_RESOURCES

feature -- Definitions

	Application_developer_name: STRING
			-- usually the company or organisation name of the application vendor.
		once ("PROCESS")
			Result := "unknown_app_dev"
		end

	Default_application_name: STRING
		once ("PROCESS")
			Result := "unknown_app"
		end

	Fallback_application_name: STRING
		once ("PROCESS")
			Result := "unknown_app"
		end

	Config_file_path_root: STRING
			-- generate a directory for application data; on unix-like systems, it is in 
			-- a directory named '.<application>' i.e. application name with a precending dot
			-- on Windows, there is no dot.
		once ("PROCESS")
			create Result.make_empty
			if not is_windows then
				Result.append_character ('.')
			end
			Result.append (application_developer_name)
		end

	Default_user_config_file_directory: STRING
			-- Default OS-specific place for user config file(s) for all applications ased on adl_workbench code base.
			-- Follows the model <user_home>/.app_vendor/adl_workbench.
		do
			if attached execution_environment.home_directory_name as hd then
				Result := file_system.pathname (file_system.pathname (hd, Config_file_path_root), application_name)
			else
				Result := file_system.current_working_directory
			end
		end

	Default_xml_rules_file_path: STRING
			-- Default full path to XML rules file for all adl_workbench-derived apps
		once ("PROCESS")
			Result := file_system.pathname (Default_user_config_file_directory, extension_replaced ("xml_rules", User_config_file_extension))
		ensure
			not_empty: not Result.is_empty
		end

feature -- Access

	app_cfg: CONFIG_FILE_ACCESS
			-- accessor object for application config file
		once ("PROCESS")
			Result := app_cfg_cell.item
			Result.initialise (user_config_file_path)
			app_cfg_initialise
		end

	app_cfg_initialise
			-- redefine in descendants, e.g. to add listeners for reload of file
		do
		end

	system_config_file_directory: STRING
			-- place for config files common to multiple applications
			-- UNIX only
		once
			create Result.make(0)
			Result.append (execution_environment.root_directory_name + "etc")
		end

	fallback_user_config_file_directory: STRING
			-- This default directory can be used as a fallback rather than forcing every related app to have its
			-- own .cfg file, with essentially the same information (configured directories etc).
			-- (On Unix/Linux/Macosx(?) systems, we would normally locate this in /etc/adl_workbench)
		once
			if attached execution_environment.home_directory_name as hd then
				Result := file_system.pathname (file_system.pathname (hd, Config_file_path_root), Fallback_application_name)
			else
				Result := file_system.current_working_directory
			end
		end

	user_config_file_directory: STRING
			-- OS-specific place for user config file(s) for this application.
			-- Follows the model home_path/app_vendor/app_name.
		once
			check attached execution_environment.home_directory_name as hd then
				Result := file_system.pathname (file_system.pathname (hd, Config_file_path_root), extension_removed (application_name))
			end

			-- if the directory doesn't exist, attempt to find a fallback directory
			if not file_system.directory_exists (Result) and then file_system.directory_exists (fallback_user_config_file_directory) then
				Result := fallback_user_config_file_directory
			end
		end

	user_config_file_path: STRING
			-- Full path to resource configuration file.
		once
			if not user_config_file_directory.is_equal (fallback_user_config_file_directory) then
				Result := file_system.pathname (user_config_file_directory, extension_replaced (application_name, User_config_file_extension))
			else
				Result := file_system.pathname (user_config_file_directory, extension_replaced (Fallback_application_name, User_config_file_extension))
			end
		end

	application_full_path: STRING
			-- The full path to the application; else, if the application is in an Eiffel project's W_code
			-- or F_code directory, a path within the Eiffel project directory. This must be called before
			-- any change_dir calls are made since there is no easy way to get the startup directory.
		local
			path: KI_PATHNAME
			dir: STRING
		once
			path := file_system.string_to_pathname (file_system.absolute_pathname (execution_environment.command_line.command_name))
			path.set_canonical
			Result := file_system.pathname_to_string (path)

			if path.count > 3 then
				dir := path.item (path.count - 1)
				if (dir.is_equal ("W_code") or dir.is_equal ("F_code")) and path.item (path.count - 3).is_equal ("EIFGENs") then
					dir := file_system.dirname (file_system.dirname (file_system.dirname (file_system.dirname (Result))))
					Result := file_system.pathname (dir, file_system.basename (Result))
				end
			end
		ensure
			not_empty: not Result.is_empty
	    end

	application_file_time_stamp: INTEGER
			-- data/time of app exe; can be used to decide when to remove certain kinds of app files
		do
			Result := file_system.file_time_stamp (application_full_path)
		end

	application_startup_directory: STRING
			-- The directory in which the application is installed; else, if the application is in an Eiffel project's W_code
			-- or F_code directory, the Eiffel project directory. This must be called before any change_dir calls are made
			-- since there is no easy way to get the startup directory.
		once
			Result := file_system.dirname (application_full_path)
		ensure
			not_empty: not Result.is_empty
		end

	application_name: STRING
			-- The name of the application executable, with any leading directory components removed.
	    once
			Result := file_system.basename (application_full_path)
	    end

	locale_language_short: STRING
			-- The ISO 2-char code for the locale language, e.g. "en"
		local
			i18n: I18N_LOCALE_MANAGER
		do
			create i18n.make (application_startup_directory)
			Result := i18n.system_locale.info.id.language.as_string_8
		end

	locale_language_long: STRING
			-- return the ISO 2-char code for the locale language + 2 char code country variant, where appropriate, e.g. "en-uk", "en-au"
		do
			-- FIXME: to be implemented
			Result := "en-uk"
		end

	xml_rules_file_path: STRING
			-- Full path to XML rules file.
		once
			Result := file_system.pathname (user_config_file_directory, extension_replaced ("xml_rules", User_config_file_extension))
		ensure
			not_empty: not Result.is_empty
		end

	xml_rules_sample_file_path: STRING
			-- Full path to XML rules file.
		once
			Result :=  file_system.pathname (application_startup_directory, extension_replaced ("sample_xml_rules", User_config_file_extension))
		ensure
			not_empty: not Result.is_empty
		end

feature -- Application Switches

	error_reporting_level: INTEGER
			-- Level of error reporting required; see BILLBOARD_MESSAGE_TYPES for levels
			-- all levels >= the one stored will be displayed; Info is the minimum.
		do
			Result := if app_cfg.has_resource ("/general/error_reporting_level") then app_cfg.integer_value ("/general/error_reporting_level") else Error_type_warning end
			if not is_valid_error_type (Result) then
				Result := Error_type_warning
			end
		end

	set_error_reporting_level (v: INTEGER)
			-- Set `status_reporting_level'.
		do
			app_cfg.put_integer_value ("/general/error_reporting_level", v)
		end

feature {NONE} -- Implementation

	set_app_cfg (an_app_cfg: CONFIG_FILE_ACCESS)
		do
			app_cfg_cell.put (an_app_cfg)
		end

	app_cfg_cell: CELL [CONFIG_FILE_ACCESS]
			-- holder for config file access object during setup phase
			-- by default, uses ODIN file access
		once
			create Result.put (create {CONFIG_FILE_ACCESS}.make (create {ODIN_CONFIG_FILE_ACCESS}.make))
		end

end



