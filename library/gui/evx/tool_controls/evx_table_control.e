note
	component:   "EOMF project"
	description: "High level visual control for displaying and filtering a tabular list of data"
	keywords:    "table, UI"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class EVX_TABLE_CONTROL

inherit
	STRING_UTILITIES
		export
			{NONE} all;
			{ANY} deep_twin, is_deep_equal, standard_is_equal
		end

	EVX_CONTROL_SHELL
		export
			{NONE} all
		redefine
			refresh
		end

	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

create
	make

feature {NONE} -- Initialisation

	make (on_mlist_keypress_agt: PROCEDURE [ANY, TUPLE [EV_KEY]];
			a_column_titles_agt: FUNCTION [ANY, TUPLE, ARRAY [STRING]];
			a_key_list_agt: like key_list_agt;
			a_row_filter_names_agt: FUNCTION [ANY, TUPLE, ARRAYED_LIST [STRING]];
			a_row_data_agt: FUNCTION [ANY, TUPLE [STRING], ARRAYED_LIST [STRING_32]])
		do
			create ev_root_container
			create gui_controls.make (0)

			key_list_agt := a_key_list_agt

			-- ================ main path list table ==============
			create evx_mlist.make (agent key_list, 0, 0, a_column_titles_agt, a_row_data_agt)
			ev_root_container.extend (evx_mlist.ev_root_container)
			evx_mlist.ev_data_control.enable_multiple_selection
			gui_controls.extend (evx_mlist)

			-- ========== view controls control panel ===========
			create evx_control_panel.make
			ev_root_container.extend (evx_control_panel.ev_root_container)
			ev_root_container.disable_item_expand (evx_control_panel.ev_root_container)

			-- -------- Row view frame --------
			evx_control_panel.create_new_frame (get_text (ec_row_filter_frame_text), False)

			-- -------- Row view combo --------
			create evx_row_filter_combo.make ("", a_row_filter_names_agt, agent set_row_filter, 0, 80, False)
			if attached evx_control_panel.last_added_frame as evx_frame then
				evx_frame.extend (evx_row_filter_combo.ev_root_container, False)
				gui_controls.extend (evx_row_filter_combo)
			end

			-- -------- Col view frame --------
			evx_control_panel.create_new_frame (get_text (ec_column_frame_text), False)

			-- set events: key press agent for main list, enables things like
			-- ctrl-C to do copy
			evx_mlist.ev_data_control.key_press_actions.extend (on_mlist_keypress_agt)

			ev_root_container.set_data (Current)
		end

feature -- Access

	ev_root_container: EV_HORIZONTAL_BOX

	row_selected_text: STRING
			-- copy a selected path row from the paths control to the OS clipboard
		local
			ev_rows: DYNAMIC_LIST[EV_MULTI_COLUMN_LIST_ROW]
			ev_col: EV_MULTI_COLUMN_LIST_ROW
		do
			ev_rows := ev_mlist.selected_items
			create Result.make (0)

			if not ev_rows.is_empty then
				from ev_rows.start until ev_rows.off loop
					ev_col := ev_rows.item
					from ev_col.start until ev_col.off loop
						Result.append (ev_col.item.string + "%N")
						ev_col.forth
					end
					ev_rows.forth
				end
			end
		end

feature -- Status Report

	is_displayed: BOOLEAN
			-- True if main panel is visible
		do
			Result := ev_mlist.is_displayed
		end

	is_populated: BOOLEAN

feature -- Commands

	clear
		do
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.clear end)
			is_populated := False
		end

	populate
		do
			gui_controls.do_all (agent (an_item: EVX_DATA_CONTROL) do an_item.populate end)
			is_populated := True
		end

	refresh
		do
			if not is_populated then
				populate
			end
		end

	enable_editable
			-- enable user editing, do nothing if `is_readonly'
		do
		end

	disable_editable
			-- disable user editing, do nothing if `is_readonly'
		do
		end

	add_boolean_filter (a_name, a_tooltip: STRING; get_agt: FUNCTION [ANY, TUPLE, BOOLEAN]; update_agt: PROCEDURE [ANY, TUPLE [BOOLEAN]])
			-- add a filter checkbox with name `a_name' to the control panel. If user clicks on that checkbox,
			-- its agent is called with the current value of the checkbox
		local
			evx_cb: EVX_CHECK_BOX_CONTROL
		do
			boolean_update_agents.put (update_agt, a_name)
			create evx_cb.make_linked (a_name, a_tooltip, get_agt, agent update_and_populate (a_name, ?))
			if attached evx_control_panel.last_added_frame as evx_frame then
				evx_frame.extend (evx_cb.ev_data_control, False)
				gui_controls.extend (evx_cb)
			end
		end

	set_row_filter
		do
			if ev_mlist.is_displayed then
				populate
			end
		end

	select_row (a_key: STRING)
			-- set row whose first col value = a_key to be selected
		require
			not a_key.is_empty
		local
			l_key: STRING
			found: BOOLEAN
		do
			from ev_mlist.start until ev_mlist.off or found loop
				l_key := ev_mlist.item.i_th (1).to_string_8
				if l_key.same_string (a_key) then
					ev_mlist.item.enable_select
					ev_mlist.ensure_item_visible (ev_mlist.item)
					found := True
				end
				ev_mlist.forth
			end
		end

	show
		do
			if not ev_root_container.is_displayed then
				ev_root_container.show
			end
		end

	hide
		do
			if ev_root_container.is_displayed then
				ev_root_container.hide
			end
		end

feature {NONE} -- Implementation

	gui_controls: ARRAYED_LIST [EVX_DATA_CONTROL]

	evx_mlist: EVX_MULTI_COLUMN_TABLE_CONTROL

	evx_control_panel: EVX_CONTROL_PANEL

	evx_row_filter_combo: EVX_COMBO_CONTROL

	ev_mlist: EV_MULTI_COLUMN_LIST
			-- the EV multi-column list control
		do
			Result := evx_mlist.ev_data_control
		end

	key_list: ARRAYED_LIST [STRING]
			-- return the contents of the row whose key is
		do
			Result := key_list_agt.item ([evx_row_filter_combo.selected_text])
		end

	key_list_agt: FUNCTION [ANY, TUPLE [STRING], ARRAYED_LIST [STRING]]

	update_and_populate (flag_name: STRING; a_flag: BOOLEAN)
		do
			check attached boolean_update_agents.item (flag_name) as att_agt then
				att_agt.call ([a_flag])
			end
			populate
		end

	boolean_update_agents: HASH_TABLE [PROCEDURE [ANY, TUPLE [BOOLEAN]], STRING]
			-- table of updater agents for boolean filter flags
		attribute
			create Result.make (0)
		end

end
