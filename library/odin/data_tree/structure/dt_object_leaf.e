note
	component:   "Eiffel Object Modelling Framework"
	description: "leaf OBJECT item in a Data Tree"
	keywords:    "data tree"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class DT_OBJECT_LEAF

inherit
	DT_OBJECT_ITEM
		redefine
			representation
		end

feature -- Initialisation

	make_identified (a_value: like value; a_node_id: STRING)
		require
			Node_id_valid: not a_node_id.is_empty
		do
			create representation.make (a_node_id)
			set_value (a_value)
			representation.set_content (Current)
		ensure
			is_addressable
		end

	make_anonymous (a_value: like value)
		do
			create representation.make_anonymous
			set_value (a_value)
			representation.set_content (Current)
		ensure
			not is_addressable
		end

feature -- Access

	value: ANY
			-- data item of this node
		deferred
		end

feature -- Representation

	representation: OG_OBJECT_LEAF

feature -- Conversion

	as_object (a_type_id: INTEGER; make_args: detachable ARRAY[ANY]): ANY
			-- make an object whose classes and attributes correspond to the structure
			-- of this DT_OBJECT
		do
			Result := value
			as_object_ref := Result
		end

feature -- Modification

	set_value (a_value: like value)
		deferred
		end

feature -- Output

	as_string: STRING
		deferred
		end

end


