note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 A control for controlling EV_TREE and EV_GRID in tree mode. It provides 4
				 buttons with the functions:
				 	- collapse all
					- collapse 1 level
					- expand 1 level
					- expand all
				 These appear as follows:

				 	+---++---++---++---+
					| 0 || - || + || * |
				 	+---++---++---++---+

				 ]"
	keywords:    "UI"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class EVX_TREEVIEW_CONTROL

inherit
	STRING_UTILITIES
		export
			{NONE} all
		end

	EVX_UTILITIES
		export
			{NONE} all
		end

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

	make (a_tree_ctl: EVX_TREE_CONTROL_I; a_collapse_expand_test_agt: like collapse_expand_test_agt;
			a_tree_expand_all_icon, a_tree_expand_icon, a_tree_collapse_icon, a_tree_collapse_all_icon: EV_PIXMAP;
			a_resize_agt: like resize_agt)
		local
			ev_hbox: EV_HORIZONTAL_BOX
		do
			gui_tree_control := a_tree_ctl

			create ev_root_container
			ev_root_container.set_minimum_width (115)

			-- add title
			ev_root_container.set_text (utf8_to_utf32 (get_text ({EVX_MESSAGES_IDS}.ec_view_label_text)))

			create ev_hbox
			ev_root_container.extend (ev_hbox)

			-- collapse all button
			create ev_collapse_button
			ev_collapse_button.set_pixmap (a_tree_collapse_all_icon)
			ev_collapse_button.set_tooltip (get_text ({EVX_MESSAGES_IDS}.ec_collapse_complete_tooltip))
			ev_collapse_button.select_actions.extend (agent on_collapse_all)
			ev_hbox.extend (ev_collapse_button)

			-- collapse one level button
			create ev_collapse_one_button
			ev_collapse_one_button.set_pixmap (a_tree_collapse_icon)
			ev_collapse_one_button.set_tooltip (get_text ({EVX_MESSAGES_IDS}.ec_collapse_one_level_tooltip))
			ev_collapse_one_button.select_actions.extend (agent on_collapse_one_level)
			ev_hbox.extend (ev_collapse_one_button)

			-- expand one level button
			create ev_expand_one_button
			ev_expand_one_button.set_pixmap (a_tree_expand_icon)
			ev_expand_one_button.set_tooltip (get_text ({EVX_MESSAGES_IDS}.ec_expand_one_level_tooltip))
			ev_expand_one_button.select_actions.extend (agent on_expand_one_level)
			ev_hbox.extend (ev_expand_one_button)

			-- expand all button
			create ev_expand_button
			ev_expand_button.set_pixmap (a_tree_expand_all_icon)
			ev_expand_button.set_tooltip (get_text ({EVX_MESSAGES_IDS}.ec_expand_complete_tooltip))
			ev_expand_button.select_actions.extend (agent on_expand_all)
			ev_hbox.extend (ev_expand_button)

			collapse_expand_test_agt := a_collapse_expand_test_agt
			if attached a_resize_agt as att_agt then
				resize_agt := att_agt
			else
				resize_agt := agent gui_tree_control.resize_columns_to_content (Default_grid_expansion_factor)
			end
		end

feature -- Access

	ev_root_container: EV_FRAME

	gui_tree_control: EVX_TREE_CONTROL_I

	ev_expand_button, ev_expand_one_button, ev_collapse_one_button, ev_collapse_button: EV_BUTTON

feature -- Commands

	ev_tree_do_all (a_node_action: attached PROCEDURE [ANY, TUPLE [ANY]])
			-- do enter_action and exit_action to all nodes in the structure
		do
			gui_tree_control.ev_tree_do_all (a_node_action)
		end

feature -- Events

	on_collapse_one_level
		do
			gui_tree_control.collapse_one_level_filtered (collapse_expand_test_agt)
			if attached resize_agt as att_agt then
				att_agt.call ([])
			end
		end

	on_expand_one_level
		do
			do_with_wait_cursor (gui_tree_control.ev_root_widget,
				agent
					do
						gui_tree_control.expand_one_level_filtered (collapse_expand_test_agt)
						if attached resize_agt as att_agt then
							att_agt.call ([])
						end
					end
			)
		end

	on_expand_all
		do
			do_with_wait_cursor (gui_tree_control.ev_root_widget,
				agent
					do
						gui_tree_control.expand_all_filtered (collapse_expand_test_agt)
						if attached resize_agt as att_agt then
							att_agt.call ([])
						end
					end
			)
		end

	on_collapse_all
		do
			gui_tree_control.collapse_all
			if attached resize_agt as att_agt then
				att_agt.call ([])
			end
		end

	on_collapse_except (test: FUNCTION [ANY, TUPLE [EV_GRID_ROW], BOOLEAN])
		do
			gui_tree_control.collapse_except (test)
		end

feature {NONE} -- Implementation

	collapse_expand_test_agt: FUNCTION [ANY, TUPLE [EV_SELECTABLE], BOOLEAN]

	resize_agt: detachable PROCEDURE [ANY, TUPLE]

end



