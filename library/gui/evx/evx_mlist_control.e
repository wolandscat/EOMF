note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Visual control for a data source that outputs to an EV_MULTI_COLUMN_LIST. Specialise data source
				 in descendants.
				 Visual control structure is a single or multi-column table with a title, in-place editing and deletion, 
				 right-click context menu to add a row.
				 
								   Title
						+----------------------------+
						|                            |
						|                            |
						|                            |
						|                            |
						+----------------------------+

				 ]"
	keywords:    "UI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class EVX_MLIST_CONTROL

inherit
	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

	EVX_TITLED_DATA_CONTROL
		rename
			make as make_data_control, make_linked as make_linked_data_control, make_readonly as make_readonly_data_control
		redefine
			populate, do_enable_editable, do_disable_editable
		end

feature -- Initialisation

	make (a_title: STRING; a_data_source_agent: like data_source_agent;
			min_height, min_width: INTEGER;
			arrange_horizontally: BOOLEAN;
			a_header_strings_agent: like header_strings_agent)
		do
			make_data_control (a_title, a_data_source_agent, min_height, min_width, arrange_horizontally)
			initialise_data_control (a_header_strings_agent)
		ensure
			not is_readonly
		end

	make_readonly (a_title: STRING; a_data_source_agent: like data_source_agent;
			min_height, min_width: INTEGER;
			arrange_horizontally: BOOLEAN;
			a_header_strings_agent: like header_strings_agent)
		do
			make_readonly_data_control (a_title, a_data_source_agent, min_height, min_width, arrange_horizontally)
			initialise_data_control (a_header_strings_agent)
		ensure
			is_readonly
		end

	make_linked (a_title: STRING; a_data_source_agent: like data_source_agent;
			a_data_source_create_agent: like data_source_setter_agent;
			a_data_source_remove_agent: like data_source_remove_agent;
			an_undo_redo_chain: like undo_redo_chain;
			min_height, min_width: INTEGER;
			arrange_horizontally: BOOLEAN;
			a_header_strings_agent: like header_strings_agent)
		do
			make_linked_data_control (a_title,
				a_data_source_agent, a_data_source_create_agent, a_data_source_remove_agent, an_undo_redo_chain,
				min_height, min_width, arrange_horizontally)
			initialise_data_control (a_header_strings_agent)
		ensure
			not is_readonly
		end

feature -- Access

	ev_data_control: EV_MULTI_COLUMN_LIST_EDITABLE

	header_strings_agent: detachable FUNCTION [ANY, TUPLE, ARRAY [STRING]]
			-- agent that returns a set of strings that can be used to populate the
			-- title row of the data control

feature -- Commands

	populate
		do
			if attached header_strings_agent then
				ev_data_control.set_column_titles (header_strings_agent.item ([]))
			end
			do_populate_control_from_source
			if is_editable then
				set_columns_editable
			end
		end

	clear
			-- Wipe out content.
		do
			ev_data_control.wipe_out
		end

feature {NONE} -- Implementation

	do_populate_control_from_source
		deferred
		end

	create_ev_data_control
		do
			create ev_data_control
		end

	process_in_place_edit
		deferred
		end

	process_add_new
		deferred
		end

	process_remove_existing
		deferred
		end

	mlist_handler (ev_mlist: EV_MULTI_COLUMN_LIST; x,y, button: INTEGER; x_tilt, y_tilt, pressure: DOUBLE; screen_x, screen_y: INTEGER)
			-- creates the context menu for a right click action on a list
		local
			menu: EV_MENU
			an_mi: EV_MENU_ITEM
		do
			if button = {EV_POINTER_CONSTANTS}.right then
				create menu
				if attached ev_mlist.selected_item then
					create an_mi.make_with_text_and_action (get_msg (ec_remove_mi, Void), agent process_remove_existing)
				--		an_mi.set_pixmap (get_icon_pixmap ("tool/archetype_tool_new"))
					menu.extend (an_mi)
				end
				create an_mi.make_with_text_and_action (get_msg (ec_add_mi, Void), agent process_add_new)
		--		an_mi.set_pixmap (get_icon_pixmap ("tool/archetype_tool"))
		    	menu.extend (an_mi)
				menu.show
			end
		end

	initialise_data_control (a_header_strings_agent: like header_strings_agent)
		do
			if attached a_header_strings_agent then
				header_strings_agent := a_header_strings_agent
			else
				ev_data_control.hide_title_row
			end
		end

	data_control_initialised: BOOLEAN
			-- flag indicating that once-only initialisation of data control has been done

	uniqueness_counter: INTEGER
		do
			Result := uniqueness_counter_cell.item
		end

	increment_uniqueness_counter
		do
			uniqueness_counter_cell.put (uniqueness_counter + 1)
		end

	uniqueness_counter_cell: CELL[INTEGER]
		local
			rnd: RANDOM
			dt: DATE_TIME
		once
			create dt.make_now
			create rnd.set_seed (dt.seconds)
			create Result.put (rnd.i_th (1))
		end

	set_columns_editable
		do
			ev_data_control.set_all_columns_editable
		end

	do_enable_editable
		do
			precursor
			ev_data_control.set_background_color (editable_colour)

			-- the following one-off initialisation has to be done now, because at make time, the call to
			-- proximate_ev_window won't work because things are not connected up yet
			if not data_control_initialised then
				check attached proximate_ev_window (ev_root_container) as root_win then
					ev_data_control.enable_editing (root_win)
				end
				ev_data_control.end_edit_actions.extend (agent do if is_editable then process_in_place_edit end end)
				ev_data_control.pointer_button_press_actions.force_extend (agent mlist_handler (ev_data_control, ?, ?, ?, ?, ?, ?, ?, ?))
				data_control_initialised := True
			end
		end

	do_disable_editable
		do
			precursor
			ev_data_control.set_background_color (background_colour)
		end

end



