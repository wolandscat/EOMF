note
	component:   "Eiffel Object Modelling Framework"
	description: "Main Application"
	keywords:    "test, dADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	GUI_APP_ROOT

inherit
	EV_APPLICATION

	SHARED_APP_ROOT
		undefine
			copy, default_create
		end

	SHARED_APP_UI_RESOURCES
		export
			{NONE} all
		undefine
			copy, default_create
		end

create
	make_and_launch

feature {NONE} -- Initialization

	make_and_launch
			-- Create and launch the application
		do
			default_create
			application_developer_name.make_from_string ("openEHR")
			if app_root.initialised then
				if not is_destroyed then
					post_launch_actions.extend_kamikaze (agent show_main_window)
					launch
				end
			end
		end

	show_main_window
			-- Build and display the application's main window.
		local
			main_window: MAIN_WINDOW
		do
			process_graphical_events
			create main_window
			main_window.show
		end

end


