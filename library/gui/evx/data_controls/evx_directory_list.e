note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Visual control for a data source containing a list of directory paths, enabling addition and
				 deletion of directories from the list.

				 Visual control structure is a combo box with a title, in-place editing, and Add and Remove
				 buttons.
				 
					        +----------------------------+ +-----+ +--------+
				    Title: 	|/dir/aaa                   V| | Add | | Remove |
						    +----------------------------+ +-----+ +--------+
							|/dir/bbbb                   | 
							|/dir/ccc                    | 
						    +----------------------------+

				 ]"
	keywords:    "UI, directory"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2015 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class EVX_DIRECTORY_LIST

inherit
	EVX_COMBO_CONTROL
		rename
			make as make_combo_control, make_linked as make_linked_combo_control, make_readonly as make_readonly_combo_control
		redefine
			data_source_setter_agent
		end

create
	make, make_linked, make_readonly

feature -- Initialisation

	make (a_title: STRING; a_data_source_agt: like data_source_agent; min_width_in_chars: INTEGER)
		do
			make_combo_control (a_title, Void, a_data_source_agt, Void, min_width_in_chars, True)
			initialise_buttons
		ensure
			not is_readonly
			has_add_button
		end

	make_readonly (a_title: STRING; a_data_source_agt: like data_source_agent; min_width_in_chars: INTEGER)
		do
			make_readonly_combo_control (a_title, a_data_source_agt, Text_min_height, min_width_in_chars * Text_char_width, True)
		ensure
			is_readonly
		end

	make_linked (a_title: STRING; a_data_source_agt: like data_source_agent;
			a_data_source_setter_agent: like data_source_setter_agent;
			a_data_source_remove_agent: like data_source_remove_agent;
			an_undo_redo_chain: like undo_redo_chain;
			min_width_in_chars: INTEGER)
		do
			make_linked_combo_control (a_title, a_data_source_agt, a_data_source_setter_agent, a_data_source_remove_agent, an_undo_redo_chain, Text_min_height, min_width_in_chars * Text_char_width, True)
			initialise_buttons
		ensure
			not is_readonly
			has_add_button
		end

feature -- Access

	data_source_setter_agent: detachable PROCEDURE [ANY, TUPLE [LIST[STRING]]]
			-- agent for creating & setting the data source, which is a list of strings

	directory_list: LIST[STRING]
		do
			Result := ev_data_control.strings_8
		end

	ev_add_button: detachable EV_BUTTON
		note
			option: stable
		attribute
		end

	ev_remove_button: detachable EV_BUTTON
		note
			option: stable
		attribute
		end

	ev_explore_button: detachable EV_BUTTON
			-- optional button to launch an explorer on the directory
		note
			option: stable
		attribute
		end

feature -- Status Resport

	has_add_button: BOOLEAN
		do
			Result := attached ev_add_button
		end

feature -- Modification

	set_default_directory_agent (an_agent: like default_directory_agent)
		do
			default_directory_agent := an_agent
		end

	set_add_button_icon (a_pixmap: EV_PIXMAP)
			-- set an icon on the add button
		do
			check attached ev_add_button as att_add_btn then
				att_add_btn.set_pixmap (a_pixmap)
			end
		end

	set_add_button_tooltip (a_text: STRING)
			-- set a tooltip on the add button
		do
			check attached ev_add_button as att_add_btn then
				att_add_btn.set_tooltip (utf8_to_utf32 (a_text))
			end
		end

feature -- Events

	on_add
			-- Let the user add a directory
		local
			initial_dir: STRING
			dir_list: LINKED_LIST [STRING_32]
			new_dir: STRING
		do
			if attached data_source_agent.item ([]) as ds_val and then not ds_val.is_empty then
				initial_dir := ds_val.first
			elseif attached default_directory_agent as dda then
				initial_dir := dda.item ([])
			else
				initial_dir := execution_environment.root_directory_name
			end

			check attached proximate_ev_window (ev_root_container) as pw then
				new_dir := get_directory (initial_dir, pw)
				dir_list := ev_data_control.strings
				if not dir_list.has (new_dir) then
					dir_list.extend (new_dir)
					ev_data_control.set_strings (dir_list)
					ev_data_control.set_text (new_dir)
				end
			end
			if attached data_source_setter_agent as ds_agt then
				ds_agt.call ([ev_data_control.strings_8])
			end
		end

	on_remove
			-- let the user remove the current displayed directory
		do
			if ev_data_control.count > 1 and attached ev_data_control.selected_item as ev_sel_item then
				ev_data_control.prune (ev_sel_item)
				ev_data_control.set_text (ev_data_control.first.text)
				if attached data_source_setter_agent as ds_agt then
					ds_agt.call ([ev_data_control.strings_8])
				end
			end
		end

feature {NONE} -- Implementation

	default_directory_agent: detachable FUNCTION [ANY, TUPLE, STRING]
			-- agent that will return a reasonable default directory for when the user hits the add button

	explore_agent: detachable PROCEDURE [ANY, TUPLE [STRING]]

	initialise_buttons
		do
			-- Add button
			create ev_add_button
			ev_add_button.set_text (utf8_to_utf32 (get_text ({EVX_MESSAGES_IDS}.ec_add_button_text)))
			ev_root_container.extend (ev_add_button)
			ev_root_container.disable_item_expand (ev_add_button)
			ev_add_button.select_actions.extend (agent on_add)

			-- Remove button
			create ev_remove_button
			ev_remove_button.set_text (utf8_to_utf32 (get_text ({EVX_MESSAGES_IDS}.ec_remove_button_text)))
			ev_root_container.extend (ev_remove_button)
			ev_root_container.disable_item_expand (ev_remove_button)
			ev_remove_button.select_actions.extend (agent on_remove)
		ensure
			has_add_button
		end

	get_directory (init_value: detachable STRING; a_parent_window: EV_WINDOW): STRING
			-- get a directory from user. `init_value' may be Void or empty
		local
			dialog: EV_DIRECTORY_DIALOG
			a_dir: DIRECTORY
			error_dialog: EV_INFORMATION_DIALOG
			default_result: STRING
			user_dir: detachable STRING
		do
			create dialog

			-- work out an appropriate default
			if attached init_value and then (create {DIRECTORY}.make (init_value)).exists then
				dialog.set_start_directory (init_value)
				default_result := init_value
			else
				create default_result.make_empty
			end

			-- make the user provide something sensible
			from until attached user_dir loop
				dialog.show_modal_to_window (a_parent_window)
				if not attached dialog.selected_button_name as att_sel_btn_name or else att_sel_btn_name.is_equal (dialog_names.ev_cancel) then
					user_dir := default_result
				else
					if not dialog.directory.is_empty then
						create a_dir.make (dialog.directory.to_string_8)

						if a_dir.exists then
							user_dir := a_dir.name
						else
							create error_dialog.make_with_text (get_msg ({GENERAL_MESSAGES_IDS}.ec_directory_does_not_exist, <<dialog.directory>>))
							error_dialog.show_modal_to_window (a_parent_window)
						end
					else
						create error_dialog.make_with_text (get_text ({GENERAL_MESSAGES_IDS}.ec_empty_directory_does_not_exist))
						error_dialog.show_modal_to_window (a_parent_window)
					end
				end
			end
			check attached user_dir then
				Result := user_dir
			end
		end

	execution_environment: EXECUTION_ENVIRONMENT
			-- Shared instance of the execution environment.
	    once
	        create Result
	    end

end


