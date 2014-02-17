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
			add_button (Void, Void, get_text (ec_save_button_text), get_text (ec_save_button_tooltip), agent save_content, Void)
			ev_text.key_press_actions.extend (agent on_keypress)
		end

	make (a_source_text_agt: like source_text_agt)
		do
			source_text_agt := a_source_text_agt

			create ev_root_container
			create gui_controls.make (0)

			-- ---------- text control -----------
			create ev_text
			ev_text.disable_edit
			ev_text.set_tab_width ((ev_text.tab_width/2).floor.max (1))  -- this is in pixels, and assumes 7-pixel wide chars
			ev_root_container.extend (ev_text)

			-- ---------- view controls control panel -----------
			create control_panel.make
			ev_root_container.extend (control_panel.ev_root_container)
			ev_root_container.disable_item_expand (control_panel.ev_root_container)

			-- ---------- view panel frame ----------
			create evx_view_frame.make (get_text (ec_view_controls_text), 85, 100, False)
			control_panel.add_frame_control (evx_view_frame, False)

			-- ---------- line numbers Check box ----------
			create evx_line_numbers_cb.make_linked (
				get_text (ec_add_line_numbers_text),
				get_text (ec_add_line_numbers_tooltip),
				agent :BOOLEAN do Result := show_line_numbers end,
				agent update_line_numbers)
			evx_view_frame.extend (evx_line_numbers_cb.ev_data_control, False)
			gui_controls.extend (evx_line_numbers_cb)

			ev_root_container.set_data (Current)
		end

feature -- Access

	ev_root_container: EV_HORIZONTAL_BOX

	show_line_numbers: BOOLEAN

	source_text_agt: FUNCTION [ANY, TUPLE, detachable STRING]
			-- agent that provides access to text

feature -- Modification

	add_button (an_active_pixmap, an_inactive_pixmap: detachable EV_PIXMAP; a_button_text, a_tooltip_text: detachable STRING_8; a_do_action, a_stop_action: detachable PROCEDURE [ANY, TUPLE])
			-- add an EVX button to the control panel
		local
			evx_button: EVX_BUTTON
		do
			create evx_button.make (an_active_pixmap, an_inactive_pixmap, a_button_text, a_tooltip_text, a_do_action, a_stop_action)
			control_panel.last_added_frame.extend (evx_button.ev_button, False)
			gui_controls.extend (evx_button)
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
		local
			s: STRING
		do
			gui_controls.do_all (agent (an_item: EVX_CONTROL_SHELL) do an_item.populate end)
			if attached source_text_agt.item ([]) as att_text then
				if show_line_numbers then
					s := add_line_numbers (att_text, Line_num_pad_width, " ")
				else
					s := att_text
				end
				ev_text.set_text (utf8_to_utf32 (s))
			end
		end

feature -- Events

	on_keypress (key: EV_KEY)
			-- When the user presses ctrl-S on row in path map, call the save agent
		do
			if ev_application.ctrl_pressed and attached key and then key.code = key_s then
				save_content
			end
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

	save_content
			-- save content of text editor using `save_agt'
		do
			if attached save_agt as att_agt then
				att_agt.call ([utf32_to_utf8 (ev_text.text)])
			end
		end

end

