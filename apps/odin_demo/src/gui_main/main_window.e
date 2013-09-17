note
	component:   "Eiffel Object Modelling Framework"
	description: "Main test app"
	keywords:    "test, application"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	MAIN_WINDOW

inherit
	EV_TITLED_WINDOW
		redefine
			show, create_interface_objects, initialize, is_in_default_state
		end

	EVX_DEFINITIONS
		undefine
			copy, default_create
		end

	EVX_WINDOW_ACCELERATORS
		undefine
			copy, default_create
		end

	EVX_UTILITIES
		undefine
			copy, default_create
		end

	SHARED_ODIN_TEST_OBJECTS
		undefine
			copy, default_create
		end

	SHARED_APP_ROOT
		undefine
			copy, default_create
		end

	SHARED_APP_UI_RESOURCES
		undefine
			copy, default_create
		end

feature -- Status setting

	show
			-- Do a few adjustments and load the repository before displaying the window.
		do
			initialise_session_ui_basic

			Precursor

			initialise_splitter (explorer_split_area, explorer_split_position)
			initialise_splitter (main_split_area, main_split_position)

			-- text widget handling
			if attached main_notebook.selected_item as nb_item then
				text_widget_handler.focus_first_widget (nb_item)
			end

			if app_maximised then
				maximize
			end

			if text_editor_command.is_empty then
				set_text_editor_command (default_text_editor_command)
			end

			populate_explorer
		end

feature {NONE} -- Initialization

	initialize
			-- Initialize `Current'.
		do
			Precursor {EV_TITLED_WINDOW}
			close_request_actions.extend (agent exit_app)

			-- attach root widgets
			set_menu_bar (l_ev_menu_bar_1)
			extend (explorer_split_area)

			set_minimum_width (500)
			set_minimum_height (350)
			set_maximum_width (2000)
			set_maximum_height (2000)

			set_title ("ODIN test bench")

			initialise_accelerators

			text_widget_handler.set_root (Current)

			test_objects.initialise (agent append_status_area, agent update_source_area, agent update_serialised_area)
		end

	create_interface_objects
			-- Create objects
		do
			-- ============ create menu =============
			create l_ev_menu_bar_1

			-- file menu
			create file_menu
			file_menu.set_text ("&File")
			l_ev_menu_bar_1.extend (file_menu)

			create file_menu_open
			file_menu_open.set_text ("&Open")
			file_menu.extend (file_menu_open)

			create file_menu_save_as
			file_menu_save_as.set_text ("&Save As")
			file_menu.extend (file_menu_save_as)
			file_menu_save_as.select_actions.extend (agent exit_app)

			create l_ev_menu_separator_1
			file_menu.extend (l_ev_menu_separator_1)

			create file_menu_exit
			file_menu_exit.set_text ("E&xit")
			file_menu.extend (file_menu_exit)
			file_menu_exit.select_actions.extend (agent exit_app)

			-- edit menu
			create edit_menu
			edit_menu.set_text ("&Edit")
			l_ev_menu_bar_1.extend (edit_menu)

			create edit_menu_copy
			edit_menu_copy.set_text ("&Copy")
			edit_menu.extend (edit_menu_copy)
			edit_menu_copy.select_actions.extend (agent text_widget_handler.on_copy)

			create edit_menu_select_all
			edit_menu_select_all.set_text ("Select &All")
			edit_menu.extend (edit_menu_select_all)
			edit_menu_select_all.select_actions.extend (agent text_widget_handler.on_select_all)

			-- ============ Left hand explorer / main work area split =============
			create explorer_split_area

			create explorer_area
			explorer_split_area.extend (explorer_area)
			explorer_split_area.enable_item_expand (explorer_area)

			create l_ev_label_1
			l_ev_label_1.set_text ("Tests")
			explorer_area.extend (l_ev_label_1)
			explorer_area.disable_item_expand (l_ev_label_1)

			-- Explorer
			create explorer_tree
			explorer_area.extend (explorer_tree)
			explorer_tree.set_minimum_width (150)
			explorer_tree.select_actions.extend (agent select_explorer_item)

			-- main work area
			create main_split_area
			explorer_split_area.extend (main_split_area)
			explorer_split_area.disable_item_expand (main_split_area)

			-- main notebook
			create main_notebook
			main_split_area.extend (main_notebook)
			main_split_area.enable_item_expand (main_notebook)

			-- source text area tab
			create source_text
			main_notebook.extend (source_text)
			main_notebook.set_item_text (source_text, "Source")

			-- XML serialised text area tab
			create xml_serialised_text
			main_notebook.extend (xml_serialised_text)
			main_notebook.set_item_text (xml_serialised_text, "XML serialised")
			serialised_panes.put (xml_serialised_text, "xml")

			-- JSON serialised text area tab
			create json_serialised_text
			main_notebook.extend (json_serialised_text)
			main_notebook.set_item_text (json_serialised_text, "JSON serialised")
			serialised_panes.put (json_serialised_text, "json")

			-- YAML serialised text area tab
			create yaml_serialised_text
			main_notebook.extend (yaml_serialised_text)
			main_notebook.set_item_text (yaml_serialised_text, "YAML serialised")
			serialised_panes.put (yaml_serialised_text, "yaml")

			-- ODIN tree tab
			create odin_tree
			main_notebook.extend (odin_tree)
			main_notebook.set_item_text (odin_tree, "Node map")

			-- status area
			create status_area
			status_area.disable_edit
			main_split_area.extend (status_area)
			main_split_area.disable_item_expand (status_area)

		end

	initialise_session_ui_basic
			-- initialise visual settings of window remembered from previous session
		do
			if app_x_position > Sane_screen_coord and app_y_position > Sane_screen_coord then
				set_position (app_x_position, app_y_position)
			else
				set_position (10, 10)
			end

			if app_width > 0 and app_height > 0 then
				set_size (app_width, app_height)
			else
				set_size (1024, 768)
			end

			if main_notebook_tab_pos > 1 then
				main_notebook.select_item (main_notebook [main_notebook_tab_pos])
			end
		end

	initialise_accelerators
			-- Initialise keyboard accelerators for various widgets.
		do
			add_menu_shortcut (file_menu_open, key_o, True, False, False)
			add_menu_shortcut (file_menu_save_as, key_s, True, False, False)
			add_menu_shortcut_for_action (edit_menu_copy, agent text_widget_handler.call_unless_text_focused (agent text_widget_handler.on_copy), key_c, True, False, False)
			add_menu_shortcut (edit_menu_select_all, key_a, True, False, False)
		end

feature -- Events

	select_explorer_item
			-- Called by `select_actions' of `explorer_tree'.
		do
			if attached {EV_TREE_NODE} explorer_tree.selected_item as node and then
				attached node.data as node_data and then
				attached {PROCEDURE [ANY, TUPLE[ANY]]} node.parent.data as test_proc
			then
				status_area.set_text ("")
				test_proc.call ([node_data])
			end
		end

	exit_app
			-- Terminate the application, saving the window location.
		do
			set_explorer_split_position (explorer_split_area.split_position)
			set_app_width (width)
			set_app_height (height)
			if not is_minimized then
				set_app_x_position (x_position)
				set_app_y_position (y_position)
			end
			set_app_maximised (is_maximized)
			set_main_notebook_tab_pos (main_notebook.selected_item_index)

			app_cfg.save
			ev_application.destroy
		end

