note
	component:   "Eiffel Object Modelling Framework"
	description: "Attribute node in Data Tree"
	keywords:    "data tree"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class DT_ATTRIBUTE

inherit
	DT_ITEM
		redefine
			parent, representation
		end

	ITERABLE [DT_OBJECT_ITEM]
		undefine
			is_equal
		end

create
	make_single, make_container, make_nested_container

feature -- Initialisation

	make_single (a_name: STRING)
			-- make as a single type attribute; set attr name
		require
			a_name_valid: not a_name.is_empty
		do
			create representation.make_single (a_name)
			representation.set_content (Current)
		ensure
			not is_container_type
			not is_nested
		end

	make_container (a_name: STRING)
			-- make as a container type attribute; set attr name
		require
			a_name_valid: not a_name.is_empty
		do
			create representation.make_multiple (a_name)
			representation.set_content (Current)
		ensure
			is_container_type
			not is_nested
		end

	make_nested_container
			-- make as a container type attribute representing the implied attirbute of a container object, typically
			-- called something like 'items', 'values', 'elements' etc
		do
			create representation.make_multiple ({DT_DEFINITIONS}.Container_attr_name)
			is_nested := True
			representation.set_content (Current)
		ensure
			is_container_type
			is_nested
		end

feature -- Access

	parent: detachable DT_COMPLEX_OBJECT

	children: ARRAYED_LIST [DT_OBJECT_ITEM]
			-- next nodes, keyed by node id or attribute name
		attribute
			create Result.make (0)
		end

	im_attr_name: STRING
			-- attribute name in information model
		do
			Result := representation.node_id
		end

	child_with_id (a_node_id: STRING): detachable DT_OBJECT_ITEM
			-- find the child node with `a_path_id'
		require
			has_child_with_id (a_node_id)
		do
			if attached {DT_OBJECT_ITEM} representation.child_with_id (a_node_id).content_item as dt_oi then
				Result := dt_oi
			end
		end

	first_child: DT_OBJECT_ITEM
			--
		do
			Result := children.first
		end

	last_child: DT_OBJECT_ITEM
			--
		do
			Result := children.last
		end

	child_count: INTEGER
			-- number of children
		do
			Result := children.count
		end

	new_cursor: ITERATION_CURSOR [DT_OBJECT_ITEM]
			-- Fresh cursor associated with current structure
		do
			Result := children.new_cursor
		end

feature -- Status Report

	is_container_type: BOOLEAN
			-- True if type of this attribute in model is a container
		do
			Result := representation.is_multiple
		end

	is_nested: BOOLEAN
			-- True if this attribute represents an assumed attribute of a parent container object

	has_child_with_id (a_node_id: STRING): BOOLEAN
			-- valid OBJ children of a REL node might not all be unique
		do
			Result := representation.has_child_with_id (a_node_id)
		end

	has_child (a_node: DT_OBJECT_ITEM): BOOLEAN
			-- True if a_node is among children of this node
		do
			Result := children.has (a_node)
		end

	is_empty: BOOLEAN
		do
			Result := children.is_empty
		end

feature -- Modification

	set_attr_name (a_name: STRING)
			-- set attr name
		require
			a_name_valid: not a_name.is_empty
		do
			representation.set_node_id(a_name)
		end

	set_container_type
			-- set an attribute created single to be multiple
		do
			representation.set_multiple
		ensure
			is_container_type
		end

	set_nested_container
			-- set an attribute created single to be multiple and nested, i.e. a container attribute
		do
			representation.set_multiple
			is_nested := True
		ensure
			is_container_type
			is_nested
		end

	unset_nested
			-- unset `is_nested' marker, so that structure is treated like a non-nested container
		require
			is_container_type
		do
			is_nested := False
		ensure
			is_container_type
			not is_nested
		end

	put_child (a_node: DT_OBJECT_ITEM)
			-- put a new child node
		require
			Node_valid: not has_child(a_node)
			Multiplicity_validity: is_container_type or else children.is_empty
		do
			representation.put_child (a_node.representation)
			children.extend(a_node)
			a_node.set_parent(Current)
		ensure
			Has_child: has_child(a_node)
		end

	remove_child (a_node: DT_OBJECT_ITEM)
			-- remove child node
		require
			Node_valid: has_child(a_node)
		do
			representation.remove_child (a_node.representation)
			children.prune_all (a_node)
		ensure
			Child_removed: not has_child (a_node)
		end

	remove_all_children
			-- remove all children
		do
			if child_count > 0 then
				representation.remove_all_children
				children.wipe_out
			end
		ensure
			Child_count: child_count = 0
		end

feature -- Representation

	representation: OG_ATTRIBUTE_NODE

feature -- Serialisation

	enter_subtree (serialiser: DT_SERIALISER; depth: INTEGER)
			-- perform serialisation at start of block for this node
		do
			serialiser.start_attribute_node (Current, depth)
		end

	exit_subtree (serialiser: DT_SERIALISER; depth: INTEGER)
			-- perform serialisation at end of block for this node
		do
			serialiser.end_attribute_node (Current, depth)
		end

invariant
	Nested_container_validity: is_nested implies is_container_type

end


