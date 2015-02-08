note
	component:   "Eiffel Object Modelling Framework"
	description: "Interface for building up a menu bar."
	keywords:    "UI, menu"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class EVX_MENU_BAR

inherit
	EV_KEY_CONSTANTS
		export
			{NONE} all;
			{ANY} valid_key_code, deep_twin, is_deep_equal, standard_is_equal
		end

create
	make

feature -- Definitions

	Menu_key_separator: CHARACTER = '>'

feature -- Initialisation

	make
		do
			create ev_menu_bar
			create menu_item_index.make (0)
			create last_menu
		end

feature -- Access

	ev_menu_bar: EV_MENU_BAR

	last_menu: EV_MENU

	menu_item (a_key: STRING): EV_MENU_ITEM
		require
			has_menu_item (a_key)
		do
			check attached menu_item_index.item (a_key) as att_mi then
				Result := att_mi
			end
		end

feature -- Status Report

	has_menu_item (a_key: STRING): BOOLEAN
		do
			Result := menu_item_index.has (a_key)
		end

feature -- Modification

	set_accelerators (app_accelerators: EVX_ACCELERATORS)
		do
			accelerators := app_accelerators
		end

feature -- Commands

	add_menu (a_key, a_title: STRING)
			-- add a menu with title `a_title'
		do
			create last_menu
			last_menu.set_text (a_title)
			ev_menu_bar.extend (last_menu)
		end

	add_menu_with_action (a_key, a_title: STRING; a_select_action: PROCEDURE [ANY, TUPLE])
			-- add a menu with title `a_title' and an action to execute when the menu is selected; 
			-- this typically resets which items are active, or changes the menu in some way
		do
			create last_menu
			last_menu.set_text (a_title)
			last_menu.select_actions.extend (a_select_action)
			ev_menu_bar.extend (last_menu)
		end

	add_menu_item (a_key, a_text: STRING; a_pixmap: detachable EV_PIXMAP; a_select_action: detachable PROCEDURE [ANY, TUPLE])
			-- add a menu item to `last_menu'
		local
			mi: EV_MENU_ITEM 
		do
			create mi
			mi.set_text (a_text)

			if attached a_pixmap as att_pm then
				mi.set_pixmap (att_pm)
			end
			if attached a_select_action as att_sa then
				mi.select_actions.extend (att_sa)
			end
			last_menu.extend (mi)

			-- register the item under key
			menu_item_index.put (mi, a_key)
		end

	add_menu_item_disabled (a_key, a_text: STRING; a_pixmap: detachable EV_PIXMAP; a_select_action: detachable PROCEDURE [ANY, TUPLE])
			-- add a greyed out menu item (insensitive = True)
		do
			add_menu_item (a_key, a_text, a_pixmap, a_select_action)
			last_menu.last.disable_sensitive
		end

	add_menu_separator
			-- add a menu separator to `last_menu'
		local
			a_menu_sep: EV_MENU_SEPARATOR 
		do
			create a_menu_sep
			last_menu.extend (a_menu_sep)
		end			

	disable_menu_items (menu_item_keys: ARRAY[STRING])
			-- disable all items in `menu_items' list in menu with `a_menu_title'
		local
			i: INTEGER
		do
			from i := menu_item_keys.lower until i > menu_item_keys.upper loop
				if menu_item_index.has (menu_item_keys[i]) and then attached menu_item_index.item (menu_item_keys[i]) as mi then
					mi.disable_sensitive
				end
				i := i + 1
			end
		end

	enable_menu_items (menu_item_keys: ARRAY[STRING])
			-- enable all items in `menu_items' list in menu with `a_menu_title'
		local
			i: INTEGER
		do
			from i := menu_item_keys.lower until i > menu_item_keys.upper loop
				if menu_item_index.has (menu_item_keys[i]) and then attached menu_item_index.item (menu_item_keys[i]) as mi then
					mi.enable_sensitive
				end
				i := i + 1
			end
		end

	add_menu_shortcut (a_menu_item_key: STRING; key: INTEGER; ctrl, alt, shift: BOOLEAN)
			-- Create a keyboard shortcut for `menu_item', to execute `menu_item.select_actions'.
		require
			valid_key: valid_key_code (key)
			valid_menu_item: has_menu_item (a_menu_item_key)
		local
			mi: EV_MENU_ITEM
		do
			mi := menu_item (a_menu_item_key)
			if attached accelerators as att_accs then
				mi.set_text (mi.text + "%T" + att_accs.shortcut_text (key, ctrl, alt, shift))
				mi.select_actions.do_all (agent att_accs.add_shortcut (?, key, ctrl, alt, shift))
			end
		ensure
			has_key: menu_item (a_menu_item_key).text.as_upper.ends_with ((key_strings [key]).as_upper)
			has_ctrl: ctrl implies menu_item (a_menu_item_key).text.has_substring (key_strings [key_ctrl])
			has_alt: alt implies menu_item (a_menu_item_key).text.has_substring (key_strings [key_alt])
			has_shift: shift implies menu_item (a_menu_item_key).text.has_substring (key_strings [key_shift])
		end

	add_menu_shortcut_for_action (a_menu_item_key: STRING; action: PROCEDURE [ANY, TUPLE]; key: INTEGER; ctrl, alt, shift: BOOLEAN)
			-- Create a keyboard shortcut for `menu_item', to execute `action' rather than `menu_item.select_actions'.
		require
			valid_key: valid_key_code (key)
		local
			mi: EV_MENU_ITEM
		do
			mi := menu_item (a_menu_item_key)
			if attached accelerators as att_accs then
				mi.set_text (mi.text + "%T" + att_accs.shortcut_text (key, ctrl, alt, shift))
				att_accs.add_shortcut (action, key, ctrl, alt, shift)
			end
		ensure
			has_key: menu_item (a_menu_item_key).text.as_upper.ends_with ((key_strings [key]).as_upper)
			has_ctrl: ctrl implies menu_item (a_menu_item_key).text.has_substring (key_strings [key_ctrl])
			has_alt: alt implies menu_item (a_menu_item_key).text.has_substring (key_strings [key_alt])
			has_shift: shift implies menu_item (a_menu_item_key).text.has_substring (key_strings [key_shift])
		end

feature {NONE} -- Implementation

	menu_item_index: HASH_TABLE [EV_MENU_ITEM, STRING]

	accelerators: detachable EVX_ACCELERATORS

end

