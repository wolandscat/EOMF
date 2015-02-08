note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 OK and Cancel buttons, with left hand padding cell, to add to any dialog box.
				 ]"
	keywords:    "UI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class EVX_OK_CANCEL_CONTROLS

inherit
	EVX_DEFINITIONS
		export
			{NONE} all;
			{ANY} deep_twin, is_deep_equal, standard_is_equal
		end

	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make (ok_agent, cancel_agent: PROCEDURE [ANY, TUPLE])
		do
			create ev_root_container
			ev_root_container.set_padding_width (default_padding_width)
			ev_root_container.set_border_width (default_border_width)

			-- Padding Cell
			create ev_cell
			ev_root_container.extend (ev_cell)
			ev_cell.set_minimum_width (100)

			-- OK button
			create ok_button
			ok_button.set_text (get_text (ec_ok_button_text))
			ok_button.set_minimum_width (100)
			ok_button.set_minimum_height (26)
			ev_root_container.extend (ok_button)
			ev_root_container.disable_item_expand (ok_button)
			ok_button.select_actions.extend (ok_agent)

			-- Cancel button
			create cancel_button
			cancel_button.set_text (get_text (ec_cancel_button_text))
			cancel_button.set_minimum_width (100)
			cancel_button.set_minimum_height (26)
			ev_root_container.extend (cancel_button)
			ev_root_container.disable_item_expand (cancel_button)
			cancel_button.select_actions.extend (cancel_agent)
		end

feature -- Access

	ev_root_container: EV_HORIZONTAL_BOX

	ok_button, cancel_button: EV_BUTTON

feature -- Status Report

	has_button (a_title: STRING): BOOLEAN
			-- is there any button with title `a_title'?
		do
			Result := attached added_buttons as att_added_buttons and then
				(att_added_buttons.has(a_title) or a_title.same_string (ok_button.text) or a_title.same_string (cancel_button.text))
		end

feature -- Modification

	add_button (a_title: STRING; an_agent: PROCEDURE [ANY, TUPLE])
			-- add another button, which will appear to the left of the OK/Cancel buttons
		require
			not has_button (a_title)
		local
			a_button: EV_BUTTON
			buttons_table: HASH_TABLE [EV_BUTTON, STRING]
		do
			if attached added_buttons as att_added_buttons then
				buttons_table := att_added_buttons
			else
				create buttons_table.make (0)
				added_buttons := buttons_table
			end
			create a_button
			a_button.set_text (a_title)
			a_button.select_actions.extend (an_agent)
			buttons_table.put (a_button, a_title)
			ev_root_container.start
			ev_root_container.put_right (a_button)
			ev_root_container.disable_item_expand (a_button)
		end

feature -- Command

	enable_sensitive
			-- enable user input
		do
			across ev_root_container as button_csr loop
				button_csr.item.enable_sensitive
			end
		end

	disable_sensitive
			-- disable user input
		do
			across ev_root_container as button_csr loop
				button_csr.item.disable_sensitive
			end
		end

feature {NONE} -- Implementation

	ev_cell: EV_CELL

	added_buttons: detachable HASH_TABLE [EV_BUTTON, STRING]

end



