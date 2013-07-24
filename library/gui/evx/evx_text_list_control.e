note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Visual control for LIST [STRING] data source. Control structure is a single column table with a title, 
				 in-place editing and deletion, right-click context menu to add a row.
				 
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

class EVX_TEXT_LIST_CONTROL

inherit
	EVX_MLIST_CONTROL
		rename
			make as make_mlist, make_linked as make_linked_mlist
		redefine
			data_source_agent, data_source_setter_agent
		end

create
	make, make_linked

feature -- Initialisation

	make (a_title: STRING; a_data_source_agent: like data_source_agent;
			min_height, min_width: INTEGER; arrange_horizontally: BOOLEAN)
		do
			make_mlist (a_title, a_data_source_agent, min_height, min_width, arrange_horizontally, Void)
		ensure
			not is_readonly
		end

	make_linked (a_title: STRING; a_data_source_agent: like data_source_agent;
			a_data_source_create_agent: like data_source_setter_agent;
			a_data_source_remove_agent: like data_source_remove_agent;
			an_undo_redo_chain: like undo_redo_chain;
			min_height, min_width: INTEGER;
			arrange_horizontally: BOOLEAN)
		do
			make_linked_mlist (a_title,
				a_data_source_agent, a_data_source_create_agent, a_data_source_remove_agent, an_undo_redo_chain,
				min_height, min_width, arrange_horizontally, Void)
		ensure
			not is_readonly
		end

feature -- Access

	data_source_agent: FUNCTION [ANY, TUPLE, detachable DYNAMIC_LIST [STRING]]
			-- function that produces a correct reference to the data source of this
			-- control when called

	data_source_setter_agent: detachable PROCEDURE [ANY, TUPLE [STRING, INTEGER]]
			-- agent for add an item to the data source list

feature {NONE} -- Implementation

	do_populate_control_from_source
		do
			populate_ev_multi_list_from_list (ev_data_control, data_source_agent.item ([]))
		end

	process_in_place_edit
		local
			old_val, new_val: STRING
			ds_index: INTEGER
		do
			if attached data_source_agent.item ([]) as ds then
				ds_index := 1
				from ds.start until ds_index = ev_data_control.widget_row or ds.off loop
					ds_index := ds_index + 1
					ds.forth
				end
				old_val := ds.item_for_iteration

				new_val := utf32_to_utf8 (ev_data_control.i_th (ev_data_control.widget_row).i_th (1))

				if not old_val.same_string (new_val) then
					ds.replace (new_val)
					undo_redo_chain.add_link (ev_data_control,
						-- undo
						agent ds.put_i_th (old_val, ds_index),
						agent (a_val: STRING_32; row_idx: INTEGER)
							local
								a_row: EV_MULTI_COLUMN_LIST_ROW
							do
								a_row := ev_data_control.i_th (row_idx)
								a_row.put_i_th (a_val, 1)
							end (utf8_to_utf32 (old_val), ev_data_control.widget_row),
						-- redo
						agent ds.put_i_th (new_val, ds_index),
						agent (a_val: STRING_32; row_idx: INTEGER)
							local
								a_row: EV_MULTI_COLUMN_LIST_ROW
							do
								a_row := ev_data_control.i_th (row_idx)
								a_row.put_i_th (a_val, 1)
							end (utf8_to_utf32 (new_val), ev_data_control.widget_row)
					)
				end
			end
		end

	process_add_new
		local
			new_row: EV_MULTI_COLUMN_LIST_ROW
			new_val: STRING
		do
			new_val := "new_val#" + uniqueness_counter.out

			create new_row
			new_row.extend (new_val)
			ev_data_control.extend (new_row)
	--		new_row.pointer_button_press_actions.force_extend (agent mlist_handler (ev_data_control, ?, ?, ?, ?, ?, ?, ?, ?))

			data_source_setter_agent.call ([new_val, 0])
			undo_redo_chain.add_link (ev_data_control, 
				-- undo
				agent data_source_remove_agent.call ([new_val]),
				agent populate,
				-- redo
				agent data_source_setter_agent.call ([new_val, 0]),
				agent populate
			)
		end

	process_remove_existing
		local
			undo_add_idx: INTEGER
			old_val: STRING
			ds_index: INTEGER
		do
			if attached data_source_agent.item ([]) as ds then
				check attached ev_data_control.selected_item as sel_item then
					ds_index := ev_data_control.index_of (sel_item, 1)
				end
				old_val := ds.i_th (ds_index)

				if ds_index = ev_data_control.count then -- removing last element
					undo_add_idx := 0
				else
					undo_add_idx := ds_index
				end
				data_source_remove_agent.call ([old_val])
				undo_redo_chain.add_link (ev_data_control, 
					agent data_source_setter_agent.call ([old_val, undo_add_idx]),
					agent populate,
					agent data_source_remove_agent.call ([old_val]),
					agent populate
				)
				ev_data_control.remove_selected_item
			end
		end

end



