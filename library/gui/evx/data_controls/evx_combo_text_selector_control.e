note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Visual control for a single text field data source whose values from from a fixed set, chosen
				 from and displayed to an EV_COMBO_BOX.
				 Visual control structure is a combo-box with a title.
				 
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

class EVX_COMBO_TEXT_SELECTOR_CONTROL

inherit
	EVX_TEXT_CONTROL
		rename
			make as make_text_control, make_linked as make_linked_text_control, make_readonly as make_readonly_text_control
		redefine
			data_source_setter_agent, populate
		end

	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

create
	make, make_linked, make_readonly

feature -- Initialisation

	make (a_title: STRING; a_tooltip: STRING; a_data_source: like data_source_agent;
			a_value_set: like value_set; min_height, min_width: INTEGER)
		require
			a_value_set.object_comparison
		do
			value_set := a_value_set
			make_text_control (a_title, a_data_source, min_height, min_width, True)
			if attached a_tooltip then
				ev_data_control.set_tooltip (a_tooltip)
			end
			ev_data_control.select_actions.extend (agent propagate_select_action)
		ensure
			not is_readonly
		end

	make_readonly (a_title: STRING; a_tooltip: STRING; a_data_source: like data_source_agent;
			a_value_set: like value_set; min_height, min_width: INTEGER)
		require
			a_value_set.object_comparison
		do
			value_set := a_value_set
			make_readonly_text_control (a_title, a_data_source, min_height, min_width, True)
			if attached a_tooltip then
				ev_data_control.set_tooltip (a_tooltip)
			end
		ensure
			is_readonly
		end

	make_linked (a_title: STRING; a_tooltip: STRING; a_data_source: like data_source_agent;
			a_value_set: like value_set;
			a_data_source_setter_agent: like data_source_setter_agent;
			a_data_source_remove_agent: like data_source_remove_agent;
			an_undo_redo_chain: like undo_redo_chain;
			min_height, min_width: INTEGER)
		require
			a_value_set.object_comparison
		do
			value_set := a_value_set
			make_linked_text_control (a_title,
				a_data_source, a_data_source_setter_agent, a_data_source_remove_agent,
				an_undo_redo_chain, min_height, min_width, True)
			if attached a_tooltip then
				ev_data_control.set_tooltip (a_tooltip)
			end
			ev_data_control.select_actions.extend (agent propagate_select_action)
			ev_data_control.select_actions.extend (agent do if is_editable then process_edit end end)
		ensure
			not is_readonly
		end

feature -- Access

	value_set: LIST [STRING]
				-- list of values from which to choose the value of the source data field

	ev_data_control: EV_COMBO_BOX

	data_source_setter_agent: detachable PROCEDURE [ANY, TUPLE [STRING]]
			-- agent for creating & setting the data source

feature -- Commands

	populate
			-- populate content
		local
			li2: EV_LIST_ITEM
			not_sensitive: BOOLEAN
		do
			ev_data_control.select_actions.block
			if not ev_data_control.is_sensitive then
				ev_data_control.enable_sensitive
				not_sensitive := True
			end
			
			-- populate with all possible values
			ev_data_control.wipe_out
			value_set.do_all (
				agent (str: STRING)
					do
						ev_data_control.extend (create {EV_LIST_ITEM}.make_with_text (utf8_to_utf32 (str)))
					end
			)

			-- select value matching that in data source, if any match exists, otherwise select
			-- the 'unknown' value
			if attached data_source_agent.item ([]) as cur_val and then value_set.has (cur_val) then
				ev_data_control.do_all (
					agent (li: EV_LIST_ITEM; a_val: STRING)
						do
							if utf32_to_utf8 (li.text).is_equal (a_val) then li.enable_select end
						end (?, cur_val)
				)
			else
				create li2.make_with_text (utf8_to_utf32 (get_text (ec_unknown_value)))
				ev_data_control.extend (li2)
				li2.enable_select
			end
			ev_data_control.select_actions.resume
			if not_sensitive then
				ev_data_control.disable_sensitive
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



