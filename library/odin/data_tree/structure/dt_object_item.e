note
	component:   "Eiffel Object Modelling Framework"
	description: "Leaf OBJECT item in an Data Tree"
	keywords:    "data tree"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class DT_OBJECT_ITEM

inherit
	DT_ITEM
		undefine
			is_equal
		redefine
			parent, representation
		end

	OG_DEFINITIONS
		export
			{NONE} all;
		undefine
			is_equal
		end

	COMPARABLE

feature -- Access

	id: STRING
			-- locally unique node id
		do
			Result := representation.node_id
		end

	parent: detachable DT_ATTRIBUTE_NODE
			-- parent of all object types must be an attribute node

feature -- Comparison

	is_less alias "<" (other: like Current): BOOLEAN
			-- compare based on node_id
		do
			Result := id < other.id
		end

feature -- Modification

	set_id (an_id: STRING)
			-- set node id
		require
			Id_valid: not an_id.is_empty
		do
			representation.set_node_id (an_id)
		end

feature -- Conversion

	as_object (a_type_id: INTEGER; make_args: detachable ARRAY[ANY]): detachable ANY
			-- make an object of type `a_type_id' whose classes and attributes correspond to the structure
			-- of this DT_OBJECT
		require
			a_type_id >= 0
		deferred
		ensure
			as_object_ref = Result
		end

	as_object_ref: detachable ANY
			-- cached reference to object created from last call to as_object or as_object_from_string

feature -- Representation

	representation: OG_OBJECT

invariant
	Id_valid: not id.is_empty

end


