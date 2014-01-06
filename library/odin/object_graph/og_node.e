note
	component:   "Eiffel Object Modelling Framework"
	description: "Object Graph abstract node type"
	keywords:    "object graph, document object model"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class OG_NODE

inherit
	OG_ITEM

	ITERABLE [OG_ITEM]
		undefine
			is_equal
		end

feature -- Access

	all_children: ARRAYED_LIST [like child_type]
		do
			Result := children.linear_representation
		end

	child_with_id (a_node_key: STRING): like child_type
			-- find the child node with `a_node_key'
		require
			has_child_with_id (a_node_key)
		do
			check attached children.item (a_node_key) as c then
				Result := c
			end
		end

	child_count: INTEGER
			-- number of child nodes
		do
			Result := children.count
		end

	new_cursor: ITERATION_CURSOR [like child_type]
			-- Fresh cursor associated with current structure
		do
			Result := children_ordered.new_cursor
		end

feature -- Status Report

	is_leaf: BOOLEAN
			-- true if no children
		do
			Result := children.is_empty
		end

	has_children: BOOLEAN
			-- true if any children
		do
			Result := not children.is_empty
		end

	has_child_with_id (a_node_key: STRING): BOOLEAN
		require
			Valid_node_id: not node_key.is_empty
		do
			Result := children.has (a_node_key)
		end

	has_child (a_node: like child_type): BOOLEAN
		do
			Result := children.has_item (a_node)
		end

	valid_child_for_insertion (a_node: like child_type): BOOLEAN
		do
			Result := not has_child (a_node) and not has_child_with_id (a_node.node_key)
		end

feature -- Modification

	put_child (a_node: like child_type)
			-- put a new child node at the end of the list
		require
			Node_exists: valid_child_for_insertion (a_node)
		do
			children.put (a_node, a_node.node_key)
			a_node.set_parent (Current)
			children_ordered.extend (a_node)
		ensure
			has_child (a_node)
		end

	put_child_left (a_node, before_node: like child_type)
			-- insert a new child node before another node in the list
		require
			Node_valid: valid_child_for_insertion (a_node)
			Before_node_valid: has_child (before_node)
		do
			children.put (a_node, a_node.node_key)
			a_node.set_parent (Current)
			children_ordered.go_i_th (children_ordered.index_of (before_node, 1))
			children_ordered.put_left (a_node)
		ensure
			has_child (a_node)
		end

	put_child_right (a_node, after_node: like child_type)
			-- insert a new child node before another node in the list
		require
			Node_valid: valid_child_for_insertion (a_node)
			After_node_valid: has_child (after_node)
		do
			children.put (a_node, a_node.node_key)
			a_node.set_parent (Current)
			children_ordered.go_i_th (children_ordered.index_of (after_node, 1))
			children_ordered.put_right (a_node)
		ensure
			has_child (a_node)
		end

	replace_child_by_id (a_node: like child_type; an_id: STRING)
			-- replace node with id `an_id' by `an_obj'
		do
			children_ordered.go_i_th (children_ordered.index_of (child_with_id(an_id), 1))
			children_ordered.replace (a_node)
			children.replace (a_node, an_id)
			a_node.set_parent (Current)
		end

	remove_child (a_node: like child_type)
			-- remove the child node `a_node'
		require
			Node_exists: has_child (a_node)
		do
			children_ordered.prune_all (a_node)
			children.remove (a_node.node_key)
			a_node.set_root
		ensure
			Child_removed: not has_child (a_node)
		end

	remove_child_by_id (a_node_key: STRING)
			-- remove the child node identified by a_node_key
		require
			Node_exists: has_child_with_id (a_node_key)
		local
			c: like child_type
		do
			c := child_with_id (a_node_key)
			remove_child(c)
		ensure
			Child_removed: not has_child_with_id (a_node_key)
		end

	remove_all_children
			-- remove all children
		do
			create children.make (0)
			create children_ordered.make (0)
		ensure
			Children_removed: children.is_empty
		end

	replace_node_id (an_old_node_key, a_new_node_key: STRING)
			-- replace `an_old_node_key' with `a_new_node_key' in the children
			-- this has the effect of making an object indexed by a new node id,
			-- that it doesn't itself carry
		require
			Keys_different: not an_old_node_key.is_equal (a_new_node_key)
		do
			children.replace_key (a_new_node_key, an_old_node_key)
		ensure
			Child_indexed_by_path_not_id: not child_with_id (a_new_node_key).node_id.is_equal (a_new_node_key)
		end

feature {OG_NODE} -- Implementation

	children: HASH_TABLE [like child_type, STRING]
			-- next nodes, keyed by node id or attribute name, or compressed attribute path
		attribute
			create Result.make (0)
		end

	children_ordered: ARRAYED_LIST [like child_type]
			-- reference list of child, in order of insertion (i.e. order of original parsing)
		attribute
			create Result.make (0)
		end

	child_type: OG_ITEM
		deferred
		end

invariant
	Child_lists_valid: children.count = children_ordered.count

end


