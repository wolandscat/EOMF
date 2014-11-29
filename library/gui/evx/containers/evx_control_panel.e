note
	component:   "Eiffel Object Modelling Framework"
	description: "Collapsable control panel container for adding to right or left of main viewing area in a window."
	keywords:    "UI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class EVX_CONTROL_PANEL

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

	make
		local
			hbox: EV_HORIZONTAL_BOX
		do
			create ev_root_container
			ev_root_container.set_border_width (Default_border_width)
			ev_root_container.set_padding_width (Default_padding_width)

			-- add collapse / expand button group
			create hbox
			ev_root_container.extend (hbox)
			ev_root_container.disable_item_expand (hbox)

			-- add an expanding cell
			hbox.extend (create {EV_CELL})

			-- add button
			create collapse_expand_button
			collapse_expand_button.set_text (get_text (ec_collapse_button_text))
			collapse_expand_button.select_actions.extend (agent do_collapse_expand)
			hbox.extend (collapse_expand_button)
			hbox.disable_item_expand (collapse_expand_button)

			-- add main box
			create ev_main_vbox
			ev_root_container.extend (ev_main_vbox)
			ev_root_container.disable_item_expand (ev_main_vbox)
		end

feature -- Access

	ev_root_container: EV_VERTICAL_BOX

	last_added_frame: detachable EVX_FRAME_CONTROL
			-- most recently added frame via `create_new_frame' call
		do
			if not evx_frame_list.is_empty then
				Result := evx_frame_list.last
			end
		end

feature -- Commands

	collapse
		do
			ev_main_vbox.hide
			collapse_expand_button.set_text (get_text (ec_expand_button_text))
		end

	expand
		do
			ev_main_vbox.show
			collapse_expand_button.set_text (get_text (ec_collapse_button_text))
		end

feature -- Modification

	add_frame_control (evx_frame: EVX_FRAME_CONTROL; can_expand: BOOLEAN)
			-- extend current container with frame inside `a_frame_ctl'
		do
			add_frame (evx_frame.ev_root_container, can_expand)
			evx_frame_list.extend (evx_frame)
		end

	add_frame (a_frame: EV_FRAME; can_expand: BOOLEAN)
			-- extend current container with `a_frame'
		do
			ev_main_vbox.extend (a_frame)
			if not can_expand then
				ev_main_vbox.disable_item_expand (a_frame)
			end
		end

	create_new_frame (a_title: STRING; can_expand: BOOLEAN)
			-- extend current container with a new EVX_FRAME_CONTROL
		local
			evx_frame: EVX_FRAME_CONTROL
		do
			create evx_frame.make (a_title, False)

			ev_main_vbox.extend (evx_frame.ev_root_container)
			if not can_expand then
				ev_main_vbox.disable_item_expand (evx_frame.ev_root_container)
			end
			evx_frame_list.extend (evx_frame)
		end

feature {NONE} -- Implementation

	ev_main_vbox: EV_VERTICAL_BOX

	collapse_expand_button: EV_TOGGLE_BUTTON

	do_collapse_expand
			-- collapse control except button
		do
			if collapse_expand_button.is_selected then
				ev_main_vbox.hide
				collapse_expand_button.set_text (get_text (ec_expand_button_text))
			else
				ev_main_vbox.show
				collapse_expand_button.set_text (get_text (ec_collapse_button_text))
			end
		end

	evx_frame_list: ARRAYED_LIST [EVX_FRAME_CONTROL]
		attribute
			create Result.make (0)
		end

end
