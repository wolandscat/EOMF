note
	component:   "Eiffel Object Modelling Framework"
	description: "A node that contains a list of references to other nodes, implemented by paths. Serialises an object non-containment reference list."
	keywords:    "data tree, serialisation, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class DT_OBJECT_REFERENCE_LIST

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

	value: ARRAYED_LIST [OG_PATH]
			-- list of path references

feature -- Output

	as_string: STRING
		do
			create Result.make(0)
			from value.start until value.off loop
				if value.index > 1 then
					Result.append(", ")
				end
					Result.append(value.item.as_string)
				value.forth
			end
			if value.count = 1 then -- append syntactic indication of list continuation
				Result.append(", ...")
			end
		end

feature -- Serialisation

	enter_subtree(serialiser: DT_SERIALISER; depth: INTEGER)
			-- perform serialisation at start of block for this node
		do
			serialiser.start_object_reference_list(Current, depth)
		end

	exit_subtree(serialiser: DT_SERIALISER; depth: INTEGER)
			-- perform serialisation at end of block for this node
		do
			serialiser.end_object_reference_list(Current, depth)
		end

end


