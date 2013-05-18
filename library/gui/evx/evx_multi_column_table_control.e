note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Multi-column tabular visual control whose data source is defined as set of functions, 
				 one for each column.  Control structure is an N column table with an optional title, in-place 
				 editing and deletion, right-click context menu to add a row.
				 
									   Title
						+------+----------------------------+
						|      |                            |
						|      |                            |
						|      |                            |
						|      |                            |
						+------+----------------------------+

				 ]"
	keywords:    "UI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class EVX_MULTI_COLUMN_TABLE_CONTROL

inherit
	EVX_MLIST_CONTROL
		rename
			make as make_mlist, make_linked as make_editable_mlist
		redefine
			data_source_agent, data_source_setter_agent, data_source_remove_agent, set_columns_editable
		end

create
	make, make_editable

feature -- Initialisation

	make (a_data_source_agent: like data_source_agent;
			min_height, min_width: INTEGER;
			a_header_strings_agent: like header_strings_agent;
			a_data_row_agt: like data_row_agt)
		do
			make_mlist ("", a_data_source_agent, min_height, min_width, False, a_header_strings_agent)
			data_row_agt := a_data_row_agt
		ensure
			not is_readonly
		end

	make_editable (a_data_source_agent: like data_source_agent;
			a_data_source_create_agent: like data_source_setter_agent;
			a_data_source_remove_agent: like data_source_remove_agent;
			a_data_source_modify_agent: like data_source_modify_agent;
			an_undo_redo_chain: like undo_redo_chain;
			min_height, min_width: INTEGER;
			a_header_strings_agent: like header_strings_agent;
			a_data_row_agt: like data_row_agt)
		do
			make_editable_mlist ("",
				a_data_source_agent, a_data_source_create_agent, a_data_source_remove_agent, an_undo_redo_chain,
				min_height, min_width, False, a_header_strings_agent)
			data_source_modify_agent := a_data_source_modify_agent
			data_row_agt := a_data_row_agt
		ensure
			not is_readonly
		end

feature -- Access

	data_source_agent: FUNCTION [ANY, TUPLE, LIST [STRING]]
			-- first column keys

	data_source_setter_agent: detachable PROCEDURE [ANY, TUPLE [STRING, STRING]]
			-- agent for creating & setting the data source

	data_source_remove_agent: detachable PROCEDURE [ANY, TUPLE [key: STRING]]
			-- agent for removing a data item

	data_source_modify_agent: detachable PROCEDURE [ANY, TUPLE [col_name: STRING; key: STRING; value: STRING_32]]
			-- agent for setting the data item in column with name `col_name', row with `key' to `value'

	data_row_agt: FUNCTION [ANY, TUPLE [key: STRING], ARRAYED_LIST [STRING_32]]
			-- agent to generate a data row, taking a key from `data_source' as argument

feature {NONE} -- Implementation

	do_populate_control_from_source
		do
			populate_table (data_source_agent.item([]))
		end

	populate_table (key_list: LIST [STRING])
		local
			list_row: EV_MULTI_COLUMN_LIST_ROW
		do
			ev_data_control.wipe_out

			-- populate the table rows using the data source as the first column keys
			across key_list as key_list_csr loop
				create list_row
				list_row.append (data_row_agt.item ([key_list_csr.item]))
				ev_data_control.extend (list_row)
			end

			-- resize columns based on data or headers if no data
			resize_ev_multi_list (ev_data_control)
		end

	process_in_place_edit
		local
			key, col_name: STRING
			old_val, new_val: STRING_32
		do
			key := utf32_to_utf8 (ev_data_control.i_th (ev_data_control.widget_row).i_th (1))
			col_name := utf32_to_utf8 (ev_data_control.column_title (ev_data_control.widget_column))
			new_val := utf32_to_utf8 (ev_data_control.i_th (ev_data_control.widget_row).i_th (ev_data_control.widget_column))
			if attached ev_data_control.saved_text as txt then
				old_val := txt
			else
				create old_val.make_empty
			end

			if not old_val.same_string (new_val) then
				data_source_modify_agent.call ([col_name, key, new_val])

				undo_redo_chain.add_link (
					-- undo
					agent data_source_modify_agent.call ([col_name, key, old_val]),
					agent (ev_data_control.i_th (ev_data_control.widget_row)).put_i_th (old_val, ev_data_control.widget_column),
					-- redo
					agent data_source_modify_agent.call ([col_name, key, new_val]),
					agent (ev_data_control.i_th (ev_data_control.widget_row)).put_i_th (new_val, ev_data_control.widget_column)
				)
			end
		end

	process_add_new
		local
			new_key, new_val: STRING
			new_row: EV_MULTI_COLUMN_LIST_ROW
		do
--			new_key := "new_key#" + uniqueness_counter.out
--			uniqueness_counter := uniqueness_counter + 1
--			new_val := "new_value"

--			create new_row
--			new_row.extend (new_key)
--			new_row.extend (new_val)
--			ev_data_control.extend (new_row)
--			new_row.pointer_button_press_actions.force_extend (agent mlist_row_handler (new_row, ?, ?, ?))

--			data_source_create_agent.call ([new_key, new_val])
--			undo_redo_chain.add_link (
--				agent data_source_remove_agent.call ([new_key]), agent data_source_create_agent.call ([new_key, new_val]), agent do_populate
--			)
		end

	process_remove_existing
		local
			old_key, old_val: STRING
		do
--			old_key := ev_data_control.selected_item.i_th (1)
--			old_val := ev_data_control.selected_item.i_th (2)

--			data_source_remove_agent.call ([old_key])
--			ev_data_control.remove_selected_item

--			undo_redo_chain.add_link (
--				agent data_source_create_agent.call ([old_key, old_val]), agent data_source_remove_agent.call ([old_key]), agent do_populate
--			)
		end

	set_columns_editable
			-- set columns editable - can only do this when when populated
		do
			precursor
			if is_editable then
				ev_data_control.set_column_editable (False, 1)
			end
		end

end



