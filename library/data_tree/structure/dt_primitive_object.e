note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Node of simple type in Data Tree structure. Simple
				 types include: STRING, INTEGER, REAL, CHARACTER,
				 BOOLEAN. Occurrences set to the default of {1..1}
			 ]"
	keywords:    "data tree"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class DT_PRIMITIVE_OBJECT

inherit
	DT_OBJECT_LEAF

	DT_STRING_UTILITIES
		export
			{NONE} all
		undefine
			is_equal, default_create
		end

create
	make_identified, make_anonymous

feature -- Access

	value: ANY

feature -- Modification

	set_value (a_value: ANY)
		do
			value := a_value
			im_type_name := a_value.generating_type
		end

feature -- Conversion

	as_serialised_string (string_converter: FUNCTION [ANY, TUPLE [ANY], STRING]; cleaner: detachable FUNCTION [ANY, TUPLE [STRING], STRING]): STRING
			-- generate a cleaned form of this object as a string, using `cleaner' to do the work
		local
			v: ANY
		do
			-- if cleaning string, do it first before converting
			if attached {STRING} value as s and attached cleaner as c then
				v := c.item ([s])
			else
				v := value
			end
			Result := string_converter.item ([v])
		end

feature -- Output

	as_string: STRING
		do
			Result := primitive_value_out (value)
		end

feature -- Serialisation

	enter_subtree (serialiser: DT_SERIALISER; depth: INTEGER)
			-- perform serialisation at start of block for this node
		do
			serialiser.start_primitive_object (Current, depth)
		end

	exit_subtree (serialiser: DT_SERIALISER; depth: INTEGER)
			-- perform serialisation at end of block for this node
		do
			serialiser.end_primitive_object (Current, depth)
		end

end


