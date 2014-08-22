note
	component:   "Eiffel Object Modelling Framework"
	description: "EV_TREE form of EVX_TREE_CONTROL_I"
	keywords:    "UI"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class EVX_TREE_CONTROL_TREE

inherit
	EVX_TREE_CONTROL_I

	EVX_UTILITIES
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make (a_tree: EV_TREE)
		do
			ev_tree := a_tree
			ev_root_widget := ev_tree
		end

feature -- Access

	ev_tree: EV_TREE

	ev_tree_do_all (an_action: attached PROCEDURE [ANY, TUPLE [EV_TREE_NODE]])
			-- do `an_action' to all nodes in the structure
		do
			from ev_tree.start until ev_tree.off loop
				ev_tree_do_all_nodes (ev_tree.item, an_action)
				ev_tree.forth
			end
		end

feature -- Events

	collapse_one_level
		do
			collapse_one_level_filtered (Void)
		end

	expand_one_level
		do
			expand_one_level_filtered (Void)
		end

	expand_all
		do
			expand_all_filtered (Void)
		end

	collapse_one_level_filtered (test: detachable FUNCTION [ANY, TUPLE [EV_TREE_NODE], BOOLEAN])
		do
			create ev_tree_node_list.make (0)
			ev_tree.recursive_do_all (agent ev_tree_item_collapse_one_level)
			across ev_tree_node_list as node_csr loop
				if not attached test as att_test or else att_test.item ([node_csr.item]) then
					node_csr.item.collapse
				end
			end
		end

	expand_one_level_filtered (test: detachable FUNCTION [ANY, TUPLE [EV_TREE_NODE], BOOLEAN])
		do
			do_with_wait_cursor (ev_tree, agent do_expand_one_level (test))
		end

	expand_all_filtered (test: detachable FUNCTION [ANY, TUPLE [EV_TREE_NODE], BOOLEAN])
		do
			do_with_wait_cursor (ev_tree,
				agent ev_tree.recursive_do_all (
					agent (an_ev_tree_node: EV_TREE_NODE; a_test: detachable FUNCTION [ANY, TUPLE [EV_TREE_NODE], BOOLEAN])
						do
							if an_ev_tree_node.is_expandable and (not attached a_test as att_test or else att_test.item ([an_ev_tree_node])) then
								an_ev_tree_node.expand
							end
						end (?, test)
				)
			)
		end

	collapse_all
		do
			ev_tree.recursive_do_all (
				agent (an_ev_tree_node: attached EV_TREE_NODE)
					do
						if an_ev_tree_node.is_expandable then
							an_ev_tree_node.collapse
						end
					end
			)
		end

	collapse_except (test: FUNCTION [ANY, TUPLE [EV_GRID_ROW], BOOLEAN])
		do
			-- TODO
		end

feature {NONE} -- Implementation

	ev_tree_item_expand_one_level (an_ev_tree_node: EV_TREE_NODE)
			-- starting from `an_ev_tree_node', expand out child nodes that are not currently expanded;
			-- if `an_ev_tree_node' is not currently expanded, add it to `ev_tree_node_list' for later expansion
		do
			if an_ev_tree_node.is_expanded then
				from an_ev_tree_node.start until an_ev_tree_node.off loop
					if an_ev_tree_node.item.is_expandable and then not an_ev_tree_node.item.is_expanded then
						ev_tree_node_list.extend (an_ev_tree_node.item)
					end
					an_ev_tree_node.forth
				end
			elseif an_ev_tree_node = ev_tree.item then
				ev_tree_node_list.extend (an_ev_tree_node)
			end
		end

	ev_tree_item_collapse_one_level (an_ev_tree_node: EV_TREE_NODE)
			-- if `an_ev_tree_node' is terminal (i.e. not expanded) then add it to `ev_tree_node_list' for
			-- subsequent collapsing
		do
			if an_ev_tree_node.is_expanded then
				from
					an_ev_tree_node.start
				until
					an_ev_tree_node.off or else (an_ev_tree_node.item.is_expandable and then an_ev_tree_node.item.is_expanded)
				loop
					an_ev_tree_node.forth
				end

				if an_ev_tree_node.off then -- didn't find any expanded children
					ev_tree_node_list.extend (an_ev_tree_node)
				end
			end
		end

	ev_tree_node_list: ARRAYED_LIST [EV_TREE_NODE]
		attribute
			create Result.make (0)
		end

	ev_tree_do_all_nodes (a_target: EV_TREE_NODE; an_action: PROCEDURE[ANY, TUPLE [EV_TREE_NODE]])
		do
			from a_target.start until a_target.off loop
				ev_tree_do_all_nodes (a_target.item, an_action)
				a_target.forth
			end
			an_action.call ([a_target])
		end

	do_expand_one_level (test: detachable FUNCTION [ANY, TUPLE [EV_TREE_NODE], BOOLEAN])
		do
			create ev_tree_node_list.make (0)
			ev_tree.recursive_do_all (agent ev_tree_item_expand_one_level)
			from ev_tree_node_list.start until ev_tree_node_list.off loop
				if not attached test as att_test or else att_test.item ([ev_tree_node_list.item]) then
					ev_tree_node_list.item.expand
				end
				ev_tree_node_list.forth
			end
		end

	resize_columns_to_content (grid_expansion_factor: REAL)
		do
		end

end



