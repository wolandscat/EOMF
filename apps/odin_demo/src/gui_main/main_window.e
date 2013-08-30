note
	description: "Objects that represent an EV_TITLED_WINDOW.%
		%The original version of this class was generated by EiffelBuild."
	generator: "EiffelBuild"
	date: "$Date$"
	revision: "$Revision$"

class
	MAIN_WINDOW

inherit
	MAIN_WINDOW_IMP
		redefine
			show
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
			initialise_overall_appearance

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

	user_initialization
			-- Called by `initialize'.
			-- Any custom user initialization that
			-- could not be performed in `initialize',
			-- (due to regeneration of implementation class)
			-- can be added here.
		do
			initialise_accelerators
			test_objects.initialise (agent append_status_area (?), agent update_source_area (?))
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

	odin_engine: ODIN_ENGINE
		once
			create Result.make
		end

	on_copy
			-- Called by `select_actions' of `edit_menu_copy'.
		do
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
		end

	initialise_overall_appearance
			-- Initialise the main properties of the window (size, appearance, title, etc.).
		do
			set_position (app_x_position, app_y_position)

			if app_width > 0 and app_height > 0 then
				set_size (app_width, app_height)
			else
				set_size (app_initial_width, app_initial_height)
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
			add_menu_shortcut_for_action (edit_menu_copy, agent text_widget_handler.call_unless_text_focused (agent on_copy), key_c, True, False, False)
			add_menu_shortcut (edit_menu_select_all, key_a, True, False, False)
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

end
