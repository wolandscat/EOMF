note
	component:   "Eiffel Object Modelling Framework"
	description: "Any node in a data tree"
	keywords:    "Data Tree"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class DT_ITEM

inherit
	VISITABLE
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

feature -- Definitions

	Unknown_type_name: STRING = "UNKNOWN"

feature -- Access

	parent: detachable DT_ITEM

	im_type_name: STRING
			-- reference model type name of object to instantiate
        attribute
            create Result.make_from_string (Unknown_type_name)
        end

	path: STRING
			-- path from root to this node
		do
			Result := representation.path.as_string
		end

feature -- Status Report

	is_typed: BOOLEAN
			-- True if this node has a known type
		do
			Result := attached im_type_name and then not im_type_name.is_equal (Unknown_type_name)
		end

	type_visible: BOOLEAN
			-- True if type names are to be shown in serialised forms

	is_addressable: BOOLEAN
			-- True if this node has a non-anonymous node_id
		do
			Result := representation.is_addressable
		end

	is_root: BOOLEAN
			-- True if is root of parse tree structure
		do
			Result := representation.is_root
		end

	set_im_type_name (a_type_name: STRING)
			-- set type name
		require
			Type_name_valid: not a_type_name.is_empty
		do
			im_type_name := a_type_name
		end

feature -- Modification

	set_visible_im_type_name (a_type_name: STRING)
			-- set type name
		require
			Type_name_valid: not a_type_name.is_empty
		do
			set_im_type_name (a_type_name)
			set_type_visible
		end

	set_type_visible
			-- show type of this object in serialised forms such as ODIN
		require
			is_typed
		do
			type_visible := True
		end

feature {DT_ITEM} -- Modification

	set_parent (a_node: like parent)
			-- connect child to parent
		do
			parent := a_node
		end

feature -- Representation

	representation: OG_ITEM

feature -- Serialisation

	enter_subtree (serialiser: DT_SERIALISER; depth: INTEGER)
			-- perform serialisation at start of block for this node
		deferred
		end

	exit_subtree (serialiser: DT_SERIALISER; depth: INTEGER)
			-- perform serialisation at end of block for this node
		deferred
		end

invariant
	Rm_type_name_validity:	attached im_type_name implies not im_type_name.is_empty

end


