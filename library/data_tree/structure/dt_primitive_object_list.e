note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Node of simple type in a Data Tree. Simple
				 types include: STRING, INTEGER, REAL, CHARACTER,
				 BOOLEAN. Occurrences set to the default of {1..1}
			 ]"
	keywords:    "data tree"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class DT_PRIMITIVE_OBJECT_LIST

inherit
	DT_OBJECT_LEAF
		redefine
			value
		end

	DT_STRING_UTILITIES
		export
			{NONE} all
		undefine
			is_equal, default_create
		end

	INTERNAL
		export
			{NONE} all
		undefine
			is_equal, default_create
		end

create
	make_identified, make_anonymous

feature -- Access

	value: SEQUENCE [ANY]

feature -- Conversion

	as_serialised_string (value_serialiser: FUNCTION [ANY, TUPLE [ANY], STRING];
			delimiter, end_delimiter: detachable STRING;
			cleaner: detachable FUNCTION [ANY, TUPLE [STRING], STRING]): STRING
			-- generate a cleaned form of this object as a structured string with specified delimiters, and cleaning with `cleaner'
		do
			create Result.make(0)
			from value.start until value.off loop
				if attached delimiter as d and value.index > 1 then
					Result.append (d)
				end
				if attached {STRING} value.item as s and attached cleaner as c then
					Result.append (value_serialiser.item ([c.item ([s])]))
				else
					Result.append (value_serialiser.item ([value.item]))
				end
				value.forth
			end
			if attached end_delimiter as d and value.count = 1 then
				Result.append (d)
			end
		end

feature -- Output

	as_string: STRING
		do
			create Result.make (0)
			from value.start until value.off loop
				if value.index > 1 then
					Result.append (", ")
				end
				Result.append (primitive_value_out (value.item))
				value.forth
			end
			if value.count = 1 then -- append syntactic indication of list continuation
				Result.append (", ...")
			end
		end

feature -- Serialisation

	enter_subtree (serialiser: DT_VISITOR; depth: INTEGER)
			-- perform serialisation at start of block for this node
		do
			serialiser.start_primitive_object_list (Current, depth)
		end

	exit_subtree (serialiser: DT_VISITOR; depth: INTEGER)
			-- perform serialisation at end of block for this node
		do
			serialiser.end_primitive_object_list (Current, depth)
		end

end


