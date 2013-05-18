note
	component:   "Eiffel Object Modelling Framework"
	description: "Initialisation of the main window's accelerator keys."
	keywords:    "test, ADL"
	author:      "Peter Gummer <peter.gummer@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class
	EVX_WINDOW_ACCELERATORS

inherit
	EV_KEY_CONSTANTS
		export
			{NONE} all;
			{ANY} standard_is_equal, is_deep_equal, deep_copy, deep_twin
		end

feature {NONE} -- Implementation

	accelerators: detachable EV_ACCELERATOR_LIST
			-- Key combination shortcuts associated with the main window.
		deferred
		end

	add_menu_shortcut (menu_item: EV_MENU_ITEM; key: INTEGER; ctrl, alt, shift: BOOLEAN)
			-- Create a keyboard shortcut for `menu_item', to execute `menu_item.select_actions'.
		require
			menu_item_attached: menu_item /= Void
			valid_key: valid_key_code (key)
		do
			menu_item.set_text (menu_item.text + "%T" + shortcut_text (key, ctrl, alt, shift))
			menu_item.select_actions.do_all (agent add_shortcut (?, key, ctrl, alt, shift))
		ensure
			has_key: menu_item.text.as_upper.ends_with ((key_strings [key]).as_upper)
			has_ctrl: ctrl implies menu_item.text.has_substring (key_strings [key_ctrl])
			has_alt: alt implies menu_item.text.has_substring (key_strings [key_alt])
			has_shift: shift implies menu_item.text.has_substring (key_strings [key_shift])
		end

	add_menu_shortcut_for_action (menu_item: EV_MENU_ITEM; action: PROCEDURE [ANY, TUPLE]; key: INTEGER; ctrl, alt, shift: BOOLEAN)
			-- Create a keyboard shortcut for `menu_item', to execute `action' rather than `menu_item.select_actions'.
		require
			menu_item_attached: menu_item /= Void
			valid_key: valid_key_code (key)
		do
			menu_item.set_text (menu_item.text + "%T" + shortcut_text (key, ctrl, alt, shift))
			add_shortcut (action, key, ctrl, alt, shift)
		ensure
			has_key: menu_item.text.as_upper.ends_with ((key_strings [key]).as_upper)
			has_ctrl: ctrl implies menu_item.text.has_substring (key_strings [key_ctrl])
			has_alt: alt implies menu_item.text.has_substring (key_strings [key_alt])
			has_shift: shift implies menu_item.text.has_substring (key_strings [key_shift])
		end

	add_shortcut (action: PROCEDURE [ANY, TUPLE]; key: INTEGER; ctrl, alt, shift: BOOLEAN)
			-- Create a keyboard shortcut to execute `action'.
		require
			action_attached: action /= Void
			valid_key: valid_key_code (key)
		local
			accelerator: EV_ACCELERATOR
		do
			create accelerator.make_with_key_combination (create {EV_KEY}.make_with_code (key), ctrl, alt, shift)
			accelerator.actions.extend (action)
			accelerators.extend (accelerator)
		ensure
			accelerators_extended: accelerators.count = 1 + old accelerators.count
		end

	shortcut_text (key: INTEGER; ctrl, alt, shift: BOOLEAN): STRING
			-- Text describing a keyboard shortcut.
		require
			valid_key: valid_key_code (key)
		do
			Result := key_strings [key].as_string_8

			if Result.count = 1 then
				Result.to_upper
			end

			if alt then
				Result := key_strings [key_alt].as_string_8 + "+" + Result
			end

			if shift then
				Result := key_strings [key_shift].as_string_8 + "+" + Result
			end

			if ctrl then
				Result := key_strings [key_ctrl].as_string_8 + "+" + Result
			end
		ensure
			not_void: attached Result
			not_empty: not Result.is_empty
			has_key: Result.as_upper.ends_with ((key_strings [key]).as_string_8.as_upper)
			has_ctrl: ctrl implies Result.has_substring (key_strings [key_ctrl].as_string_8)
			has_alt: alt implies Result.has_substring (key_strings [key_alt].as_string_8)
			has_shift: shift implies Result.has_substring (key_strings [key_shift].as_string_8)
		end

end


