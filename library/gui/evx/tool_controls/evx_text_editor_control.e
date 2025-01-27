note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 High-level control to provide a container with a Rich text editor and a 
				 control panel to the right with a line numbers on/off check-box.
				 ]"
	keywords:    "UI, editor"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class EVX_TEXT_EDITOR_CONTROL

inherit
	EVX_CONTROL_SHELL
		export
			{NONE} all;
			{ANY} standard_is_equal, is_deep_equal, deep_copy, deep_twin
		end

	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

	EV_SHARED_APPLICATION
		export
			{NONE} all
		end

	EV_KEY_CONSTANTS
		export
			{NONE} all
		end

	STRING_UTILITIES
		export
			{NONE} all
		end

create
	make, make_editable

feature -- Definitions

	Line_num_pad_width: INTEGER = 4

feature {NONE}-- Initialization

	make_editable (a_source_text_agt: like source_text_agt; a_save_agt: like save_agt)
		do
			make (a_source_text_agt)
			enable_editable
			save_agt := a_save_agt
			add_button (Void, Void, get_text ({EVX_MESSAGES_IDS}.ec_save_button_text), get_text ({EVX_MESSAGES_IDS}.ec_save_button_tooltip), agent save_content, Void)
			ev_text.key_press_actions.extend (agent on_save)
		end

	make (a_source_text_agt: like source_text_agt)
		do
			source_text_agt := a_source_text_agt

			create ev_root_container

			create check_box_table.make(0)
			create gui_controls.make (0)

			-- ---------- text control -----------
			create ev_text
			ev_text.disable_edit
			ev_text.set_tab_width ((ev_text.tab_width/2).floor.max (1))  -- this is in pixels
			ev_root_container.extend (ev_text)

			-- ---------- view controls control panel -----------
			create control_panel.make
			ev_root_container.extend (control_panel.ev_root_container)
			ev_root_container.disable_item_expand (control_panel.ev_root_container)

			-- ---------- view panel frame ----------
			create evx_view_frame.make (get_text ({EVX_MESSAGES_IDS}.ec_view_controls_text), False)
			control_panel.add_frame_control (evx_view_frame, False)

			-- ---------- line numbers Check box ----------
			create evx_line_numbers_cb.make_linked (
				get_text ({EVX_MESSAGES_IDS}.ec_add_line_numbers_text),
				get_text ({EVX_MESSAGES_IDS}.ec_add_line_numbers_tooltip),
				agent :BOOLEAN do Result := show_line_numbers end,
				agent update_line_numbers)
			evx_view_frame.extend (evx_line_numbers_cb.ev_data_control, False)
			gui_controls.extend (evx_line_numbers_cb)

			ev_root_container.set_data (Current)

			ev_text.key_press_actions.extend (agent on_keypress)
			ev_text.pointer_button_press_actions.extend (agent on_mouse_button_press)
		end

feature -- Access

	ev_root_container: EV_HORIZONTAL_BOX

	source_text_agt: FUNCTION [ANY, TUPLE, detachable STRING]
			-- agent that provides access to text

feature -- Search

	has_text (a_text: STRING): BOOLEAN
			-- return True if `a_text` found
		do
			Result := ev_text.search (a_text, 1) > 0
		end

	search_and_display (a_text: STRING)
			-- search for `a_text` from start and make visible if found
		local
			pos: INTEGER
		do
			create search_text.make_from_string (a_text)
			pos := ev_text.search (search_text, 1)
			if pos > 0 then
				ev_application.add_idle_action_kamikaze (agent select_and_display (pos, pos + search_text.count - 1))
			end
		end

	search_next
			-- search for last searched text from start and make visible if found
		local
			pos: INTEGER
		do
			pos := ev_text.search (search_text, (last_search_pos + 1) \\ ev_text.text_length)
			if pos = 0 then
				pos := ev_text.search (search_text, 1)
			end
			if pos > 0 then
				last_search_pos := pos
				if not ev_text.character_displayed (pos) then
					ev_text.scroll_to_line (ev_text.line_number_from_position (pos))
				end
				ev_text.select_region (pos, pos + search_text.count - 1)
			end
		end

	search_previous
			-- search for previous instance of last searched text from start and make visible if found
		do
			-- TODO
		end

feature -- Modification

	add_button (an_active_pixmap, an_inactive_pixmap: detachable EV_PIXMAP; a_button_text, a_tooltip_text: detachable STRING_8;
			a_do_action, a_stop_action: detachable PROCEDURE [ANY, TUPLE])
			-- add an EVX button to the control panel, along with two agents for 'do' and 'stop' (the two button states)
		local
			evx_button: EVX_BUTTON
		do
			create evx_button.make (an_active_pixmap, an_inactive_pixmap, a_button_text, a_tooltip_text, a_do_action, a_stop_action)
			if attached control_panel.last_added_frame as att_frame then
				att_frame.extend (evx_button.ev_button, False)
				gui_controls.extend (evx_button)
			end
		end

	set_text_filter (a_text: STRING; a_tooltip_text: detachable STRING_8; a_filter_agt: attached like filter_agt)
			-- add a checkbox with a text filter to the control panel that generates an alternate from of the text
		local
			evx_filter_cb: EVX_CHECK_BOX_CONTROL
		do
			filter_agt := a_filter_agt
			create evx_filter_cb.make_linked (a_text, a_tooltip_text,
				agent :BOOLEAN do Result := text_filter_selected end,
				agent (a_button_state: BOOLEAN) do text_filter_selected := a_button_state; populate end)
			evx_view_frame.extend (evx_filter_cb.ev_data_control, False)
			gui_controls.extend (evx_filter_cb)
		end

	add_check_box (a_text: STRING; a_tooltip_text: detachable STRING_8;
			a_data_source_agent: FUNCTION [ANY, TUPLE, BOOLEAN];
			a_on_select_agent: PROCEDURE [ANY, TUPLE [BOOLEAN]])
				-- add a checkbox to the frame; state of the checkbox is available in `check_box_selected`
		local
			evx_cb: EVX_CHECK_BOX_CONTROL
		do
			create evx_cb.make_linked (a_text, a_tooltip_text, a_data_source_agent,
				agent (cb_selected: BOOLEAN; agt: PROCEDURE [ANY, TUPLE [BOOLEAN]])
					do
						agt.call([cb_selected]); populate
					end (?, a_on_select_agent))
			evx_view_frame.extend (evx_cb.ev_data_control, False)
			check_box_table.put(evx_cb, a_text)
			gui_controls.extend (evx_cb)
		end

	set_text_focus_in_action (agt: PROCEDURE[ANY,TUPLE])
		do
			ev_text.focus_in_actions.extend (agt)
		end