feature {NONE} -- Implementation

	populate_explorer
   		local
			a_node, a_node1, a_node2: EV_TREE_ITEM
		do
			explorer_tree.wipe_out
			create a_node
 			a_node.set_text ("Test groups")
			explorer_tree.extend (a_node)

			across test_objects.test_table as test_groups_csr loop
				create a_node1
				if attached test_groups_csr.item.test_set as test_set and
					attached test_groups_csr.item.test_proc as test_proc and
					attached test_groups_csr.item.test_name as test_name
				then
			 		a_node1.set_data (test_proc)
			 		a_node1.set_text (test_name)
					a_node.extend (a_node1)
					across test_set as test_set_csr loop
						create a_node2
			 			a_node2.set_data (test_set_csr.item)
			 			a_node2.set_text (test_set_csr.key)
						a_node1.extend (a_node2)
					end
				end
			end

			explorer_tree.recursive_do_all (agent expand_ev_node)
		end

	expand_ev_node (a_node: EV_TREE_NODE)
		do
			if a_node.is_expandable then
				a_node.expand
			end
		end

	append_status_area (text: STRING)
			-- Append `text' to `parser_status_area'.
		do
			status_area.append_text (text)
			ev_application.process_graphical_events
		end

	update_source_area (text: STRING)
			-- Write `text' to `source_text'.
		do
			source_text.set_text (text)
		end

	update_serialised_area (text, format: STRING)
			-- Write `text' to `serialised_text'.
		do
			serialised_panes.item (format).set_text (text)
		end

feature {NONE} -- Standard Windows behaviour that EiffelVision ought to be managing automatically

	text_widget_handler: EVX_TEXT_WIDGET_HANDLER
			-- FIXME: this is a hack to get round lack of standard behaviour in Vision2 for
			-- focussed text widgets & cut & paste behaviours
		once
			-- FIXME: create with a dummy EV_CONTAINER initially; the argument should be 'Current', i.e the MAIN_WINDOW,
			-- but we can't supply it when this call gets made because 'make' has not finished yet, and 'Current' doesn't
			-- pass the void-safety test. So we give it a fake for now, and set the real root at the end of the make routine
			create Result.set_root (create {EV_CELL})
		end

	is_in_default_state: BOOLEAN
			-- Is `Current' in its default state?
		do
			Result := True
		end

	file_menu, edit_menu: EV_MENU
	file_menu_open, file_menu_save_as, file_menu_exit, edit_menu_copy,
	edit_menu_select_all: EV_MENU_ITEM
	explorer_split_area: EV_HORIZONTAL_SPLIT_AREA
	explorer_area: EV_VERTICAL_BOX
	explorer_tree, odin_tree: EV_TREE
	main_split_area: EV_VERTICAL_SPLIT_AREA
	main_notebook: EV_NOTEBOOK
	source_text, xml_serialised_text, json_serialised_text, yaml_serialised_text: EV_RICH_TEXT
	status_area: EV_TEXT

	l_ev_menu_bar_1: EV_MENU_BAR
	l_ev_menu_separator_1: EV_MENU_SEPARATOR
	l_ev_label_1: EV_LABEL

	serialised_panes: HASH_TABLE [EV_RICH_TEXT, STRING]
		once
			create Result.make (0)
		end

end
