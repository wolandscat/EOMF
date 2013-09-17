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

class DT_PRIMITIVE_OBJECT_INTERVAL_LIST

inherit
	DT_OBJECT_LEAF

create
	make_identified, make_anonymous

feature -- Access

	value: ARRAYED_LIST [INTERVAL [PART_COMPARABLE]]

feature -- Modification

	set_value (a_value: like value)
		do
			value := a_value
			im_type_name := a_value.generating_type
		end

feature -- Conversion

	as_string: STRING
		do
			create Result.make_empty
			across value as ivl_csr loop
				Result.append_character ('|')
				Result.append (ivl_csr.item.as_string)
				Result.append_character ('|')

				if not ivl_csr.is_last then
					Result.append (", ")
				end
			end
		end

	as_serialised_string (value_serialiser: FUNCTION [ANY, TUPLE [ANY], STRING];
			attr_name_formatter: FUNCTION [ANY, TUPLE [STRING], STRING];
			ivl_value_string_formatter: FUNCTION [ANY, TUPLE [STRING], STRING];
			obj_start_sym, obj_end_sym, obj_attr_indent: STRING
			equal_symbol, attr_delimiter: STRING): STRING
			-- generate a cleaned form of this object as a structured string following the general model (in ODIN)
			-- 		lower = <0.0>
			--  	upper_unbounded = <True>
			-- etc. IN JSON, this would be:
			-- 		"lower": 0.0,
			-- 		"upper_unbounded": true
			-- The agent `attr_name_formatter' can be used to format the agent name e.g. add "" as in JSON
			-- The agent `ivl_value_string_formatter' is used to format the value, e.g. add <> as in ODIN
			-- The agent `list_formatter' is used to format whole list of values, e.g. add [] as in JSON
			-- FIXME: the 'to_reference' in the below should not be required, but BOOLEAN does not conform to ANY when it is an agent argument!
		local
			obj_new_line: BOOLEAN
		do
			create Result.make(0)
			across value as ivl_csr loop
				obj_new_line := obj_start_sym.ends_with ("%N")
				Result.append (obj_start_sym)
				if ivl_csr.item.lower_unbounded then
					if obj_new_line then
						Result.append (obj_attr_indent)
					else
						obj_new_line := True
					end
					Result.append (attr_name_formatter.item (["lower_unbounded"]))
					Result.append (equal_symbol)
					Result.append (ivl_value_string_formatter.item ([value_serialiser.item ([ivl_csr.item.lower_unbounded.to_reference])]))
					Result.append (attr_delimiter)
				elseif attached ivl_csr.item.lower as val_lower then
					if obj_new_line then
						Result.append (obj_attr_indent)
					else
						obj_new_line := True
					end
					Result.append (attr_name_formatter.item (["lower"]))
					Result.append (equal_symbol)
					Result.append (ivl_value_string_formatter.item ([value_serialiser.item ([val_lower])]))
					Result.append (attr_delimiter)
					if not ivl_csr.item.lower_included then
						if obj_new_line then
							Result.append (obj_attr_indent)
						else
							obj_new_line := True
						end
						Result.append (attr_name_formatter.item (["lower_included"]))
						Result.append (equal_symbol)
						Result.append (ivl_value_string_formatter.item ([value_serialiser.item ([ivl_csr.item.lower_included.to_reference])]))
						Result.append (attr_delimiter)
					end
				end
				if ivl_csr.item.upper_unbounded then
					if obj_new_line then
						Result.append (obj_attr_indent)
					else
						obj_new_line := True
					end
					Result.append (attr_name_formatter.item (["upper_unbounded"]))
					Result.append (equal_symbol)
					Result.append (ivl_value_string_formatter.item ([value_serialiser.item ([ivl_csr.item.upper_unbounded.to_reference])]))
				elseif attached ivl_csr.item.upper as val_upper then
					if obj_new_line then
						Result.append (obj_attr_indent)
					else
						obj_new_line := True
					end
					Result.append (attr_name_formatter.item (["upper"]))
					Result.append (equal_symbol)
					Result.append (ivl_value_string_formatter.item ([value_serialiser.item ([val_upper])]))
					if not ivl_csr.item.upper_included then
						Result.append (attr_delimiter)
						if obj_new_line then
							Result.append (obj_attr_indent)
						else
							obj_new_line := True
						end
						Result.append (attr_name_formatter.item (["upper_included"]))
						Result.append (equal_symbol)
						Result.append (ivl_value_string_formatter.item ([value_serialiser.item ([ivl_csr.item.upper_included.to_reference])]))
					end
				end
				Result.append (obj_end_sym)

				if not ivl_csr.is_last then
					Result.append (attr_delimiter)
				end
			end
		end

feature -- Serialisation

	enter_subtree (serialiser: DT_SERIALISER; depth: INTEGER)
			-- perform serialisation at start of block for this node
		do
			serialiser.start_primitive_object_interval_list (Current, depth)
		end

	exit_subtree (serialiser: DT_SERIALISER; depth: INTEGER)
			-- perform serialisation at end of block for this node
		do
			serialiser.end_primitive_object_interval_list (Current, depth)
		end

end


