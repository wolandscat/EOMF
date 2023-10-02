note
	component:   "Eiffel Object Modelling Framework"
	description: "Serialise ODIN archetype to any syntax format"
	keywords:    "ODIN, serialisation"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class DT_ODIN_SERIALISER

inherit
	DT_SERIALISER
		redefine
			make, reset
		end

	ODIN_TOKENS
		export
			{NONE} all
		end

	DT_DEFINITIONS
		export
			{NONE} all
		end

	STRING_UTILITIES
		export
			{NONE} all
		end

	BASIC_DEFINITIONS
		export
			{NONE} all
		end

create
	make

feature -- Definitions

	Date_time_format_string: STRING = "yyyy-[0]mm-[0]dd [0]hh:[0]mi:[0]ss"
			-- ISO 8601 standard

feature -- Initialisation

	make (a_profile: SERIALISATION_PROFILE)
			-- set profile
		do
			precursor (a_profile)
			create last_string_value.make_empty
		end

feature -- Commands

	reset
			-- set up serialiser
		do
			precursor
			dt_complex_object_completed.wipe_out
		end

feature -- Visitor

	start_complex_object_node (a_node: DT_COMPLEX_OBJECT; depth: INTEGER)
			-- start serialising a DT_COMPLEX_OBJECT_NODE
		local
			terminology_id, code_string, terminology_version: STRING
			term_code: TERMINOLOGY_CODE
		do
			start_object_item (a_node, depth)

			----------------------------------------------------------------------------
			-- if we hit a TERMINOLOGY_CODE, we will output it as a single string; this happens because
			-- TERMINOLOGY_CODE is no longer treated as a DT_PRIMITIVE type, so as to allow it to be serialised
			-- as a regular object in JSON, YAML etc.
			if a_node.has_attribute ("terminology_id") then
				if attached {DT_ATTRIBUTE} a_node.attribute_node ("terminology_id") as dt_attr_term_id and then
					attached {DT_PRIMITIVE_OBJECT} dt_attr_term_id.first_child as dt_prim_obj and then attached {STRING} dt_prim_obj.value as a_str
				then
					terminology_id := a_str
				else
					create terminology_id.make_empty
				end
				if a_node.has_attribute ("terminology_version") and then attached {DT_ATTRIBUTE} a_node.attribute_node ("terminology_version") as dt_attr_term_id and then
					attached {DT_PRIMITIVE_OBJECT} dt_attr_term_id.first_child as dt_prim_obj and then attached {STRING} dt_prim_obj.value as a_str
				then
					terminology_version := a_str
				else
					create terminology_version.make_empty
				end
				if a_node.has_attribute ("code_string") and then attached {DT_ATTRIBUTE} a_node.attribute_node ("code_string") as dt_attr_term_id and then
					attached {DT_PRIMITIVE_OBJECT} dt_attr_term_id.first_child as dt_prim_obj and then attached {STRING} dt_prim_obj.value as a_str
				then
					code_string := a_str
				else
					create code_string.make_empty
				end

				if not terminology_version.is_empty then
					create term_code.make_with_version (terminology_id, terminology_version, code_string)
				else
					create term_code.make (terminology_id, code_string)
				end

				-- now simulate having entered start_primitive_object_node
				last_result.append (symbol (SYM_START_DBLOCK))
				last_result.append (apply_style (primitive_value_to_odin_string(term_code), STYLE_VALUE))

				dt_complex_object_completed.extend(True)
			else
			----------------------------------------------------------------------------

				-- output the type information if required, then the opening '<'
				if a_node.is_typed and (a_node.type_visible or full_type_marking_on or a_node.is_root and output_typed_encapsulated) then
					last_result.append ("(" + eiffel_to_standard_type_name (a_node.im_type_name) + ")" +
							format_item (FMT_SPACE) + symbol(SYM_START_DBLOCK) + format_item (FMT_NEWLINE))
				elseif not a_node.is_root then
					last_result.append (symbol(SYM_START_DBLOCK) + format_item(FMT_NEWLINE))
				end

			----------------------------------------------------------------------------
				dt_complex_object_completed.extend(False)
			end
			----------------------------------------------------------------------------
		end

	end_complex_object_node (a_node: DT_COMPLEX_OBJECT; depth: INTEGER)
			-- end serialising a DT_COMPLEX_OBJECT_NODE
		do
			-----------------------------------------------------------------------				
			-- if we are in a TERMINOLOGY_CODE, we will output it as a single string; this happens because
			-- TERMINOLOGY_CODE is no longer treated as a DT_PRIMITIVE type, so as to allow it to be serialised
			-- as a regular object in JSON, YAML etc.
			if a_node.has_attribute ("terminology_id") then
				last_result.append (symbol (SYM_END_DBLOCK) + format_item(FMT_NEWLINE))
			else
			-----------------------------------------------------------------------

				last_result.append (create_indent (depth//2 + multiple_attr_count))


				if not a_node.is_root or else a_node.is_typed and (a_node.type_visible or full_type_marking_on or output_typed_encapsulated) then
					last_result.append (symbol(SYM_END_DBLOCK) + format_item(FMT_NEWLINE))
				end

			-----------------------------------------------------------------------				
			end
			dt_complex_object_completed.remove
			-----------------------------------------------------------------------					
		end

	start_attribute_node (a_node: DT_ATTRIBUTE; depth: INTEGER)
			-- start serialising a DT_ATTRIBUTE_NODE
		do
			-----------------------------------------------------------------------			
			-- if we hit a TERMINOLOGY_CODE, ignore.
			if not dt_complex_object_completed.item then
			-----------------------------------------------------------------------

				-- don't output anything if nested - generate nested keyed objects only
				if not a_node.is_nested then
					-- output:  indent $attr_name ' ' = ' '
					last_result.append (create_indent (depth//2 + multiple_attr_count))
					last_result.append (apply_style (a_node.im_attr_name, STYLE_IDENTIFIER))
					last_result.append (format_item (FMT_SPACE) + apply_style (symbol (SYM_EQ), STYLE_OPERATOR) + format_item (FMT_SPACE))

					-- if it is a container, first output typing info, if option on
					-- then '<'
					if a_node.is_container_type then
						if a_node.is_typed and (a_node.type_visible or full_type_marking_on) then
							last_result.append ("(" + a_node.im_type_name + ")" + format_item(FMT_SPACE))
						end
						multiple_attr_count := multiple_attr_count + 1
						last_result.append (symbol (SYM_START_DBLOCK) + format_item (FMT_NEWLINE))
					end
				end

			-----------------------------------------------------------------------			
			end
			-----------------------------------------------------------------------			
		end

	end_attribute_node (a_node: DT_ATTRIBUTE; depth: INTEGER)
			-- end serialising an DT_ATTRIBUTE_NODE
		do
			-----------------------------------------------------------------------			
			-- if we hit a TERMINOLOGY_CODE, ignore.
			if not dt_complex_object_completed.item then
			-----------------------------------------------------------------------			

				-- don't output anything if nested - generate nested keyed objects only
				if not a_node.is_nested then
					if a_node.is_container_type then
						multiple_attr_count := multiple_attr_count - 1
						last_result.append (create_indent (depth//2 + multiple_attr_count) + symbol (SYM_END_DBLOCK) + format_item (FMT_NEWLINE))
					end
				end

			-----------------------------------------------------------------------			
			end
			-----------------------------------------------------------------------			
		end

	start_primitive_object (a_node: DT_PRIMITIVE_OBJECT; depth: INTEGER)
			-- start serialising a DT_PRIMITIVE_OBJECT
		do
			-----------------------------------------------------------------------			
			-- if we hit a TERMINOLOGY_CODE, ignore.
			if not dt_complex_object_completed.item then
			-----------------------------------------------------------------------			

			start_object_leaf (a_node, depth)
			last_result.append (apply_style (a_node.as_serialised_string (agent primitive_value_to_odin_string, agent clean), STYLE_VALUE))

			-----------------------------------------------------------------------			
			end
			-----------------------------------------------------------------------						
		end

	end_primitive_object (a_node: DT_PRIMITIVE_OBJECT; depth: INTEGER)
			-- end serialising a DT_PRIMITIVE_OBJECT
		do
			-----------------------------------------------------------------------			
			-- if we hit a TERMINOLOGY_CODE, ignore.
			if not dt_complex_object_completed.item then
			-----------------------------------------------------------------------			

			last_result.append (symbol (SYM_END_DBLOCK) + format_item(FMT_NEWLINE))

			-----------------------------------------------------------------------			
			end
			-----------------------------------------------------------------------						
		end

	start_primitive_object_list (a_node: DT_PRIMITIVE_OBJECT_LIST; depth: INTEGER)
			-- start serialising an DT_PRIMITIVE_OBJECT_LIST
		do
			-----------------------------------------------------------------------			
			-- if we hit a TERMINOLOGY_CODE, ignore.
			if not dt_complex_object_completed.item then
			-----------------------------------------------------------------------			

			start_object_leaf (a_node, depth)
			last_result.append (apply_style (a_node.as_serialised_string (agent primitive_value_to_odin_string, ", ", ", ...", agent clean), STYLE_VALUE))

			-----------------------------------------------------------------------			
			end
			-----------------------------------------------------------------------						
		end

	end_primitive_object_list (a_node: DT_PRIMITIVE_OBJECT_LIST; depth: INTEGER)
			-- end serialising an DT_PRIMITIVE_OBJECT_LIST
		do
			-----------------------------------------------------------------------			
			-- if we hit a TERMINOLOGY_CODE, ignore.
			if not dt_complex_object_completed.item then
			-----------------------------------------------------------------------			

			last_result.append (symbol (SYM_END_DBLOCK) + format_item(FMT_NEWLINE))

			-----------------------------------------------------------------------			
			end
			-----------------------------------------------------------------------						
		end

	start_primitive_object_interval (a_node: DT_PRIMITIVE_OBJECT_INTERVAL; depth: INTEGER)
			-- start serialising a DT_PRIMITIVE_OBJECT_INTERVAL
		do
			-----------------------------------------------------------------------			
			-- if we hit a TERMINOLOGY_CODE, ignore.
			if not dt_complex_object_completed.item then
			-----------------------------------------------------------------------			

			start_object_leaf (a_node, depth)
			last_result.append (apply_style (a_node.as_string, STYLE_VALUE))

			-----------------------------------------------------------------------			
			end
			-----------------------------------------------------------------------						
		end

	end_primitive_object_interval (a_node: DT_PRIMITIVE_OBJECT_INTERVAL; depth: INTEGER)
			-- end serialising a DT_PRIMITIVE_OBJECT_INTERVAL
		do
			-----------------------------------------------------------------------			
			-- if we hit a TERMINOLOGY_CODE, ignore.
			if not dt_complex_object_completed.item then
			-----------------------------------------------------------------------			

			last_result.append (symbol (SYM_END_DBLOCK) + format_item(FMT_NEWLINE))

			-----------------------------------------------------------------------			
			end
			-----------------------------------------------------------------------						
		end

	start_primitive_object_interval_list (a_node: DT_PRIMITIVE_OBJECT_INTERVAL_LIST; depth: INTEGER)
			-- start serialising a DT_OBJECT_SIMPLE
		do
			-----------------------------------------------------------------------			
			-- if we hit a TERMINOLOGY_CODE, ignore.
			if not dt_complex_object_completed.item then
			-----------------------------------------------------------------------			

			start_object_leaf (a_node, depth)
			last_result.append (apply_style (a_node.as_string, STYLE_VALUE))

			-----------------------------------------------------------------------			
			end
			-----------------------------------------------------------------------						
		end

	end_primitive_object_interval_list (a_node: DT_PRIMITIVE_OBJECT_INTERVAL_LIST; depth: INTEGER)
			-- end serialising a DT_OBJECT_SIMPLE
		do
			-----------------------------------------------------------------------			
			-- if we hit a TERMINOLOGY_CODE, ignore.
			if not dt_complex_object_completed.item then
			-----------------------------------------------------------------------			

			last_result.append (symbol (SYM_END_DBLOCK) + format_item(FMT_NEWLINE))

			-----------------------------------------------------------------------			
			end
			-----------------------------------------------------------------------						
		end

	start_object_reference (a_node: DT_OBJECT_REFERENCE; depth: INTEGER)
			-- start serialising a DT_OBJECT_REFERENCE
		do
			-----------------------------------------------------------------------			
			-- if we hit a TERMINOLOGY_CODE, ignore.
			if not dt_complex_object_completed.item then
			-----------------------------------------------------------------------			

			start_object_leaf(a_node, depth)
			last_result.append (apply_style (a_node.as_string, STYLE_VALUE))

			-----------------------------------------------------------------------			
			end
			-----------------------------------------------------------------------						
		end

	end_object_reference (a_node: DT_OBJECT_REFERENCE; depth: INTEGER)
			-- end serialising a DT_OBJECT_REFERENCE
		do
			-----------------------------------------------------------------------			
			-- if we hit a TERMINOLOGY_CODE, ignore.
			if not dt_complex_object_completed.item then
			-----------------------------------------------------------------------			

			last_result.append (symbol (SYM_END_DBLOCK) + format_item(FMT_NEWLINE))

			-----------------------------------------------------------------------			
			end
			-----------------------------------------------------------------------						
		end

	start_object_reference_list (a_node: DT_OBJECT_REFERENCE_LIST; depth: INTEGER)
			-- start serialising a DT_OBJECT_REFERENCE_LIST
		do
			-----------------------------------------------------------------------			
			-- if we hit a TERMINOLOGY_CODE, ignore.
			if not dt_complex_object_completed.item then
			-----------------------------------------------------------------------			

			start_object_leaf (a_node, depth)
			last_result.append (apply_style (a_node.as_string, STYLE_VALUE))

			-----------------------------------------------------------------------			
			end
			-----------------------------------------------------------------------						
		end

	end_object_reference_list (a_node: DT_OBJECT_REFERENCE_LIST; depth: INTEGER)
			-- end serialising a DT_OBJECT_REFERENCE_LIST
		do
			-----------------------------------------------------------------------			
			-- if we hit a TERMINOLOGY_CODE, ignore.
			if not dt_complex_object_completed.item then
			-----------------------------------------------------------------------			

			last_result.append (symbol (SYM_END_DBLOCK) + format_item(FMT_NEWLINE))

			-----------------------------------------------------------------------			
			end
			-----------------------------------------------------------------------						
		end

feature {NONE} -- Implementation

	multiple_attr_count: INTEGER
			-- counter for how many multiple attributes at the current point

	start_object_item (a_node: DT_OBJECT_ITEM; depth: INTEGER)
			-- start serialising a DT_OBJECT_ITEM
		do
			if a_node.is_addressable then
				-- indent
				last_result.append (create_indent (depth//2 + multiple_attr_count))
				-- tag id
				last_result.append (apply_style ("[%"" + clean (a_node.id) + "%"]", STYLE_IDENTIFIER))
				-- ' = '
				last_result.append (format_item (FMT_SPACE) + apply_style (symbol (SYM_EQ), STYLE_OPERATOR) + format_item (FMT_SPACE))
			end
		end

	start_object_leaf (a_node: DT_OBJECT_LEAF; depth: INTEGER)
			-- start serialising a DT_OBJECT_LEAF
		do
			start_object_item (a_node, depth)
			last_result.append (symbol (SYM_START_DBLOCK))
		end

	primitive_value_to_odin_string (a_prim_val: ANY): STRING
			-- generate a string, including ODIN delimiters, e.g. "", '' for strings and chars.
		do
			if attached {STRING_GENERAL} a_prim_val then
				Result := "%"" + a_prim_val.out + "%""
			elseif attached {CHARACTER} a_prim_val or attached {CHARACTER_32} a_prim_val then
				Result := "%'" + a_prim_val.out + "%'"

			-- TERMINOLOGY_CODE will only be received as a DT_PRIMITIVE if it is compiled into
			-- DT_TYPES.dt_primitive_atomic_types; otherwise it will appear as a complex object
			elseif attached {TERMINOLOGY_CODE} a_prim_val then
				Result := "[" + a_prim_val.out + "]"
			else
				Result := primitive_value_out (a_prim_val)
			end
		end

	dt_complex_object_completed: ARRAYED_STACK [BOOLEAN]
			-- flag for current attribute to indicate if processing should stop on a DT_COMPLEX_OBJECT,
		attribute
			create Result.make(0)
		end

end

