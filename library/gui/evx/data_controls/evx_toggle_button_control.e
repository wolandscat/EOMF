note
	component:   "Eiffel Object Modelling Framework"
	description: "Toggle button with two titles that change when toggled"
	keywords:    "UI"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class EVX_TOGGLE_BUTTON_CONTROL

inherit
	EVX_DATA_CONTROL
		redefine
			data_source_agent, data_source_setter_agent
		end

create
	make

feature -- Initialisation

	make (a_state_1_label, a_state_2_label: STRING;
			a_tooltip_text: detachable STRING;
			a_data_source_agent: like data_source_agent;
			a_data_source_setter_agent: like data_source_setter_agent;
			min_height, min_width: INTEGER)
		do
			data_source_agent := a_data_source_agent
			data_source_setter_agent := a_data_source_setter_agent

			create state_1_settings
			create state_2_settings

			set_labels (a_state_1_label, a_state_2_label)

			create ev_data_control
			ev_data_control.set_minimum_height (default_min_height)
			if attached a_tooltip_text then
				ev_data_control.set_tooltip (utf8_to_utf32 (a_tooltip_text))
			end

			ev_data_control.select_actions.extend (agent toggle_state)
		ensure
			not is_readonly
		end

feature -- Access

	ev_data_control: EV_BUTTON

	data_source_agent: FUNCTION [ANY, TUPLE, BOOLEAN]

	data_source_setter_agent: detachable PROCEDURE [ANY, TUPLE [BOOLEAN]]
			-- agent for creating & setting the data source

	state_1_settings, state_2_settings: TUPLE [label: STRING_32; pixmap: detachable EV_PIXMAP]

feature -- Commands

	clear
		do
		end

	populate
		do
			set_state (data_source_agent.item ([]))
		end

feature -- Modification

	set_pixmaps (a_state_1_pixmap, a_state_2_pixmap: EV_PIXMAP)
			-- as for the labels, reverse the pixmaps because a button shows
			-- the other state, not the current one
		do
			state_2_settings.pixmap := a_state_1_pixmap
			state_1_settings.pixmap := a_state_2_pixmap
		end

	set_labels (a_state_1_label, a_state_2_label: STRING)
			-- as for the labels, reverse the pixmaps because a button shows
			-- the other state, not the current one
		do
			state_2_settings.label := utf8_to_utf32 (a_state_1_label)
			state_1_settings.label := utf8_to_utf32 (a_state_2_label)

		end

feature {NONE} -- Implementation

	create_ev_data_control
		do
			create ev_data_control
		end

	toggle_state
			-- change state
		do
			if attached data_source_setter_agent then
				data_source_setter_agent.call ([not data_source_agent.item ([])])
			end
		end

	set_state (in_state_1: BOOLEAN)
			-- set state
		local
			settings: like state_1_settings
		do
			if in_state_1 then
				settings := state_1_settings
			else
				settings := state_2_settings
			end

			ev_data_control.set_text (settings.label)
			if attached settings.pixmap as att_pixmap then
				ev_data_control.set_pixmap (att_pixmap)
			end
		end

end

