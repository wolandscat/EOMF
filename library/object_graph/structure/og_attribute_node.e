note
	component:   "Eiffel Object Modelling Framework"
	description: "Attribute node in an Object Graph."
	keywords:    "object graph, document object model"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2004- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class OG_ATTRIBUTE_NODE

inherit
	OG_NODE
		rename
			make as make_og_node
		redefine
			parent, put_child, put_child_left, put_child_right, valid_child_for_insertion, node_key
		end

create
	make_single, make_multiple

feature -- Initialisation

	make_single (a_node_id: STRING)
			-- make an attribute representing a single-valued attribute in some model
		require
			Node_id_valid: not a_node_id.is_empty
		do
			make_og_node (a_node_id)
		ensure
			Is_single: not is_multiple
		end

	make_multiple (a_node_id: STRING)
			-- make an attribute representing a multiple-valued (i.e. container) attribute in some model
		require
			Node_id_valid: not a_node_id.is_empty
		do
			make_og_node (a_node_id)
			is_multiple := True
		ensure
			Is_multiple: is_multiple
		end

feature -- Access

	parent: detachable OG_OBJECT_NODE

	differential_path: detachable OG_PATH
			-- if set, contains the path to this attribute, excluding the name of this attribute, allowing this
			-- OG_ATTRIBUTE_NODE to stand as a 'path-compressed' replacement for a string of OG_OBJECT_NODE/
			-- OG_ATTRIBUTE_NODE objects. Only valid in differential archetypes and templates.

	node_key: STRING
			-- uses differential path if it exists
		do
			if has_differential_path and then attached differential_path as att_diff_path then
				Result := att_diff_path.as_string
				if not att_diff_path.is_root then
					Result.append_character ({OG_PATH}.segment_separator)
				end
				Result.append (node_id)
			else
				Result := node_id
			end
		end

	proxy_child_with_target_id (a_node_key: STRING): OG_OBJECT_PROXY
		require
			Valid_node_id: has_proxy_child_with_target_id (a_node_key)
		do
			from children.start until children.off or attached {OG_OBJECT_PROXY} children.item_for_iteration as og_proxy
				and then attached og_proxy.target_object as att_targ_obj and then att_targ_obj.node_id.is_equal (a_node_key)
			loop
				children.forth
			end
			check attached {OG_OBJECT_PROXY} children.item_for_iteration as ogp then
				Result := ogp
			end
		end

feature -- Status Report

	is_multiple: BOOLEAN
			-- True if this node logically represents a container attribute. Note that even if is_multiple is False,
			-- there can be multiple children, because for constraint representation, these correspond to alternatives, not
			-- multiple concurrent members.

	is_single: BOOLEAN
			-- True if this node logically represents a single-valued attribute.
		do
			Result := not is_multiple
		end

	is_addressable: BOOLEAN = True
			-- True if this node has a non-anonymous node_id

	has_differential_path: BOOLEAN
			-- True if this node has a differential path
		do
			Result := attached differential_path
		end

	valid_child_for_insertion (a_node: like child_type): BOOLEAN
			-- valid OBJ children of a REL node might not all be unique
		do
			Result := not children.has_item (a_node)
		end

	has_proxy_child_with_target_id (a_node_key: STRING): BOOLEAN
		require
			Valid_node_id: not a_node_key.is_empty
		do
			Result := across children as child_obj_csr some
				attached {OG_OBJECT_PROXY} child_obj_csr.item as og_proxy and then attached
					og_proxy.target_object as att_targ_obj and then att_targ_obj.node_id.is_equal (a_node_key)
			end
		end

feature -- Status Setting

	set_multiple
			-- set `is_multiple' True (sometimes discovered after make is done)
		do
			is_multiple := True
		end

feature -- Modification

	put_child (obj_node: like child_type)
			-- put a new child node
			-- if new child is an OBJECT_NODE id is already known in children, generate a unique id for it
		local
			new_id: STRING
		do
			if children.has(obj_node.node_id) then
				new_id := obj_node.node_id + (children.count + 1).out
				obj_node.set_node_id(new_id)
			end
			precursor(obj_node)
		end

	put_child_left (obj_node, before_obj_node: like child_type)
			-- insert a new child node before another object node
			-- if new child is an OBJECT_NODE id is already known in children, generate a unique id for it
		local
			new_id: STRING
		do
			if children.has (obj_node.node_id) then
				new_id := obj_node.node_id + (children.count + 1).out
				obj_node.set_node_id (new_id)
			end
			precursor(obj_node, before_obj_node)
		end

	put_child_right (obj_node, after_obj_node: like child_type)
			-- insert a new child node before another object node
			-- if new child is an OBJECT_NODE id is already known in children, generate a unique id for it
		local
			new_id: STRING
		do
			if children.has (obj_node.node_id) then
				new_id := obj_node.node_id + (children.count + 1).out
				obj_node.set_node_id(new_id)
			end
			precursor(obj_node, after_obj_node)
		end

	set_differential_path (a_path: OG_PATH)
			-- set `differential_path'
		do
			differential_path := a_path
			if attached parent as att_parent then
				att_parent.replace_node_id (node_id, node_key)
			end
		ensure
			Compessed_path_set: differential_path = a_path
			Parent_has_child: not is_root implies attached parent as att_parent and then att_parent.child_with_id (node_key) = Current
			Differential_path_flag_set: has_differential_path
		end

	clear_differential_path
			-- remove `differential_path'
		do
			differential_path := Void
		ensure
			not has_differential_path
		end

	set_differential_path_to_here
			-- compress the path and reparent current node to root node
		do
			if attached parent as att_parent then
				differential_path := att_parent.path
				if not att_parent.is_root then
					reparent_to_root
				end
			end
		ensure
			Differential_path_set: attached differential_path
		end

feature {NONE} -- Implementation

	child_type: OG_OBJECT
			-- relationship target type
		once
			create {OG_OBJECT_LEAF} Result.make_anonymous
		end

	reparent_to_root
			-- reparent this node to the root node, removing intervening orphaned nodes on the way
		local
			csr: OG_NODE
		do
			check attached parent as p then
				csr := p
			end
			csr.remove_child (Current)
			from until csr.parent = Void loop
				check attached csr.parent as p then
					if not csr.has_children then
						p.remove_child (csr)
					end
					csr := p
				end
			end
			csr.put_child (Current)
		end

end


