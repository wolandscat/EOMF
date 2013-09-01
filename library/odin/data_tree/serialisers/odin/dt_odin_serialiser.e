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
			make
		end

	ODIN_TOKENS
		export
			{NONE} all
		end

	DT_STRING_UTILITIES
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make (a_profile: SERIALISATION_PROFILE)
			-- set profile
		do
			precursor (a_profile)
			create last_string_value.make_empty
		end

feature -- Visitor

	start_complex_object_node (a_node: DT_COMPLEX_OBJECT_NODE; depth: INTEGER)
			-- start serialising a DT_COMPLEX_OBJECT_NODE
		do
			start_object_item (a_node, depth)

			-- output the type information if required, then the opening '<'
			if a_node.is_typed and (a_node.type_visible or full_type_marking_on or a_node.is_root and output_typed_encapsulated) then
				last_result.append ("(" + a_node.im_type_name + ")" + format_item (FMT_SPACE) + symbol(SYM_START_DBLOCK) + format_item (FMT_NEWLINE))
			elseif not a_node.is_root then
				last_result.append (symbol(SYM_START_DBLOCK) + format_item(FMT_NEWLINE))
			end
		end

	end_complex_object_node (a_node: DT_COMPLEX_OBJECT_NODE; depth: INTEGER)
			-- end serialising a DT_COMPLEX_OBJECT_NODE
		do
			last_result.append (create_indent (depth//2 + multiple_attr_count))
			if not a_node.is_root or else a_node.is_typed and (a_node.type_visible or full_type_marking_on or output_typed_encapsulated) then
				last_result.append (symbol(SYM_END_DBLOCK) + format_item(FMT_NEWLINE))
			end
		end

	start_attribute_node (a_node: DT_ATTRIBUTE_NODE; depth: INTEGER)
			-- start serialising a DT_ATTRIBUTE_NODE
		do
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
		end

	end_attribute_node (a_node: DT_ATTRIBUTE_NODE; depth: INTEGER)
			-- end serialising an DT_ATTRIBUTE_NODE
		do
			-- don't output anything if nested - generate nested keyed objects only
			if not a_node.is_nested then
				if a_node.is_container_type then
					multiple_attr_count := multiple_attr_count - 1
					last_result.append (create_indent (depth//2 + multiple_attr_count) + symbol (SYM_END_DBLOCK) + format_item (FMT_NEWLINE))
				end
			end
		end

	start_primitive_object (a_node: DT_PRIMITIVE_OBJECT; depth: INTEGER)
			-- start serialising a DT_PRIMITIVE_OBJECT
		do
			start_object_leaf (a_node, depth)
			last_result.append (apply_style (a_node.as_serialised_string (agent primitive_value_to_odin_string, agent clean), STYLE_VALUE))
		end

	end_primitive_object (a_node: DT_PRIMITIVE_OBJECT; depth: INTEGER)
			-- end serialising a DT_PRIMITIVE_OBJECT
		do
			last_result.append (symbol (SYM_END_DBLOCK) + format_item(FMT_NEWLINE))
		end

	start_primitive_object_list (a_node: DT_PRIMITIVE_OBJECT_LIST; depth: INTEGER)
			-- start serialising an DT_PRIMITIVE_OBJECT_LIST
		do
			start_object_leaf (a_node, depth)
			last_result.append (apply_style (a_node.as_serialised_string (agent primitive_value_to_odin_string, ", ", ", ...", agent clean), STYLE_VALUE))
		end

	end_primitive_object_list (a_node: DT_PRIMITIVE_OBJECT_LIST; depth: INTEGER)
			-- end serialising an DT_PRIMITIVE_OBJECT_LIST
		do
			last_result.append (symbol (SYM_END_DBLOCK) + format_item(FMT_NEWLINE))
		end

	start_primitive_object_interval (a_node: DT_PRIMITIVE_OBJECT_INTERVAL; depth: INTEGER)
			-- start serialising a DT_PRIMITIVE_OBJECT_INTERVAL
		do
			start_object_leaf (a_node, depth)
			last_result.append (apply_style (a_node.as_string, STYLE_VALUE))
		end

	end_primitive_object_interval (a_node: DT_PRIMITIVE_OBJECT_INTERVAL; depth: INTEGER)
			-- end serialising a DT_PRIMITIVE_OBJECT_INTERVAL
		do
			last_result.append (symbol (SYM_END_DBLOCK) + format_item(FMT_NEWLINE))
		end

	start_object_reference (a_node: DT_OBJECT_REFERENCE; depth: INTEGER)
			-- start serialising a DT_OBJECT_REFERENCE
		do
			start_object_leaf(a_node, depth)
			last_result.append (apply_style (a_node.as_string, STYLE_VALUE))
		end

	end_object_reference (a_node: DT_OBJECT_REFERENCE; depth: INTEGER)
			-- end serialising a DT_OBJECT_REFERENCE
		do
			last_result.append (symbol (SYM_END_DBLOCK) + format_item(FMT_NEWLINE))
		end

	start_object_reference_list (a_node: DT_OBJECT_REFERENCE_LIST; depth: INTEGER)
			-- start serialising a DT_OBJECT_REFERENCE_LIST
		do
			start_object_leaf (a_node, depth)
			last_result.append (apply_style (a_node.as_string, STYLE_VALUE))
		end

	end_object_reference_list (a_node: DT_OBJECT_REFERENCE_LIST; depth: INTEGER)
			-- end serialising a DT_OBJECT_REFERENCE_LIST
		do
			last_result.append (symbol (SYM_END_DBLOCK) + format_item(FMT_NEWLINE))
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

end


