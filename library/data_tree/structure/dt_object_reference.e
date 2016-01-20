note
	component:   "Eiffel Object Modelling Framework"
	description: "A node that contains a reference to another node, implemented by a path. Serialises an object non-containment reference."
	keywords:    "data tree, serialisation, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class DT_OBJECT_REFERENCE

inherit
	DT_REFERENCE

	DT_OBJECT_LEAF
		export
			{NONE} as_object
		undefine
			default_create
		redefine
			value
		end

create
	make_anonymous, make_identified

feature -- Access

	value: OG_PATH
			-- path reference

feature -- Output

	as_string: STRING
		do
			Result := value.as_string
		end

feature -- Serialisation

	enter_subtree (serialiser: DT_SERIALISER; depth: INTEGER)
			-- perform serialisation at start of block for this node
		do
			serialiser.start_object_reference (Current, depth)
		end

	exit_subtree (serialiser: DT_SERIALISER; depth: INTEGER)
			-- perform serialisation at end of block for this node
		do
			serialiser.end_object_reference (Current, depth)
		end

end


