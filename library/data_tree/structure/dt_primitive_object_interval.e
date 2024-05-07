note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 DT node of interval of ordered simple type, i.e. : INTEGER, REAL, DATE, TIME, DATE_TIME, DURATION. Has a 
				 structured serialisation method that can output the object in a form that can be tailored by agents to
				 look like ODIN, JSON, YAML or any other such format.
			 	 ]"
	keywords:    "data tree, interval"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2004- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class DT_PRIMITIVE_OBJECT_INTERVAL

inherit
	DT_OBJECT_LEAF
		redefine
			value
		end

create
	make_identified, make_anonymous

feature -- Access

	value: INTERVAL [PART_COMPARABLE]

feature -- Conversion

	as_serialised_string (value_serialiser: FUNCTION [ANY, TUPLE [ANY], STRING];
			attr_name_formatter: FUNCTION [ANY, TUPLE [STRING], STRING];
			value_string_formatter: FUNCTION [ANY, TUPLE [STRING], STRING];
			equal_symbol, attr_delimiter: STRING): STRING
			-- generate a cleaned form of this object as a structured string following the general model (in ODIN)
			-- 		lower = <0.0>
			--  	upper_unbounded = <True>
			-- etc. IN JSON, this would be:
			-- 		"lower": 0.0,
			-- 		"upper_unbounded": true
			-- The agent `attr_name_formatter' can be used to format the agent name e.g. add "" as in JSON
			-- The agent `value_string_formatter' is used to format the value, e.g. add <> as in ODIN
			-- FIXME: the 'to_reference' in the below should not be required, but BOOLEAN does not conform to ANY when it is an agent argument!
		do
			create Result.make(0)
			if value.lower_unbounded then
				Result.append (attr_name_formatter.item (["lower_unbounded"]))
				Result.append (equal_symbol)
				Result.append (value_string_formatter.item ([value_serialiser.item ([value.lower_unbounded.to_reference])]))
				Result.append (attr_delimiter)
			elseif attached value.lower as val_lower then
				Result.append (attr_name_formatter.item (["lower"]))
				Result.append (equal_symbol)
				Result.append (value_string_formatter.item ([value_serialiser.item ([val_lower])]))
				Result.append (attr_delimiter)
				if not value.lower_included then
					Result.append (attr_name_formatter.item (["lower_included"]))
					Result.append (equal_symbol)
					Result.append (value_string_formatter.item ([value_serialiser.item ([value.lower_included.to_reference])]))
					Result.append (attr_delimiter)
				end
			end
			if value.upper_unbounded then
				Result.append (attr_name_formatter.item (["upper_unbounded"]))
				Result.append (equal_symbol)
				Result.append (value_string_formatter.item ([value_serialiser.item ([value.upper_unbounded.to_reference])]))
			elseif attached value.upper as val_upper then
				Result.append (attr_name_formatter.item (["upper"]))
				Result.append (equal_symbol)
				Result.append (value_string_formatter.item ([value_serialiser.item ([val_upper])]))
				if not value.upper_included then
					Result.append (attr_delimiter)
					Result.append (attr_name_formatter.item (["upper_included"]))
					Result.append (equal_symbol)
					Result.append (value_string_formatter.item ([value_serialiser.item ([value.upper_included.to_reference])]))
				end
			end
		end

feature -- Output

	as_string: STRING
		do
			create Result.make_empty
			Result.append_character ('|')
			Result.append (value.as_string)
			Result.append_character ('|')
		end

feature -- Serialisation

	enter_subtree (serialiser: DT_VISITOR; depth: INTEGER)
			-- perform serialisation at start of block for this node
		do
			serialiser.start_primitive_object_interval (Current, depth)
		end

	exit_subtree (serialiser: DT_VISITOR; depth: INTEGER)
			-- perform serialisation at end of block for this node
		do
			serialiser.end_primitive_object_interval (Current, depth)
		end

end


