note
	component:   "openEHR Archetype Project"
	description: "Main window"
	keywords:    "evx, vision, ui, test"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

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

	EVX_WINDOW_ACCELERATORS
		undefine
			copy, default_create
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

	evx_text: EVX_TEXT_CONTROL
	evx_frame: EVX_FRAME_CONTROL
	evx_boolean: EVX_BOOLEAN_RADIO_CONTROL
	evx_mlist: EVX_MLIST_CONTROL
	evx_combo_control: EVX_COMBO_CONTROL
	evx_combo_text_selector: EVX_COMBO_TEXT_SELECTOR_CONTROL
	evx_grid: EVX_GRID
	evx_treeview: EVX_TREEVIEW_CONTROL
	evx_dir_setter: EVX_DIRECTORY_SETTER
	evx_file_path_setter: EVX_FILE_PATH_SETTER
	evx_ok_cancel_controls: EVX_OK_CANCEL_CONTROLS
	evx_control_panel: EVX_CONTROL_PANEL
	evx_multi_column_table_control: EVX_MULTI_COLUMN_TABLE_CONTROL

end


--|
--| ***** BEGIN LICENSE BLOCK *****
--| Version: MPL 1.1/GPL 2.0/LGPL 2.1
--|
--| The contents of this file are subject to the Mozilla Public License Version
--| 1.1 (the 'License'); you may not use this file except in compliance with
--| the License. You may obtain a copy of the License at
--| http://www.mozilla.org/MPL/
--|
--| Software distributed under the License is distributed on an 'AS IS' basis,
--| WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
--| for the specific language governing rights and limitations under the
--| License.
--|
--| The Original Code is main_window.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|
--| Alternatively, the contents of this file may be used under the terms of
--| either the GNU General Public License Version 2 or later (the 'GPL'), or
--| the GNU Lesser General Public License Version 2.1 or later (the 'LGPL'),
--| in which case the provisions of the GPL or the LGPL are applicable instead
--| of those above. If you wish to allow use of your version of this file only
--| under the terms of either the GPL or the LGPL, and not to allow others to
--| use your version of this file under the terms of the MPL, indicate your
--| decision by deleting the provisions above and replace them with the notice
--| and other provisions required by the GPL or the LGPL. If you do not delete
--| the provisions above, a recipient may use your version of this file under
--| the terms of any one of the MPL, the GPL or the LGPL.
--|
--| ***** END LICENSE BLOCK *****
--|
