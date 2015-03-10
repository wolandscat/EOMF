note
	component:   "Eiffel Object Modelling Framework"
	description: "Shared UI resources"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2003-2010 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SHARED_APP_UI_RESOURCES

inherit
	SHARED_APP_RESOURCES

feature -- Application Switches

	current_work_directory: STRING
			-- Directory where archetypes are currently being opened and saved
			-- from GUI open and save buttons; automatic opens (due to clicking
			-- on archetype name) still use main repository directory.
		do
			Result := app_cfg.string_value ("/file_system/current_work_directory")
		end

	set_current_work_directory (a_path: STRING)
			-- set the directory where archetypes are currently being opened and saved.
		do
			if not a_path.is_empty then
				app_cfg.put_string_value ("/file_system/current_work_directory", a_path)
			else
				app_cfg.remove_resource ("/file_system/current_work_directory")
			end
		end

	app_width: INTEGER
			-- application width
		do
			Result := app_cfg.integer_value ("/gui/app_width")
		end

	set_app_width (v: INTEGER)
			-- set app width
		require
			v > 0
		do
			app_cfg.put_integer_value ("/gui/app_width", v)
		end

	app_height: INTEGER
			-- application height
		do
			Result := app_cfg.integer_value ("/gui/app_height")
		end

	set_app_height (v: INTEGER)
			-- set app height
		require
			v > 0
		do
			app_cfg.put_integer_value ("/gui/app_height", v)
		end

	app_x_position: INTEGER
			-- application horizontal position
		do
			Result := app_cfg.integer_value ("/gui/app_x_position")
		end

	set_app_x_position (v: INTEGER)
			-- set app x position
		do
			app_cfg.put_integer_value ("/gui/app_x_position", v)
		end

	app_y_position: INTEGER
			-- application vertical position
		do
			Result := app_cfg.integer_value ("/gui/app_y_position")
		end

	set_app_y_position (v: INTEGER)
			-- set app y position
		do
			app_cfg.put_integer_value ("/gui/app_y_position", v)
		end

	app_maximised: BOOLEAN
			-- True if app should be maximised
		do
			Result := app_cfg.boolean_value ("/gui/app_maximised")
		end

	set_app_maximised (flag: BOOLEAN)
			-- set app maximised flag
		do
			app_cfg.put_boolean_value("/gui/app_maximised", flag)
		end

	main_notebook_tab_pos: INTEGER
			-- which tab of the main notebook was visible at the end of the last session
		do
			Result := app_cfg.integer_value ("/gui/main_notebook_tab_pos")
		end

	set_main_notebook_tab_pos(a_tab_pos: INTEGER)
			-- set main notebook tab pos
		require
			a_tab_pos_valid: a_tab_pos > 0
		do
			app_cfg.put_integer_value ("/gui/main_notebook_tab_pos", a_tab_pos)
		end

	explorer_split_position: INTEGER
			-- Split position of explorer horizontal split control.
		do
			Result := app_cfg.integer_value ("/gui/explorer_split_position")
		end

	set_explorer_split_position (v: INTEGER)
			-- Set split position of explorer horizontal split control.
		require
			v > 0
		do
			app_cfg.put_integer_value ("/gui/explorer_split_position", v)
		end

	main_split_position: INTEGER
			-- Split position of explorer horizontal split control.
		do
			Result := app_cfg.integer_value ("/gui/main_split_position")
		end

	set_main_split_position (v: INTEGER)
			-- Set split position of explorer horizontal split control.
		require
			v > 0
		do
			app_cfg.put_integer_value ("/gui/main_split_position", v)
		end

	text_editor_command: STRING
			-- Path of editor application for ADL files.
		do
			Result := app_cfg.string_value_env_var_sub ("/commands/text_editor_command")
		end

	set_text_editor_command (a_value: STRING)
			-- set editor
		require
			value_not_empty: not a_value.is_empty
		do
			app_cfg.put_string_value ("/commands/text_editor_command", a_value)
		end

end



