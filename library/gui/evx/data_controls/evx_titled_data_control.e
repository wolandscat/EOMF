note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 General model of a data control, consisting of a data source, visual control(s), an outer container,
				 routines for populate, clear, and agents for editing.
				 ]"
	keywords:    "UI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class EVX_TITLED_DATA_CONTROL

inherit
	EVX_DATA_CONTROL
		redefine
			hide, show
		end

feature -- Initialisation

	make (a_title: detachable STRING; a_data_source_agent: like data_source_agent;
			min_height, min_width: INTEGER; arrange_horizontally: BOOLEAN)
			-- create the control with title if specified, horizontally or vertically arranged as
			-- specified. The main control (i.e. not the title) will expand automatically if
			-- `min_width' = 0
		local
			mh, mw: INTEGER
		do
			data_source_agent := a_data_source_agent

			mh := min_height.max (default_min_height) + Default_border_width
			mw := min_width.max (default_min_width) + Default_border_width

			-- create a container to hold title and data control
			if arrange_horizontally then
				create {EV_HORIZONTAL_BOX} ev_root_container
			else
				create {EV_VERTICAL_BOX} ev_root_container
			end

			-- if there is a title, set appropriate padding & border
			if attached a_title as t and then not t.is_empty then
				ev_root_container.set_padding (Default_padding_width)
				ev_root_container.set_border_width (Default_border_width)

				-- create the title and add to ev_container
				create ev_title_label
				ev_title_label.set_text (t)
				ev_root_container.extend (ev_title_label)
				ev_root_container.disable_item_expand (ev_title_label)

				-- add some more spacing due to title
				if arrange_horizontally then
					mw := mw + Default_border_width
				else
					mh := mh + Default_border_width
				end
			end

			-- create the data control and add to ev_container
			create_ev_data_control
			ev_root_container.extend (ev_data_control)
			if min_width > 0 then
				ev_data_control.set_minimum_width (mw)
			end
			if min_height > 0 then
				ev_data_control.set_minimum_height (mh)
			end

			-- control expanding characteristics of main control
			if (arrange_horizontally and min_width > 0) or else (not arrange_horizontally and min_height > 0) then
				ev_root_container.extend (create {EV_CELL})
				ev_root_container.disable_item_expand (ev_data_control)
			end
	--		ev_root_container.set_data (Current)
		ensure
			not is_readonly
		end

	make_readonly (a_title: detachable STRING; a_data_source_agent: like data_source_agent;
			min_height, min_width: INTEGER; arrange_horizontally: BOOLEAN)
			-- make so that no user interaction with visual control is possible
		do
			make (a_title, a_data_source_agent, min_height, min_width, arrange_horizontally)
			is_readonly := True
			do_disable_editable
		ensure
			is_readonly
		end

	make_linked (a_title: STRING; a_data_source_agent: like data_source_agent;
				a_data_source_create_agent: like data_source_setter_agent;
				a_data_source_remove_agent: like data_source_remove_agent;
				an_undo_redo_chain: like undo_redo_chain;
				min_height, min_width: INTEGER; arrange_horizontally: BOOLEAN)
			-- make with active editing agents so that changes made in the visual control
			-- affect the data source
		do
			make (a_title, a_data_source_agent, min_height, min_width, arrange_horizontally)
			data_source_setter_agent := a_data_source_create_agent
			data_source_remove_agent := a_data_source_remove_agent
			undo_redo_chain := an_undo_redo_chain
		ensure
			not is_readonly
		end

feature -- Access

	ev_root_container: EV_BOX

	ev_title_label: detachable EV_LABEL
		note
			option: stable
		attribute
		end

feature -- Commands

	hide
		do
			ev_root_container.hide
		end

	show
		do
			ev_root_container.show
		end

end


