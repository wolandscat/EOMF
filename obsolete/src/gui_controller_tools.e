note
	component:   "Eiffel Object Modelling Framework"
	description: "Populate various Eiffel Vision2 standard controls from standard EiffelBase data structures"
	keywords:    "EiffelVision, GUI"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2007- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class GUI_CONTROLLER_TOOLS

inherit
	STRING_UTILITIES

feature {NONE} -- Implementation

	populate_ev_multi_list_from_hash (ev_mlist: EV_MULTI_COLUMN_LIST; ht: HASH_TABLE [ANY, STRING])
			-- populate rows of a multi-column list with name - value pairs in a HASH_TABLE
			-- Note that the value type is assumed to have a sensible outpur from its 'out' function
		local
			ev_list_row: EV_MULTI_COLUMN_LIST_ROW
			i: INTEGER
		do
			if ht /= Void then
				from
					ht.start
				until
					ht.off
				loop
					create ev_list_row
					ev_list_row.extend (utf8 (ht.key_for_iteration))
					ev_list_row.extend (utf8 (ht.item_for_iteration.out))
					ev_mlist.extend(ev_list_row)
					ht.forth
				end

				from i := 1
				until i > ev_mlist.column_count
				loop ev_mlist.resize_column_to_content(i)
					i := i + 1
				end
			end
		end

	populate_ev_list_from_list(ev_list: EV_LIST; a_list: ARRAYED_LIST [STRING])
			-- populate rows of a list with items from a ARRAYED_LIST [STRING]
		local
			ev_list_item: EV_LIST_ITEM
		do
			if a_list /= Void then
				from
					a_list.start
				until
					a_list.off
				loop
					create ev_list_item.make_with_text (utf8 (a_list.item))
					ev_list.extend(ev_list_item)
					a_list.forth
				end
			end
		end

	populate_ev_list_from_hash_keys(ev_list: EV_LIST; ht: HASH_TABLE [ANY, STRING])
			-- populate list from hash table keys
		local
			ev_list_item: EV_LIST_ITEM
		do
			if ht /= Void then
				from
					ht.start
				until
					ht.off
				loop
					create ev_list_item.make_with_text (utf8 (ht.key_for_iteration))
					ev_list.extend(ev_list_item)
					ht.forth
				end
			end
		end

--	populate_ev_combo_from_hash_keys(ev_combo: EV_COMBO_BOX; ht: DS_HASH_TABLE [INTEGER, STRING])
--			-- populate combo from hash table items
--		local
--			strs: ARRAYED_LIST[STRING]
--		do
--			create strs.make (0)
--			if ht /= Void then
--				from
--					ht.start
--				until
--					ht.off
--				loop
--					strs.extend (utf8 (ht.key_for_iteration))
--					ht.forth
--				end
--			end
--			ev_combo.set_strings (strs)
--		end

end



