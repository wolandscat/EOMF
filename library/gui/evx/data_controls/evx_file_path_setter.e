note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Visual control for a data source containing a full file path, enabling both direct setting
				 and browsing by the user.
				 Visual control structure is a text edit field with a title, in-place editing, and a browse
				 button.
				 
					        +----------------------------+ +--------+
				    Title: 	|                            | | Browse |
						    +----------------------------+ +--------+

				 The text field may contain a file path and options, e.g. typical form:
				 	'C:\Program Files\winmerge\winmergeU.exe /e /u /f *.*'
				 Only the path part of this is used to perform the browse action. The options are retained
				 and re-appended to the final string.
				 ]"
	keywords:    "UI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class EVX_FILE_PATH_SETTER

inherit
	EVX_SINGLE_LINE_TEXT_CONTROL
		rename
			make as make_text_control, make_linked as make_linked_text_control, make_readonly as make_readonly_text_control
		end

	KL_SHARED_FILE_SYSTEM
		export
			{NONE} all
		end

create
	make, make_linked, make_readonly

feature -- Initialisation

	make (a_title: STRING; a_data_source: like data_source_agent; min_height, min_width: INTEGER)
		do
			make_text_control (a_title, a_data_source, min_height, min_width, True)
			initialise_browse_button
		ensure
			not is_readonly
		end

	make_readonly (a_title: STRING; a_data_source: like data_source_agent; min_height, min_width: INTEGER)
		do
			make_readonly_text_control (a_title, a_data_source, min_height, min_width, True)
		ensure
			is_readonly
		end

	make_linked (a_title: STRING; a_data_source: like data_source_agent;
			a_data_source_setter_agent: like data_source_setter_agent;
			a_data_source_remove_agent: like data_source_remove_agent;
			an_undo_redo_chain: like undo_redo_chain;
			min_height, min_width: INTEGER)
		do
			make_linked_text_control (a_title, a_data_source, a_data_source_setter_agent, a_data_source_remove_agent, an_undo_redo_chain, min_height, min_width, True)
			initialise_browse_button
		ensure
			not is_readonly
		end

feature -- Access

	ev_browse_button: detachable EV_BUTTON
		note
			option: stable
		attribute
		end

	file_path: detachable STRING
			-- file path only, with any options removed

	options: detachable STRING
			-- any options from original data_source string

feature -- Events

	on_browse
			-- Let the user browse for the file path
		local
			lpos: INTEGER
			file_str: STRING
		do
			file_path := data_source_agent.item ([]).twin
			file_path.left_adjust
			file_path.right_adjust

			-- if there are quotes around the path, go past the path
			if file_path.item (1) = '%"' then
				lpos := file_path.index_of ('%"', 2) + 1
			else
				lpos := file_path.index_of (' ', 1)
			end

			-- set options string appropriately
			create options.make_empty
			if lpos > 0 then
				options.append (file_path.substring (lpos, file_path.count))
				file_path.remove_substring (lpos, file_path.count)
			end

			-- do the browse
			check attached proximate_ev_window (ev_root_container) as pw then
				file_str := get_file (file_path, pw)
			end

			-- add back in options
			if attached options as opts then
				file_str.append (opts)
			end
			ev_data_control.set_text (file_str)

			if attached data_source_setter_agent as ds_agt then
				ds_agt.call ([data_control_text])
			end

		end

feature {NONE} -- Implmentation

	get_file (init_value: detachable STRING; a_parent_window: attached EV_WINDOW): STRING
			-- get a file path from user. `init_value' may be Void or empty
		local
			dialog: EV_FILE_OPEN_DIALOG
			a_file: RAW_FILE
			error_dialog: EV_INFORMATION_DIALOG
			init_dirname, default_result: STRING
			user_file: detachable STRING
		do
			create dialog

			if attached init_value and then not init_value.is_empty then
				init_dirname := file_system.dirname (init_value)
				if (create {DIRECTORY}.make (init_dirname)).exists then
					dialog.set_start_directory (init_dirname)
				end
				default_result := init_value
			else
				create default_result.make_empty
			end

			from until attached user_file loop
				dialog.show_modal_to_window (a_parent_window)
				if not attached dialog.selected_button or else dialog.selected_button_name.is_equal (dialog_names.ev_cancel) then
					user_file := default_result
				else
					if not dialog.file_name.is_empty then
						create a_file.make (dialog.file_name.to_string_8)
						if a_file.exists then
							user_file := a_file.name
						else
							create error_dialog.make_with_text (get_msg (ec_file_does_not_exist,  <<dialog.file_name>>))
							error_dialog.show_modal_to_window (a_parent_window)
						end
					else
						create error_dialog.make_with_text (get_text (ec_empty_file_does_not_exist))
						error_dialog.show_modal_to_window (a_parent_window)
					end
				end
			end
			Result := user_file
		end

	initialise_browse_button
		do
			create ev_browse_button
			ev_browse_button.set_text (get_text (ec_browse_button_text))
			ev_root_container.extend (ev_browse_button)
			ev_root_container.disable_item_expand (ev_browse_button)
			ev_browse_button.select_actions.extend (agent on_browse)
		end

end


