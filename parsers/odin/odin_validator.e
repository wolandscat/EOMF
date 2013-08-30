note
	component:   "Eiffel Object Modelling Framework"
	description: "Validating parser for data Archetype Description Language (ODIN)"
	keywords:    "ODIN"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2004- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ODIN_VALIDATOR

inherit
	PARSER_VALIDATOR
		rename
			reset as validator_reset,
			make as make_parser_skeleton
		redefine
			output
		end

	OG_DEFINITIONS
		export
			{NONE} all
		end

	DATE_TIME_ROUTINES
		export
			{NONE} all
		end

	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

	ODIN_SCANNER
		rename
			make as make_scanner
		redefine
			reset
		end

	KL_SHARED_EXCEPTIONS
	KL_SHARED_ARGUMENTS

create
	make


feature {NONE} -- Implementation

	yy_build_parser_tables
			-- Build parser tables.
		do
			yytranslate := yytranslate_template
			yyr1 := yyr1_template
			yytypes1 := yytypes1_template
			yytypes2 := yytypes2_template
			yydefact := yydefact_template
			yydefgoto := yydefgoto_template
			yypact := yypact_template
			yypgoto := yypgoto_template
			yytable := yytable_template
			yycheck := yycheck_template
		end

	yy_create_value_stacks
			-- Create value stacks.
		do
			create yyspecial_routines1
			yyvsc1 := yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.make (yyvsc1)
			create yyspecial_routines2
			yyvsc2 := yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.make (yyvsc2)
			create yyspecial_routines3
			yyvsc3 := yyInitial_yyvs_size
			yyvs3 := yyspecial_routines3.make (yyvsc3)
			create yyspecial_routines4
			yyvsc4 := yyInitial_yyvs_size
			yyvs4 := yyspecial_routines4.make (yyvsc4)
			create yyspecial_routines5
			yyvsc5 := yyInitial_yyvs_size
			yyvs5 := yyspecial_routines5.make (yyvsc5)
			create yyspecial_routines6
			yyvsc6 := yyInitial_yyvs_size
			yyvs6 := yyspecial_routines6.make (yyvsc6)
			create yyspecial_routines7
			yyvsc7 := yyInitial_yyvs_size
			yyvs7 := yyspecial_routines7.make (yyvsc7)
			create yyspecial_routines8
			yyvsc8 := yyInitial_yyvs_size
			yyvs8 := yyspecial_routines8.make (yyvsc8)
			create yyspecial_routines9
			yyvsc9 := yyInitial_yyvs_size
			yyvs9 := yyspecial_routines9.make (yyvsc9)
			create yyspecial_routines10
			yyvsc10 := yyInitial_yyvs_size
			yyvs10 := yyspecial_routines10.make (yyvsc10)
			create yyspecial_routines11
			yyvsc11 := yyInitial_yyvs_size
			yyvs11 := yyspecial_routines11.make (yyvsc11)
			create yyspecial_routines12
			yyvsc12 := yyInitial_yyvs_size
			yyvs12 := yyspecial_routines12.make (yyvsc12)
			create yyspecial_routines13
			yyvsc13 := yyInitial_yyvs_size
			yyvs13 := yyspecial_routines13.make (yyvsc13)
			create yyspecial_routines14
			yyvsc14 := yyInitial_yyvs_size
			yyvs14 := yyspecial_routines14.make (yyvsc14)
			create yyspecial_routines15
			yyvsc15 := yyInitial_yyvs_size
			yyvs15 := yyspecial_routines15.make (yyvsc15)
			create yyspecial_routines16
			yyvsc16 := yyInitial_yyvs_size
			yyvs16 := yyspecial_routines16.make (yyvsc16)
			create yyspecial_routines17
			yyvsc17 := yyInitial_yyvs_size
			yyvs17 := yyspecial_routines17.make (yyvsc17)
			create yyspecial_routines18
			yyvsc18 := yyInitial_yyvs_size
			yyvs18 := yyspecial_routines18.make (yyvsc18)
			create yyspecial_routines19
			yyvsc19 := yyInitial_yyvs_size
			yyvs19 := yyspecial_routines19.make (yyvsc19)
			create yyspecial_routines20
			yyvsc20 := yyInitial_yyvs_size
			yyvs20 := yyspecial_routines20.make (yyvsc20)
			create yyspecial_routines21
			yyvsc21 := yyInitial_yyvs_size
			yyvs21 := yyspecial_routines21.make (yyvsc21)
			create yyspecial_routines22
			yyvsc22 := yyInitial_yyvs_size
			yyvs22 := yyspecial_routines22.make (yyvsc22)
			create yyspecial_routines23
			yyvsc23 := yyInitial_yyvs_size
			yyvs23 := yyspecial_routines23.make (yyvsc23)
			create yyspecial_routines24
			yyvsc24 := yyInitial_yyvs_size
			yyvs24 := yyspecial_routines24.make (yyvsc24)
			create yyspecial_routines25
			yyvsc25 := yyInitial_yyvs_size
			yyvs25 := yyspecial_routines25.make (yyvsc25)
			create yyspecial_routines26
			yyvsc26 := yyInitial_yyvs_size
			yyvs26 := yyspecial_routines26.make (yyvsc26)
			create yyspecial_routines27
			yyvsc27 := yyInitial_yyvs_size
			yyvs27 := yyspecial_routines27.make (yyvsc27)
			create yyspecial_routines28
			yyvsc28 := yyInitial_yyvs_size
			yyvs28 := yyspecial_routines28.make (yyvsc28)
			create yyspecial_routines29
			yyvsc29 := yyInitial_yyvs_size
			yyvs29 := yyspecial_routines29.make (yyvsc29)
			create yyspecial_routines30
			yyvsc30 := yyInitial_yyvs_size
			yyvs30 := yyspecial_routines30.make (yyvsc30)
			create yyspecial_routines31
			yyvsc31 := yyInitial_yyvs_size
			yyvs31 := yyspecial_routines31.make (yyvsc31)
			create yyspecial_routines32
			yyvsc32 := yyInitial_yyvs_size
			yyvs32 := yyspecial_routines32.make (yyvsc32)
			create yyspecial_routines33
			yyvsc33 := yyInitial_yyvs_size
			yyvs33 := yyspecial_routines33.make (yyvsc33)
			create yyspecial_routines34
			yyvsc34 := yyInitial_yyvs_size
			yyvs34 := yyspecial_routines34.make (yyvsc34)
			create yyspecial_routines35
			yyvsc35 := yyInitial_yyvs_size
			yyvs35 := yyspecial_routines35.make (yyvsc35)
		end

	yy_init_value_stacks
			-- Initialize value stacks.
		do
			yyvsp1 := -1
			yyvsp2 := -1
			yyvsp3 := -1
			yyvsp4 := -1
			yyvsp5 := -1
			yyvsp6 := -1
			yyvsp7 := -1
			yyvsp8 := -1
			yyvsp9 := -1
			yyvsp10 := -1
			yyvsp11 := -1
			yyvsp12 := -1
			yyvsp13 := -1
			yyvsp14 := -1
			yyvsp15 := -1
			yyvsp16 := -1
			yyvsp17 := -1
			yyvsp18 := -1
			yyvsp19 := -1
			yyvsp20 := -1
			yyvsp21 := -1
			yyvsp22 := -1
			yyvsp23 := -1
			yyvsp24 := -1
			yyvsp25 := -1
			yyvsp26 := -1
			yyvsp27 := -1
			yyvsp28 := -1
			yyvsp29 := -1
			yyvsp30 := -1
			yyvsp31 := -1
			yyvsp32 := -1
			yyvsp33 := -1
			yyvsp34 := -1
			yyvsp35 := -1
		end

	yy_clear_value_stacks
			-- Clear objects in semantic value stacks so that
			-- they can be collected by the garbage collector.
		do
			yyvs1.keep_head (0)
			yyvs2.keep_head (0)
			yyvs3.keep_head (0)
			yyvs4.keep_head (0)
			yyvs5.keep_head (0)
			yyvs6.keep_head (0)
			yyvs7.keep_head (0)
			yyvs8.keep_head (0)
			yyvs9.keep_head (0)
			yyvs10.keep_head (0)
			yyvs11.keep_head (0)
			yyvs12.keep_head (0)
			yyvs13.keep_head (0)
			yyvs14.keep_head (0)
			yyvs15.keep_head (0)
			yyvs16.keep_head (0)
			yyvs17.keep_head (0)
			yyvs18.keep_head (0)
			yyvs19.keep_head (0)
			yyvs20.keep_head (0)
			yyvs21.keep_head (0)
			yyvs22.keep_head (0)
			yyvs23.keep_head (0)
			yyvs24.keep_head (0)
			yyvs25.keep_head (0)
			yyvs26.keep_head (0)
			yyvs27.keep_head (0)
			yyvs28.keep_head (0)
			yyvs29.keep_head (0)
			yyvs30.keep_head (0)
			yyvs31.keep_head (0)
			yyvs32.keep_head (0)
			yyvs33.keep_head (0)
			yyvs34.keep_head (0)
			yyvs35.keep_head (0)
		end

	yy_push_last_value (yychar1: INTEGER)
			-- Push semantic value associated with token `last_token'
			-- (with internal id `yychar1') on top of corresponding
			-- value stack.
		do
			inspect yytypes2.item (yychar1)
			when 1 then
				yyvsp1 := yyvsp1 + 1
				if yyvsp1 >= yyvsc1 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs1")
					end
					yyvsc1 := yyvsc1 + yyInitial_yyvs_size
					yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
				end
				if attached last_detachable_any_value as yyl_last_detachable_any_value then
					yyspecial_routines1.force (yyvs1, yyl_last_detachable_any_value, yyvsp1)
				else
					yyspecial_routines1.force (yyvs1, ({detachable ANY}).default, yyvsp1)
				end
			when 2 then
				yyvsp2 := yyvsp2 + 1
				if yyvsp2 >= yyvsc2 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs2")
					end
					yyvsc2 := yyvsc2 + yyInitial_yyvs_size
					yyvs2 := yyspecial_routines2.aliased_resized_area (yyvs2, yyvsc2)
				end
				if attached last_integer_value as yyl_last_integer_value then
					yyspecial_routines2.force (yyvs2, yyl_last_integer_value, yyvsp2)
				else
					yyspecial_routines2.force (yyvs2, ({INTEGER}).default, yyvsp2)
				end
			when 3 then
				yyvsp3 := yyvsp3 + 1
				if yyvsp3 >= yyvsc3 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs3")
					end
					yyvsc3 := yyvsc3 + yyInitial_yyvs_size
					yyvs3 := yyspecial_routines3.aliased_resized_area (yyvs3, yyvsc3)
				end
				if attached last_real_value as yyl_last_real_value then
					yyspecial_routines3.force (yyvs3, yyl_last_real_value, yyvsp3)
				else
					yyspecial_routines3.force (yyvs3, ({REAL}).default, yyvsp3)
				end
			when 4 then
				yyvsp4 := yyvsp4 + 1
				if yyvsp4 >= yyvsc4 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs4")
					end
					yyvsc4 := yyvsc4 + yyInitial_yyvs_size
					yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
				end
				if attached last_string_value as yyl_last_string_value then
					yyspecial_routines4.force (yyvs4, yyl_last_string_value, yyvsp4)
				else
					yyspecial_routines4.force (yyvs4, ({STRING}).default, yyvsp4)
				end
			when 5 then
				yyvsp5 := yyvsp5 + 1
				if yyvsp5 >= yyvsc5 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs5")
					end
					yyvsc5 := yyvsc5 + yyInitial_yyvs_size
					yyvs5 := yyspecial_routines5.aliased_resized_area (yyvs5, yyvsc5)
				end
				if attached last_character_value as yyl_last_character_value then
					yyspecial_routines5.force (yyvs5, yyl_last_character_value, yyvsp5)
				else
					yyspecial_routines5.force (yyvs5, ({CHARACTER}).default, yyvsp5)
				end
			else
				debug ("GEYACC")
					std.error.put_string ("Error in parser: not a token type: ")
					std.error.put_integer (yytypes2.item (yychar1))
					std.error.put_new_line
				end
				abort
			end
		end

	yy_push_error_value
			-- Push semantic value associated with token 'error'
			-- on top of corresponding value stack.
		local
			yyval1: detachable ANY
		do
			yyvsp1 := yyvsp1 + 1
			if yyvsp1 >= yyvsc1 then
				debug ("GEYACC")
					std.error.put_line ("Resize yyvs1")
				end
				yyvsc1 := yyvsc1 + yyInitial_yyvs_size
				yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
			end
			yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
		end

	yy_pop_last_value (yystate: INTEGER)
			-- Pop semantic value from stack when in state `yystate'.
		local
			yy_type_id: INTEGER
		do
			yy_type_id := yytypes1.item (yystate)
			inspect yy_type_id
			when 1 then
				yyvsp1 := yyvsp1 - 1
			when 2 then
				yyvsp2 := yyvsp2 - 1
			when 3 then
				yyvsp3 := yyvsp3 - 1
			when 4 then
				yyvsp4 := yyvsp4 - 1
			when 5 then
				yyvsp5 := yyvsp5 - 1
			when 6 then
				yyvsp6 := yyvsp6 - 1
			when 7 then
				yyvsp7 := yyvsp7 - 1
			when 8 then
				yyvsp8 := yyvsp8 - 1
			when 9 then
				yyvsp9 := yyvsp9 - 1
			when 10 then
				yyvsp10 := yyvsp10 - 1
			when 11 then
				yyvsp11 := yyvsp11 - 1
			when 12 then
				yyvsp12 := yyvsp12 - 1
			when 13 then
				yyvsp13 := yyvsp13 - 1
			when 14 then
				yyvsp14 := yyvsp14 - 1
			when 15 then
				yyvsp15 := yyvsp15 - 1
			when 16 then
				yyvsp16 := yyvsp16 - 1
			when 17 then
				yyvsp17 := yyvsp17 - 1
			when 18 then
				yyvsp18 := yyvsp18 - 1
			when 19 then
				yyvsp19 := yyvsp19 - 1
			when 20 then
				yyvsp20 := yyvsp20 - 1
			when 21 then
				yyvsp21 := yyvsp21 - 1
			when 22 then
				yyvsp22 := yyvsp22 - 1
			when 23 then
				yyvsp23 := yyvsp23 - 1
			when 24 then
				yyvsp24 := yyvsp24 - 1
			when 25 then
				yyvsp25 := yyvsp25 - 1
			when 26 then
				yyvsp26 := yyvsp26 - 1
			when 27 then
				yyvsp27 := yyvsp27 - 1
			when 28 then
				yyvsp28 := yyvsp28 - 1
			when 29 then
				yyvsp29 := yyvsp29 - 1
			when 30 then
				yyvsp30 := yyvsp30 - 1
			when 31 then
				yyvsp31 := yyvsp31 - 1
			when 32 then
				yyvsp32 := yyvsp32 - 1
			when 33 then
				yyvsp33 := yyvsp33 - 1
			when 34 then
				yyvsp34 := yyvsp34 - 1
			when 35 then
				yyvsp35 := yyvsp35 - 1
			else
				debug ("GEYACC")
					std.error.put_string ("Error in parser: unknown type id: ")
					std.error.put_integer (yy_type_id)
					std.error.put_new_line
				end
				abort
			end
		end

	yy_run_geyacc
			-- You must run geyacc to regenerate this class.
		do
		end

feature {NONE} -- Semantic actions

	yy_do_action (yy_act: INTEGER)
			-- Execute semantic action.
		local
			yyval1: detachable ANY
			yyval13: detachable DT_COMPLEX_OBJECT_NODE
			yyval14: detachable DT_OBJECT_LEAF
			yyval28: detachable ARRAYED_LIST [ANY]
			yyval35: detachable INTERVAL [PART_COMPARABLE]
			yyval4: STRING
			yyval18: detachable ARRAYED_LIST [STRING]
			yyval2: INTEGER
			yyval19: detachable ARRAYED_LIST [INTEGER]
			yyval29: detachable INTERVAL [INTEGER]
			yyval3: REAL
			yyval20: detachable ARRAYED_LIST [REAL]
			yyval30: detachable INTERVAL [REAL]
			yyval6: BOOLEAN
			yyval22: detachable ARRAYED_LIST [BOOLEAN]
			yyval5: CHARACTER
			yyval21: detachable ARRAYED_LIST [CHARACTER]
			yyval7: detachable ISO8601_DATE
			yyval23: detachable ARRAYED_LIST [ISO8601_DATE]
			yyval32: detachable INTERVAL [ISO8601_DATE]
			yyval9: detachable ISO8601_TIME
			yyval24: detachable ARRAYED_LIST [ISO8601_TIME]
			yyval31: detachable INTERVAL [ISO8601_TIME]
			yyval8: detachable ISO8601_DATE_TIME
			yyval25: detachable ARRAYED_LIST [ISO8601_DATE_TIME]
			yyval33: detachable INTERVAL [ISO8601_DATE_TIME]
			yyval10: detachable ISO8601_DURATION
			yyval26: detachable ARRAYED_LIST [ISO8601_DURATION]
			yyval34: detachable INTERVAL [ISO8601_DURATION]
			yyval11: detachable TERMINOLOGY_CODE
			yyval27: detachable ARRAYED_LIST [TERMINOLOGY_CODE]
			yyval12: detachable URI
			yyval17: ARRAYED_LIST [OG_PATH]
			yyval15: detachable OG_PATH
			yyval16: detachable OG_PATH_ITEM
		do
			inspect yy_act
when 1 then
--|#line 116 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 116")
end

			output := complex_object_nodes.item
debug("ODIN_parse")
	io.put_string("Object data definition validated (non-delimited)%N")
end
			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 2 then
--|#line 124 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 124")
end

			output := yyvs13.item (yyvsp13)
debug("ODIN_parse")
	io.put_string("Object data definition validated%N")
end
			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp13 := yyvsp13 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 3 then
--|#line 132 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 132")
end

debug("ODIN_parse")
	io.put_string("ODIN text NOT validated%N")
end
			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 4 then
--|#line 144 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 144")
end

debug("ODIN_parse")
	io.put_string(indent + "attr_val complete%N")
end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 5 then
--|#line 150 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 150")
end

debug("ODIN_parse")
	io.put_string(indent + "attr_val complete%N")
end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 6 then
--|#line 156 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 156")
end

debug("ODIN_parse")
	io.put_string(indent + "attr_val complete%N")
end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 7 then
--|#line 165 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 165")
end

debug("ODIN_parse")
	io.put_string(indent + "attr_val: POP attr node (" +  attr_nodes.item.im_attr_name+ ")%N")
	indent.remove_tail(1)
end
			attr_nodes.remove
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 8 then
--|#line 175 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 175")
end

			-- create first anonymous object
			if complex_object_nodes.is_empty then
debug("ODIN_parse")
	io.put_string(indent + "attr_id: create complex_object_node.make_anonymous%N")
	io.put_string(indent + "attr_id: PUSH Object node%N")
	indent.append("%T")
end
				create complex_object_node.make_anonymous
				complex_object_nodes.extend(complex_object_node)
			end

debug("ODIN_parse")
	io.put_string(indent + "attr_id: create_attr_node.make_single(<<" + yyvs4.item (yyvsp4) + ">>)%N")
end
			create attr_node.make_single(yyvs4.item (yyvsp4))

debug("ODIN_parse")
	io.put_string(indent + "attr_id: complex_object_nodes.item(" + complex_object_nodes.item.id + 
			").put_attribute(<<" + attr_node.im_attr_name + ">>)%N")
end
			if not complex_object_nodes.item.has_attribute(attr_node.im_attr_name) then
				complex_object_nodes.item.put_attribute(attr_node)
			else
				abort_with_error (ec_VDATU, <<attr_node.im_attr_name>>)
			end

debug("ODIN_parse")
	io.put_string(indent + "attr_id: PUSH attr node%N")
	indent.append("%T")
end
			attr_nodes.extend(attr_node)
			obj_key := Void
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 9 then
--|#line 210 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 210")
end

			abort_with_error (ec_SDAT, Void)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 10 then
--|#line 219 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 219")
end

			-- if object_block was an empty object then get rid of it from parent attribute
			if complex_object_nodes.item.is_empty then
				attr_nodes.item.remove_child (complex_object_nodes.item)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp13 := yyvsp13 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 11 then
--|#line 226 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 226")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp14 := yyvsp14 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 12 then
--|#line 227 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 227")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp14 := yyvsp14 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 13 then
--|#line 228 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 228")
end

			-- for single-valued attributes, remove the attribute
			if not attached obj_key then
				complex_object_nodes.item.remove_attribute(attr_node.im_attr_name)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 14 then
--|#line 237 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 237")
end

			yyval13 := yyvs13.item (yyvsp13)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 15 then
--|#line 241 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 241")
end

			yyval13 := yyvs13.item (yyvsp13)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 16 then
--|#line 250 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 250")
end

			yyval13 := yyvs13.item (yyvsp13)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 17 then
--|#line 254 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 254")
end

			-- probably should set type name on owning attribute - it doesn't belong on each 
			-- object, since it is essentially a constraint
			yyval13 := yyvs13.item (yyvsp13)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 -1
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 18 then
--|#line 273 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 273")
end

			-- if the keyed_objects were all empty, then the attribute can be thrown away 
			-- as well, since we don't create void object structures
			if attr_nodes.item.is_empty then
				attr_nodes.item.parent.remove_attribute (attr_nodes.item.im_attr_name)
			end

			-- if the current C_ATTRIBUTE_NODE is a synthesised one, under a keyed object,
			-- then pop it off the attribute stack, and also pop off its parent object
			if complex_object_nodes.item.is_addressable and attr_nodes.item.is_nested then
				-- pop the generic attr node
debug("ODIN_parse")
	io.put_string(indent + "container_attr_object_block: POP attr node (" +  
		attr_nodes.item.im_attr_name+ ")%N")
	indent.remove_tail(1)
end
				attr_nodes.remove

debug("ODIN_parse")
	io.put_string(indent + "container_attr_object_block: POP Object node(" + 
		complex_object_nodes.item.id + ")%N")
	indent.remove_tail(1)
end
				yyval13 := complex_object_nodes.item
				complex_object_nodes.remove
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp13 := yyvsp13 + 1
	yyvsp1 := yyvsp1 -3
	if yyvsp13 >= yyvsc13 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs13")
		end
		yyvsc13 := yyvsc13 + yyInitial_yyvs_size
		yyvs13 := yyspecial_routines13.aliased_resized_area (yyvs13, yyvsc13)
	end
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 19 then
--|#line 325 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 325")
end

			-- if obj_key is set, it means we are inside a keyed object, and we have hit more keyed objects
			if attached obj_key as att_obj_key then
				create complex_object_node.make_identified (att_obj_key)
				if not attr_nodes.item.has_child_with_id (complex_object_node.id) then
debug("ODIN_parse")
	io.put_string(indent + "container_attr_object_block_head; attr_nodes(<<" + 
		attr_nodes.item.im_attr_name + ">>).item.put_child(complex_object_node(" + 
		complex_object_node.id + "))%N")
end
					attr_nodes.item.put_child (complex_object_node)
				else
					abort_with_error (ec_VOKU, <<complex_object_node.id, attr_nodes.item.im_attr_name >>)
				end

debug("ODIN_parse")
	io.put_string(indent + "container_attr_object_block_head: PUSH Obj node%N")
	indent.append("%T")
end
				complex_object_nodes.extend(complex_object_node)

				-- now create a generic attribute node to stand for the hidden attribute of the 
				-- generic object, e.g. it might be List<T>.items or whatever
debug("ODIN_parse")
	io.put_string(indent + "container_attr_object_block_head: create_attr_node.make_nested_container%N")
end
				create attr_node.make_nested_container

debug("ODIN_parse")
	io.put_string(indent + "container_attr_object_block_head: complex_object_node(" + 
			complex_object_node.id + ").put_attribute(" + attr_node.im_attr_name + ")%N")
end
				complex_object_node.put_attribute(attr_node)

debug("ODIN_parse")
	io.put_string(indent + "container_attr_object_block_head: PUSH attr node%N")
	indent.append("%T")
end
				attr_nodes.extend(attr_node)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 20 then
--|#line 369 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 369")
end

debug("ODIN_parse")
	io.put_string(indent + "one keyed object%N")
end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 21 then
--|#line 375 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 375")
end

debug("ODIN_parse")
	io.put_string(indent + "multiple keyed objects%N")
end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 22 then
--|#line 383 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 383")
end

debug("ODIN_parse")
	io.put_string(indent + "(keyed object)%N")
end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 23 then
--|#line 391 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 391")
end

			obj_key := yyvs1.item (yyvsp1 - 1).out

debug("ODIN_parse")
	check attached obj_key as att_obj_key then
		io.put_string(indent + "object_key: " + att_obj_key + 
			" (setting " + attr_nodes.item.im_attr_name + " to Multiple)%N")
	end
end
			if not attr_nodes.is_empty then
				attr_nodes.item.set_container_type
			else
				abort_with_error (ec_SGEE, <<attr_node.im_attr_name>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 24 then
--|#line 413 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 413")
end

debug("ODIN_parse")
	io.put_string(indent + "untyped single_attr_object_block%N")
end
			yyval13 := yyvs13.item (yyvsp13)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 25 then
--|#line 420 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 420")
end

debug("ODIN_parse")
	io.put_string(indent + "typed single_attr_object_block; type = " + yyvs4.item (yyvsp4) + "%N")
end
			yyvs13.item (yyvsp13).set_visible_type_name(yyvs4.item (yyvsp4))
			yyval13 := yyvs13.item (yyvsp13)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 -1
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 26 then
--|#line 438 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 438")
end

debug("ODIN_parse")
	io.put_string(indent + "single_attr_object_complex_block: POP Object node(" + 
		complex_object_nodes.item.id + ")%N")
	indent.remove_tail(1)
end
			yyval13 := complex_object_nodes.item
			complex_object_nodes.remove
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp13 := yyvsp13 + 1
	yyvsp1 := yyvsp1 -3
	if yyvsp13 >= yyvsc13 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs13")
		end
		yyvsc13 := yyvsc13 + yyInitial_yyvs_size
		yyvs13 := yyspecial_routines13.aliased_resized_area (yyvs13, yyvsc13)
	end
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 27 then
--|#line 450 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 450")
end

			-- if parent attr is not multiple, create an anon object; else an object identified by a key
			if attr_nodes.is_empty or else not attr_nodes.item.is_container_type then
debug("ODIN_parse")
	io.put_string(indent + "single_attr_object_complex_head: create complex_object_node.make_anonymous%N")
end
				create complex_object_node.make_anonymous
			elseif attached obj_key as att_obj_key then
debug("ODIN_parse")
	io.put_string(indent + "single_attr_object_complex_head: create complex_object_node.make (" + att_obj_key + ")%N")
end
				create complex_object_node.make_identified (att_obj_key)
				obj_key := Void
			end

			-- now put the new object under its attribute, if one exists
			if not attr_nodes.is_empty then
				if not attr_nodes.item.has_child_with_id(complex_object_node.id) then
debug("ODIN_parse")
	io.put_string(indent + "single_attr_object_complex_head: attr_nodes(<<" + 
		attr_nodes.item.im_attr_name + ">>).item.put_child(complex_object_node(" + 
		complex_object_node.id + "))%N")
end
					attr_nodes.item.put_child(complex_object_node)
				else
					abort_with_error (ec_VOKU, <<complex_object_node.id, attr_nodes.item.im_attr_name >>)
				end
			end

			-- finally, put the new object on the object stack
debug("ODIN_parse")
	io.put_string(indent + "single_attr_object_complex_head: PUSH Obj node%N")
	indent.append("%T")
end
			complex_object_nodes.extend(complex_object_node)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 28 then
--|#line 492 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 492")
end

debug("ODIN_parse")
	io.put_string(indent + "untyped primitive_object_block%N")
end
			yyval14 := yyvs14.item (yyvsp14)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 29 then
--|#line 499 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 499")
end

debug("ODIN_parse")
	io.put_string(indent + "typed primitive_object_block; type = " + yyvs4.item (yyvsp4) + "%N")
end
			if attached yyvs4.item (yyvsp4) as att_type_id and attached yyvs14.item (yyvsp14) as att_ut_pob then
				att_ut_pob.set_visible_type_name(att_type_id)
				yyval14 := att_ut_pob
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 -1
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 30 then
--|#line 515 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 515")
end

			if attached yyvs14.item (yyvsp14) as att_po then
debug("ODIN_parse")
	io.put_string(indent + "untyped_primitive_object_block; attr_nodes(<<" + 
			attr_nodes.item.im_attr_name + ">>).item.put_child(<<" + 
			att_po.as_string + ">>)%N")
end
				if not attr_nodes.item.has_child_with_id(att_po.id) then
					attr_nodes.item.put_child(att_po)
					yyval14 := att_po
				else
					abort_with_error (ec_VOKU, <<att_po.id, attr_nodes.item.im_attr_name >>)
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 31 then
--|#line 533 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 533")
end

			if attached yyvs1.item (yyvsp1) as att_pv then
				if attached obj_key as att_obj_key then
					create {DT_PRIMITIVE_OBJECT} yyval14.make_identified (att_pv, att_obj_key)
					obj_key := Void
				else
					create {DT_PRIMITIVE_OBJECT} yyval14.make_anonymous (att_pv)
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp14 := yyvsp14 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp14 >= yyvsc14 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs14")
		end
		yyvsc14 := yyvsc14 + yyInitial_yyvs_size
		yyvs14 := yyspecial_routines14.aliased_resized_area (yyvs14, yyvsc14)
	end
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 32 then
--|#line 544 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 544")
end

			if attached yyvs28.item (yyvsp28) as att_plv then
				if attached obj_key as att_obj_key then
					create {DT_PRIMITIVE_OBJECT_LIST} yyval14.make_identified (att_plv, att_obj_key)
					obj_key := Void
				else
					create {DT_PRIMITIVE_OBJECT_LIST} yyval14.make_anonymous (att_plv)
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp14 := yyvsp14 + 1
	yyvsp28 := yyvsp28 -1
	if yyvsp14 >= yyvsc14 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs14")
		end
		yyvsc14 := yyvsc14 + yyInitial_yyvs_size
		yyvs14 := yyspecial_routines14.aliased_resized_area (yyvs14, yyvsc14)
	end
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 33 then
--|#line 555 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 555")
end

			if attached yyvs35.item (yyvsp35) as att_piv then
				if attached obj_key as att_obj_key then
					create {DT_PRIMITIVE_OBJECT_INTERVAL} yyval14.make_identified (att_piv, att_obj_key)
					obj_key := Void
				else
					create {DT_PRIMITIVE_OBJECT_INTERVAL} yyval14.make_anonymous (att_piv)
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp14 := yyvsp14 + 1
	yyvsp35 := yyvsp35 -1
	if yyvsp14 >= yyvsc14 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs14")
		end
		yyvsc14 := yyvsc14 + yyInitial_yyvs_size
		yyvs14 := yyspecial_routines14.aliased_resized_area (yyvs14, yyvsc14)
	end
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 34 then
--|#line 566 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 566")
end

			if attached yyvs11.item (yyvsp11) as att_tc then
				if attached obj_key as att_obj_key then
					create {DT_PRIMITIVE_OBJECT} yyval14.make_identified (att_tc, att_obj_key)
					obj_key := Void
				else
					create {DT_PRIMITIVE_OBJECT} yyval14.make_anonymous (att_tc)
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp14 := yyvsp14 + 1
	yyvsp11 := yyvsp11 -1
	if yyvsp14 >= yyvsc14 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs14")
		end
		yyvsc14 := yyvsc14 + yyInitial_yyvs_size
		yyvs14 := yyspecial_routines14.aliased_resized_area (yyvs14, yyvsc14)
	end
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 35 then
--|#line 577 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 577")
end

			if attached yyvs27.item (yyvsp27) as att_tclv then
				if attached obj_key as att_obj_key then
					create {DT_PRIMITIVE_OBJECT_LIST} yyval14.make_identified (att_tclv, att_obj_key)
					obj_key := Void
				else
					create {DT_PRIMITIVE_OBJECT_LIST} yyval14.make_anonymous (att_tclv)
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp14 := yyvsp14 + 1
	yyvsp27 := yyvsp27 -1
	if yyvsp14 >= yyvsc14 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs14")
		end
		yyvsc14 := yyvsc14 + yyInitial_yyvs_size
		yyvs14 := yyspecial_routines14.aliased_resized_area (yyvs14, yyvsc14)
	end
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 36 then
--|#line 590 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 590")
end

			yyval1 := yyvs1.item (yyvsp1)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 37 then
--|#line 594 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 594")
end

			yyval1 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 38 then
--|#line 598 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 598")
end

			yyval1 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp3 := yyvsp3 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 39 then
--|#line 602 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 602")
end

			yyval1 := yyvs6.item (yyvsp6)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp6 := yyvsp6 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 40 then
--|#line 606 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 606")
end

			yyval1 := yyvs5.item (yyvsp5)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp5 := yyvsp5 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 41 then
--|#line 610 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 610")
end

			yyval1 := yyvs7.item (yyvsp7)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp7 := yyvsp7 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 42 then
--|#line 614 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 614")
end

			yyval1 := yyvs9.item (yyvsp9)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp9 := yyvsp9 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 43 then
--|#line 618 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 618")
end

			yyval1 := yyvs8.item (yyvsp8)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp8 := yyvsp8 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 44 then
--|#line 622 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 622")
end

			yyval1 := yyvs10.item (yyvsp10)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp10 := yyvsp10 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 45 then
--|#line 626 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 626")
end

			yyval1 := yyvs12.item (yyvsp12)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp12 := yyvsp12 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 46 then
--|#line 632 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 632")
end

			yyval28 := yyvs18.item (yyvsp18)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp28 := yyvsp28 + 1
	yyvsp18 := yyvsp18 -1
	if yyvsp28 >= yyvsc28 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs28")
		end
		yyvsc28 := yyvsc28 + yyInitial_yyvs_size
		yyvs28 := yyspecial_routines28.aliased_resized_area (yyvs28, yyvsc28)
	end
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
when 47 then
--|#line 636 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 636")
end

			yyval28 := yyvs19.item (yyvsp19)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp28 := yyvsp28 + 1
	yyvsp19 := yyvsp19 -1
	if yyvsp28 >= yyvsc28 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs28")
		end
		yyvsc28 := yyvsc28 + yyInitial_yyvs_size
		yyvs28 := yyspecial_routines28.aliased_resized_area (yyvs28, yyvsc28)
	end
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
when 48 then
--|#line 640 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 640")
end

			yyval28 := yyvs20.item (yyvsp20)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp28 := yyvsp28 + 1
	yyvsp20 := yyvsp20 -1
	if yyvsp28 >= yyvsc28 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs28")
		end
		yyvsc28 := yyvsc28 + yyInitial_yyvs_size
		yyvs28 := yyspecial_routines28.aliased_resized_area (yyvs28, yyvsc28)
	end
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
when 49 then
--|#line 644 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 644")
end

			yyval28 := yyvs22.item (yyvsp22)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp28 := yyvsp28 + 1
	yyvsp22 := yyvsp22 -1
	if yyvsp28 >= yyvsc28 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs28")
		end
		yyvsc28 := yyvsc28 + yyInitial_yyvs_size
		yyvs28 := yyspecial_routines28.aliased_resized_area (yyvs28, yyvsc28)
	end
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
when 50 then
--|#line 648 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 648")
end

			yyval28 := yyvs21.item (yyvsp21)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp28 := yyvsp28 + 1
	yyvsp21 := yyvsp21 -1
	if yyvsp28 >= yyvsc28 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs28")
		end
		yyvsc28 := yyvsc28 + yyInitial_yyvs_size
		yyvs28 := yyspecial_routines28.aliased_resized_area (yyvs28, yyvsc28)
	end
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
when 51 then
--|#line 652 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 652")
end

			yyval28 := yyvs23.item (yyvsp23)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp28 := yyvsp28 + 1
	yyvsp23 := yyvsp23 -1
	if yyvsp28 >= yyvsc28 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs28")
		end
		yyvsc28 := yyvsc28 + yyInitial_yyvs_size
		yyvs28 := yyspecial_routines28.aliased_resized_area (yyvs28, yyvsc28)
	end
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
when 52 then
--|#line 656 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 656")
end

			yyval28 := yyvs24.item (yyvsp24)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp28 := yyvsp28 + 1
	yyvsp24 := yyvsp24 -1
	if yyvsp28 >= yyvsc28 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs28")
		end
		yyvsc28 := yyvsc28 + yyInitial_yyvs_size
		yyvs28 := yyspecial_routines28.aliased_resized_area (yyvs28, yyvsc28)
	end
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
when 53 then
--|#line 660 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 660")
end

			yyval28 := yyvs25.item (yyvsp25)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp28 := yyvsp28 + 1
	yyvsp25 := yyvsp25 -1
	if yyvsp28 >= yyvsc28 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs28")
		end
		yyvsc28 := yyvsc28 + yyInitial_yyvs_size
		yyvs28 := yyspecial_routines28.aliased_resized_area (yyvs28, yyvsc28)
	end
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
when 54 then
--|#line 664 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 664")
end

			yyval28 := yyvs26.item (yyvsp26)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp28 := yyvsp28 + 1
	yyvsp26 := yyvsp26 -1
	if yyvsp28 >= yyvsc28 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs28")
		end
		yyvsc28 := yyvsc28 + yyInitial_yyvs_size
		yyvs28 := yyspecial_routines28.aliased_resized_area (yyvs28, yyvsc28)
	end
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
when 55 then
--|#line 670 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 670")
end

			yyval35 := yyvs29.item (yyvsp29)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp35 := yyvsp35 + 1
	yyvsp29 := yyvsp29 -1
	if yyvsp35 >= yyvsc35 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs35")
		end
		yyvsc35 := yyvsc35 + yyInitial_yyvs_size
		yyvs35 := yyspecial_routines35.aliased_resized_area (yyvs35, yyvsc35)
	end
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
when 56 then
--|#line 674 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 674")
end

			yyval35 := yyvs30.item (yyvsp30)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp35 := yyvsp35 + 1
	yyvsp30 := yyvsp30 -1
	if yyvsp35 >= yyvsc35 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs35")
		end
		yyvsc35 := yyvsc35 + yyInitial_yyvs_size
		yyvs35 := yyspecial_routines35.aliased_resized_area (yyvs35, yyvsc35)
	end
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
when 57 then
--|#line 678 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 678")
end

			yyval35 := yyvs32.item (yyvsp32)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp35 := yyvsp35 + 1
	yyvsp32 := yyvsp32 -1
	if yyvsp35 >= yyvsc35 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs35")
		end
		yyvsc35 := yyvsc35 + yyInitial_yyvs_size
		yyvs35 := yyspecial_routines35.aliased_resized_area (yyvs35, yyvsc35)
	end
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
when 58 then
--|#line 682 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 682")
end

			yyval35 := yyvs31.item (yyvsp31)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp35 := yyvsp35 + 1
	yyvsp31 := yyvsp31 -1
	if yyvsp35 >= yyvsc35 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs35")
		end
		yyvsc35 := yyvsc35 + yyInitial_yyvs_size
		yyvs35 := yyspecial_routines35.aliased_resized_area (yyvs35, yyvsc35)
	end
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
when 59 then
--|#line 686 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 686")
end

			yyval35 := yyvs33.item (yyvsp33)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp35 := yyvsp35 + 1
	yyvsp33 := yyvsp33 -1
	if yyvsp35 >= yyvsc35 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs35")
		end
		yyvsc35 := yyvsc35 + yyInitial_yyvs_size
		yyvs35 := yyspecial_routines35.aliased_resized_area (yyvs35, yyvsc35)
	end
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
when 60 then
--|#line 690 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 690")
end

			yyval35 := yyvs34.item (yyvsp34)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp35 := yyvsp35 + 1
	yyvsp34 := yyvsp34 -1
	if yyvsp35 >= yyvsc35 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs35")
		end
		yyvsc35 := yyvsc35 + yyInitial_yyvs_size
		yyvs35 := yyspecial_routines35.aliased_resized_area (yyvs35, yyvsc35)
	end
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
when 61 then
--|#line 696 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 696")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 62 then
--|#line 700 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 700")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 63 then
--|#line 704 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 704")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 64 then
--|#line 708 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 708")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 65 then
--|#line 717 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 717")
end

			yyval1 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 66 then
--|#line 723 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 723")
end

			create yyval18.make(0)
			yyval18.extend(yyvs4.item (yyvsp4 - 1))
			yyval18.extend(yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp18 := yyvsp18 + 1
	yyvsp4 := yyvsp4 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp18 >= yyvsc18 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs18")
		end
		yyvsc18 := yyvsc18 + yyInitial_yyvs_size
		yyvs18 := yyspecial_routines18.aliased_resized_area (yyvs18, yyvsc18)
	end
	yyspecial_routines18.force (yyvs18, yyval18, yyvsp18)
end
when 67 then
--|#line 729 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 729")
end

			yyvs18.item (yyvsp18).extend(yyvs4.item (yyvsp4))
			yyval18 := yyvs18.item (yyvsp18)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	yyspecial_routines18.force (yyvs18, yyval18, yyvsp18)
end
when 68 then
--|#line 737 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 737")
end

			yyval18 := yyvs18.item (yyvsp18)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines18.force (yyvs18, yyval18, yyvsp18)
end
when 69 then
--|#line 741 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 741")
end

			create yyval18.make (0)
			yyval18.extend (yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp18 := yyvsp18 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp18 >= yyvsc18 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs18")
		end
		yyvsc18 := yyvsc18 + yyInitial_yyvs_size
		yyvs18 := yyspecial_routines18.aliased_resized_area (yyvs18, yyvsc18)
	end
	yyspecial_routines18.force (yyvs18, yyval18, yyvsp18)
end
when 70 then
--|#line 748 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 748")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 71 then
--|#line 751 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 751")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 72 then
--|#line 754 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 754")
end

			yyval2 := - yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 73 then
--|#line 759 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 759")
end

			create yyval19.make(0)
			yyval19.extend(yyvs2.item (yyvsp2 - 1))
			yyval19.extend(yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp19 := yyvsp19 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp19 >= yyvsc19 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs19")
		end
		yyvsc19 := yyvsc19 + yyInitial_yyvs_size
		yyvs19 := yyspecial_routines19.aliased_resized_area (yyvs19, yyvsc19)
	end
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 74 then
--|#line 765 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 765")
end

			yyvs19.item (yyvsp19).extend(yyvs2.item (yyvsp2))
			yyval19 := yyvs19.item (yyvsp19)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 75 then
--|#line 770 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 770")
end

			create yyval19.make(0)
			yyval19.extend(yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp19 := yyvsp19 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp19 >= yyvsc19 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs19")
		end
		yyvsc19 := yyvsc19 + yyInitial_yyvs_size
		yyvs19 := yyspecial_routines19.aliased_resized_area (yyvs19, yyvsc19)
	end
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 76 then
--|#line 777 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 777")
end

			if yyvs2.item (yyvsp2 - 1) <= yyvs2.item (yyvsp2) then
				create yyval29.make_bounded(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs2.item (yyvsp2 - 1).out, yyvs2.item (yyvsp2).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp29 := yyvsp29 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -2
	if yyvsp29 >= yyvsc29 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs29")
		end
		yyvsc29 := yyvsc29 + yyInitial_yyvs_size
		yyvs29 := yyspecial_routines29.aliased_resized_area (yyvs29, yyvsc29)
	end
	yyspecial_routines29.force (yyvs29, yyval29, yyvsp29)
end
when 77 then
--|#line 785 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 785")
end

			if yyvs2.item (yyvsp2 - 1) <= yyvs2.item (yyvsp2) then
				create yyval29.make_bounded(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs2.item (yyvsp2 - 1).out, yyvs2.item (yyvsp2).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp29 := yyvsp29 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp2 := yyvsp2 -2
	if yyvsp29 >= yyvsc29 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs29")
		end
		yyvsc29 := yyvsc29 + yyInitial_yyvs_size
		yyvs29 := yyspecial_routines29.aliased_resized_area (yyvs29, yyvsc29)
	end
	yyspecial_routines29.force (yyvs29, yyval29, yyvsp29)
end
when 78 then
--|#line 793 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 793")
end

			if yyvs2.item (yyvsp2 - 1) <= yyvs2.item (yyvsp2) then
				create yyval29.make_bounded(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs2.item (yyvsp2 - 1).out, yyvs2.item (yyvsp2).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp29 := yyvsp29 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp2 := yyvsp2 -2
	if yyvsp29 >= yyvsc29 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs29")
		end
		yyvsc29 := yyvsc29 + yyInitial_yyvs_size
		yyvs29 := yyspecial_routines29.aliased_resized_area (yyvs29, yyvsc29)
	end
	yyspecial_routines29.force (yyvs29, yyval29, yyvsp29)
end
when 79 then
--|#line 801 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 801")
end

			if yyvs2.item (yyvsp2 - 1) <= yyvs2.item (yyvsp2) then
				create yyval29.make_bounded(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs2.item (yyvsp2 - 1).out, yyvs2.item (yyvsp2).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp29 := yyvsp29 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp2 := yyvsp2 -2
	if yyvsp29 >= yyvsc29 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs29")
		end
		yyvsc29 := yyvsc29 + yyInitial_yyvs_size
		yyvs29 := yyspecial_routines29.aliased_resized_area (yyvs29, yyvsc29)
	end
	yyspecial_routines29.force (yyvs29, yyval29, yyvsp29)
end
when 80 then
--|#line 809 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 809")
end

			create yyval29.make_lower_unbounded(yyvs2.item (yyvsp2), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp29 := yyvsp29 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -1
	if yyvsp29 >= yyvsc29 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs29")
		end
		yyvsc29 := yyvsc29 + yyInitial_yyvs_size
		yyvs29 := yyspecial_routines29.aliased_resized_area (yyvs29, yyvsc29)
	end
	yyspecial_routines29.force (yyvs29, yyval29, yyvsp29)
end
when 81 then
--|#line 813 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 813")
end

			create yyval29.make_lower_unbounded(yyvs2.item (yyvsp2), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp29 := yyvsp29 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -1
	if yyvsp29 >= yyvsc29 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs29")
		end
		yyvsc29 := yyvsc29 + yyInitial_yyvs_size
		yyvs29 := yyspecial_routines29.aliased_resized_area (yyvs29, yyvsc29)
	end
	yyspecial_routines29.force (yyvs29, yyval29, yyvsp29)
end
when 82 then
--|#line 817 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 817")
end

			create yyval29.make_upper_unbounded(yyvs2.item (yyvsp2), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp29 := yyvsp29 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -1
	if yyvsp29 >= yyvsc29 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs29")
		end
		yyvsc29 := yyvsc29 + yyInitial_yyvs_size
		yyvs29 := yyspecial_routines29.aliased_resized_area (yyvs29, yyvsc29)
	end
	yyspecial_routines29.force (yyvs29, yyval29, yyvsp29)
end
when 83 then
--|#line 821 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 821")
end

			create yyval29.make_upper_unbounded(yyvs2.item (yyvsp2), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp29 := yyvsp29 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -1
	if yyvsp29 >= yyvsc29 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs29")
		end
		yyvsc29 := yyvsc29 + yyInitial_yyvs_size
		yyvs29 := yyspecial_routines29.aliased_resized_area (yyvs29, yyvsc29)
	end
	yyspecial_routines29.force (yyvs29, yyval29, yyvsp29)
end
when 84 then
--|#line 825 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 825")
end

			create yyval29.make_point(yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp29 := yyvsp29 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp2 := yyvsp2 -1
	if yyvsp29 >= yyvsc29 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs29")
		end
		yyvsc29 := yyvsc29 + yyInitial_yyvs_size
		yyvs29 := yyspecial_routines29.aliased_resized_area (yyvs29, yyvsc29)
	end
	yyspecial_routines29.force (yyvs29, yyval29, yyvsp29)
end
when 85 then
--|#line 831 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 831")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 86 then
--|#line 835 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 835")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 87 then
--|#line 839 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 839")
end

			yyval3 := - yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 88 then
--|#line 845 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 845")
end

			create yyval20.make(0)
			yyval20.extend(yyvs3.item (yyvsp3 - 1))
			yyval20.extend(yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp20 := yyvsp20 + 1
	yyvsp3 := yyvsp3 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
when 89 then
--|#line 851 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 851")
end

			yyvs20.item (yyvsp20).extend(yyvs3.item (yyvsp3))
			yyval20 := yyvs20.item (yyvsp20)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp3 := yyvsp3 -1
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
when 90 then
--|#line 856 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 856")
end

			create yyval20.make(0)
			yyval20.extend(yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp20 := yyvsp20 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
when 91 then
--|#line 863 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 863")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create yyval30.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp30 := yyvsp30 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -2
	if yyvsp30 >= yyvsc30 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs30")
		end
		yyvsc30 := yyvsc30 + yyInitial_yyvs_size
		yyvs30 := yyspecial_routines30.aliased_resized_area (yyvs30, yyvsc30)
	end
	yyspecial_routines30.force (yyvs30, yyval30, yyvsp30)
end
when 92 then
--|#line 871 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 871")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create yyval30.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp30 := yyvsp30 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp3 := yyvsp3 -2
	if yyvsp30 >= yyvsc30 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs30")
		end
		yyvsc30 := yyvsc30 + yyInitial_yyvs_size
		yyvs30 := yyspecial_routines30.aliased_resized_area (yyvs30, yyvsc30)
	end
	yyspecial_routines30.force (yyvs30, yyval30, yyvsp30)
end
when 93 then
--|#line 879 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 879")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create yyval30.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp30 := yyvsp30 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp3 := yyvsp3 -2
	if yyvsp30 >= yyvsc30 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs30")
		end
		yyvsc30 := yyvsc30 + yyInitial_yyvs_size
		yyvs30 := yyspecial_routines30.aliased_resized_area (yyvs30, yyvsc30)
	end
	yyspecial_routines30.force (yyvs30, yyval30, yyvsp30)
end
when 94 then
--|#line 887 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 887")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create yyval30.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp30 := yyvsp30 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp3 := yyvsp3 -2
	if yyvsp30 >= yyvsc30 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs30")
		end
		yyvsc30 := yyvsc30 + yyInitial_yyvs_size
		yyvs30 := yyspecial_routines30.aliased_resized_area (yyvs30, yyvsc30)
	end
	yyspecial_routines30.force (yyvs30, yyval30, yyvsp30)
end
when 95 then
--|#line 895 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 895")
end

			create yyval30.make_lower_unbounded(yyvs3.item (yyvsp3), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp30 := yyvsp30 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp30 >= yyvsc30 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs30")
		end
		yyvsc30 := yyvsc30 + yyInitial_yyvs_size
		yyvs30 := yyspecial_routines30.aliased_resized_area (yyvs30, yyvsc30)
	end
	yyspecial_routines30.force (yyvs30, yyval30, yyvsp30)
end
when 96 then
--|#line 899 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 899")
end

			create yyval30.make_lower_unbounded(yyvs3.item (yyvsp3), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp30 := yyvsp30 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp30 >= yyvsc30 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs30")
		end
		yyvsc30 := yyvsc30 + yyInitial_yyvs_size
		yyvs30 := yyspecial_routines30.aliased_resized_area (yyvs30, yyvsc30)
	end
	yyspecial_routines30.force (yyvs30, yyval30, yyvsp30)
end
when 97 then
--|#line 903 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 903")
end

			create yyval30.make_upper_unbounded(yyvs3.item (yyvsp3), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp30 := yyvsp30 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp30 >= yyvsc30 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs30")
		end
		yyvsc30 := yyvsc30 + yyInitial_yyvs_size
		yyvs30 := yyspecial_routines30.aliased_resized_area (yyvs30, yyvsc30)
	end
	yyspecial_routines30.force (yyvs30, yyval30, yyvsp30)
end
when 98 then
--|#line 907 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 907")
end

			create yyval30.make_upper_unbounded(yyvs3.item (yyvsp3), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp30 := yyvsp30 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp30 >= yyvsc30 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs30")
		end
		yyvsc30 := yyvsc30 + yyInitial_yyvs_size
		yyvs30 := yyspecial_routines30.aliased_resized_area (yyvs30, yyvsc30)
	end
	yyspecial_routines30.force (yyvs30, yyval30, yyvsp30)
end
when 99 then
--|#line 911 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 911")
end

			create yyval30.make_point(yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp30 := yyvsp30 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp3 := yyvsp3 -1
	if yyvsp30 >= yyvsc30 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs30")
		end
		yyvsc30 := yyvsc30 + yyInitial_yyvs_size
		yyvs30 := yyspecial_routines30.aliased_resized_area (yyvs30, yyvsc30)
	end
	yyspecial_routines30.force (yyvs30, yyval30, yyvsp30)
end
when 100 then
--|#line 917 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 917")
end

			yyval6 := True
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp6 := yyvsp6 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp6 >= yyvsc6 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs6")
		end
		yyvsc6 := yyvsc6 + yyInitial_yyvs_size
		yyvs6 := yyspecial_routines6.aliased_resized_area (yyvs6, yyvsc6)
	end
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 101 then
--|#line 921 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 921")
end

			yyval6 := False
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp6 := yyvsp6 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp6 >= yyvsc6 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs6")
		end
		yyvsc6 := yyvsc6 + yyInitial_yyvs_size
		yyvs6 := yyspecial_routines6.aliased_resized_area (yyvs6, yyvsc6)
	end
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 102 then
--|#line 927 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 927")
end

			create yyval22.make(0)
			yyval22.extend(yyvs6.item (yyvsp6 - 1))
			yyval22.extend(yyvs6.item (yyvsp6))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp22 := yyvsp22 + 1
	yyvsp6 := yyvsp6 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
when 103 then
--|#line 933 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 933")
end

			yyvs22.item (yyvsp22).extend(yyvs6.item (yyvsp6))
			yyval22 := yyvs22.item (yyvsp22)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp6 := yyvsp6 -1
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
when 104 then
--|#line 938 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 938")
end

			create yyval22.make(0)
			yyval22.extend(yyvs6.item (yyvsp6))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp22 := yyvsp22 + 1
	yyvsp6 := yyvsp6 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
when 105 then
--|#line 945 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 945")
end

			yyval5 := yyvs5.item (yyvsp5)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 106 then
--|#line 951 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 951")
end

			create yyval21.make(0)
			yyval21.extend(yyvs5.item (yyvsp5 - 1))
			yyval21.extend(yyvs5.item (yyvsp5))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp21 := yyvsp21 + 1
	yyvsp5 := yyvsp5 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 107 then
--|#line 957 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 957")
end

			yyvs21.item (yyvsp21).extend(yyvs5.item (yyvsp5))
			yyval21 := yyvs21.item (yyvsp21)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 108 then
--|#line 962 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 962")
end

			create yyval21.make(0)
			yyval21.extend(yyvs5.item (yyvsp5))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp21 := yyvsp21 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 109 then
--|#line 969 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 969")
end

			if valid_iso8601_date(yyvs4.item (yyvsp4)) then
				create yyval7.make_from_string(yyvs4.item (yyvsp4))
			else
				abort_with_error (ec_VIDV, <<yyvs4.item (yyvsp4)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp7 := yyvsp7 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp7 >= yyvsc7 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs7")
		end
		yyvsc7 := yyvsc7 + yyInitial_yyvs_size
		yyvs7 := yyspecial_routines7.aliased_resized_area (yyvs7, yyvsc7)
	end
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 110 then
--|#line 979 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 979")
end

			create yyval23.make(0)
			if attached yyvs7.item (yyvsp7 - 1) as att_dlv and attached yyvs7.item (yyvsp7) as att_dv then
				yyval23.extend (att_dlv)
				yyval23.extend (att_dv)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp23 := yyvsp23 + 1
	yyvsp7 := yyvsp7 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp23 >= yyvsc23 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs23")
		end
		yyvsc23 := yyvsc23 + yyInitial_yyvs_size
		yyvs23 := yyspecial_routines23.aliased_resized_area (yyvs23, yyvsc23)
	end
	yyspecial_routines23.force (yyvs23, yyval23, yyvsp23)
end
when 111 then
--|#line 987 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 987")
end

			if attached yyvs23.item (yyvsp23) as att_dlv and attached yyvs7.item (yyvsp7) as att_dv then
				att_dlv.extend (att_dv)
				yyval23 := att_dlv
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp7 := yyvsp7 -1
	yyspecial_routines23.force (yyvs23, yyval23, yyvsp23)
end
when 112 then
--|#line 994 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 994")
end

			create yyval23.make(0)
			if attached yyvs7.item (yyvsp7) as att_dlv then
				yyval23.extend (att_dlv)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp23 := yyvsp23 + 1
	yyvsp7 := yyvsp7 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp23 >= yyvsc23 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs23")
		end
		yyvsc23 := yyvsc23 + yyInitial_yyvs_size
		yyvs23 := yyspecial_routines23.aliased_resized_area (yyvs23, yyvsc23)
	end
	yyspecial_routines23.force (yyvs23, yyval23, yyvsp23)
end
when 113 then
--|#line 1003 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1003")
end

			if yyvs7.item (yyvsp7 - 1) <= yyvs7.item (yyvsp7) then
				create yyval32.make_bounded(yyvs7.item (yyvsp7 - 1), yyvs7.item (yyvsp7), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs7.item (yyvsp7 - 1).out, yyvs7.item (yyvsp7).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp7 := yyvsp7 -2
	if yyvsp32 >= yyvsc32 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs32")
		end
		yyvsc32 := yyvsc32 + yyInitial_yyvs_size
		yyvs32 := yyspecial_routines32.aliased_resized_area (yyvs32, yyvsc32)
	end
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 114 then
--|#line 1011 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1011")
end

			if yyvs7.item (yyvsp7 - 1) <= yyvs7.item (yyvsp7) then
				create yyval32.make_bounded(yyvs7.item (yyvsp7 - 1), yyvs7.item (yyvsp7), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs7.item (yyvsp7 - 1).out, yyvs7.item (yyvsp7).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp7 := yyvsp7 -2
	if yyvsp32 >= yyvsc32 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs32")
		end
		yyvsc32 := yyvsc32 + yyInitial_yyvs_size
		yyvs32 := yyspecial_routines32.aliased_resized_area (yyvs32, yyvsc32)
	end
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 115 then
--|#line 1019 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1019")
end

			if yyvs7.item (yyvsp7 - 1) <= yyvs7.item (yyvsp7) then
				create yyval32.make_bounded(yyvs7.item (yyvsp7 - 1), yyvs7.item (yyvsp7), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs7.item (yyvsp7 - 1).out, yyvs7.item (yyvsp7).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp7 := yyvsp7 -2
	if yyvsp32 >= yyvsc32 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs32")
		end
		yyvsc32 := yyvsc32 + yyInitial_yyvs_size
		yyvs32 := yyspecial_routines32.aliased_resized_area (yyvs32, yyvsc32)
	end
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 116 then
--|#line 1027 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1027")
end

			if yyvs7.item (yyvsp7 - 1) <= yyvs7.item (yyvsp7) then
				create yyval32.make_bounded(yyvs7.item (yyvsp7 - 1), yyvs7.item (yyvsp7), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs7.item (yyvsp7 - 1).out, yyvs7.item (yyvsp7).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp7 := yyvsp7 -2
	if yyvsp32 >= yyvsc32 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs32")
		end
		yyvsc32 := yyvsc32 + yyInitial_yyvs_size
		yyvs32 := yyspecial_routines32.aliased_resized_area (yyvs32, yyvsc32)
	end
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 117 then
--|#line 1035 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1035")
end

			create yyval32.make_lower_unbounded(yyvs7.item (yyvsp7), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp7 := yyvsp7 -1
	if yyvsp32 >= yyvsc32 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs32")
		end
		yyvsc32 := yyvsc32 + yyInitial_yyvs_size
		yyvs32 := yyspecial_routines32.aliased_resized_area (yyvs32, yyvsc32)
	end
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 118 then
--|#line 1039 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1039")
end

			create yyval32.make_lower_unbounded(yyvs7.item (yyvsp7), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp7 := yyvsp7 -1
	if yyvsp32 >= yyvsc32 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs32")
		end
		yyvsc32 := yyvsc32 + yyInitial_yyvs_size
		yyvs32 := yyspecial_routines32.aliased_resized_area (yyvs32, yyvsc32)
	end
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 119 then
--|#line 1043 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1043")
end

			create yyval32.make_upper_unbounded(yyvs7.item (yyvsp7), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp7 := yyvsp7 -1
	if yyvsp32 >= yyvsc32 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs32")
		end
		yyvsc32 := yyvsc32 + yyInitial_yyvs_size
		yyvs32 := yyspecial_routines32.aliased_resized_area (yyvs32, yyvsc32)
	end
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 120 then
--|#line 1047 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1047")
end

			create yyval32.make_upper_unbounded(yyvs7.item (yyvsp7), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp7 := yyvsp7 -1
	if yyvsp32 >= yyvsc32 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs32")
		end
		yyvsc32 := yyvsc32 + yyInitial_yyvs_size
		yyvs32 := yyspecial_routines32.aliased_resized_area (yyvs32, yyvsc32)
	end
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 121 then
--|#line 1051 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1051")
end

			create yyval32.make_point(yyvs7.item (yyvsp7))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp7 := yyvsp7 -1
	if yyvsp32 >= yyvsc32 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs32")
		end
		yyvsc32 := yyvsc32 + yyInitial_yyvs_size
		yyvs32 := yyspecial_routines32.aliased_resized_area (yyvs32, yyvsc32)
	end
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 122 then
--|#line 1057 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1057")
end

			if valid_iso8601_time(yyvs4.item (yyvsp4)) then
				create yyval9.make_from_string(yyvs4.item (yyvsp4))
			else
				abort_with_error (ec_VITV, <<yyvs4.item (yyvsp4)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp9 := yyvsp9 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp9 >= yyvsc9 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs9")
		end
		yyvsc9 := yyvsc9 + yyInitial_yyvs_size
		yyvs9 := yyspecial_routines9.aliased_resized_area (yyvs9, yyvsc9)
	end
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
when 123 then
--|#line 1067 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1067")
end

			create yyval24.make(0)
			if attached yyvs9.item (yyvsp9 - 1) as tv1 and attached yyvs9.item (yyvsp9) as tv3 then
				yyval24.extend(tv1)
				yyval24.extend(tv3)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp24 := yyvsp24 + 1
	yyvsp9 := yyvsp9 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp24 >= yyvsc24 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs24")
		end
		yyvsc24 := yyvsc24 + yyInitial_yyvs_size
		yyvs24 := yyspecial_routines24.aliased_resized_area (yyvs24, yyvsc24)
	end
	yyspecial_routines24.force (yyvs24, yyval24, yyvsp24)
end
when 124 then
--|#line 1075 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1075")
end

			if attached yyvs24.item (yyvsp24) as tv1 and attached yyvs9.item (yyvsp9) as tv3 then
				tv1.extend(tv3)
				yyval24 := tv1
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp9 := yyvsp9 -1
	yyspecial_routines24.force (yyvs24, yyval24, yyvsp24)
end
when 125 then
--|#line 1082 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1082")
end

			create yyval24.make(0)
			if attached yyvs9.item (yyvsp9) as tv1 then
				yyval24.extend(tv1)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp24 := yyvsp24 + 1
	yyvsp9 := yyvsp9 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp24 >= yyvsc24 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs24")
		end
		yyvsc24 := yyvsc24 + yyInitial_yyvs_size
		yyvs24 := yyspecial_routines24.aliased_resized_area (yyvs24, yyvsc24)
	end
	yyspecial_routines24.force (yyvs24, yyval24, yyvsp24)
end
when 126 then
--|#line 1091 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1091")
end

			if yyvs9.item (yyvsp9 - 1) <= yyvs9.item (yyvsp9) then
				create yyval31.make_bounded(yyvs9.item (yyvsp9 - 1), yyvs9.item (yyvsp9), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs9.item (yyvsp9 - 1).out, yyvs9.item (yyvsp9).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp31 := yyvsp31 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp9 := yyvsp9 -2
	if yyvsp31 >= yyvsc31 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs31")
		end
		yyvsc31 := yyvsc31 + yyInitial_yyvs_size
		yyvs31 := yyspecial_routines31.aliased_resized_area (yyvs31, yyvsc31)
	end
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
when 127 then
--|#line 1099 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1099")
end

			if yyvs9.item (yyvsp9 - 1) <= yyvs9.item (yyvsp9) then
				create yyval31.make_bounded(yyvs9.item (yyvsp9 - 1), yyvs9.item (yyvsp9), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs9.item (yyvsp9 - 1).out, yyvs9.item (yyvsp9).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp31 := yyvsp31 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp9 := yyvsp9 -2
	if yyvsp31 >= yyvsc31 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs31")
		end
		yyvsc31 := yyvsc31 + yyInitial_yyvs_size
		yyvs31 := yyspecial_routines31.aliased_resized_area (yyvs31, yyvsc31)
	end
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
when 128 then
--|#line 1107 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1107")
end

			if yyvs9.item (yyvsp9 - 1) <= yyvs9.item (yyvsp9) then
				create yyval31.make_bounded(yyvs9.item (yyvsp9 - 1), yyvs9.item (yyvsp9), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs9.item (yyvsp9 - 1).out, yyvs9.item (yyvsp9).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp31 := yyvsp31 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp9 := yyvsp9 -2
	if yyvsp31 >= yyvsc31 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs31")
		end
		yyvsc31 := yyvsc31 + yyInitial_yyvs_size
		yyvs31 := yyspecial_routines31.aliased_resized_area (yyvs31, yyvsc31)
	end
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
when 129 then
--|#line 1115 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1115")
end

			if yyvs9.item (yyvsp9 - 1) <= yyvs9.item (yyvsp9) then
				create yyval31.make_bounded(yyvs9.item (yyvsp9 - 1), yyvs9.item (yyvsp9), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs9.item (yyvsp9 - 1).out, yyvs9.item (yyvsp9).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp31 := yyvsp31 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp9 := yyvsp9 -2
	if yyvsp31 >= yyvsc31 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs31")
		end
		yyvsc31 := yyvsc31 + yyInitial_yyvs_size
		yyvs31 := yyspecial_routines31.aliased_resized_area (yyvs31, yyvsc31)
	end
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
when 130 then
--|#line 1123 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1123")
end

			create yyval31.make_lower_unbounded(yyvs9.item (yyvsp9), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp31 := yyvsp31 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp9 := yyvsp9 -1
	if yyvsp31 >= yyvsc31 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs31")
		end
		yyvsc31 := yyvsc31 + yyInitial_yyvs_size
		yyvs31 := yyspecial_routines31.aliased_resized_area (yyvs31, yyvsc31)
	end
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
when 131 then
--|#line 1127 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1127")
end

			create yyval31.make_lower_unbounded(yyvs9.item (yyvsp9), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp31 := yyvsp31 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp9 := yyvsp9 -1
	if yyvsp31 >= yyvsc31 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs31")
		end
		yyvsc31 := yyvsc31 + yyInitial_yyvs_size
		yyvs31 := yyspecial_routines31.aliased_resized_area (yyvs31, yyvsc31)
	end
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
when 132 then
--|#line 1131 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1131")
end

			create yyval31.make_upper_unbounded(yyvs9.item (yyvsp9), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp31 := yyvsp31 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp9 := yyvsp9 -1
	if yyvsp31 >= yyvsc31 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs31")
		end
		yyvsc31 := yyvsc31 + yyInitial_yyvs_size
		yyvs31 := yyspecial_routines31.aliased_resized_area (yyvs31, yyvsc31)
	end
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
when 133 then
--|#line 1135 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1135")
end

			create yyval31.make_upper_unbounded(yyvs9.item (yyvsp9), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp31 := yyvsp31 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp9 := yyvsp9 -1
	if yyvsp31 >= yyvsc31 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs31")
		end
		yyvsc31 := yyvsc31 + yyInitial_yyvs_size
		yyvs31 := yyspecial_routines31.aliased_resized_area (yyvs31, yyvsc31)
	end
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
when 134 then
--|#line 1139 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1139")
end

			create yyval31.make_point(yyvs9.item (yyvsp9))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp31 := yyvsp31 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp9 := yyvsp9 -1
	if yyvsp31 >= yyvsc31 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs31")
		end
		yyvsc31 := yyvsc31 + yyInitial_yyvs_size
		yyvs31 := yyspecial_routines31.aliased_resized_area (yyvs31, yyvsc31)
	end
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
when 135 then
--|#line 1145 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1145")
end

			if valid_iso8601_date_time(yyvs4.item (yyvsp4)) then
				create yyval8.make_from_string(yyvs4.item (yyvsp4))
			else
				abort_with_error (ec_VIDTV, <<yyvs4.item (yyvsp4)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp8 := yyvsp8 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp8 >= yyvsc8 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs8")
		end
		yyvsc8 := yyvsc8 + yyInitial_yyvs_size
		yyvs8 := yyspecial_routines8.aliased_resized_area (yyvs8, yyvsc8)
	end
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 136 then
--|#line 1155 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1155")
end

			create yyval25.make(0)
			yyval25.extend(yyvs8.item (yyvsp8 - 1))
			yyval25.extend(yyvs8.item (yyvsp8))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp25 := yyvsp25 + 1
	yyvsp8 := yyvsp8 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp25 >= yyvsc25 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs25")
		end
		yyvsc25 := yyvsc25 + yyInitial_yyvs_size
		yyvs25 := yyspecial_routines25.aliased_resized_area (yyvs25, yyvsc25)
	end
	yyspecial_routines25.force (yyvs25, yyval25, yyvsp25)
end
when 137 then
--|#line 1161 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1161")
end

			yyvs25.item (yyvsp25).extend(yyvs8.item (yyvsp8))
			yyval25 := yyvs25.item (yyvsp25)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp8 := yyvsp8 -1
	yyspecial_routines25.force (yyvs25, yyval25, yyvsp25)
end
when 138 then
--|#line 1166 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1166")
end

			create yyval25.make(0)
			yyval25.extend(yyvs8.item (yyvsp8))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp25 := yyvsp25 + 1
	yyvsp8 := yyvsp8 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp25 >= yyvsc25 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs25")
		end
		yyvsc25 := yyvsc25 + yyInitial_yyvs_size
		yyvs25 := yyspecial_routines25.aliased_resized_area (yyvs25, yyvsc25)
	end
	yyspecial_routines25.force (yyvs25, yyval25, yyvsp25)
end
when 139 then
--|#line 1173 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1173")
end

			if yyvs8.item (yyvsp8 - 1) <= yyvs8.item (yyvsp8) then
				create yyval33.make_bounded(yyvs8.item (yyvsp8 - 1), yyvs8.item (yyvsp8), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs8.item (yyvsp8 - 1).out, yyvs8.item (yyvsp8).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp33 := yyvsp33 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp8 := yyvsp8 -2
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 140 then
--|#line 1181 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1181")
end

			if yyvs8.item (yyvsp8 - 1) <= yyvs8.item (yyvsp8) then
				create yyval33.make_bounded(yyvs8.item (yyvsp8 - 1), yyvs8.item (yyvsp8), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs8.item (yyvsp8 - 1).out, yyvs8.item (yyvsp8).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp33 := yyvsp33 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp8 := yyvsp8 -2
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 141 then
--|#line 1189 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1189")
end

			if yyvs8.item (yyvsp8 - 1) <= yyvs8.item (yyvsp8) then
				create yyval33.make_bounded(yyvs8.item (yyvsp8 - 1), yyvs8.item (yyvsp8), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs8.item (yyvsp8 - 1).out, yyvs8.item (yyvsp8).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp33 := yyvsp33 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp8 := yyvsp8 -2
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 142 then
--|#line 1197 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1197")
end

			if yyvs8.item (yyvsp8 - 1) <= yyvs8.item (yyvsp8) then
				create yyval33.make_bounded(yyvs8.item (yyvsp8 - 1), yyvs8.item (yyvsp8), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs8.item (yyvsp8 - 1).out, yyvs8.item (yyvsp8).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp33 := yyvsp33 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp8 := yyvsp8 -2
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 143 then
--|#line 1205 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1205")
end

			create yyval33.make_lower_unbounded(yyvs8.item (yyvsp8), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp33 := yyvsp33 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp8 := yyvsp8 -1
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 144 then
--|#line 1209 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1209")
end

			create yyval33.make_lower_unbounded(yyvs8.item (yyvsp8), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp33 := yyvsp33 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp8 := yyvsp8 -1
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 145 then
--|#line 1213 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1213")
end

			create yyval33.make_upper_unbounded(yyvs8.item (yyvsp8), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp33 := yyvsp33 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp8 := yyvsp8 -1
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 146 then
--|#line 1217 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1217")
end

			create yyval33.make_upper_unbounded(yyvs8.item (yyvsp8), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp33 := yyvsp33 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp8 := yyvsp8 -1
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 147 then
--|#line 1221 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1221")
end

			create yyval33.make_point(yyvs8.item (yyvsp8))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp33 := yyvsp33 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp8 := yyvsp8 -1
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 148 then
--|#line 1227 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1227")
end

			if valid_iso8601_duration(yyvs4.item (yyvsp4)) then
				create yyval10.make_from_string(yyvs4.item (yyvsp4))
			else
				abort_with_error (ec_VIDUV, <<yyvs4.item (yyvsp4)>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp10 := yyvsp10 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp10 >= yyvsc10 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs10")
		end
		yyvsc10 := yyvsc10 + yyInitial_yyvs_size
		yyvs10 := yyspecial_routines10.aliased_resized_area (yyvs10, yyvsc10)
	end
	yyspecial_routines10.force (yyvs10, yyval10, yyvsp10)
end
when 149 then
--|#line 1237 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1237")
end

			create yyval26.make(0)
			yyval26.extend(yyvs10.item (yyvsp10 - 1))
			yyval26.extend(yyvs10.item (yyvsp10))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp26 := yyvsp26 + 1
	yyvsp10 := yyvsp10 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp26 >= yyvsc26 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs26")
		end
		yyvsc26 := yyvsc26 + yyInitial_yyvs_size
		yyvs26 := yyspecial_routines26.aliased_resized_area (yyvs26, yyvsc26)
	end
	yyspecial_routines26.force (yyvs26, yyval26, yyvsp26)
end
when 150 then
--|#line 1243 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1243")
end

			yyvs26.item (yyvsp26).extend(yyvs10.item (yyvsp10))
			yyval26 := yyvs26.item (yyvsp26)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp10 := yyvsp10 -1
	yyspecial_routines26.force (yyvs26, yyval26, yyvsp26)
end
when 151 then
--|#line 1248 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1248")
end

			create yyval26.make(0)
			yyval26.extend(yyvs10.item (yyvsp10))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp26 := yyvsp26 + 1
	yyvsp10 := yyvsp10 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp26 >= yyvsc26 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs26")
		end
		yyvsc26 := yyvsc26 + yyInitial_yyvs_size
		yyvs26 := yyspecial_routines26.aliased_resized_area (yyvs26, yyvsc26)
	end
	yyspecial_routines26.force (yyvs26, yyval26, yyvsp26)
end
when 152 then
--|#line 1255 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1255")
end

			if yyvs10.item (yyvsp10 - 1) <= yyvs10.item (yyvsp10) then
				create yyval34.make_bounded(yyvs10.item (yyvsp10 - 1), yyvs10.item (yyvsp10), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs10.item (yyvsp10 - 1).out, yyvs10.item (yyvsp10).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp34 := yyvsp34 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp10 := yyvsp10 -2
	if yyvsp34 >= yyvsc34 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs34")
		end
		yyvsc34 := yyvsc34 + yyInitial_yyvs_size
		yyvs34 := yyspecial_routines34.aliased_resized_area (yyvs34, yyvsc34)
	end
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 153 then
--|#line 1263 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1263")
end

			if yyvs10.item (yyvsp10 - 1) <= yyvs10.item (yyvsp10) then
				create yyval34.make_bounded(yyvs10.item (yyvsp10 - 1), yyvs10.item (yyvsp10), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs10.item (yyvsp10 - 1).out, yyvs10.item (yyvsp10).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp34 := yyvsp34 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp10 := yyvsp10 -2
	if yyvsp34 >= yyvsc34 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs34")
		end
		yyvsc34 := yyvsc34 + yyInitial_yyvs_size
		yyvs34 := yyspecial_routines34.aliased_resized_area (yyvs34, yyvsc34)
	end
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 154 then
--|#line 1271 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1271")
end

			if yyvs10.item (yyvsp10 - 1) <= yyvs10.item (yyvsp10) then
				create yyval34.make_bounded(yyvs10.item (yyvsp10 - 1), yyvs10.item (yyvsp10), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs10.item (yyvsp10 - 1).out, yyvs10.item (yyvsp10).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp34 := yyvsp34 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp10 := yyvsp10 -2
	if yyvsp34 >= yyvsc34 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs34")
		end
		yyvsc34 := yyvsc34 + yyInitial_yyvs_size
		yyvs34 := yyspecial_routines34.aliased_resized_area (yyvs34, yyvsc34)
	end
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 155 then
--|#line 1279 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1279")
end

			if yyvs10.item (yyvsp10 - 1) <= yyvs10.item (yyvsp10) then
				create yyval34.make_bounded(yyvs10.item (yyvsp10 - 1), yyvs10.item (yyvsp10), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs10.item (yyvsp10 - 1).out, yyvs10.item (yyvsp10).out>>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp34 := yyvsp34 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp10 := yyvsp10 -2
	if yyvsp34 >= yyvsc34 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs34")
		end
		yyvsc34 := yyvsc34 + yyInitial_yyvs_size
		yyvs34 := yyspecial_routines34.aliased_resized_area (yyvs34, yyvsc34)
	end
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 156 then
--|#line 1287 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1287")
end

			create yyval34.make_lower_unbounded(yyvs10.item (yyvsp10), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp34 := yyvsp34 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp10 := yyvsp10 -1
	if yyvsp34 >= yyvsc34 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs34")
		end
		yyvsc34 := yyvsc34 + yyInitial_yyvs_size
		yyvs34 := yyspecial_routines34.aliased_resized_area (yyvs34, yyvsc34)
	end
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 157 then
--|#line 1291 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1291")
end

			create yyval34.make_lower_unbounded(yyvs10.item (yyvsp10), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp34 := yyvsp34 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp10 := yyvsp10 -1
	if yyvsp34 >= yyvsc34 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs34")
		end
		yyvsc34 := yyvsc34 + yyInitial_yyvs_size
		yyvs34 := yyspecial_routines34.aliased_resized_area (yyvs34, yyvsc34)
	end
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 158 then
--|#line 1295 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1295")
end

			create yyval34.make_upper_unbounded(yyvs10.item (yyvsp10), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp34 := yyvsp34 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp10 := yyvsp10 -1
	if yyvsp34 >= yyvsc34 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs34")
		end
		yyvsc34 := yyvsc34 + yyInitial_yyvs_size
		yyvs34 := yyspecial_routines34.aliased_resized_area (yyvs34, yyvsc34)
	end
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 159 then
--|#line 1299 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1299")
end

			create yyval34.make_upper_unbounded(yyvs10.item (yyvsp10), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp34 := yyvsp34 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp10 := yyvsp10 -1
	if yyvsp34 >= yyvsc34 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs34")
		end
		yyvsc34 := yyvsc34 + yyInitial_yyvs_size
		yyvs34 := yyspecial_routines34.aliased_resized_area (yyvs34, yyvsc34)
	end
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 160 then
--|#line 1303 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1303")
end

			create yyval34.make_point(yyvs10.item (yyvsp10))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp34 := yyvsp34 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp10 := yyvsp10 -1
	if yyvsp34 >= yyvsc34 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs34")
		end
		yyvsc34 := yyvsc34 + yyInitial_yyvs_size
		yyvs34 := yyspecial_routines34.aliased_resized_area (yyvs34, yyvsc34)
	end
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 161 then
--|#line 1309 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1309")
end

			create yyval11.make_from_string (yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp11 := yyvsp11 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp11 >= yyvsc11 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs11")
		end
		yyvsc11 := yyvsc11 + yyInitial_yyvs_size
		yyvs11 := yyspecial_routines11.aliased_resized_area (yyvs11, yyvsc11)
	end
	yyspecial_routines11.force (yyvs11, yyval11, yyvsp11)
end
when 162 then
--|#line 1313 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1313")
end

			abort_with_error (ec_STNC, <<yyvs4.item (yyvsp4)>>)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp11 := yyvsp11 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp11 >= yyvsc11 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs11")
		end
		yyvsc11 := yyvsc11 + yyInitial_yyvs_size
		yyvs11 := yyspecial_routines11.aliased_resized_area (yyvs11, yyvsc11)
	end
	yyspecial_routines11.force (yyvs11, yyval11, yyvsp11)
end
when 163 then
--|#line 1317 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1317")
end

			abort_with_error (ec_STCV, <<yyvs4.item (yyvsp4)>>)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp11 := yyvsp11 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp11 >= yyvsc11 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs11")
		end
		yyvsc11 := yyvsc11 + yyInitial_yyvs_size
		yyvs11 := yyspecial_routines11.aliased_resized_area (yyvs11, yyvsc11)
	end
	yyspecial_routines11.force (yyvs11, yyval11, yyvsp11)
end
when 164 then
--|#line 1323 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1323")
end

			create yyval27.make(0)
			yyval27.extend(yyvs11.item (yyvsp11 - 1))
			yyval27.extend(yyvs11.item (yyvsp11))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp27 := yyvsp27 + 1
	yyvsp11 := yyvsp11 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp27 >= yyvsc27 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs27")
		end
		yyvsc27 := yyvsc27 + yyInitial_yyvs_size
		yyvs27 := yyspecial_routines27.aliased_resized_area (yyvs27, yyvsc27)
	end
	yyspecial_routines27.force (yyvs27, yyval27, yyvsp27)
end
when 165 then
--|#line 1329 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1329")
end

			yyvs27.item (yyvsp27).extend(yyvs11.item (yyvsp11))
			yyval27 := yyvs27.item (yyvsp27)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp11 := yyvsp11 -1
	yyspecial_routines27.force (yyvs27, yyval27, yyvsp27)
end
when 166 then
--|#line 1334 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1334")
end

			create yyval27.make(0)
			yyval27.extend(yyvs11.item (yyvsp11))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp27 := yyvsp27 + 1
	yyvsp11 := yyvsp11 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp27 >= yyvsc27 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs27")
		end
		yyvsc27 := yyvsc27 + yyInitial_yyvs_size
		yyvs27 := yyspecial_routines27.aliased_resized_area (yyvs27, yyvsc27)
	end
	yyspecial_routines27.force (yyvs27, yyval27, yyvsp27)
end
when 167 then
--|#line 1341 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1341")
end

			create yyval12.make_from_string(yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp12 := yyvsp12 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp12 >= yyvsc12 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs12")
		end
		yyvsc12 := yyvsc12 + yyInitial_yyvs_size
		yyvs12 := yyspecial_routines12.aliased_resized_area (yyvs12, yyvsc12)
	end
	yyspecial_routines12.force (yyvs12, yyval12, yyvsp12)
end
when 168 then
--|#line 1351 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1351")
end

debug("ODIN_parse")
	io.put_string(indent + "object_reference_block; attr_nodes(<<" + 
			attr_nodes.item.im_attr_name + ">>).item.put_child(<<" + 
			yyvs14.item (yyvsp14).as_string + ">>)%N")
end
			if not attr_nodes.item.has_child_with_id(yyvs14.item (yyvsp14).id) then
				attr_nodes.item.put_child(yyvs14.item (yyvsp14))
				yyval14 := yyvs14.item (yyvsp14)
			else
				abort_with_error (ec_VOKU, <<yyvs14.item (yyvsp14).id, attr_nodes.item.im_attr_name >>)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 169 then
--|#line 1367 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1367")
end

			if attached obj_key as att_obj_key then
				create {DT_OBJECT_REFERENCE} yyval14.make_identified(yyvs15.item (yyvsp15), att_obj_key)
				obj_key := Void
			else
				create {DT_OBJECT_REFERENCE} yyval14.make_anonymous(yyvs15.item (yyvsp15))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp14 := yyvsp14 + 1
	yyvsp15 := yyvsp15 -1
	if yyvsp14 >= yyvsc14 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs14")
		end
		yyvsc14 := yyvsc14 + yyInitial_yyvs_size
		yyvs14 := yyspecial_routines14.aliased_resized_area (yyvs14, yyvsc14)
	end
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 170 then
--|#line 1376 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1376")
end

			if attached obj_key as att_obj_key then
				create {DT_OBJECT_REFERENCE_LIST} yyval14.make_identified(yyvs17.item (yyvsp17), att_obj_key)
				obj_key := Void
			else
				create {DT_OBJECT_REFERENCE_LIST} yyval14.make_anonymous(yyvs17.item (yyvsp17))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp14 := yyvsp14 + 1
	yyvsp17 := yyvsp17 -1
	if yyvsp14 >= yyvsc14 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs14")
		end
		yyvsc14 := yyvsc14 + yyInitial_yyvs_size
		yyvs14 := yyspecial_routines14.aliased_resized_area (yyvs14, yyvsc14)
	end
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 171 then
--|#line 1388 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1388")
end

			create yyval17.make(0)
			yyval17.extend(yyvs15.item (yyvsp15 - 1))
			yyval17.extend(yyvs15.item (yyvsp15))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp17 := yyvsp17 + 1
	yyvsp15 := yyvsp15 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp17 >= yyvsc17 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs17")
		end
		yyvsc17 := yyvsc17 + yyInitial_yyvs_size
		yyvs17 := yyspecial_routines17.aliased_resized_area (yyvs17, yyvsc17)
	end
	yyspecial_routines17.force (yyvs17, yyval17, yyvsp17)
end
when 172 then
--|#line 1394 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1394")
end

			yyvs17.item (yyvsp17).extend(yyvs15.item (yyvsp15))
			yyval17 := yyvs17.item (yyvsp17)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp15 := yyvsp15 -1
	yyspecial_routines17.force (yyvs17, yyval17, yyvsp17)
end
when 173 then
--|#line 1399 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1399")
end

			create yyval17.make(0)
			yyval17.extend(yyvs15.item (yyvsp15))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp17 := yyvsp17 + 1
	yyvsp15 := yyvsp15 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp17 >= yyvsc17 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs17")
		end
		yyvsc17 := yyvsc17 + yyInitial_yyvs_size
		yyvs17 := yyspecial_routines17.aliased_resized_area (yyvs17, yyvsc17)
	end
	yyspecial_routines17.force (yyvs17, yyval17, yyvsp17)
end
when 174 then
--|#line 1411 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1411")
end

			create yyval15.make_root
debug("OG_PATH_parse")
	io.put_string("....absolute_path (root); %N")
end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp15 := yyvsp15 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp15 >= yyvsc15 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs15")
		end
		yyvsc15 := yyvsc15 + yyInitial_yyvs_size
		yyvs15 := yyspecial_routines15.aliased_resized_area (yyvs15, yyvsc15)
	end
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 175 then
--|#line 1418 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1418")
end

			yyval15 := yyvs15.item (yyvsp15)
			yyval15.set_absolute
debug("OG_PATH_parse")
	io.put_string("....absolute_path; %N")
end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 176 then
--|#line 1426 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1426")
end

			yyval15 := yyvs15.item (yyvsp15 - 1)
			yyval15.append_path(yyvs15.item (yyvsp15))
debug("OG_PATH_parse")
	io.put_string("....absolute_path (appended relative path); %N")
end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp15 := yyvsp15 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 177 then
--|#line 1436 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1436")
end

			create yyval15.make_relative(yyvs16.item (yyvsp16))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp15 := yyvsp15 + 1
	yyvsp16 := yyvsp16 -1
	if yyvsp15 >= yyvsc15 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs15")
		end
		yyvsc15 := yyvsc15 + yyInitial_yyvs_size
		yyvs15 := yyspecial_routines15.aliased_resized_area (yyvs15, yyvsc15)
	end
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 178 then
--|#line 1440 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1440")
end

			yyval15 := yyvs15.item (yyvsp15)
			yyval15.append_segment(yyvs16.item (yyvsp16))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp16 := yyvsp16 -1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 179 then
--|#line 1447 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1447")
end

			create yyval16.make_with_object_id(yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4))
debug("OG_PATH_parse")
	io.put_string("...path_segment: " + yyvs4.item (yyvsp4 - 1) + "[" + yyvs4.item (yyvsp4) + "]%N")
end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp16 := yyvsp16 + 1
	yyvsp4 := yyvsp4 -2
	yyvsp1 := yyvsp1 -2
	if yyvsp16 >= yyvsc16 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs16")
		end
		yyvsc16 := yyvsc16 + yyInitial_yyvs_size
		yyvs16 := yyspecial_routines16.aliased_resized_area (yyvs16, yyvsc16)
	end
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 180 then
--|#line 1454 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1454")
end

			create yyval16.make(yyvs4.item (yyvsp4))
debug("OG_PATH_parse")
	io.put_string("...path_segment: " + yyvs4.item (yyvsp4) + "%N")
end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp16 >= yyvsc16 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs16")
		end
		yyvsc16 := yyvsc16 + yyInitial_yyvs_size
		yyvs16 := yyspecial_routines16.aliased_resized_area (yyvs16, yyvsc16)
	end
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
			else
				debug ("GEYACC")
					std.error.put_string ("Error in parser: unknown rule id: ")
					std.error.put_integer (yy_act)
					std.error.put_new_line
				end
				abort
			end
		end

	yy_do_error_action (yy_act: INTEGER)
			-- Execute error action.
		do
			inspect yy_act
			when 324 then
					-- End-of-file expected action.
				report_eof_expected_error
			else
					-- Default action.
				report_error ("parse error")
			end
		end

feature {NONE} -- Table templates

	yytranslate_template: SPECIAL [INTEGER]
			-- Template for `yytranslate'
		once
			Result := yyfixed_array (<<
			    0,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			   38,   39,    2,   41,   40,   42,    2,   43,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,   35,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,   36,    2,   37,    2,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    1,    2,    3,    4,
			    5,    6,    7,    8,    9,   10,   11,   12,   13,   14,
			   15,   16,   17,   18,   19,   20,   21,   22,   23,   24,
			   25,   26,   27,   28,   29,   30,   31,   32,   33,   34, yyDummy>>)
		end

	yyr1_template: SPECIAL [INTEGER]
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,   87,   87,   87,   88,   88,   88,   89,   90,   90,
			   91,   91,   91,   91,   59,   59,   57,   57,   58,   92,
			   93,   93,   94,   95,   55,   55,   56,   97,   61,   61,
			   60,   63,   63,   63,   63,   63,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   79,   79,   79,   79,
			   79,   79,   79,   79,   79,   86,   86,   86,   86,   86,
			   86,   44,   44,   44,   44,   98,   69,   69,   69,   69,
			   45,   45,   45,   70,   70,   70,   80,   80,   80,   80,
			   80,   80,   80,   80,   80,   46,   46,   46,   71,   71,
			   71,   81,   81,   81,   81,   81,   81,   81,   81,   81,

			   47,   47,   73,   73,   73,   48,   72,   72,   72,   49,
			   74,   74,   74,   83,   83,   83,   83,   83,   83,   83,
			   83,   83,   51,   75,   75,   75,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   50,   76,   76,   76,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   52,   77,
			   77,   77,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   53,   53,   53,   78,   78,   78,   54,   62,   64,
			   64,   68,   68,   68,   65,   65,   65,   66,   66,   67,
			   67, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    4,    4,    4,    1,    4,   13,   13,
			   13,   13,   13,    1,    1,    1,    1,    1,    4,    4,
			    1,   13,   13,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    4,   13,   14,   14,   14,
			    1,    1,    1,    1,    1,    5,    4,    4,    4,    4,
			    4,    4,    3,    2,    2,    3,    6,    5,    7,    8,
			    9,   10,   12,    1,    1,    1,    1,    1,    1,    1,
			    4,    1,    1,    4,    4,    4,    2,    3,    6,    5,
			    7,    8,    9,   10,   11,   14,   14,   15,   17,   18,
			   19,   20,   21,   22,   23,   24,   25,   26,   27,   28,

			   29,   30,   31,   32,   33,   34,   35,    1,    1,   14,
			    3,    2,    3,    2,    1,    1,    4,   15,   16,    1,
			    1,    1,    1,    2,    3,    7,    8,    9,   10,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    2,    3,    7,    8,
			    9,   10,    2,    3,    7,    8,    9,   10,    2,    3,
			    7,    8,    9,   10,    2,    3,    7,    8,    9,   10,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    4,    1,    1,    1,    2,    1,    1,

			    1,    3,    1,    6,    1,    5,    1,    7,    1,    8,
			    1,    9,    1,   10,    1,   11,   15,    1,   15,   15,
			    1,    4,    2,    3,    5,    6,    7,    9,    8,   10,
			   11,    4,   16,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    2,    1,    3,    1,    7,    1,
			    8,    1,    9,    1,   10,    1,    1,    2,    1,    3,
			    1,    7,    1,    8,    1,    9,    1,   10,    2,    1,
			    3,    1,    7,    1,    8,    1,    9,    1,   10,    1,

			    2,    1,    3,    1,    7,    1,    8,    1,    9,    1,
			   10,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER]
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    2,    3,    4,    4,    4,    4,    4,
			    4,    4,    4,    4,    4,    4,    4,    5,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    4,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER]
			-- Template for `yydefact'
		once
			Result := yyfixed_array (<<
			    0,    0,   27,    0,   64,   63,    3,    0,   14,   24,
			   15,   16,    2,    1,    4,    0,    0,    0,    0,    0,
			    9,   25,   17,    0,    5,    0,    0,    0,   20,    0,
			    0,   62,   61,    6,   27,    0,   10,   28,   11,   12,
			    7,    0,    0,  101,  100,  105,  167,  148,  135,  122,
			  109,   65,   85,   70,   37,   38,   39,   40,   41,   43,
			   42,   44,   45,    0,   36,   18,   21,    0,   26,  174,
			  163,    0,   13,  162,  161,   65,   37,   38,   39,   40,
			   41,   43,   42,   44,   34,    0,    0,  169,  170,   46,
			   47,   48,   50,   49,   51,   52,   53,   54,   35,   32,

			   55,   56,   58,   57,   59,   60,   33,   31,   27,   29,
			   87,   72,   86,   71,   23,   22,  180,  175,  177,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   30,
			  168,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			   84,    0,   99,    0,  121,    0,  147,    0,  134,    0,
			  160,    0,   69,   66,    0,    0,   75,   73,    0,    0,

			   90,   88,  104,  102,  108,  106,  112,  110,  138,  136,
			  125,  123,  151,  149,  166,  164,  176,  173,  171,  172,
			   68,   67,   74,   89,  107,  103,  111,  124,  137,  150,
			  165,    0,  178,   83,   98,  120,  146,  133,  159,   81,
			   96,  118,  144,  131,  157,   82,    0,   97,    0,  119,
			    0,  145,    0,  132,    0,  158,    0,   80,   95,  117,
			  143,  130,  156,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  179,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   76,
			    0,   91,    0,  113,    0,  139,    0,  126,    0,  152,

			    0,   77,    0,   92,    0,  114,    0,  140,    0,  127,
			    0,  153,   78,   93,  115,  141,  128,  154,   79,   94,
			  116,  142,  129,  155,    0,    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			   35,   76,   77,   78,   79,   80,   81,   82,   83,   84,
			   62,    8,    9,   10,   11,   36,   37,   38,   39,   85,
			   86,   87,  117,  118,   88,   89,   90,   91,   92,   93,
			   94,   95,   96,   97,   98,   99,  100,  101,  102,  103,
			  104,  105,  106,  324,   13,   14,   15,   40,   16,   27,
			   28,   29,  107,   17,   64, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			  139,  267,  358,    0, -32768, -32768, -32768,  371, -32768, -32768,
			 -32768, -32768, -32768,   51, -32768,  357,  355,  350,  354,  353,
			 -32768, -32768, -32768,  350, -32768,  200,  273,  165, -32768,  356,
			   -5, -32768, -32768, -32768,   23,  352, -32768, -32768, -32768, -32768,
			 -32768,  188,    7, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768,  351, -32768, -32768, -32768,  200, -32768,  330,
			 -32768,  199, -32768, -32768, -32768,  347,  346,  345,  344,  343,
			  342,  341,  340,  339,  338,  337,  336,   79,  335,  334,
			  333,  331,  329,  328,  327,  326,  325,  324,  323, -32768,

			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  171, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768,  322,  274, -32768,   13,
			   13,   13,   13,  248,  247,  244,  238,  234,  233,  207,
			   38,  148,  197,   -4,  144,  209,   -1,  211,  202, -32768,
			 -32768,  330,  -15,  298,  192,   41,   74,  321,   47,  295,
			  286,  291,  151,  140,  332,  330,  320,  319,  316,  313,
			  312,  311,  310,  309,  308,  307,  306,  305,  229,  225,
			  222,  221,  216,  176,  304,  303,  302,  301,  300,  299,
			 -32768,   48, -32768,  117, -32768,  152, -32768,   58, -32768,  150,
			 -32768,   98, -32768, -32768,  318,  317, -32768, -32768,  315,  314,

			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768,  274, -32768,  266,  266,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768,  279, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768,   26, -32768,  108, -32768,
			   61, -32768,   50, -32768,  138, -32768,   -7, -32768, -32768, -32768,
			 -32768, -32768, -32768,   41,  290,   74,  289,  295,  288,  291,
			  287,  286,  285,  151,  284, -32768,   41,  283,   74,  282,
			  295,  280,  291,  278,  286,  277,  151,  276,  272, -32768,
			  271, -32768,  269, -32768,  268, -32768,  264, -32768,  263, -32768,

			  251, -32768,  149, -32768,  145, -32768,  119, -32768,   95, -32768,
			   27, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768,   73,   15, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			  359,   17,   10,  -23,  -20,  -14,  -18,  -22,  -26,  -76,
			 -32768, -32768,  116, -32768,   56,  349,  362, -32768, -32768, -32768,
			 -32768,  136,  204,  189, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768,  379,   62, -32768,  281, -32768, -32768,
			  368, -32768,  364, -32768, -32768, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   61,   20,    3,   56,   60,   47,   57,  217,   59,   49,
			  113,  112,   58,   45,   68,  326,   53,   52,  204,  286,
			   -8,  210,   50,   49,   48,   47,   53,   52,   69,   53,
			   23,   75,   50,   49,   48,   47,   55,   74,   73,   46,
			   45,   53,   72,   54,   53,  128,   71,   44,   43,  127,
			  323,   53,  276,  126,   42,   41,   70,  125,    3,  -19,
			  196,   48,  215,   22,   42,   41,   69,  195,  194,   48,
			   50,   44,   43,  325,  263,   24,  282,  230,   52,  195,
			  194,  124,  195,  194,  269,   33,   23,  280,  123,  195,
			  194,   22,   24,  161,  167,  173,  179,  160,  166,  172,

			  178,  159,  165,  171,  177,  158,  164,  170,  176,  203,
			   47,  213,   52,  205,  211,  199,  198,  209,  322,  142,
			  207,   52,  141,   21,  273,  225,  229,  224,  227,  157,
			  163,  169,  175,  228,  278,  226,  156,  162,  168,  174,
			    6,  201,  321,  265,    5,    4,    3,  197,   49,  199,
			  198,   21,   52,   50,   74,   73,  223,    2,  199,  198,
			   49,   50,  222,   47,  284,  274,  206,  272,  320,  270,
			  200,  268,  319,   70,   53,   52,  271,    1,  267,   75,
			   50,   49,   48,   47,   65,   74,   73,   46,   45,  199,
			  198,  111,  110,  266,   71,   44,   43,  256,  264,  255,

			  221,   26,   53,   52,   70,    5,    4,  -19,   50,   49,
			   48,   47,   42,   41,  220,  193,   74,   73,   34,  202,
			   48,   44,   43,   47,  214,  122,  121,  120,  119,  192,
			  287,  208,  285,  212,  283,   70,  281,  254,    1,  253,
			   42,   41,  252,  250,  251,  249,  248,  298,  247,  296,
			  246,  294,  245,  292,  191,  189,  190,  188,  279,  187,
			  310,  186,  308,  277,  306,  185,  304,  184,  183,  181,
			  182,  180,   19,   18,  318,  290,   53,   52,  218,  219,
			  288,   51,   50,   49,   48,   47,  317,  316,  302,   46,
			   45,  315,  314,  300,  313,  312,   49,   44,   43,  311,

			  309,  307,   48,  305,   50,  303,  301,  299,  297,  141,
			  295,  293,  291,  289,   42,   41,  275,  155,  112,  110,
			  113,  111,  262,  261,  260,  259,  258,  257,  244,  243,
			  242,  241,  240,  239,  238,  237,  236,  116,   45,  235,
			  231,   69,  234,  233,  232,  216,    0,    0,  115,   12,
			    0,    0,    0,    0,    0,  140,  139,    3,  154,    7,
			    0,    0,    0,  153,  152,  151,  150,  149,  148,  147,
			  108,  146,    0,  145,  144,  143,   67,   25,  138,  137,
			  136,  135,  134,  133,  132,  131,  130,  129,  114,    2,
			   63,   26,   32,   31,  -19,   66,   30,  109, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			   26,    1,    7,   26,   26,   12,   26,   22,   26,   10,
			    3,    4,   26,   17,   19,    0,    3,    4,   22,   26,
			   20,   22,    9,   10,   11,   12,    3,    4,   43,    3,
			   35,    8,    9,   10,   11,   12,   26,   14,   15,   16,
			   17,    3,   19,   26,    3,   71,   23,   24,   25,   71,
			   23,    3,   26,   71,   41,   42,   33,   71,    7,   36,
			   22,   11,  138,    7,   41,   42,   43,   41,   42,   11,
			    9,   24,   25,    0,   26,   13,   26,  153,    4,   41,
			   42,   71,   41,   42,   26,   23,   35,   26,   71,   41,
			   42,   35,   30,  119,  120,  121,  122,  119,  120,  121,

			  122,  119,  120,  121,  122,  119,  120,  121,  122,  132,
			   12,  137,    4,  133,  136,   41,   42,  135,   23,   40,
			  134,    4,   43,    7,   26,  148,  152,  147,  150,  119,
			  120,  121,  122,  151,   26,  149,  119,  120,  121,  122,
			    1,  131,   23,   26,    5,    6,    7,  130,   10,   41,
			   42,   35,    4,    9,   14,   15,  146,   18,   41,   42,
			   10,    9,  145,   12,   26,  191,   22,  189,   23,  187,
			   22,  185,   23,   33,    3,    4,   26,   38,   26,    8,
			    9,   10,   11,   12,   19,   14,   15,   16,   17,   41,
			   42,    3,    4,  183,   23,   24,   25,   21,  181,   23,

			    8,   36,    3,    4,   33,    5,    6,   36,    9,   10,
			   11,   12,   41,   42,   22,    8,   14,   15,   18,   22,
			   11,   24,   25,   12,   22,   26,   27,   28,   29,   22,
			  256,   22,  254,   22,  252,   33,  250,   21,   38,   23,
			   41,   42,   21,   21,   23,   23,   21,  273,   23,  271,
			   21,  269,   23,  267,   21,   21,   23,   23,  248,   21,
			  286,   23,  284,  246,  282,   21,  280,   23,   21,   21,
			   23,   23,    5,    6,   23,  265,    3,    4,  142,  143,
			  263,    8,    9,   10,   11,   12,   23,   23,  278,   16,
			   17,   23,   23,  276,   23,   23,   10,   24,   25,   23,

			   23,   23,   11,   23,    9,   23,   23,   23,   23,   43,
			   23,   23,   23,   23,   41,   42,   37,   43,    4,    4,
			    3,    3,   23,   23,   23,   23,   23,   23,   23,   23,
			   23,   23,   23,   23,   23,   23,   23,    7,   17,   23,
			    8,   43,   23,   23,  155,  141,   -1,   -1,   67,    0,
			   -1,   -1,   -1,   -1,   -1,   19,   19,    7,   36,    0,
			   -1,   -1,   -1,   40,   40,   40,   40,   40,   40,   40,
			   18,   40,   -1,   40,   40,   40,   20,   20,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   37,   18,
			   26,   36,   39,   39,   36,   27,   17,   35, yyDummy>>)
		end

feature {NONE} -- Semantic value stacks

	yyvs1: SPECIAL [detachable ANY]
			-- Stack for semantic values of type detachable ANY

	yyvsc1: INTEGER
			-- Capacity of semantic value stack `yyvs1'

	yyvsp1: INTEGER
			-- Top of semantic value stack `yyvs1'

	yyspecial_routines1: KL_SPECIAL_ROUTINES [detachable ANY]
			-- Routines that ought to be in SPECIAL [detachable ANY]

	yyvs2: SPECIAL [INTEGER]
			-- Stack for semantic values of type INTEGER

	yyvsc2: INTEGER
			-- Capacity of semantic value stack `yyvs2'

	yyvsp2: INTEGER
			-- Top of semantic value stack `yyvs2'

	yyspecial_routines2: KL_SPECIAL_ROUTINES [INTEGER]
			-- Routines that ought to be in SPECIAL [INTEGER]

	yyvs3: SPECIAL [REAL]
			-- Stack for semantic values of type REAL

	yyvsc3: INTEGER
			-- Capacity of semantic value stack `yyvs3'

	yyvsp3: INTEGER
			-- Top of semantic value stack `yyvs3'

	yyspecial_routines3: KL_SPECIAL_ROUTINES [REAL]
			-- Routines that ought to be in SPECIAL [REAL]

	yyvs4: SPECIAL [STRING]
			-- Stack for semantic values of type STRING

	yyvsc4: INTEGER
			-- Capacity of semantic value stack `yyvs4'

	yyvsp4: INTEGER
			-- Top of semantic value stack `yyvs4'

	yyspecial_routines4: KL_SPECIAL_ROUTINES [STRING]
			-- Routines that ought to be in SPECIAL [STRING]

	yyvs5: SPECIAL [CHARACTER]
			-- Stack for semantic values of type CHARACTER

	yyvsc5: INTEGER
			-- Capacity of semantic value stack `yyvs5'

	yyvsp5: INTEGER
			-- Top of semantic value stack `yyvs5'

	yyspecial_routines5: KL_SPECIAL_ROUTINES [CHARACTER]
			-- Routines that ought to be in SPECIAL [CHARACTER]

	yyvs6: SPECIAL [BOOLEAN]
			-- Stack for semantic values of type BOOLEAN

	yyvsc6: INTEGER
			-- Capacity of semantic value stack `yyvs6'

	yyvsp6: INTEGER
			-- Top of semantic value stack `yyvs6'

	yyspecial_routines6: KL_SPECIAL_ROUTINES [BOOLEAN]
			-- Routines that ought to be in SPECIAL [BOOLEAN]

	yyvs7: SPECIAL [detachable ISO8601_DATE]
			-- Stack for semantic values of type detachable ISO8601_DATE

	yyvsc7: INTEGER
			-- Capacity of semantic value stack `yyvs7'

	yyvsp7: INTEGER
			-- Top of semantic value stack `yyvs7'

	yyspecial_routines7: KL_SPECIAL_ROUTINES [detachable ISO8601_DATE]
			-- Routines that ought to be in SPECIAL [detachable ISO8601_DATE]

	yyvs8: SPECIAL [detachable ISO8601_DATE_TIME]
			-- Stack for semantic values of type detachable ISO8601_DATE_TIME

	yyvsc8: INTEGER
			-- Capacity of semantic value stack `yyvs8'

	yyvsp8: INTEGER
			-- Top of semantic value stack `yyvs8'

	yyspecial_routines8: KL_SPECIAL_ROUTINES [detachable ISO8601_DATE_TIME]
			-- Routines that ought to be in SPECIAL [detachable ISO8601_DATE_TIME]

	yyvs9: SPECIAL [detachable ISO8601_TIME]
			-- Stack for semantic values of type detachable ISO8601_TIME

	yyvsc9: INTEGER
			-- Capacity of semantic value stack `yyvs9'

	yyvsp9: INTEGER
			-- Top of semantic value stack `yyvs9'

	yyspecial_routines9: KL_SPECIAL_ROUTINES [detachable ISO8601_TIME]
			-- Routines that ought to be in SPECIAL [detachable ISO8601_TIME]

	yyvs10: SPECIAL [detachable ISO8601_DURATION]
			-- Stack for semantic values of type detachable ISO8601_DURATION

	yyvsc10: INTEGER
			-- Capacity of semantic value stack `yyvs10'

	yyvsp10: INTEGER
			-- Top of semantic value stack `yyvs10'

	yyspecial_routines10: KL_SPECIAL_ROUTINES [detachable ISO8601_DURATION]
			-- Routines that ought to be in SPECIAL [detachable ISO8601_DURATION]

	yyvs11: SPECIAL [detachable TERMINOLOGY_CODE]
			-- Stack for semantic values of type detachable TERMINOLOGY_CODE

	yyvsc11: INTEGER
			-- Capacity of semantic value stack `yyvs11'

	yyvsp11: INTEGER
			-- Top of semantic value stack `yyvs11'

	yyspecial_routines11: KL_SPECIAL_ROUTINES [detachable TERMINOLOGY_CODE]
			-- Routines that ought to be in SPECIAL [detachable TERMINOLOGY_CODE]

	yyvs12: SPECIAL [detachable URI]
			-- Stack for semantic values of type detachable URI

	yyvsc12: INTEGER
			-- Capacity of semantic value stack `yyvs12'

	yyvsp12: INTEGER
			-- Top of semantic value stack `yyvs12'

	yyspecial_routines12: KL_SPECIAL_ROUTINES [detachable URI]
			-- Routines that ought to be in SPECIAL [detachable URI]

	yyvs13: SPECIAL [detachable DT_COMPLEX_OBJECT_NODE]
			-- Stack for semantic values of type detachable DT_COMPLEX_OBJECT_NODE

	yyvsc13: INTEGER
			-- Capacity of semantic value stack `yyvs13'

	yyvsp13: INTEGER
			-- Top of semantic value stack `yyvs13'

	yyspecial_routines13: KL_SPECIAL_ROUTINES [detachable DT_COMPLEX_OBJECT_NODE]
			-- Routines that ought to be in SPECIAL [detachable DT_COMPLEX_OBJECT_NODE]

	yyvs14: SPECIAL [detachable DT_OBJECT_LEAF]
			-- Stack for semantic values of type detachable DT_OBJECT_LEAF

	yyvsc14: INTEGER
			-- Capacity of semantic value stack `yyvs14'

	yyvsp14: INTEGER
			-- Top of semantic value stack `yyvs14'

	yyspecial_routines14: KL_SPECIAL_ROUTINES [detachable DT_OBJECT_LEAF]
			-- Routines that ought to be in SPECIAL [detachable DT_OBJECT_LEAF]

	yyvs15: SPECIAL [detachable OG_PATH]
			-- Stack for semantic values of type detachable OG_PATH

	yyvsc15: INTEGER
			-- Capacity of semantic value stack `yyvs15'

	yyvsp15: INTEGER
			-- Top of semantic value stack `yyvs15'

	yyspecial_routines15: KL_SPECIAL_ROUTINES [detachable OG_PATH]
			-- Routines that ought to be in SPECIAL [detachable OG_PATH]

	yyvs16: SPECIAL [detachable OG_PATH_ITEM]
			-- Stack for semantic values of type detachable OG_PATH_ITEM

	yyvsc16: INTEGER
			-- Capacity of semantic value stack `yyvs16'

	yyvsp16: INTEGER
			-- Top of semantic value stack `yyvs16'

	yyspecial_routines16: KL_SPECIAL_ROUTINES [detachable OG_PATH_ITEM]
			-- Routines that ought to be in SPECIAL [detachable OG_PATH_ITEM]

	yyvs17: SPECIAL [ARRAYED_LIST [OG_PATH]]
			-- Stack for semantic values of type ARRAYED_LIST [OG_PATH]

	yyvsc17: INTEGER
			-- Capacity of semantic value stack `yyvs17'

	yyvsp17: INTEGER
			-- Top of semantic value stack `yyvs17'

	yyspecial_routines17: KL_SPECIAL_ROUTINES [ARRAYED_LIST [OG_PATH]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [OG_PATH]]

	yyvs18: SPECIAL [detachable ARRAYED_LIST [STRING]]
			-- Stack for semantic values of type detachable ARRAYED_LIST [STRING]

	yyvsc18: INTEGER
			-- Capacity of semantic value stack `yyvs18'

	yyvsp18: INTEGER
			-- Top of semantic value stack `yyvs18'

	yyspecial_routines18: KL_SPECIAL_ROUTINES [detachable ARRAYED_LIST [STRING]]
			-- Routines that ought to be in SPECIAL [detachable ARRAYED_LIST [STRING]]

	yyvs19: SPECIAL [detachable ARRAYED_LIST [INTEGER]]
			-- Stack for semantic values of type detachable ARRAYED_LIST [INTEGER]

	yyvsc19: INTEGER
			-- Capacity of semantic value stack `yyvs19'

	yyvsp19: INTEGER
			-- Top of semantic value stack `yyvs19'

	yyspecial_routines19: KL_SPECIAL_ROUTINES [detachable ARRAYED_LIST [INTEGER]]
			-- Routines that ought to be in SPECIAL [detachable ARRAYED_LIST [INTEGER]]

	yyvs20: SPECIAL [detachable ARRAYED_LIST [REAL]]
			-- Stack for semantic values of type detachable ARRAYED_LIST [REAL]

	yyvsc20: INTEGER
			-- Capacity of semantic value stack `yyvs20'

	yyvsp20: INTEGER
			-- Top of semantic value stack `yyvs20'

	yyspecial_routines20: KL_SPECIAL_ROUTINES [detachable ARRAYED_LIST [REAL]]
			-- Routines that ought to be in SPECIAL [detachable ARRAYED_LIST [REAL]]

	yyvs21: SPECIAL [detachable ARRAYED_LIST [CHARACTER]]
			-- Stack for semantic values of type detachable ARRAYED_LIST [CHARACTER]

	yyvsc21: INTEGER
			-- Capacity of semantic value stack `yyvs21'

	yyvsp21: INTEGER
			-- Top of semantic value stack `yyvs21'

	yyspecial_routines21: KL_SPECIAL_ROUTINES [detachable ARRAYED_LIST [CHARACTER]]
			-- Routines that ought to be in SPECIAL [detachable ARRAYED_LIST [CHARACTER]]

	yyvs22: SPECIAL [detachable ARRAYED_LIST [BOOLEAN]]
			-- Stack for semantic values of type detachable ARRAYED_LIST [BOOLEAN]

	yyvsc22: INTEGER
			-- Capacity of semantic value stack `yyvs22'

	yyvsp22: INTEGER
			-- Top of semantic value stack `yyvs22'

	yyspecial_routines22: KL_SPECIAL_ROUTINES [detachable ARRAYED_LIST [BOOLEAN]]
			-- Routines that ought to be in SPECIAL [detachable ARRAYED_LIST [BOOLEAN]]

	yyvs23: SPECIAL [detachable ARRAYED_LIST [ISO8601_DATE]]
			-- Stack for semantic values of type detachable ARRAYED_LIST [ISO8601_DATE]

	yyvsc23: INTEGER
			-- Capacity of semantic value stack `yyvs23'

	yyvsp23: INTEGER
			-- Top of semantic value stack `yyvs23'

	yyspecial_routines23: KL_SPECIAL_ROUTINES [detachable ARRAYED_LIST [ISO8601_DATE]]
			-- Routines that ought to be in SPECIAL [detachable ARRAYED_LIST [ISO8601_DATE]]

	yyvs24: SPECIAL [detachable ARRAYED_LIST [ISO8601_TIME]]
			-- Stack for semantic values of type detachable ARRAYED_LIST [ISO8601_TIME]

	yyvsc24: INTEGER
			-- Capacity of semantic value stack `yyvs24'

	yyvsp24: INTEGER
			-- Top of semantic value stack `yyvs24'

	yyspecial_routines24: KL_SPECIAL_ROUTINES [detachable ARRAYED_LIST [ISO8601_TIME]]
			-- Routines that ought to be in SPECIAL [detachable ARRAYED_LIST [ISO8601_TIME]]

	yyvs25: SPECIAL [detachable ARRAYED_LIST [ISO8601_DATE_TIME]]
			-- Stack for semantic values of type detachable ARRAYED_LIST [ISO8601_DATE_TIME]

	yyvsc25: INTEGER
			-- Capacity of semantic value stack `yyvs25'

	yyvsp25: INTEGER
			-- Top of semantic value stack `yyvs25'

	yyspecial_routines25: KL_SPECIAL_ROUTINES [detachable ARRAYED_LIST [ISO8601_DATE_TIME]]
			-- Routines that ought to be in SPECIAL [detachable ARRAYED_LIST [ISO8601_DATE_TIME]]

	yyvs26: SPECIAL [detachable ARRAYED_LIST [ISO8601_DURATION]]
			-- Stack for semantic values of type detachable ARRAYED_LIST [ISO8601_DURATION]

	yyvsc26: INTEGER
			-- Capacity of semantic value stack `yyvs26'

	yyvsp26: INTEGER
			-- Top of semantic value stack `yyvs26'

	yyspecial_routines26: KL_SPECIAL_ROUTINES [detachable ARRAYED_LIST [ISO8601_DURATION]]
			-- Routines that ought to be in SPECIAL [detachable ARRAYED_LIST [ISO8601_DURATION]]

	yyvs27: SPECIAL [detachable ARRAYED_LIST [TERMINOLOGY_CODE]]
			-- Stack for semantic values of type detachable ARRAYED_LIST [TERMINOLOGY_CODE]

	yyvsc27: INTEGER
			-- Capacity of semantic value stack `yyvs27'

	yyvsp27: INTEGER
			-- Top of semantic value stack `yyvs27'

	yyspecial_routines27: KL_SPECIAL_ROUTINES [detachable ARRAYED_LIST [TERMINOLOGY_CODE]]
			-- Routines that ought to be in SPECIAL [detachable ARRAYED_LIST [TERMINOLOGY_CODE]]

	yyvs28: SPECIAL [detachable ARRAYED_LIST [ANY]]
			-- Stack for semantic values of type detachable ARRAYED_LIST [ANY]

	yyvsc28: INTEGER
			-- Capacity of semantic value stack `yyvs28'

	yyvsp28: INTEGER
			-- Top of semantic value stack `yyvs28'

	yyspecial_routines28: KL_SPECIAL_ROUTINES [detachable ARRAYED_LIST [ANY]]
			-- Routines that ought to be in SPECIAL [detachable ARRAYED_LIST [ANY]]

	yyvs29: SPECIAL [detachable INTERVAL [INTEGER]]
			-- Stack for semantic values of type detachable INTERVAL [INTEGER]

	yyvsc29: INTEGER
			-- Capacity of semantic value stack `yyvs29'

	yyvsp29: INTEGER
			-- Top of semantic value stack `yyvs29'

	yyspecial_routines29: KL_SPECIAL_ROUTINES [detachable INTERVAL [INTEGER]]
			-- Routines that ought to be in SPECIAL [detachable INTERVAL [INTEGER]]

	yyvs30: SPECIAL [detachable INTERVAL [REAL]]
			-- Stack for semantic values of type detachable INTERVAL [REAL]

	yyvsc30: INTEGER
			-- Capacity of semantic value stack `yyvs30'

	yyvsp30: INTEGER
			-- Top of semantic value stack `yyvs30'

	yyspecial_routines30: KL_SPECIAL_ROUTINES [detachable INTERVAL [REAL]]
			-- Routines that ought to be in SPECIAL [detachable INTERVAL [REAL]]

	yyvs31: SPECIAL [detachable INTERVAL [ISO8601_TIME]]
			-- Stack for semantic values of type detachable INTERVAL [ISO8601_TIME]

	yyvsc31: INTEGER
			-- Capacity of semantic value stack `yyvs31'

	yyvsp31: INTEGER
			-- Top of semantic value stack `yyvs31'

	yyspecial_routines31: KL_SPECIAL_ROUTINES [detachable INTERVAL [ISO8601_TIME]]
			-- Routines that ought to be in SPECIAL [detachable INTERVAL [ISO8601_TIME]]

	yyvs32: SPECIAL [detachable INTERVAL [ISO8601_DATE]]
			-- Stack for semantic values of type detachable INTERVAL [ISO8601_DATE]

	yyvsc32: INTEGER
			-- Capacity of semantic value stack `yyvs32'

	yyvsp32: INTEGER
			-- Top of semantic value stack `yyvs32'

	yyspecial_routines32: KL_SPECIAL_ROUTINES [detachable INTERVAL [ISO8601_DATE]]
			-- Routines that ought to be in SPECIAL [detachable INTERVAL [ISO8601_DATE]]

	yyvs33: SPECIAL [detachable INTERVAL [ISO8601_DATE_TIME]]
			-- Stack for semantic values of type detachable INTERVAL [ISO8601_DATE_TIME]

	yyvsc33: INTEGER
			-- Capacity of semantic value stack `yyvs33'

	yyvsp33: INTEGER
			-- Top of semantic value stack `yyvs33'

	yyspecial_routines33: KL_SPECIAL_ROUTINES [detachable INTERVAL [ISO8601_DATE_TIME]]
			-- Routines that ought to be in SPECIAL [detachable INTERVAL [ISO8601_DATE_TIME]]

	yyvs34: SPECIAL [detachable INTERVAL [ISO8601_DURATION]]
			-- Stack for semantic values of type detachable INTERVAL [ISO8601_DURATION]

	yyvsc34: INTEGER
			-- Capacity of semantic value stack `yyvs34'

	yyvsp34: INTEGER
			-- Top of semantic value stack `yyvs34'

	yyspecial_routines34: KL_SPECIAL_ROUTINES [detachable INTERVAL [ISO8601_DURATION]]
			-- Routines that ought to be in SPECIAL [detachable INTERVAL [ISO8601_DURATION]]

	yyvs35: SPECIAL [detachable INTERVAL [PART_COMPARABLE]]
			-- Stack for semantic values of type detachable INTERVAL [PART_COMPARABLE]

	yyvsc35: INTEGER
			-- Capacity of semantic value stack `yyvs35'

	yyvsp35: INTEGER
			-- Top of semantic value stack `yyvs35'

	yyspecial_routines35: KL_SPECIAL_ROUTINES [detachable INTERVAL [PART_COMPARABLE]]
			-- Routines that ought to be in SPECIAL [detachable INTERVAL [PART_COMPARABLE]]

feature {NONE} -- Constants

	yyFinal: INTEGER = 326
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 44
			-- Number of tokens

	yyLast: INTEGER = 397
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 289
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER = 99
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



feature {NONE} -- Initialization

	make
			-- Create a new parser.
		do
			make_scanner
			make_parser_skeleton
			create time_vc
			create date_vc
			create complex_object_nodes.make(0)
			create attr_nodes.make(0)
			create indent.make(0)

			create complex_object_node.make_anonymous
			create attr_node.make_single("xxx")
		end

feature -- Commands

	reset
		do
			precursor
			validator_reset
			accept -- ensure no syntax errors lying around from previous invocation
		end

	execute (in_text:STRING; a_source_start_line: INTEGER)
		do
			reset

			source_start_line := a_source_start_line

			indent.wipe_out
			complex_object_nodes.wipe_out
			attr_nodes.wipe_out

			create time_vc
			create date_vc
	
			set_input_buffer (new_string_buffer (in_text))
			parse
		end

	error_loc: STRING
		do
			create Result.make_empty
			if attached {YY_FILE_BUFFER} input_buffer as f_buffer then
				Result.append (f_buffer.file.name + ", ")
			end
			Result.append ("line " + (in_lineno + source_start_line).out)
			Result.append(" [last token = " + token_name (last_token) + "]")
		end

feature -- Access

	source_start_line: INTEGER
			-- offset of source in other document, else 0

	output: detachable DT_COMPLEX_OBJECT_NODE
			-- parsed structure

feature {NONE} -- Parse Tree

	complex_object_nodes: ARRAYED_STACK [DT_COMPLEX_OBJECT_NODE]
	complex_object_node: DT_COMPLEX_OBJECT_NODE

	attr_nodes: ARRAYED_STACK [DT_ATTRIBUTE_NODE]
	attr_node: DT_ATTRIBUTE_NODE

	obj_key: detachable STRING
			-- qualifier of last rel name; use for next object creation

	time_vc: TIME_VALIDITY_CHECKER
	date_vc: DATE_VALIDITY_CHECKER

feature {NONE} -- Implementation 
	
	indent: STRING

end
