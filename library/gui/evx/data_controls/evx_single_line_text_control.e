note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Visual control for a data source that outputs to single_line EV_TEXT_FIELD control.
				 Visual control structure is a text edit field with a title, in-place editing.
				 
					        +----------------------------+
				    Title: 	|                            |
						    +----------------------------+

				 ]"
	keywords:    "UI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class EVX_SINGLE_LINE_TEXT_CONTROL

inherit
	EVX_TEXT_CONTROL
		rename
			make as make_text_data_control, make_linked as make_linked_text_data_control, make_readonly as make_readonly_text_control
		redefine
			ev_data_control
		end

	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

create
	make, make_readonly, make_linked

feature -- Initialisation

	make (a_title: STRING; a_data_source_agent: like data_source_agent;
			min_width: INTEGER; arrange_horizontally: BOOLEAN)
		do
			make_text_data_control (a_title, a_data_source_agent, Text_min_height, min_width, arrange_horizontally)
		end

	make_readonly (a_title: detachable STRING; a_data_source_agent: like data_source_agent;
			min_width: INTEGER; arrange_horizontally: BOOLEAN)
			-- make so that no user interaction with visual control is possible
		do
			make_readonly_text_control (a_title, a_data_source_agent, Text_min_height, min_width, arrange_horizontally)
		end

	make_linked (a_title: STRING; a_data_source_agent: like data_source_agent;
			a_data_source_setter_agent: like data_source_setter_agent;
			a_data_source_remove_agent: like data_source_remove_agent;
			an_undo_redo_chain: like undo_redo_chain;
			min_width: INTEGER; arrange_horizontally: BOOLEAN)
		do
			make_linked_text_data_control (a_title,
				a_data_source_agent, a_data_source_setter_agent, a_data_source_remove_agent,
				an_undo_redo_chain, Text_min_height, min_width, arrange_horizontally)
		end

feature -- Access

	ev_data_control: EV_TEXT_FIELD

feature {NONE} -- Implementation

	create_ev_data_control
		do
			create ev_data_control
		end

end



