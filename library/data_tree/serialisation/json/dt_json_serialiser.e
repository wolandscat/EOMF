note
	component:   "Eiffel Object Modelling Framework"
	description: "Serialise DT structure to JSON syntax"
	keywords:    "Data tree, JSON"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class DT_JSON_SERIALISER

inherit
	DT_SERIALISER
		redefine
			reset
		end

	JSON_SYMBOLS
		export
			{NONE} all
		end

	STRING_UTILITIES
		export
			{NONE} all
		end

	DT_DEFINITIONS
		export
			{NONE} all
		end

create
	make

feature -- Commands

	reset
		do
			precursor
			multiple_attr_count := 0
		end

feature -- Visitor

	start_complex_object_node (a_node: DT_COMPLEX_OBJECT; depth: INTEGER)
			-- start serialising a DT_COMPLEX_OBJECT_NODE
		do
			if not a_node.is_root then
				start_object_item (a_node, depth)
			end
			last_result.append (symbol (SYM_JSON_START_OBJECT) + format_item (FMT_NEWLINE))

			last_result.append (create_indent ((depth+1)//2 + multiple_attr_count))
			last_result.append (serialise_type_attribute (a_node))
		end

	end_complex_object_node (a_node: DT_COMPLEX_OBJECT; depth: INTEGER)
			-- end serialising a DT_COMPLEX_OBJECT_NODE
		do
			last_result.append (create_indent (depth//2 + multiple_attr_count))
			last_result.append (symbol (SYM_JSON_END_OBJECT))
			if not a_node.is_root then
				end_object_item (a_node, depth)
			end
		end

	start_attribute_node (a_node: DT_ATTRIBUTE; depth: INTEGER)
			-- start serialising a DT_ATTRIBUTE_NODE
		do
			-- don't output anything if nested - generate nested keyed objects only
			if not a_node.is_nested then
				-- output: indent "$attr_name":
				last_result.append (create_indent (depth//2 + multiple_attr_count))
				last_result.append (format_attr_name (a_node.im_attr_name))
				last_result.append (symbol (SYM_JSON_EQ))

				-- if it is a container, first output typing info, if option on
				-- then '['
				if a_node.is_container_type then
					multiple_attr_count := multiple_attr_count + 1

					-- look into the objects in the container; if it turns out to be a HASH_TABLE,
					-- i.e. with real hash keys (not just numbers) we need to put out another SYM_JSON_START_OBJECT
					-- token (JSON is very dumb about hash maps)
					if not a_node.is_empty and then a_node.first_child.is_addressable and then not a_node.first_child.id.is_integer then
						last_result.append (symbol (SYM_JSON_START_OBJECT))
					else
						last_result.append (symbol (SYM_JSON_START_ARRAY))
					end
					last_result.append (format_item (FMT_NEWLINE))
				end
			end
		end

	end_attribute_node (a_node: DT_ATTRIBUTE; depth: INTEGER)
			-- end serialising an DT_ATTRIBUTE_NODE
		do
			-- don't output anything if nested - generate nested keyed objects only
			if not a_node.is_nested then
				if a_node.is_container_type then
					multiple_attr_count := multiple_attr_count - 1

					-- output the indent
					last_result.append (create_indent (depth//2 + multiple_attr_count))

					-- look into the objects in the container; if it turns out to be a HASH_TABLE,
					-- i.e. with real hash keys (not just numbers) we need to put out another SYM_JSON_END_OBJECT
					-- token (JSON is very dumb about hash maps)
					if not a_node.is_empty and then a_node.first_child.is_addressable and then not a_node.first_child.id.is_integer then
						last_result.append (symbol (SYM_JSON_END_OBJECT))
					else
						last_result.append (symbol (SYM_JSON_END_ARRAY))
					end
					if attached a_node.parent as att_dt_obj and then att_dt_obj.last /= a_node then
						last_result.append (symbol (SYM_JSON_ITEM_DELIMITER))
					end
					last_result.append (format_item (FMT_NEWLINE))
				end
			end
		end

	start_primitive_object (a_node: DT_PRIMITIVE_OBJECT; depth: INTEGER)
			-- start serialising a DT_PRIMITIVE_OBJECT
		do
			start_object_item (a_node, depth)
			last_result.append (a_node.as_serialised_string (agent primitive_value_to_json_string, agent clean))
		end

	end_primitive_object (a_node: DT_PRIMITIVE_OBJECT; depth: INTEGER)
			-- end serialising a DT_PRIMITIVE_OBJECT
		do
			end_object_item (a_node, depth)
		end

	start_primitive_object_list (a_node: DT_PRIMITIVE_OBJECT_LIST; depth: INTEGER)
			-- start serialising an DT_PRIMITIVE_OBJECT_LIST
		do
			last_result.append (symbol (SYM_JSON_START_ARRAY))
			start_object_item (a_node, depth)
			last_result.append (a_node.as_serialised_string (agent primitive_value_to_json_string, ", ", "", agent clean))
		end

	end_primitive_object_list (a_node: DT_PRIMITIVE_OBJECT_LIST; depth: INTEGER)
			-- end serialising an DT_PRIMITIVE_OBJECT_LIST
		do
			last_result.append (symbol (SYM_JSON_END_ARRAY))
			end_object_item (a_node, depth)
		end

	start_primitive_object_interval (a_node: DT_PRIMITIVE_OBJECT_INTERVAL; depth: INTEGER)
			-- start serialising a DT_PRIMITIVE_OBJECT_INTERVAL
		local
			str: STRING
		do
			last_result.append (symbol (SYM_JSON_START_OBJECT) + "%N")
			str := a_node.as_serialised_string (
					agent primitive_value_to_json_string,
					agent format_attr_name,
					agent (s: STRING): STRING do Result := s end,
					symbol (SYM_JSON_EQ),
					symbol (sym_json_item_delimiter) + "%N")
			str.append ("%N")
			last_result.append (indented (str, create_indent (depth//2 + multiple_attr_count + 1)))
		end

	end_primitive_object_interval (a_node: DT_PRIMITIVE_OBJECT_INTERVAL; depth: INTEGER)
			-- end serialising a DT_PRIMITIVE_OBJECT_INTERVAL
		do
			last_result.append (create_indent (depth//2 + multiple_attr_count) + symbol (SYM_JSON_END_OBJECT))
			end_object_item (a_node, depth)
		end

	start_primitive_object_interval_list (a_node: DT_PRIMITIVE_OBJECT_INTERVAL_LIST; depth: INTEGER)
			-- start serialising a DT_PRIMITIVE_OBJECT_INTERVAL_LIST
		local
			str: STRING
		do
			last_result.append (symbol (SYM_JSON_START_ARRAY) + "%N")
			str :=  a_node.as_serialised_string (
					agent primitive_value_to_json_string,
					agent format_attr_name,
					agent (s: STRING): STRING do Result := s end,
					symbol (SYM_JSON_START_OBJECT) + "%N",
					"%N" + symbol (SYM_JSON_END_OBJECT),
					format_item (FMT_INDENT),
					symbol (SYM_JSON_EQ),
					symbol (sym_json_item_delimiter) + "%N")
			str.append ("%N")
			last_result.append (indented (str, create_indent (depth//2 + multiple_attr_count + 1)))
		end

	end_primitive_object_interval_list (a_node: DT_PRIMITIVE_OBJECT_INTERVAL_LIST; depth: INTEGER)
			-- end serialising a DT_OBJECT_SIMPLE
		do
			last_result.append (create_indent (depth//2 + multiple_attr_count) + symbol (SYM_JSON_END_ARRAY))
			end_object_item (a_node, depth)
		end

	start_object_reference (a_node: DT_OBJECT_REFERENCE; depth: INTEGER)
			-- start serialising a DT_OBJECT_REFERENCE
		do
			start_object_item (a_node, depth)
			last_result.append (a_node.as_string)
		end

	end_object_reference (a_node: DT_OBJECT_REFERENCE; depth: INTEGER)
			-- end serialising a DT_OBJECT_REFERENCE
		do
			end_object_item (a_node, depth)
		end

	start_object_reference_list (a_node: DT_OBJECT_REFERENCE_LIST; depth: INTEGER)
			-- start serialising a DT_OBJECT_REFERENCE_LIST
		do
			last_result.append (symbol (SYM_JSON_START_ARRAY))
			start_object_item (a_node, depth)
			last_result.append (a_node.as_string)
		end

	end_object_reference_list (a_node: DT_OBJECT_REFERENCE_LIST; depth: INTEGER)
			-- end serialising a DT_OBJECT_REFERENCE_LIST
		do
			last_result.append (symbol (SYM_JSON_END_ARRAY))
			end_object_item (a_node, depth)
		end

feature {NONE} -- Implementation

	multiple_attr_count: INTEGER
			-- counter for how many multiple attributes at the current point

	start_object_item (a_node: DT_OBJECT_ITEM; depth: INTEGER)
			-- start serialising a DT_OBJECT_ITEM
		do
			-- indent
			if last_result.item(last_result.count).out.is_equal (format_item (FMT_NEWLINE)) then
				last_result.append (create_indent (depth//2 + multiple_attr_count))
			end

			-- for containers contianing primitive types, put out the key as if it were an attribute name (JSON doesn't distinguish between hash
			-- keys and proper attribute names)
			if a_node.is_addressable then
				if not a_node.id.is_integer then
					last_result.append (format_attr_name (clean (a_node.id)))
					last_result.append (symbol (SYM_JSON_EQ))
				end
			end
		end

	end_object_item (a_node: DT_OBJECT_ITEM; depth: INTEGER)
			-- end serialising a DT_OBJECT_ITEM
		do
			-- determine whether to putput a comma or not
			if attached a_node.parent as att_dt_attr and then (att_dt_attr.is_container_type and then att_dt_attr.last_child /= a_node or else
				not att_dt_attr.is_container_type and then attached att_dt_attr.parent as att_dt_obj and then att_dt_obj.last /= att_dt_attr)
			then
				last_result.append (symbol (SYM_JSON_ITEM_DELIMITER))
			end
			last_result.append (format_item (FMT_NEWLINE))
		end


	format_attr_name (an_attr_name: STRING): STRING
			-- from a normal attribute name, generate the JSON formatting, i.e. with enclosing ""
		do
			Result := symbol (Sym_json_attribute_name_delimiter) + an_attr_name + symbol (Sym_json_attribute_name_delimiter)
		end

	primitive_value_to_json_string (a_prim_val: ANY): STRING
			-- generate a string, including JSON delimiters, e.g. "", '' for strings and chars.
		do
			if attached {BOOLEAN} a_prim_val or attached {BOOLEAN_REF} a_prim_val then
				Result := a_prim_val.out.as_lower

			elseif attached {STRING_GENERAL} a_prim_val or attached {URI} a_prim_val or attached {UID} a_prim_val then
				Result := "%"" + a_prim_val.out + "%""

			elseif attached {CHARACTER} a_prim_val or attached {CHARACTER_32} a_prim_val then
				Result := "%'" + a_prim_val.out + "%'"

			elseif attached {TERMINOLOGY_CODE} a_prim_val then
				Result := "%"" + a_prim_val.out + "%""

			else
				-- FIXME: duration.out does not exist in Eiffel, and in any case would not be ISO8601-compliant
				if attached {DATE_TIME_DURATION} a_prim_val as a_dur then
					Result := "%"" + (create {ISO8601_DURATION}.make_date_time_duration(a_dur)).as_string + "%""

				elseif attached {DATE_TIME} a_prim_val as a_dt then
					Result := "%"" + (create {ISO8601_DATE_TIME}.make_date_time(a_dt)).as_string + "%""

				elseif attached {ISO8601_DURATION} a_prim_val or attached {ISO8601_DATE_TIME} a_prim_val or
						attached {ISO8601_DATE} a_prim_val or attached {ISO8601_TIME} a_prim_val then
					Result := "%"" + a_prim_val.out + "%""

				-- numbers
				else
					if attached {REAL_32} a_prim_val as a_real then
						Result := format_real (a_real)

					elseif attached {REAL_64} a_prim_val as a_real then
						Result := format_real (a_real)

					elseif attached {DOUBLE} a_prim_val as a_real then
						Result := format_real (a_real)

					else
						Result := a_prim_val.out

					end

					-- JSON has to have scientific format numbers as strings
					if Result.has_substring ("e+") then
						Result.prepend ("%"")
						Result.append ("%"")
					end
				end
			end
		end

	serialise_type_attribute (a_node: DT_ITEM): STRING
			-- output "_type": "xxx", if `full_type_marking_on` set
		do
			create Result.make_empty
			if full_type_marking_on and not is_eif_type_ignored_in_json (a_node.im_type_name) then
				-- output: indent "_type":
				Result.append (format_attr_name (symbol (Sym_json_type_attribute_name)))
				Result.append (symbol (SYM_JSON_EQ))

				-- output the value
				Result.append (primitive_value_to_json_string (eiffel_to_json_type_name (a_node.im_type_name)))
				Result.append (symbol (SYM_JSON_ITEM_DELIMITER))
				Result.append (format_item (FMT_NEWLINE))
			end
		end

end


