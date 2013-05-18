note
	component:   "Eiffel Object Modelling Framework"
	description: "Interface to common tree functionality of EV_TREE and EV_GRID"
	keywords:    "UI"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class EVX_TREE_CONTROL_I

feature -- Access

	ev_root_widget: EV_WIDGET
			-- provide access to tree widget

feature -- Commands

	ev_tree_do_all (a_node_action: PROCEDURE [ANY, TUPLE [ANY]])
			-- do enter_action and exit_action to all nodes in the structure
		deferred
		end

	collapse_one_level (test: detachable FUNCTION [ANY, TUPLE [EV_SELECTABLE], BOOLEAN])
		deferred
		end

	expand_one_level (test: detachable FUNCTION [ANY, TUPLE [EV_SELECTABLE], BOOLEAN])
		deferred
		end

	expand_all (test: detachable FUNCTION [ANY, TUPLE [EV_SELECTABLE], BOOLEAN])
		deferred
		end

	collapse_all
		deferred
		end

	collapse_except (test: FUNCTION [ANY, TUPLE [EV_GRID_ROW], BOOLEAN])
		deferred
		end

	resize_columns_to_content (grid_expansion_factor: REAL)
		deferred
		end

end



