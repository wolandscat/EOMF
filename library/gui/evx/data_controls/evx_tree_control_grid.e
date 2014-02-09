note
	component:   "Eiffel Object Modelling Framework"
	description: "EV_GRID form of EVX_TREE_CONTROL_I"
	keywords:    "UI"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class EVX_TREE_CONTROL_GRID

inherit
	EVX_TREE_CONTROL_I

	EVX_DEFINITIONS
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make (a_gui_grid: EVX_GRID)
		do
			ev_grid := a_gui_grid.ev_grid
			ev_root_widget := ev_grid
		end

feature -- Access

	ev_grid: EV_GRID_KBD_MOUSE

feature -- Commands

	ev_tree_do_all (a_node_action: PROCEDURE [ANY, TUPLE [EV_GRID_ROW]])
			-- do `a_node_action' to all nodes in the structure
		do
			ev_grid.tree_do_all (a_node_action)
		end

	collapse_one_level (test: FUNCTION [ANY, TUPLE [EV_GRID_ROW], BOOLEAN])
		do
			ev_grid.row_collapse_actions.block
			ev_grid.collapse_one_level (test)
			ev_grid.row_collapse_actions.resume
		end

	expand_one_level (test: FUNCTION [ANY, TUPLE [EV_GRID_ROW], BOOLEAN])
		do
			ev_grid.row_expand_actions.block
			ev_grid.expand_one_level (test)
			ev_grid.row_expand_actions.resume
		end

	expand_all (test: FUNCTION [ANY, TUPLE [EV_GRID_ROW], BOOLEAN])
		do
			ev_grid.row_collapse_actions.block
			ev_grid.expand_all (test)
			ev_grid.row_collapse_actions.resume
		end

	collapse_all
		do
			ev_grid.row_collapse_actions.block
			ev_grid.collapse_all
			ev_grid.row_collapse_actions.resume
		end

	collapse_except (test: FUNCTION [ANY, TUPLE [EV_GRID_ROW], BOOLEAN])
		do
			ev_grid.row_collapse_actions.block
			ev_grid.collapse_except (test)
			ev_grid.row_collapse_actions.resume
			resize_columns_to_content (default_grid_expansion_factor)
		end

	resize_columns_to_content (grid_expansion_factor: REAL)
		do
			ev_grid.resize_columns_to_content (grid_expansion_factor)
		end

end



