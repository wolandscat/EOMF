note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Visual control for a LIST [STRING] data source that outputs to an EV_COMBO_BOX.
				 Visual control structure is a combo-box with a title.
				 Designed for selecting various values of a list or hash, not for editing. 
				 
								   Title
						+-------------------------+-+
						|                         |V|
						+-------------------------+-+
						
				 or
				 
							+-------------------------+-+
					Title	|                         |V|
							+-------------------------+-+

				 ]"
	keywords:    "UI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class EVX_COMBO_CONTROL

inherit
	EVX_TITLED_DATA_CONTROL
		rename
			make as make_data_control
		export
			{NONE} make_linked
		redefine
			data_source_agent
		end

create
	make

feature -- Initialisation

	make (a_title: STRING; a_tooltip: detachable STRING; a_data_source_agent: like data_source_agent;
			a_select_agent: detachable PROCEDURE [ANY, TUPLE];
			min_height, min_width: INTEGER; arrange_horizontally: BOOLEAN)
		do
			make_data_control (a_title, a_data_source_agent, min_height, min_width, arrange_horizontally)
			if attached a_tooltip then
				ev_data_control.set_tooltip (a_tooltip)
			end
			if attached a_select_agent as att_agt then
				ev_data_control.select_actions.extend (att_agt)
			end
			ev_data_control.select_actions.extend (agent propagate_select_action)
		end

feature -- Access

	ev_data_control: EV_COMBO_BOX

	selected_text: STRING
		do
			if ev_data_control.is_empty then
				populate
			end
			Result := ev_data_control.text
		end

	data_source_agent: FUNCTION [ANY, TUPLE, detachable LIST [STRING]]

feature -- Commands

	clear
			-- Wipe out content
		do
			ev_data_control.wipe_out
		end

	populate
			-- repopulate content
		do
			if ev_data_control.is_empty then
				ev_data_control.select_actions.block
				ev_data_control.wipe_out
				if attached {LIST [STRING]} data_source_agent.item ([]) as strs then
					strs.do_all (
						agent (str:STRING)
							do
								ev_data_control.extend (create {EV_LIST_ITEM}.make_with_text (utf8_to_utf32 (str)))
							end
					)
					-- Select the first one if nothing selected
--					if not across ev_data_control as combo_items_csr some combo_items_csr.item.is_selected end then
--						ev_data_control.first.enable_select
--					end
				end
				ev_data_control.select_actions.resume
			end
		end

feature {NONE} -- Implementation

	propagate_select_action
		do
			if attached linked_data_controls as att_ldc then
				att_ldc.do_all (agent (a_ctl: EVX_DATA_CONTROL) do a_ctl.populate end)
			end
		end

feature {NONE} -- Implementation

	create_ev_data_control
		do
			create ev_data_control
		end

end



