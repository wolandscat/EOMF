note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Object Graph Tree iterator. This iterator currently supplies the standard 'do_all'
				 function which performs an action on entry to each node, descends, and then performs
				 an action on exiting each node; there are two agent actions supplied: node_enter_action
				 and node_exit_action. This allows signficantly more power than just a single action per 
				 node type.
				 
				 It also supports a more esoteric iteration function called do_at_surface, which iterates
				 from the top until a 'surface' of nodes is hit (which test true according to the supplied
				 'is_at_surface' agent); performs a single action to each such node, and does not continue
				 past these nodes.
				 ]"
	keywords:    "object graph, recursive iterator"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class OG_ITERATOR

create
	make

feature -- Initialisation

	make (a_target: OG_OBJECT_NODE)
		do
			target := a_target
		end

feature -- Access

	target: OG_OBJECT_NODE

feature -- Traversal

	do_all (node_enter_action, node_exit_action: PROCEDURE [ANY, TUPLE [OG_ITEM, INTEGER]])
			-- do enter_action and exit_action to all nodes in the structure
		do
			depth := 0
			do_all_nodes (target, node_enter_action, node_exit_action)
		end

	do_at_surface (node_action: PROCEDURE [ANY, TUPLE [OG_ITEM, INTEGER]];
			node_is_included: FUNCTION [ANY, TUPLE [OG_ITEM], BOOLEAN])
			-- Do action only to nodes at surface, where membership is defined by `node_is_included'.
		do
			do_at_surface_nodes (target, node_action, node_is_included)
		end

	do_until_surface (node_action: PROCEDURE [ANY, TUPLE [OG_ITEM, INTEGER]];
			node_is_included: FUNCTION [ANY, TUPLE[OG_ITEM], BOOLEAN])
			-- Do action only to nodes from top until surface (inclusive), where membership is defined by `node_is_included'.
		do
			do_until_surface_nodes (target, node_action, node_is_included)
		end

	do_if (node_action: PROCEDURE [ANY, TUPLE [OG_ITEM, INTEGER]];
			node_is_included: FUNCTION [ANY, TUPLE[OG_ITEM], BOOLEAN])
			-- Do action only to nodes from top until surface (inclusive), where membership is defined by `node_is_included'.
		do
			do_if_nodes (target, node_action, node_is_included)
		end

feature {NONE} -- Implementation

	do_all_nodes (a_target: OG_NODE; node_enter_action, node_exit_action: PROCEDURE [ANY, TUPLE [OG_ITEM, INTEGER]])
		do
			depth := depth + 1
			node_enter_action.call ([a_target, depth])
			across a_target as a_target_csr loop
				if attached {OG_NODE} a_target_csr.item as a_node then
					do_all_nodes (a_node, node_enter_action, node_exit_action)
				else -- terminal child node
					node_enter_action.call ([a_target_csr.item, depth+1])
					node_exit_action.call ([a_target_csr.item, depth+1])
				end
			end
			node_exit_action.call ([a_target, depth])
			depth := depth - 1
		end

	do_at_surface_nodes (a_target: OG_NODE; node_action: PROCEDURE [ANY, TUPLE [OG_ITEM, INTEGER]];
				node_is_at_surface: FUNCTION [ANY, TUPLE [OG_ITEM], BOOLEAN])
			-- Do action only to nodes at surface, where membership is defined by `node_is_at_surface'.
		do
			if node_is_at_surface.item ([a_target]) then
				node_action.call ([a_target, 0])
			else -- haven't hit the surface yet, descend...
				across a_target as a_target_csr loop
					if attached {OG_NODE} a_target_csr.item as a_node then
						do_at_surface_nodes (a_node, node_action, node_is_at_surface)
					elseif node_is_at_surface.item ([a_target_csr.item]) then -- terminal child node
						node_action.call ([a_target_csr.item, 0])
					end
				end
			end
		end

	do_until_surface_nodes (a_target: OG_NODE; node_action: PROCEDURE [ANY, TUPLE [OG_ITEM, INTEGER]];
				node_is_included: FUNCTION [ANY, TUPLE [OG_ITEM], BOOLEAN])
			-- Do action only to nodes from top down to surface, where membership is defined by `node_is_included'.
		do
			if node_is_included.item ([a_target]) then
				node_action.call ([a_target, 0])
				across a_target as a_target_csr loop
					if attached {OG_NODE} a_target_csr.item as a_node then
						do_until_surface_nodes (a_node, node_action, node_is_included)
					elseif node_is_included.item ([a_target_csr.item]) then -- terminal child node
						node_action.call ([a_target_csr.item, 0])
					end
				end
			end
		end

	do_if_nodes (a_target: OG_NODE; node_action: PROCEDURE [ANY, TUPLE [OG_ITEM, INTEGER]];
				node_is_included: FUNCTION [ANY, TUPLE [OG_ITEM], BOOLEAN])
			-- Do action only to nodes from top down to surface, where membership is defined by `node_is_included'.
		do
			if node_is_included.item ([a_target]) then
				node_action.call ([a_target, 0])
			end
			across a_target as a_target_csr loop
				if attached {OG_NODE} a_target_csr.item as a_node then
					do_if_nodes (a_node, node_action, node_is_included)
				elseif node_is_included.item ([a_target_csr.item]) then -- terminal child node
					node_action.call ([a_target_csr.item, 0])
				end
			end
		end

	depth: INTEGER

end