feature -- Status Report

	is_displayed: BOOLEAN
			-- True if main panel is visible
		do
			Result := ev_root_container.is_displayed
		end

	is_empty: BOOLEAN
			-- True if no text in this editor
		do
			Result := ev_text.text_length = 0
		end

	show_line_numbers: BOOLEAN

	text_filter_selected: BOOLEAN

	check_box_selected (a_key: STRING): BOOLEAN
		do
			if check_box_table.has(a_key) and then attached check_box_table.item(a_key) as evx_cb_ctl then
				Result := evx_cb_ctl.is_selected
			end
		end

feature -- Commands

	hide
		do
			ev_root_container.hide
		end

	show
		do
			ev_root_container.show
		end

	enable_editable
			-- enable editing
		do
			ev_text.enable_edit

		end

	disable_editable
			-- disable editing
		do
			ev_text.disable_edit
		end

	clear
		do
			gui_controls.do_all (agent (an_item: EVX_CONTROL_SHELL) do an_item.clear end)
			ev_text.remove_text
		end

	populate
		do
			gui_controls.do_all (agent (an_item: EVX_CONTROL_SHELL) do an_item.populate end)
			ev_text.set_text (utf8_to_utf32 (editor_text))
		end

feature -- Events

	on_save (a_key: EV_KEY)
			-- When the user presses ctrl-S on row in path map, call the save agent
		do
			if ev_application.ctrl_pressed and attached a_key as key and then key.code = key_s then
				save_content
			end
		end

	on_keypress (a_key: EV_KEY)
			-- Check if an arrow key has been pressed and update last search position
		do
			if attached a_key as key and then key.is_arrow then
				ev_application.add_idle_action_kamikaze (agent do_update_last_search_pos_from_carat)
			end
		end

	on_mouse_button_press (x, y, button: INTEGER; x_tilt, y_tilt, pressure: DOUBLE; screen_x, screen_y: INTEGER)
		do
			if button = {EV_POINTER_CONSTANTS}.left then
				ev_application.add_idle_action_kamikaze (agent do_update_last_search_pos_from_carat)
			end
		end

	do_update_last_search_pos_from_carat
		do
			last_search_pos := ev_text.caret_position
		end

feature {NONE} -- Implementation

	update_line_numbers (flag: BOOLEAN)
		do
			show_line_numbers := flag
			populate
		end

	gui_controls: ARRAYED_LIST [EVX_CONTROL_SHELL]

	control_panel: EVX_CONTROL_PANEL

	ev_text: EV_RICH_TEXT

	evx_view_frame: EVX_FRAME_CONTROL

	evx_line_numbers_cb: EVX_CHECK_BOX_CONTROL

	save_agt: detachable PROCEDURE [ANY, TUPLE [STRING]]

	filter_agt: detachable FUNCTION [ANY, TUPLE [STRING], STRING]
			-- optional agent to filter text into a new form (still UTF-8)

	save_content
			-- save content of text editor using `save_agt'
		do
			if attached save_agt as att_agt then
				att_agt.call ([utf32_to_utf8 (ev_text.text)])
			end
		end

	editor_text: STRING
		local
			raw_text: STRING
		do
			if attached source_text_agt.item ([]) as att_text then
				-- add line numbers if requested	
				if show_line_numbers then
					raw_text := add_line_numbers (att_text, Line_num_pad_width, " ")
				else
					raw_text := att_text
				end

				-- filter if requested
				if text_filter_selected and then attached filter_agt as att_filter_agt then
					Result := att_filter_agt.item ([raw_text])
				else
					Result := raw_text
				end
			else
				create Result.make_empty
			end
		end

	select_filter (a_button_state: BOOLEAN)
		do
			if a_button_state then

			end
		end

	check_box_table: STRING_TABLE [EVX_CHECK_BOX_CONTROL]

	last_search_pos: INTEGER
			-- character position of last matched string in text due to call to `search_and_display`

	search_text: STRING
		attribute
			create Result.make_empty
		end

	select_and_display (start_pos, end_pos: INTEGER)
			-- select between two positions and display
		do
			ev_text.set_focus
			last_search_pos := start_pos
			if not ev_text.character_displayed (start_pos) then
				ev_text.scroll_to_line (ev_text.line_number_from_position (start_pos))
			end
			ev_text.select_region (start_pos, end_pos)
		end

end

