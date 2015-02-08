note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Visual control for a data source that outputs to text field control.
				 Visual control structure is a text edit field with a title, in-place editing.
				 
					        +----------------------------+
				    Title: 	|                            |
						    +----------------------------+

				 ]"
	keywords:    "UI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class EVX_TEXT_CONTROL

inherit
	EVX_TITLED_DATA_CONTROL
		rename
			make as make_data_control, make_readonly as make_readonly_data_control, make_linked as make_linked_data_control
		redefine
			data_source_agent, data_source_setter_agent, do_enable_editable, do_disable_editable
		end

feature -- Initialisation

	make (a_title: STRING; a_data_source_agent: like data_source_agent;
			min_lines, min_width_in_chars: INTEGER; arrange_horizontally: BOOLEAN)
		do
			make_data_control (a_title, a_data_source_agent, min_lines * text_min_height, min_width_in_chars * Text_char_width, arrange_horizontally)
			ev_data_control.focus_in_actions.extend (agent on_select_all)
		end

	make_readonly (a_title: detachable STRING; a_data_source_agent: like data_source_agent;
			min_lines, min_width_in_chars: INTEGER; arrange_horizontally: BOOLEAN)
		do
			make_readonly_data_control (a_title, a_data_source_agent, min_lines * text_min_height, min_width_in_chars * Text_char_width, arrange_horizontally)
		end

	make_linked (a_title: STRING; a_data_source_agent: like data_source_agent;
			a_data_source_setter_agent: like data_source_setter_agent;
			a_data_source_remove_agent: like data_source_remove_agent;
			an_undo_redo_chain: like undo_redo_chain;
			min_lines, min_width_in_chars: INTEGER; arrange_horizontally: BOOLEAN)
		do
			make_linked_data_control (a_title,
				a_data_source_agent, a_data_source_setter_agent, a_data_source_remove_agent,
				an_undo_redo_chain, min_lines * text_min_height, min_width_in_chars * Text_char_width, arrange_horizontally)
			ev_data_control.focus_in_actions.extend (agent on_select_all)
			ev_data_control.focus_out_actions.extend (agent do if is_editable then process_edit end end)
		end

feature -- Access

	ev_data_control: EV_TEXT_COMPONENT
		deferred
		end

	data_control_text: STRING_8
			-- STRING_8 converted form of text from UI
		do
			Result := ev_data_control.text.to_string_8
		end

	data_source_agent: FUNCTION [ANY, TUPLE, detachable STRING]

	data_source_setter_agent: detachable PROCEDURE [ANY, TUPLE [STRING]]
			-- agent for creating & setting the data source

	update_validity_agent: detachable FUNCTION [ANY, TUPLE [STRING], BOOLEAN]
			-- agent that if set will be used to check data entered into the control
			-- for validity; if invalid, an error dialog will be displayed and the
			-- value will be reverted to its previous value

	validity_error_msg_agent: detachable FUNCTION [ANY, TUPLE [args: detachable ARRAY [STRING]], STRING]
			-- agent that if passed optional string args, will generate a message with the arguments
			-- correctly interpolated, suitable for screen display.

feature -- Commands

	clear
			-- Wipe out content.
		do
			ev_data_control.remove_text
		end

	populate
			-- populate content.
		do
			if attached {STRING} data_source_agent.item ([]) as str then
				ev_data_control.set_text (utf8_to_utf32 (str))
			else
				ev_data_control.remove_text
			end
		end

	set_focus
			-- select text
		do
			ev_data_control.select_all
			ev_data_control.set_focus
		end

feature -- Modification

	set_validity_agents (an_update_validity_agent: like update_validity_agent; a_validity_error_msg_agent: like validity_error_msg_agent)
		do
			update_validity_agent := an_update_validity_agent
			validity_error_msg_agent := a_validity_error_msg_agent
		end

feature {NONE} -- Implementation

	process_edit
		require
			Setter_agent_available: attached data_source_setter_agent
		local
			old_val, new_val: STRING
			undo_agt, redo_agt: detachable PROCEDURE [ANY, TUPLE]
			error_dialog: EV_INFORMATION_DIALOG
		do
			new_val := utf32_to_utf8 (ev_data_control.text)
			if attached data_source_agent.item ([]) as ds then
				create old_val.make_from_string (ds)
			else
				create old_val.make_empty
			end

			if not old_val.same_string (new_val) then
				if attached update_validity_agent as att_validity_agt and then attached validity_error_msg_agent as att_err_msg_agt and then
					 not att_validity_agt.item ([new_val])
				then
					ev_data_control.focus_out_actions.block
					create error_dialog.make_with_text (att_err_msg_agt.item ([<<new_val>>]))
					check attached proximate_ev_window (ev_data_control) as pw then
						error_dialog.show_modal_to_window (pw)
					end
					populate
					ev_data_control.focus_out_actions.resume
				elseif attached data_source_setter_agent as att_setter_agt and attached data_source_remove_agent as att_rmeove_agt then
					-- if user is removing value then use the remove agent, else use the setting agent
					if old_val.is_empty then
						undo_agt := att_rmeove_agt
					else
						undo_agt := agent att_setter_agt.call ([old_val])
					end

					if new_val.is_empty then
						redo_agt := att_rmeove_agt
					else
						redo_agt := agent att_setter_agt.call ([new_val])
					end

					att_setter_agt.call ([new_val])

					if attached undo_redo_chain as urc and attached undo_agt as ua and attached redo_agt as ra then
						urc.add_link (ev_data_control, ua, agent populate, ra, agent populate)
					end
				end
			end
		end

	on_select_all
		do
			if ev_data_control.text_length > 0 then
				ev_data_control.select_all
			end
		end

	do_enable_editable
			-- enable editing
		do
			precursor
			ev_data_control.enable_edit
		end

	do_disable_editable
			-- disable editing
		do
			precursor
			ev_data_control.disable_edit
		end

end



