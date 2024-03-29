note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Visual control for a data source containing a directory path, enabling both direct setting
				 and browsing by the user.
				 Visual control structure is a text edit field with a title, in-place editing, and a browse
				 button.
				 
					        +----------------------------+ +--------+
				    Title: 	|                            | | Browse |
						    +----------------------------+ +--------+

				 ]"
	keywords:    "UI, directory"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class EVX_DIRECTORY_SETTER

inherit
	EVX_SINGLE_LINE_TEXT_CONTROL
		rename
			make as make_single_line_text_control, make_linked as make_linked_single_line_text_control, make_readonly as make_readonly_single_line_text_control
		end

create
	make, make_linked, make_readonly

feature -- Initialisation

	make (a_title: STRING; a_data_source: like data_source_agent; min_width_in_chars: INTEGER)
		do
			make_single_line_text_control (a_title, a_data_source, min_width_in_chars, True)
			initialise_browse_button
		ensure
			not is_readonly
			has_browse_button
		end

	make_readonly (a_title: STRING; a_data_source: like data_source_agent; min_width_in_chars: INTEGER)
		do
			make_readonly_single_line_text_control (a_title, a_data_source, min_width_in_chars, True)
		ensure
			is_readonly
		end

	make_linked (a_title: STRING; a_data_source: like data_source_agent;
			a_data_source_setter_agent: like data_source_setter_agent;
			a_data_source_remove_agent: like data_source_remove_agent;
			an_undo_redo_chain: like undo_redo_chain;
			min_width_in_chars: INTEGER)
		do
			make_linked_single_line_text_control (a_title, a_data_source, a_data_source_setter_agent, a_data_source_remove_agent, an_undo_redo_chain, min_width_in_chars, True)
			initialise_browse_button
		ensure
			not is_readonly
			has_browse_button
		end

feature -- Access

	ev_browse_button: detachable EV_BUTTON
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

	has_browse_button: BOOLEAN
		do
			Result := attached ev_browse_button
		end

feature -- Modification

	set_default_directory_agent (an_agent: like default_directory_agent)
		do
			default_directory_agent := an_agent
		end

	set_button_icon (a_pixmap: EV_PIXMAP)
			-- set an icon on the browse button
		do
			check attached ev_browse_button as att_browse_btn then
				att_browse_btn.set_pixmap (a_pixmap)
			end
		end

	set_button_tooltip (a_text: STRING)
			-- set a tooltip on the browse button
		do
			check attached ev_browse_button as att_browse_btn then
				att_browse_btn.set_tooltip (utf8_to_utf32 (a_text))
			end
		end

	add_explore_button (an_explore_agent: PROCEDURE [ANY, TUPLE [STRING]]; an_icon: EV_PIXMAP)
			-- add an explorer lanuch button to the right of the browse button
		do
			explore_agent := an_explore_agent
			create ev_explore_button
			ev_explore_button.set_pixmap (an_icon)
			ev_root_container.extend (ev_explore_button)
			ev_root_container.disable_item_expand (ev_explore_button)
			ev_explore_button.select_actions.extend (agent on_explore)
		end

feature -- Events

	on_browse
			-- Let the user browse for the directory
		local
			initial_dir: STRING
		do
			if attached data_source_agent.item ([]) as ds_val and then not ds_val.is_empty then
				initial_dir := ds_val
			elseif attached default_directory_agent as dda then
				initial_dir := dda.item ([])
			else
				initial_dir := execution_environment.root_directory_name
			end

			check attached proximate_ev_window (ev_root_container) as pw then
				ev_data_control.set_text (get_directory (initial_dir, pw))
			end
			if attached data_source_setter_agent as ds_agt then
				ds_agt.call ([data_control_text])
			end
		end

	on_explore
		do
			if attached explore_agent as att_agt then
				att_agt.call ([data_control_text])
			end
		end

feature {NONE} -- Implementation

	default_directory_agent: detachable FUNCTION [ANY, TUPLE, STRING]
			-- agent that will return a reasonable default directory for when the user hits the browser button

	explore_agent: detachable PROCEDURE [ANY, TUPLE [STRING]]

	initialise_browse_button
		do
			create ev_browse_button
			ev_browse_button.set_text (utf8_to_utf32 (get_text ({EVX_MESSAGES_IDS}.ec_browse_button_text)))
			ev_root_container.extend (ev_browse_button)
			ev_root_container.disable_item_expand (ev_browse_button)
			ev_browse_button.select_actions.extend (agent on_browse)
		ensure
			has_browse_button
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


