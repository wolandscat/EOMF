note
	component:   "Eiffel Object Modelling Framework"
	description: "Initialisation of the main window's accelerator keys."
	keywords:    "UI, accelerators"
	author:      "Peter Gummer <peter.gummer@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class EVX_ACCELERATORS

inherit
	EV_KEY_CONSTANTS
		export
			{NONE} all;
			{ANY} valid_key_code, deep_twin, is_deep_equal, standard_is_equal
		end

create
	make

feature -- Initialisation

	make (app_accelerators: EV_ACCELERATOR_LIST)
		do
			accelerators := app_accelerators
		end

feature -- Modification

	add_shortcut (action: PROCEDURE [ANY, TUPLE]; key: INTEGER; ctrl, alt, shift: BOOLEAN)
			-- Create a keyboard shortcut to execute `action'.
		require
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
			not_empty: not Result.is_empty
			has_key: Result.as_upper.ends_with ((key_strings [key]).as_string_8.as_upper)
			has_ctrl: ctrl implies Result.has_substring (key_strings [key_ctrl].as_string_8)
			has_alt: alt implies Result.has_substring (key_strings [key_alt].as_string_8)
			has_shift: shift implies Result.has_substring (key_strings [key_shift].as_string_8)
		end

feature {NONE} -- Implementation

	accelerators: EV_ACCELERATOR_LIST
			-- Key combination shortcuts associated with the main window.

end


