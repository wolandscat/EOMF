note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 EV_FRAME-based control, containing a vbox or hbox, and with some style setting.
				 ]"
	keywords:    "UI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class EVX_FRAME_CONTROL

inherit
	EVX_DEFINITIONS
		export
			{NONE} all;
			{ANY} standard_is_equal, is_deep_equal, deep_copy, deep_twin
		end

create
	make

feature -- Initialisation

	make (a_title: STRING; min_height, min_width: INTEGER; horizontal_flag: BOOLEAN)
		do
			create ev_root_container
			ev_root_container.set_text (a_title)
			ev_root_container.set_style (1)

			if horizontal_flag then
				create {EV_HORIZONTAL_BOX} ev_root_box
			else
				create {EV_VERTICAL_BOX} ev_root_box
			end
			ev_root_box.set_border_width (Default_border_width)
			ev_root_box.set_padding_width (Default_padding_width)
			ev_root_container.extend (ev_root_box)
			ev_current_box := ev_root_box
		end

feature -- Access

	ev_root_container: EV_FRAME

feature -- Modification

	extend (a_widget: EV_WIDGET; can_expand: BOOLEAN)
			-- extend current container with `a_widget'
		do
			ev_current_box.extend (a_widget)
			if not can_expand then
				ev_current_box.disable_item_expand (a_widget)
			end
		end

	add_row (can_expand: BOOLEAN)
			-- add an HBOX container; subsequent calls to `extend' will add to this HBOX
		do
			create {EV_HORIZONTAL_BOX} ev_current_box
			ev_root_box.extend (ev_current_box)
			if not can_expand then
				ev_root_box.disable_item_expand (ev_current_box)
			end
		end

feature {NONE} -- Implementation

	ev_root_box: EV_BOX

	ev_current_box: EV_BOX
			-- ref to box currently being added to

end



