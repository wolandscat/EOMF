note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Visual control for a BOOLEAN data source that outputs to an EV_CHECK_BUTTON.
				 Visual control structure is a check-box with a title.
				 
					+-+
					| | Title
					+-+

				 ]"
	keywords:    "UI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class EVX_CHECK_BOX_CONTROL

inherit
	EVX_DATA_CONTROL
		redefine
			data_source_agent, data_source_setter_agent
		end

create
	make, make_linked, make_readonly

feature -- Initialisation

	make (a_title: STRING; a_tooltip: detachable STRING; a_data_source_agent: like data_source_agent)
			-- make with a data_source agent, typically for a Dialog box
			-- caller should use `is_selected' to inspect state when OK is pressed
		do
			data_source_agent := a_data_source_agent

			-- create the data control and add to ev_container
			create_ev_data_control
			ev_data_control.set_text (a_title)
			if attached a_tooltip then
				ev_data_control.set_tooltip (a_tooltip)
			end
		ensure
			not is_readonly
		end

	make_readonly (a_title: STRING; a_tooltip: detachable STRING; a_data_source_agent: like data_source_agent)
			-- make readonly with a data_source agent, typically for a Dialog box
		do
			make (a_title, a_tooltip, a_data_source_agent)
			is_readonly := True
		ensure
			is_readonly
		end

	make_linked (a_title: STRING; a_tooltip: detachable STRING;
				a_data_source_agent: like data_source_agent;
				a_data_source_setter_agent: attached like data_source_setter_agent)
			-- make for a normal form with active semantics
		do
			make (a_title, a_tooltip, a_data_source_agent)
			data_source_setter_agent := a_data_source_setter_agent
			ev_data_control.select_actions.extend (agent on_select)
		ensure
			not is_readonly
		end

feature -- Access

	ev_data_control: EV_CHECK_BUTTON

	data_source_agent: FUNCTION [ANY, TUPLE, BOOLEAN]

	data_source_setter_agent: detachable PROCEDURE [ANY, TUPLE [BOOLEAN]]
			-- agent for setting the data source

feature -- Status Report

	is_selected: BOOLEAN
			-- report state of checkbox
		do
			Result := ev_data_control.is_selected
		end

feature -- Commands

	clear
			-- Wipe out content
		do
			ev_data_control.select_actions.block
			ev_data_control.disable_select
			ev_data_control.select_actions.resume
		end

	populate
		do
			ev_data_control.select_actions.block
			if data_source_agent.item ([]) then
				ev_data_control.enable_select
			else
				ev_data_control.disable_select
			end
			ev_data_control.select_actions.resume
		end

feature {NONE} -- Implementation

	create_ev_data_control
		do
			create ev_data_control
		end

	on_select
		do
			data_source_setter_agent.call ([ev_data_control.is_selected])
		end

end



