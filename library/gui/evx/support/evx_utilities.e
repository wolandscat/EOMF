note
	component:   "Eiffel Object Modelling Framework"
	description: "Populate various Eiffel Vision2 standard controls from standard EiffelBase data structures"
	keywords:    "EiffelVision, GUI"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2007- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class EVX_UTILITIES

inherit
	STRING_UTILITIES

feature -- Commands

	do_with_wait_cursor (an_ev_widget: EV_WIDGET; action: PROCEDURE [ANY, TUPLE])
			-- Perform `action' with an hourglass mouse cursor, restoring the cursor when done.
		local
			ptr_style: detachable EV_POINTER_STYLE
			ev_app: EV_APPLICATION
		do
			create ev_app
			ptr_style := an_ev_widget.pointer_style
			an_ev_widget.set_pointer_style ((create {EV_STOCK_PIXMAPS}).wait_cursor)
			ev_app.process_graphical_events
			action.call ([])
			an_ev_widget.set_pointer_style (ptr_style)
		rescue
			if attached ptr_style as ps then
				an_ev_widget.set_pointer_style (ps)
			end
		end

feature {NONE} -- Implementation

	populate_ev_multi_list_from_hash (ev_mlist: EV_MULTI_COLUMN_LIST; ht: detachable STRING_TABLE [ANY])
			-- populate rows of a multi-column list with name - value pairs in a STRING_TABLE
			-- Note that the value type is assumed to have a sensible outpur from its 'out' function
		local
			ev_list_row: EV_MULTI_COLUMN_LIST_ROW
		do
			if attached ht then
				ev_mlist.wipe_out
				across ht as ht_csr loop
					create ev_list_row
					ev_list_row.extend (ht_csr.key.as_string_32)
					ev_list_row.extend (ht_csr.item.out.as_string_32)
					ev_mlist.extend (ev_list_row)
				end
				resize_ev_multi_list (ev_mlist)
			end
		end

	populate_ev_multi_list_from_hash_list (ev_mlist: EV_MULTI_COLUMN_LIST; ht: detachable STRING_TABLE [LIST[STRING]])
			-- populate rows of a multi-column list with name - value pairs in a STRING_TABLE
			-- Note that the value type is assumed to have a sensible outpur from its 'out' function
		local
			ev_list_row: EV_MULTI_COLUMN_LIST_ROW
		do
			if attached ht then
				ev_mlist.wipe_out
				across ht as ht_csr loop
					create ev_list_row
					ev_list_row.extend (ht_csr.key.as_string_32)
					across ht_csr.item as items_csr loop
						ev_list_row.extend (items_csr.item.as_string_32)
					end
					ev_mlist.extend (ev_list_row)
				end
				resize_ev_multi_list (ev_mlist)
			end
		end

	populate_ev_multi_list_from_list (ev_mlist: EV_MULTI_COLUMN_LIST; a_list: detachable LIST [ANY])
			-- populate rows of a multi-column list with a single column of strings from `a_list'
			-- Note that the list value type is assumed to have a sensible outpur from its 'out' function
		local
			ev_list_row: EV_MULTI_COLUMN_LIST_ROW
		do
			if attached a_list then
				ev_mlist.wipe_out
				from a_list.start until a_list.off loop
					create ev_list_row
					ev_list_row.extend (utf8_to_utf32 (a_list.item.out))
					ev_mlist.extend (ev_list_row)
					a_list.forth
				end
				resize_ev_multi_list (ev_mlist)
			end
		end

	resize_ev_multi_list (ev_mlist: EV_MULTI_COLUMN_LIST)
			-- perform sensible column resizing on a EV_MULTI_COLUMN_LIST
		local
			i: INTEGER
		do
			if not ev_mlist.is_empty then
				from i := 1 until i > ev_mlist.column_count loop
					ev_mlist.resize_column_to_content (i)
					if not ev_mlist.column_title (i).is_empty then
						-- FIXME: a pure hack to get round the problem of Multi-list column resizing not including title contents
						ev_mlist.set_column_width (ev_mlist.column_width (i).max (ev_mlist.column_title (i).count * 12), i)
					end
					i := i + 1
				end
			else
				resize_ev_multi_list_to_headers (ev_mlist)
			end
		end

	resize_ev_multi_list_to_headers (ev_mlist: EV_MULTI_COLUMN_LIST)
			-- perform sensible column resizing on a EV_MULTI_COLUMN_LIST based on column headings
		local
			i: INTEGER
		do
			from i := 1 until i > ev_mlist.column_count loop
				ev_mlist.set_column_width (ev_mlist.column_width (i).max (ev_mlist.column_title (i).count * 12), i)
				i := i + 1
			end
		end

	populate_ev_list_from_hash_keys (ev_list: EV_LIST; ht: detachable STRING_TABLE [ANY])
			-- populate list from hash table keys
		local
			ev_list_item: EV_LIST_ITEM
		do
			if attached ht as att_ht then
				across att_ht as ht_csr loop
					create ev_list_item.make_with_text (ht_csr.key.as_string_32)
					ev_list.extend(ev_list_item)
				end
			end
		end

	initialise_splitter (split: EV_SPLIT_AREA; position: INTEGER)
			-- Make `position' the position for `split'; but do nothing if `position' is outside the allowed bounds.
		do
			if position = 0 then
				split.set_split_position (((split.minimum_split_position + split.maximum_split_position)/2).floor)
			elseif split.minimum_split_position <= position and position <= split.maximum_split_position then
				split.set_split_position (position)
			end
		end

	proximate_ev_window (a_widget: EV_WIDGET): EV_WINDOW
			-- find closest EV_WINDOW containing `a_widget'
		local
			csr: detachable EV_WIDGET
		do
			from csr := a_widget.parent until not attached csr or else attached {EV_WINDOW} csr loop
				csr := csr.parent
			end
			check attached {EV_WINDOW} csr as ev_win then
				Result := ev_win
			end
		end

	dialog_names: EV_DIALOG_NAMES
		once
			create Result
		end

	set_max_size_to_monitor (a_window: EV_WINDOW)
		local
			screen_area: EV_RECTANGLE
		do
			screen_area := monitor_area (a_window)
			a_window.set_maximum_width ((0.8 * screen_area.width).floor)
			a_window.set_maximum_height ((0.8 * screen_area.height).floor)
		end

	monitor_area (a_window: EV_WINDOW): EV_RECTANGLE
		local
			screen: EV_SCREEN
		do
			create screen
			Result := screen.monitor_area_from_window (a_window)
		end

feature -- Unicode

	utf8_to_utf32 (utf8_bytes: STRING): STRING_32
			-- `utf8_bytes' converted from a sequence of UTF-8 bytes to 32-bit Unicode characters.
		do
			utf8_encoding.convert_to (utf32_encoding, utf8_bytes)
			Result := utf8_encoding.last_converted_string_32
		end

	utf32_to_utf8 (utf32_bytes: STRING_32): STRING_8
			-- `utf32_bytes' converted from a sequence of UTF-32 bytes to UTF-8 byte sequence
		do
			utf32_encoding.convert_to (utf8_encoding, utf32_bytes)
			Result := utf32_encoding.last_converted_string_8
		end

feature {NONE} -- Unicode

	utf8_encoding: ENCODING
	    once
	        create Result.make ({CODE_PAGE_CONSTANTS}.utf8)
	    end

	utf32_encoding: ENCODING
	    once
	        create Result.make ({CODE_PAGE_CONSTANTS}.utf32)
	    end

end



