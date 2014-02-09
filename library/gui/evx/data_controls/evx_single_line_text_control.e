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
		redefine
			ev_data_control
		end

	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

create
	make, make_readonly, make_linked

feature -- Access

	ev_data_control: EV_TEXT_FIELD

feature {NONE} -- Implementation

	create_ev_data_control
		do
			create ev_data_control
		end

end



