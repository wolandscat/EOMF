note
	component:   "Eiffel Object Modelling Framework"
	description: "item in an Object Graph"
	keywords:    "object graph, document object model"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class OG_ITEM

inherit
	OG_DEFINITIONS
		export
			{NONE} all
		undefine
			is_equal
		end

	COMPARABLE

feature -- Initialisation

	make (a_node_id: STRING)
			-- create with node id and optional content_item
		require
			Node_id_valid: not a_node_id.is_empty
		do
			node_id := a_node_id
		ensure
			Node_id_set: node_id = a_node_id
		end

feature -- Access

	node_id: STRING
			-- id of this node

	node_key: STRING
			-- uses compressed path if it exists
		do
			Result := node_id
		end

	content_item: detachable OG_VISITABLE
				-- content of this node

	path: OG_PATH
			-- absolute path of this node relative to the root; may produce non-unique paths
			-- uses compressed path if it exists
		do
			Result := get_path (Void)
		end

	path_to_node (a_node: OG_OBJECT): OG_PATH
			-- absolute path of this node relative to `a_node'
		do
			Result := get_path (a_node)
		end

	parent: detachable OG_NODE

	ultimate_parent: detachable OG_NODE
			-- return the root node of the tree
		require
			not is_root
		do
			from Result := parent until not attached Result loop
				Result := Result.parent
			end
		end

	has_parent (a_node: OG_NODE): BOOLEAN
			-- return True if `a_node' found in line of parent nodes back to ultimate_parent,
			-- including if it is the immediate parent
		local
			csr: detachable OG_NODE
		do
			from csr := parent until not attached csr as att_csr or else att_csr = a_node loop
				csr := csr.parent
			end
			Result := csr = a_node
		end

feature -- Comparison

	is_less alias "<" (other: like Current): BOOLEAN
			-- compare based on node_id
		do
			Result := node_id < other.node_id
		end

feature -- Status Report

	is_addressable: BOOLEAN
			-- True if this node has a non-anonymous node_id
		deferred
		end

	is_root: BOOLEAN
			-- True if is root of parse tree structure
		do
			Result := parent = Void
		end

	is_leaf: BOOLEAN
			-- True if this object is a leaf object
		deferred
		end

feature -- Modification

	set_root
			-- set this node to root, i.e. remove its parent
		do
			parent := Void
		ensure
			is_root
		end

	set_node_id (a_node_id: STRING)
			-- Set node_id and also key in owning OG_ATTR hash table
		require
			Node_id_valid: not a_node_id.is_empty
		local
			old_id: STRING
		do
			old_id := node_id
			node_id := a_node_id

			-- now fix the node id
			if attached parent as og_attr then
				parent.replace_node_id (old_id, a_node_id)
			end
		end

	set_parent (a_node: like parent)
			-- connect child to parent
		do
			parent := a_node
		end

	set_content (a_content_item: OG_VISITABLE)
			-- set item
		do
			content_item := a_content_item
		ensure
			Content_set: content_item = a_content_item
		end

feature -- Serialisation

	enter_subtree (visitor: ANY; depth: INTEGER)
			-- perform action at start of block for this node
		require
			Depth_valid: depth >= 0
		do
			if attached content_item as att_item then
				att_item.enter_subtree (visitor, depth)
			end
		end

	exit_subtree (visitor:  ANY; depth: INTEGER)
			-- perform action at end of block for this node
		require
			Depth_valid: depth >= 0
		do
			if attached content_item as att_item then
				att_item.exit_subtree (visitor, depth)
			end
		end

feature {NONE} -- Implementation

	get_path (stop_node: detachable OG_OBJECT): OG_PATH
			-- absolute path of this node relative to `stop_node' or if Void, the root;
		local
			csr: OG_ITEM
			og_nodes: ARRAYED_LIST [OG_ITEM]
			a_path_item: OG_PATH_ITEM
			og_path: detachable OG_PATH
		do
			-- get the node list from here back up to the root or `stop_node' if set,
			-- but don't include the root OG_OBJECT_NODE
			create og_nodes.make(0)
			from csr := Current until csr.parent = Void or csr ~ stop_node loop
				og_nodes.put_front (csr)
				check attached csr.parent as p then
					csr := p
				end
			end

			if csr.is_root then
				create og_path.make_root
			end
			from og_nodes.start until og_nodes.off loop
				-- now on an OG_ATTR_NODE
				if attached {OG_ATTRIBUTE_NODE} og_nodes.item as og_attr then
					create a_path_item.make (og_attr.node_id)
					if og_attr.has_differential_path and attached og_attr.differential_path as att_diff_path then
						if attached og_path as att_path then
							att_path.append_path (att_diff_path.deep_twin)
						else
							og_path := att_diff_path.deep_twin
						end
						check attached og_path as att_path then
							att_path.append_segment (a_path_item)
						end
					elseif attached og_path as att_path then
						att_path.append_segment (a_path_item)
					else
						create og_path.make_absolute (a_path_item)
					end
					og_nodes.forth

					-- now on an OG_OBJECT_NODE
					if not og_nodes.off then
						if og_nodes.item.is_addressable then
							a_path_item.set_object_id (og_nodes.item.node_id)
						end
						og_nodes.forth
					end
				end
			end
			check attached og_path as ogp then
				Result := ogp
			end
		end

invariant
	Node_id_valid: not node_id.is_empty

end


