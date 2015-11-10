note
	component:   "Eiffel Object Modelling Framework"
	description: "Main window"
	keywords:    "evx, vision, ui, test"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	MAIN_WINDOW

inherit
	EV_TITLED_WINDOW
		redefine
			show, create_interface_objects, initialize, is_in_default_state
		end

	EVX_DEFINITIONS
		undefine
			is_equal, default_create, copy
		end

	SHARED_APP_ROOT
		undefine
			copy, default_create
		end

	SHARED_ICON_RESOURCES
		undefine
			copy, default_create
		end

	EVX_UTILITIES
		export
			{NONE} all
		undefine
			copy, default_create
		end

feature {NONE} -- Initialization

	create_interface_objects
		do

		end

	initialize
			-- Initialize `Current'.
		do
			Precursor {EV_TITLED_WINDOW}

			close_request_actions.extend (agent exit_app)
		end

	initialise_docking_layout
			-- initialise visual settings of window remembered from previous session
		do
		end

feature -- Commands

	show
			-- Do a few adjustments and load the repository before displaying the window.
		do
			Precursor
			initialise_docking_layout

		end

	exit_app
			-- Terminate the application, saving the window location.
		do
			ev_application.destroy
		end

feature -- Docking controls

	attached_docking_manager: SD_DOCKING_MANAGER
			-- Attached `manager'
		require
			not_void: docking_manager /= Void
		local
			l_result: like docking_manager
		do
			l_result := docking_manager
			check l_result /= Void end -- Implied by precondition `not_void'
			Result := l_result
		end

	docking_manager: detachable SD_DOCKING_MANAGER
			-- Docking manager

feature {NONE} -- Implementation

	info_feedback (a_message: STRING)
		local
			info_dialog: EV_INFORMATION_DIALOG
		do
			create info_dialog.make_with_text (a_message)
			info_dialog.set_title ("Information")
			info_dialog.show_modal_to_window (Current)
		end

	text_widget_handler: EVX_TEXT_WIDGET_HANDLER
			-- FIXME: this is a hack to get round lack of standard behaviour in Vision2 for
			-- focussed text widgets & cut & paste behaviours
		once
			-- FIXME: create with a dummy EV_CONTAINER initially; the argument should be 'Current', i.e the MAIN_WINDOW,
			-- but we can't supply it when this call gets made because 'make' has not finished yet, and 'Current' doesn't
			-- pass the void-safety test. So we give it a fake for now, and set the real root at the end of the make routine
			create Result.set_root (create {EV_CELL})
		end

	save_resources
			-- Save the application configuration file and update the status area.
		do
		end

feature {NONE} -- GUI Widgets

	is_in_default_state: BOOLEAN
			-- Is `Current' in its default state?
		do
			Result := True
		end

	evx_text: detachable EVX_TEXT_CONTROL
	evx_frame: detachable EVX_FRAME_CONTROL
	evx_boolean: detachable EVX_BOOLEAN_RADIO_CONTROL
	evx_mlist: detachable EVX_MLIST_CONTROL
	evx_combo_control: detachable EVX_COMBO_CONTROL
	evx_combo_text_selector: detachable EVX_COMBO_TEXT_SELECTOR_CONTROL
	evx_grid: detachable EVX_GRID
	evx_treeview: detachable EVX_TREEVIEW_CONTROL
	evx_treeview_grid: detachable EVX_TREE_CONTROL_GRID
	evx_treeview_tree: detachable EVX_TREE_CONTROL_TREE

	evx_dir_setter: detachable EVX_DIRECTORY_SETTER
	evx_dir_list: detachable EVX_DIRECTORY_LIST
	evx_file_path_setter: detachable EVX_FILE_PATH_SETTER
	evx_ok_cancel_controls: detachable EVX_OK_CANCEL_CONTROLS
	evx_control_panel: detachable EVX_CONTROL_PANEL
	evx_multi_column_table_control: detachable EVX_MULTI_COLUMN_TABLE_CONTROL
	evx_button: detachable EVX_BUTTON
	evx_hash_table: detachable EVX_HASH_TABLE_CONTROL
	evx_text_list: detachable EVX_TEXT_LIST_CONTROL
	evx_table_control: detachable EVX_TABLE_CONTROL
	evx_text_editor_control: detachable EVX_TEXT_EDITOR_CONTROL
	evx_multiline_text_control: detachable EVX_MULTILINE_TEXT_CONTROL
	evx_toggle_btn: detachable EVX_TOGGLE_BUTTON_CONTROL

	evx_toolbar: detachable EVX_TOOL_BAR
	evx_toolbar_btn: detachable EVX_TOOL_BAR_BUTTON

	ev_multi_col_list_editable: detachable EV_MULTI_COLUMN_LIST_EDITABLE

end


