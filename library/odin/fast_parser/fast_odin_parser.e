note
	component:   "Eiffel Object Modelling Framework"
	description: "Fast non-validating parser for Object Data Instance Notation (ODIN)"
	keywords:    "ODIN, fast, non-validating, data syntax"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class FAST_ODIN_PARSER

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

	ISO8601_ROUTINES
		export
			{NONE} all
		end

	FAST_ODIN_SCANNER
		rename
			make as make_scanner
		redefine
			reset
		end

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
			create yyspecial_routines36
			yyvsc36 := yyInitial_yyvs_size
			yyvs36 := yyspecial_routines36.make (yyvsc36)
			create yyspecial_routines37
			yyvsc37 := yyInitial_yyvs_size
			yyvs37 := yyspecial_routines37.make (yyvsc37)
			create yyspecial_routines38
			yyvsc38 := yyInitial_yyvs_size
			yyvs38 := yyspecial_routines38.make (yyvsc38)
			create yyspecial_routines39
			yyvsc39 := yyInitial_yyvs_size
			yyvs39 := yyspecial_routines39.make (yyvsc39)
			create yyspecial_routines40
			yyvsc40 := yyInitial_yyvs_size
			yyvs40 := yyspecial_routines40.make (yyvsc40)
			create yyspecial_routines41
			yyvsc41 := yyInitial_yyvs_size
			yyvs41 := yyspecial_routines41.make (yyvsc41)
			create yyspecial_routines42
			yyvsc42 := yyInitial_yyvs_size
			yyvs42 := yyspecial_routines42.make (yyvsc42)
			create yyspecial_routines43
			yyvsc43 := yyInitial_yyvs_size
			yyvs43 := yyspecial_routines43.make (yyvsc43)
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
			yyvsp36 := -1
			yyvsp37 := -1
			yyvsp38 := -1
			yyvsp39 := -1
			yyvsp40 := -1
			yyvsp41 := -1
			yyvsp42 := -1
			yyvsp43 := -1
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
			yyvs36.keep_head (0)
			yyvs37.keep_head (0)
			yyvs38.keep_head (0)
			yyvs39.keep_head (0)
			yyvs40.keep_head (0)
			yyvs41.keep_head (0)
			yyvs42.keep_head (0)
			yyvs43.keep_head (0)
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
				yyspecial_routines1.force (yyvs1, last_detachable_any_value, yyvsp1)
			when 2 then
				yyvsp2 := yyvsp2 + 1
				if yyvsp2 >= yyvsc2 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs2")
					end
					yyvsc2 := yyvsc2 + yyInitial_yyvs_size
					yyvs2 := yyspecial_routines2.aliased_resized_area (yyvs2, yyvsc2)
				end
				yyspecial_routines2.force (yyvs2, last_integer_value, yyvsp2)
			when 3 then
				yyvsp3 := yyvsp3 + 1
				if yyvsp3 >= yyvsc3 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs3")
					end
					yyvsc3 := yyvsc3 + yyInitial_yyvs_size
					yyvs3 := yyspecial_routines3.aliased_resized_area (yyvs3, yyvsc3)
				end
				yyspecial_routines3.force (yyvs3, last_real_value, yyvsp3)
			when 4 then
				yyvsp4 := yyvsp4 + 1
				if yyvsp4 >= yyvsc4 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs4")
					end
					yyvsc4 := yyvsc4 + yyInitial_yyvs_size
					yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
				end
				yyspecial_routines4.force (yyvs4, last_string_value, yyvsp4)
			when 5 then
				yyvsp5 := yyvsp5 + 1
				if yyvsp5 >= yyvsc5 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs5")
					end
					yyvsc5 := yyvsc5 + yyInitial_yyvs_size
					yyvs5 := yyspecial_routines5.aliased_resized_area (yyvs5, yyvsc5)
				end
				yyspecial_routines5.force (yyvs5, last_character_value, yyvsp5)
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
			when 36 then
				yyvsp36 := yyvsp36 - 1
			when 37 then
				yyvsp37 := yyvsp37 - 1
			when 38 then
				yyvsp38 := yyvsp38 - 1
			when 39 then
				yyvsp39 := yyvsp39 - 1
			when 40 then
				yyvsp40 := yyvsp40 - 1
			when 41 then
				yyvsp41 := yyvsp41 - 1
			when 42 then
				yyvsp42 := yyvsp42 - 1
			when 43 then
				yyvsp43 := yyvsp43 - 1
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
			yy_retried: BOOLEAN
			yyval1: detachable ANY
			yyval13: DT_COMPLEX_OBJECT
			yyval14: DT_OBJECT_LEAF
			yyval15: ANY
			yyval29: ARRAYED_LIST [ANY]
			yyval36: INTERVAL [PART_COMPARABLE]
			yyval43: ARRAYED_LIST [INTERVAL [PART_COMPARABLE]]
			yyval4: STRING
			yyval19: ARRAYED_LIST [STRING]
			yyval2: INTEGER
			yyval20: ARRAYED_LIST [INTEGER]
			yyval30: INTERVAL [INTEGER]
			yyval37: ARRAYED_LIST [INTERVAL [INTEGER]]
			yyval3: REAL
			yyval21: ARRAYED_LIST [REAL]
			yyval31: INTERVAL [REAL]
			yyval38: ARRAYED_LIST [INTERVAL [REAL]]
			yyval6: BOOLEAN
			yyval23: ARRAYED_LIST [BOOLEAN]
			yyval5: CHARACTER
			yyval22: ARRAYED_LIST [CHARACTER]
			yyval7: ISO8601_DATE
			yyval24: ARRAYED_LIST [ISO8601_DATE]
			yyval33: INTERVAL [ISO8601_DATE]
			yyval40: ARRAYED_LIST [INTERVAL [ISO8601_DATE]]
			yyval9: ISO8601_TIME
			yyval25: ARRAYED_LIST [ISO8601_TIME]
			yyval32: INTERVAL [ISO8601_TIME]
			yyval39: ARRAYED_LIST [INTERVAL [ISO8601_TIME]]
			yyval8: ISO8601_DATE_TIME
			yyval26: ARRAYED_LIST [ISO8601_DATE_TIME]
			yyval34: INTERVAL [ISO8601_DATE_TIME]
			yyval41: ARRAYED_LIST [INTERVAL [ISO8601_DATE_TIME]]
			yyval10: ISO8601_DURATION
			yyval27: ARRAYED_LIST [ISO8601_DURATION]
			yyval35: INTERVAL [ISO8601_DURATION]
			yyval42: ARRAYED_LIST [INTERVAL [ISO8601_DURATION]]
			yyval11: TERMINOLOGY_CODE
			yyval28: ARRAYED_LIST [TERMINOLOGY_CODE]
			yyval12: URI
			yyval18: ARRAYED_LIST [OG_PATH]
			yyval16: OG_PATH
			yyval17: OG_PATH_ITEM
		do
			if not yy_retried then
				inspect yy_act
when 1 then
--|#line 116 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 116")
end

			output := complex_object_nodes.item
			accept
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 2 then
--|#line 121 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 121")
end

			output := yyvs13.item (yyvsp13)
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
--|#line 126 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 126")
end

			abort
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 4 then
--|#line 135 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 135")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 5 then
--|#line 138 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 138")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 6 then
--|#line 141 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 141")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 7 then
--|#line 147 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 147")
end

			attr_nodes.remove
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 8 then
--|#line 153 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 153")
end

			-- create first anonymous object
			if complex_object_nodes.is_empty then
				create complex_object_node.make_anonymous
				complex_object_nodes.extend(complex_object_node)
			end

			create attr_node.make_single(yyvs4.item (yyvsp4))
			complex_object_nodes.item.put_attribute(attr_node)
			attr_nodes.extend(attr_node)
			create obj_key.make_empty
		
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
--|#line 171 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 171")
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
when 10 then
--|#line 178 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 178")
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
when 11 then
--|#line 179 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 179")
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
--|#line 180 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 180")
end

			-- for single-valued attributes, remove the attribute
			if obj_key.is_empty then
				complex_object_nodes.item.remove_attribute (attr_node.im_attr_name)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 13 then
--|#line 189 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 189")
end

			yyval13 := yyvs13.item (yyvsp13)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 14 then
--|#line 193 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 193")
end

			yyval13 := yyvs13.item (yyvsp13)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 15 then
--|#line 202 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 202")
end

			yyval13 := yyvs13.item (yyvsp13)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 16 then
--|#line 206 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 206")
end

			-- probably should set type name on owning attribute - it doesn't belong on each 
			-- object, since it is essentially a constraint
			yyval13 := yyvs13.item (yyvsp13)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 -1
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 17 then
--|#line 225 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 225")
end

			yyval13 := complex_object_nodes.item

			-- if the keyed_objects were all empty, then the attribute can be thrown away 
			-- as well, since we don't create void object structures
			if attr_nodes.item.is_empty then
				attr_nodes.item.parent.remove_attribute (attr_nodes.item.im_attr_name)
			end

			-- if the current C_ATTRIBUTE_NODE is a synthesised one, under a keyed object,
			-- then pop it off the attribute stack, and also pop off its parent object
			if complex_object_nodes.item.is_addressable and attr_nodes.item.is_nested then
				-- pop the generic attr node
				attr_nodes.remove
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
when 18 then
--|#line 267 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 267")
end

			-- if obj_key is set, it means we are inside a keyed object, and we have hit more keyed objects
			if not obj_key.is_empty then
				create complex_object_node.make_identified (obj_key)
				attr_nodes.item.put_child (complex_object_node)
				complex_object_nodes.extend(complex_object_node)

				-- now create a generic attribute node to stand for the hidden attribute of the 
				-- generic object, e.g. it might be List<T>.items or whatever
				create attr_node.make_nested_container
				complex_object_node.put_attribute(attr_node)
				attr_nodes.extend(attr_node)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 19 then
--|#line 284 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 284")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 20 then
--|#line 287 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 287")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 21 then
--|#line 292 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 292")
end

		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 22 then
--|#line 297 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 297")
end

			obj_key := yyvs15.item (yyvsp15).out

			attr_nodes.item.set_container_type
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp15 := yyvsp15 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 23 then
--|#line 309 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 309")
end

			yyval13 := yyvs13.item (yyvsp13)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 24 then
--|#line 313 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 313")
end

			yyvs13.item (yyvsp13).set_visible_im_type_name(yyvs4.item (yyvsp4))
			yyval13 := yyvs13.item (yyvsp13)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 -1
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 25 then
--|#line 328 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 328")
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
when 26 then
--|#line 335 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 335")
end

			-- if parent attr is not multiple, create an anon object; else an object identified by a key
			if attr_nodes.is_empty or else not attr_nodes.item.is_container_type then
				create complex_object_node.make_anonymous
			else
				create complex_object_node.make_identified (obj_key)
				create obj_key.make_empty
			end

			-- now put the new object under its attribute, if one exists
			if not attr_nodes.is_empty then
				attr_nodes.item.put_child(complex_object_node)
			end

			-- finally, put the new object on the object stack
			complex_object_nodes.extend(complex_object_node)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 27 then
--|#line 358 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 358")
end

			yyval14 := yyvs14.item (yyvsp14)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 28 then
--|#line 362 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 362")
end

			yyvs14.item (yyvsp14).set_visible_im_type_name (yyvs4.item (yyvsp4))
			yyval14 := yyvs14.item (yyvsp14)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 -1
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 29 then
--|#line 372 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 372")
end

			yyval14 := yyvs14.item (yyvsp14)
			create obj_key.make_empty
			attr_nodes.item.put_child (yyval14)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 30 then
--|#line 380 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 380")
end

			if not obj_key.is_empty then
				create {DT_PRIMITIVE_OBJECT} yyval14.make_identified (yyvs15.item (yyvsp15), obj_key)
			else
				create {DT_PRIMITIVE_OBJECT} yyval14.make_anonymous (yyvs15.item (yyvsp15))
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
when 31 then
--|#line 388 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 388")
end

			if not obj_key.is_empty then
				create {DT_PRIMITIVE_OBJECT_LIST} yyval14.make_identified (yyvs29.item (yyvsp29), obj_key)
			else
				create {DT_PRIMITIVE_OBJECT_LIST} yyval14.make_anonymous (yyvs29.item (yyvsp29))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp14 := yyvsp14 + 1
	yyvsp29 := yyvsp29 -1
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
--|#line 396 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 396")
end

			if not obj_key.is_empty then
				create {DT_PRIMITIVE_OBJECT_INTERVAL} yyval14.make_identified (yyvs36.item (yyvsp36), obj_key)
			else
				create {DT_PRIMITIVE_OBJECT_INTERVAL} yyval14.make_anonymous (yyvs36.item (yyvsp36))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp14 := yyvsp14 + 1
	yyvsp36 := yyvsp36 -1
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
--|#line 404 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 404")
end

			if not obj_key.is_empty then
				create {DT_PRIMITIVE_OBJECT_INTERVAL_LIST} yyval14.make_identified (yyvs43.item (yyvsp43), obj_key)
			else
				create {DT_PRIMITIVE_OBJECT_INTERVAL_LIST} yyval14.make_anonymous (yyvs43.item (yyvsp43))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp14 := yyvsp14 + 1
	yyvsp43 := yyvsp43 -1
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
--|#line 412 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 412")
end

			if not obj_key.is_empty then
				create {DT_PRIMITIVE_OBJECT} yyval14.make_identified (yyvs11.item (yyvsp11), obj_key)
			else
				create {DT_PRIMITIVE_OBJECT} yyval14.make_anonymous (yyvs11.item (yyvsp11))
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
--|#line 420 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 420")
end

			if not obj_key.is_empty then
				create {DT_PRIMITIVE_OBJECT_LIST} yyval14.make_identified (yyvs28.item (yyvsp28), obj_key)
			else
				create {DT_PRIMITIVE_OBJECT_LIST} yyval14.make_anonymous (yyvs28.item (yyvsp28))
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
when 36 then
--|#line 430 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 430")
end

			yyval15 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp15 := yyvsp15 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp15 >= yyvsc15 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs15")
		end
		yyvsc15 := yyvsc15 + yyInitial_yyvs_size
		yyvs15 := yyspecial_routines15.aliased_resized_area (yyvs15, yyvsc15)
	end
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 37 then
--|#line 434 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 434")
end

			yyval15 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp15 := yyvsp15 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp15 >= yyvsc15 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs15")
		end
		yyvsc15 := yyvsc15 + yyInitial_yyvs_size
		yyvs15 := yyspecial_routines15.aliased_resized_area (yyvs15, yyvsc15)
	end
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 38 then
--|#line 438 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 438")
end

			yyval15 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp15 := yyvsp15 + 1
	yyvsp3 := yyvsp3 -1
	if yyvsp15 >= yyvsc15 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs15")
		end
		yyvsc15 := yyvsc15 + yyInitial_yyvs_size
		yyvs15 := yyspecial_routines15.aliased_resized_area (yyvs15, yyvsc15)
	end
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 39 then
--|#line 442 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 442")
end

			yyval15 := yyvs6.item (yyvsp6)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp15 := yyvsp15 + 1
	yyvsp6 := yyvsp6 -1
	if yyvsp15 >= yyvsc15 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs15")
		end
		yyvsc15 := yyvsc15 + yyInitial_yyvs_size
		yyvs15 := yyspecial_routines15.aliased_resized_area (yyvs15, yyvsc15)
	end
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 40 then
--|#line 446 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 446")
end

			yyval15 := yyvs5.item (yyvsp5)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp15 := yyvsp15 + 1
	yyvsp5 := yyvsp5 -1
	if yyvsp15 >= yyvsc15 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs15")
		end
		yyvsc15 := yyvsc15 + yyInitial_yyvs_size
		yyvs15 := yyspecial_routines15.aliased_resized_area (yyvs15, yyvsc15)
	end
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 41 then
--|#line 450 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 450")
end

			yyval15 := yyvs7.item (yyvsp7)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp15 := yyvsp15 + 1
	yyvsp7 := yyvsp7 -1
	if yyvsp15 >= yyvsc15 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs15")
		end
		yyvsc15 := yyvsc15 + yyInitial_yyvs_size
		yyvs15 := yyspecial_routines15.aliased_resized_area (yyvs15, yyvsc15)
	end
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 42 then
--|#line 454 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 454")
end

			yyval15 := yyvs9.item (yyvsp9)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp15 := yyvsp15 + 1
	yyvsp9 := yyvsp9 -1
	if yyvsp15 >= yyvsc15 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs15")
		end
		yyvsc15 := yyvsc15 + yyInitial_yyvs_size
		yyvs15 := yyspecial_routines15.aliased_resized_area (yyvs15, yyvsc15)
	end
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 43 then
--|#line 458 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 458")
end

			yyval15 := yyvs8.item (yyvsp8)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp15 := yyvsp15 + 1
	yyvsp8 := yyvsp8 -1
	if yyvsp15 >= yyvsc15 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs15")
		end
		yyvsc15 := yyvsc15 + yyInitial_yyvs_size
		yyvs15 := yyspecial_routines15.aliased_resized_area (yyvs15, yyvsc15)
	end
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 44 then
--|#line 462 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 462")
end

			yyval15 := yyvs10.item (yyvsp10)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp15 := yyvsp15 + 1
	yyvsp10 := yyvsp10 -1
	if yyvsp15 >= yyvsc15 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs15")
		end
		yyvsc15 := yyvsc15 + yyInitial_yyvs_size
		yyvs15 := yyspecial_routines15.aliased_resized_area (yyvs15, yyvsc15)
	end
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 45 then
--|#line 466 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 466")
end

			yyval15 := yyvs12.item (yyvsp12)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp15 := yyvsp15 + 1
	yyvsp12 := yyvsp12 -1
	if yyvsp15 >= yyvsc15 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs15")
		end
		yyvsc15 := yyvsc15 + yyInitial_yyvs_size
		yyvs15 := yyspecial_routines15.aliased_resized_area (yyvs15, yyvsc15)
	end
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
when 46 then
--|#line 472 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 472")
end

			yyval29 := yyvs19.item (yyvsp19)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp29 := yyvsp29 + 1
	yyvsp19 := yyvsp19 -1
	if yyvsp29 >= yyvsc29 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs29")
		end
		yyvsc29 := yyvsc29 + yyInitial_yyvs_size
		yyvs29 := yyspecial_routines29.aliased_resized_area (yyvs29, yyvsc29)
	end
	yyspecial_routines29.force (yyvs29, yyval29, yyvsp29)
end
when 47 then
--|#line 476 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 476")
end

			yyval29 := yyvs20.item (yyvsp20)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp29 := yyvsp29 + 1
	yyvsp20 := yyvsp20 -1
	if yyvsp29 >= yyvsc29 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs29")
		end
		yyvsc29 := yyvsc29 + yyInitial_yyvs_size
		yyvs29 := yyspecial_routines29.aliased_resized_area (yyvs29, yyvsc29)
	end
	yyspecial_routines29.force (yyvs29, yyval29, yyvsp29)
end
when 48 then
--|#line 480 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 480")
end

			yyval29 := yyvs21.item (yyvsp21)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp29 := yyvsp29 + 1
	yyvsp21 := yyvsp21 -1
	if yyvsp29 >= yyvsc29 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs29")
		end
		yyvsc29 := yyvsc29 + yyInitial_yyvs_size
		yyvs29 := yyspecial_routines29.aliased_resized_area (yyvs29, yyvsc29)
	end
	yyspecial_routines29.force (yyvs29, yyval29, yyvsp29)
end
when 49 then
--|#line 484 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 484")
end

			yyval29 := yyvs23.item (yyvsp23)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp29 := yyvsp29 + 1
	yyvsp23 := yyvsp23 -1
	if yyvsp29 >= yyvsc29 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs29")
		end
		yyvsc29 := yyvsc29 + yyInitial_yyvs_size
		yyvs29 := yyspecial_routines29.aliased_resized_area (yyvs29, yyvsc29)
	end
	yyspecial_routines29.force (yyvs29, yyval29, yyvsp29)
end
when 50 then
--|#line 488 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 488")
end

			yyval29 := yyvs22.item (yyvsp22)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp29 := yyvsp29 + 1
	yyvsp22 := yyvsp22 -1
	if yyvsp29 >= yyvsc29 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs29")
		end
		yyvsc29 := yyvsc29 + yyInitial_yyvs_size
		yyvs29 := yyspecial_routines29.aliased_resized_area (yyvs29, yyvsc29)
	end
	yyspecial_routines29.force (yyvs29, yyval29, yyvsp29)
end
when 51 then
--|#line 492 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 492")
end

			yyval29 := yyvs24.item (yyvsp24)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp29 := yyvsp29 + 1
	yyvsp24 := yyvsp24 -1
	if yyvsp29 >= yyvsc29 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs29")
		end
		yyvsc29 := yyvsc29 + yyInitial_yyvs_size
		yyvs29 := yyspecial_routines29.aliased_resized_area (yyvs29, yyvsc29)
	end
	yyspecial_routines29.force (yyvs29, yyval29, yyvsp29)
end
when 52 then
--|#line 496 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 496")
end

			yyval29 := yyvs25.item (yyvsp25)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp29 := yyvsp29 + 1
	yyvsp25 := yyvsp25 -1
	if yyvsp29 >= yyvsc29 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs29")
		end
		yyvsc29 := yyvsc29 + yyInitial_yyvs_size
		yyvs29 := yyspecial_routines29.aliased_resized_area (yyvs29, yyvsc29)
	end
	yyspecial_routines29.force (yyvs29, yyval29, yyvsp29)
end
when 53 then
--|#line 500 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 500")
end

			yyval29 := yyvs26.item (yyvsp26)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp29 := yyvsp29 + 1
	yyvsp26 := yyvsp26 -1
	if yyvsp29 >= yyvsc29 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs29")
		end
		yyvsc29 := yyvsc29 + yyInitial_yyvs_size
		yyvs29 := yyspecial_routines29.aliased_resized_area (yyvs29, yyvsc29)
	end
	yyspecial_routines29.force (yyvs29, yyval29, yyvsp29)
end
when 54 then
--|#line 504 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 504")
end

			yyval29 := yyvs27.item (yyvsp27)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp29 := yyvsp29 + 1
	yyvsp27 := yyvsp27 -1
	if yyvsp29 >= yyvsc29 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs29")
		end
		yyvsc29 := yyvsc29 + yyInitial_yyvs_size
		yyvs29 := yyspecial_routines29.aliased_resized_area (yyvs29, yyvsc29)
	end
	yyspecial_routines29.force (yyvs29, yyval29, yyvsp29)
end
when 55 then
--|#line 510 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 510")
end

			yyval36 := yyvs30.item (yyvsp30)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp36 := yyvsp36 + 1
	yyvsp30 := yyvsp30 -1
	if yyvsp36 >= yyvsc36 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs36")
		end
		yyvsc36 := yyvsc36 + yyInitial_yyvs_size
		yyvs36 := yyspecial_routines36.aliased_resized_area (yyvs36, yyvsc36)
	end
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
when 56 then
--|#line 514 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 514")
end

			yyval36 := yyvs31.item (yyvsp31)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp36 := yyvsp36 + 1
	yyvsp31 := yyvsp31 -1
	if yyvsp36 >= yyvsc36 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs36")
		end
		yyvsc36 := yyvsc36 + yyInitial_yyvs_size
		yyvs36 := yyspecial_routines36.aliased_resized_area (yyvs36, yyvsc36)
	end
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
when 57 then
--|#line 518 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 518")
end

			yyval36 := yyvs33.item (yyvsp33)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp36 := yyvsp36 + 1
	yyvsp33 := yyvsp33 -1
	if yyvsp36 >= yyvsc36 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs36")
		end
		yyvsc36 := yyvsc36 + yyInitial_yyvs_size
		yyvs36 := yyspecial_routines36.aliased_resized_area (yyvs36, yyvsc36)
	end
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
when 58 then
--|#line 522 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 522")
end

			yyval36 := yyvs32.item (yyvsp32)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp36 := yyvsp36 + 1
	yyvsp32 := yyvsp32 -1
	if yyvsp36 >= yyvsc36 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs36")
		end
		yyvsc36 := yyvsc36 + yyInitial_yyvs_size
		yyvs36 := yyspecial_routines36.aliased_resized_area (yyvs36, yyvsc36)
	end
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
when 59 then
--|#line 526 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 526")
end

			yyval36 := yyvs34.item (yyvsp34)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp36 := yyvsp36 + 1
	yyvsp34 := yyvsp34 -1
	if yyvsp36 >= yyvsc36 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs36")
		end
		yyvsc36 := yyvsc36 + yyInitial_yyvs_size
		yyvs36 := yyspecial_routines36.aliased_resized_area (yyvs36, yyvsc36)
	end
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
when 60 then
--|#line 530 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 530")
end

			yyval36 := yyvs35.item (yyvsp35)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp36 := yyvsp36 + 1
	yyvsp35 := yyvsp35 -1
	if yyvsp36 >= yyvsc36 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs36")
		end
		yyvsc36 := yyvsc36 + yyInitial_yyvs_size
		yyvs36 := yyspecial_routines36.aliased_resized_area (yyvs36, yyvsc36)
	end
	yyspecial_routines36.force (yyvs36, yyval36, yyvsp36)
end
when 61 then
--|#line 536 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 536")
end

			yyval43 := yyvs37.item (yyvsp37)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp43 := yyvsp43 + 1
	yyvsp37 := yyvsp37 -1
	if yyvsp43 >= yyvsc43 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs43")
		end
		yyvsc43 := yyvsc43 + yyInitial_yyvs_size
		yyvs43 := yyspecial_routines43.aliased_resized_area (yyvs43, yyvsc43)
	end
	yyspecial_routines43.force (yyvs43, yyval43, yyvsp43)
end
when 62 then
--|#line 540 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 540")
end

			yyval43 := yyvs38.item (yyvsp38)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp43 := yyvsp43 + 1
	yyvsp38 := yyvsp38 -1
	if yyvsp43 >= yyvsc43 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs43")
		end
		yyvsc43 := yyvsc43 + yyInitial_yyvs_size
		yyvs43 := yyspecial_routines43.aliased_resized_area (yyvs43, yyvsc43)
	end
	yyspecial_routines43.force (yyvs43, yyval43, yyvsp43)
end
when 63 then
--|#line 544 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 544")
end

			yyval43 := yyvs40.item (yyvsp40)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp43 := yyvsp43 + 1
	yyvsp40 := yyvsp40 -1
	if yyvsp43 >= yyvsc43 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs43")
		end
		yyvsc43 := yyvsc43 + yyInitial_yyvs_size
		yyvs43 := yyspecial_routines43.aliased_resized_area (yyvs43, yyvsc43)
	end
	yyspecial_routines43.force (yyvs43, yyval43, yyvsp43)
end
when 64 then
--|#line 548 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 548")
end

			yyval43 := yyvs39.item (yyvsp39)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp43 := yyvsp43 + 1
	yyvsp39 := yyvsp39 -1
	if yyvsp43 >= yyvsc43 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs43")
		end
		yyvsc43 := yyvsc43 + yyInitial_yyvs_size
		yyvs43 := yyspecial_routines43.aliased_resized_area (yyvs43, yyvsc43)
	end
	yyspecial_routines43.force (yyvs43, yyval43, yyvsp43)
end
when 65 then
--|#line 552 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 552")
end

			yyval43 := yyvs41.item (yyvsp41)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp43 := yyvsp43 + 1
	yyvsp41 := yyvsp41 -1
	if yyvsp43 >= yyvsc43 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs43")
		end
		yyvsc43 := yyvsc43 + yyInitial_yyvs_size
		yyvs43 := yyspecial_routines43.aliased_resized_area (yyvs43, yyvsc43)
	end
	yyspecial_routines43.force (yyvs43, yyval43, yyvsp43)
end
when 66 then
--|#line 556 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 556")
end

			yyval43 := yyvs42.item (yyvsp42)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp43 := yyvsp43 + 1
	yyvsp42 := yyvsp42 -1
	if yyvsp43 >= yyvsc43 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs43")
		end
		yyvsc43 := yyvsc43 + yyInitial_yyvs_size
		yyvs43 := yyspecial_routines43.aliased_resized_area (yyvs43, yyvsc43)
	end
	yyspecial_routines43.force (yyvs43, yyval43, yyvsp43)
end
when 67 then
--|#line 562 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 562")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 68 then
--|#line 566 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 566")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 69 then
--|#line 570 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 570")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 70 then
--|#line 574 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 574")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 71 then
--|#line 583 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 583")
end

			yyval4 := yyvs4.item (yyvsp4)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 72 then
--|#line 589 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 589")
end

			create yyval19.make(0)
			yyval19.extend(yyvs4.item (yyvsp4 - 1))
			yyval19.extend(yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp19 := yyvsp19 + 1
	yyvsp4 := yyvsp4 -2
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
when 73 then
--|#line 595 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 595")
end

			yyvs19.item (yyvsp19).extend(yyvs4.item (yyvsp4))
			yyval19 := yyvs19.item (yyvsp19)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 74 then
--|#line 600 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 600")
end

			create yyval19.make (0)
			yyval19.extend (yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp19 := yyvsp19 + 1
	yyvsp4 := yyvsp4 -1
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
when 75 then
--|#line 607 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 607")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 76 then
--|#line 610 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 610")
end

			yyval2 := yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 77 then
--|#line 613 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 613")
end

			yyval2 := - yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 78 then
--|#line 618 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 618")
end

			create yyval20.make(0)
			yyval20.extend(yyvs2.item (yyvsp2 - 1))
			yyval20.extend(yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp20 := yyvsp20 + 1
	yyvsp2 := yyvsp2 -2
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
when 79 then
--|#line 624 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 624")
end

			yyvs20.item (yyvsp20).extend(yyvs2.item (yyvsp2))
			yyval20 := yyvs20.item (yyvsp20)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
when 80 then
--|#line 629 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 629")
end

			create yyval20.make(0)
			yyval20.extend(yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp20 := yyvsp20 + 1
	yyvsp2 := yyvsp2 -1
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
when 81 then
--|#line 636 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 636")
end

			create {PROPER_INTERVAL [INTEGER]} yyval30.make_bounded(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), True, True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp30 := yyvsp30 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -2
	if yyvsp30 >= yyvsc30 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs30")
		end
		yyvsc30 := yyvsc30 + yyInitial_yyvs_size
		yyvs30 := yyspecial_routines30.aliased_resized_area (yyvs30, yyvsc30)
	end
	yyspecial_routines30.force (yyvs30, yyval30, yyvsp30)
end
when 82 then
--|#line 640 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 640")
end

			create {PROPER_INTERVAL [INTEGER]} yyval30.make_bounded(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), False, True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp30 := yyvsp30 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp2 := yyvsp2 -2
	if yyvsp30 >= yyvsc30 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs30")
		end
		yyvsc30 := yyvsc30 + yyInitial_yyvs_size
		yyvs30 := yyspecial_routines30.aliased_resized_area (yyvs30, yyvsc30)
	end
	yyspecial_routines30.force (yyvs30, yyval30, yyvsp30)
end
when 83 then
--|#line 644 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 644")
end

			create {PROPER_INTERVAL [INTEGER]} yyval30.make_bounded(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), True, False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp30 := yyvsp30 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp2 := yyvsp2 -2
	if yyvsp30 >= yyvsc30 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs30")
		end
		yyvsc30 := yyvsc30 + yyInitial_yyvs_size
		yyvs30 := yyspecial_routines30.aliased_resized_area (yyvs30, yyvsc30)
	end
	yyspecial_routines30.force (yyvs30, yyval30, yyvsp30)
end
when 84 then
--|#line 648 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 648")
end

			create {PROPER_INTERVAL [INTEGER]} yyval30.make_bounded (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), False, False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp30 := yyvsp30 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp2 := yyvsp2 -2
	if yyvsp30 >= yyvsc30 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs30")
		end
		yyvsc30 := yyvsc30 + yyInitial_yyvs_size
		yyvs30 := yyspecial_routines30.aliased_resized_area (yyvs30, yyvsc30)
	end
	yyspecial_routines30.force (yyvs30, yyval30, yyvsp30)
end
when 85 then
--|#line 652 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 652")
end

			create {PROPER_INTERVAL [INTEGER]} yyval30.make_lower_unbounded (yyvs2.item (yyvsp2), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp30 := yyvsp30 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -1
	if yyvsp30 >= yyvsc30 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs30")
		end
		yyvsc30 := yyvsc30 + yyInitial_yyvs_size
		yyvs30 := yyspecial_routines30.aliased_resized_area (yyvs30, yyvsc30)
	end
	yyspecial_routines30.force (yyvs30, yyval30, yyvsp30)
end
when 86 then
--|#line 656 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 656")
end

			create {PROPER_INTERVAL [INTEGER]} yyval30.make_lower_unbounded (yyvs2.item (yyvsp2), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp30 := yyvsp30 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -1
	if yyvsp30 >= yyvsc30 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs30")
		end
		yyvsc30 := yyvsc30 + yyInitial_yyvs_size
		yyvs30 := yyspecial_routines30.aliased_resized_area (yyvs30, yyvsc30)
	end
	yyspecial_routines30.force (yyvs30, yyval30, yyvsp30)
end
when 87 then
--|#line 660 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 660")
end

			create {PROPER_INTERVAL [INTEGER]} yyval30.make_upper_unbounded (yyvs2.item (yyvsp2), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp30 := yyvsp30 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -1
	if yyvsp30 >= yyvsc30 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs30")
		end
		yyvsc30 := yyvsc30 + yyInitial_yyvs_size
		yyvs30 := yyspecial_routines30.aliased_resized_area (yyvs30, yyvsc30)
	end
	yyspecial_routines30.force (yyvs30, yyval30, yyvsp30)
end
when 88 then
--|#line 664 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 664")
end

			create {PROPER_INTERVAL [INTEGER]} yyval30.make_upper_unbounded (yyvs2.item (yyvsp2), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp30 := yyvsp30 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -1
	if yyvsp30 >= yyvsc30 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs30")
		end
		yyvsc30 := yyvsc30 + yyInitial_yyvs_size
		yyvs30 := yyspecial_routines30.aliased_resized_area (yyvs30, yyvsc30)
	end
	yyspecial_routines30.force (yyvs30, yyval30, yyvsp30)
end
when 89 then
--|#line 668 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 668")
end

			create {POINT_INTERVAL [INTEGER]} yyval30.make (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp30 := yyvsp30 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp2 := yyvsp2 -1
	if yyvsp30 >= yyvsc30 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs30")
		end
		yyvsc30 := yyvsc30 + yyInitial_yyvs_size
		yyvs30 := yyspecial_routines30.aliased_resized_area (yyvs30, yyvsc30)
	end
	yyspecial_routines30.force (yyvs30, yyval30, yyvsp30)
end
when 90 then
--|#line 674 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 674")
end

			create yyval37.make(0)
			yyval37.extend(yyvs30.item (yyvsp30 - 1))
			yyval37.extend(yyvs30.item (yyvsp30))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp37 := yyvsp37 + 1
	yyvsp30 := yyvsp30 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp37 >= yyvsc37 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs37")
		end
		yyvsc37 := yyvsc37 + yyInitial_yyvs_size
		yyvs37 := yyspecial_routines37.aliased_resized_area (yyvs37, yyvsc37)
	end
	yyspecial_routines37.force (yyvs37, yyval37, yyvsp37)
end
when 91 then
--|#line 680 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 680")
end

			yyvs37.item (yyvsp37).extend(yyvs30.item (yyvsp30))
			yyval37 := yyvs37.item (yyvsp37)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp30 := yyvsp30 -1
	yyspecial_routines37.force (yyvs37, yyval37, yyvsp37)
end
when 92 then
--|#line 685 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 685")
end

			create yyval37.make(0)
			yyval37.extend(yyvs30.item (yyvsp30))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp37 := yyvsp37 + 1
	yyvsp30 := yyvsp30 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp37 >= yyvsc37 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs37")
		end
		yyvsc37 := yyvsc37 + yyInitial_yyvs_size
		yyvs37 := yyspecial_routines37.aliased_resized_area (yyvs37, yyvsc37)
	end
	yyspecial_routines37.force (yyvs37, yyval37, yyvsp37)
end
when 93 then
--|#line 692 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 692")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 94 then
--|#line 696 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 696")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 95 then
--|#line 700 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 700")
end

			yyval3 := - yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 96 then
--|#line 706 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 706")
end

			create yyval21.make(0)
			yyval21.extend(yyvs3.item (yyvsp3 - 1))
			yyval21.extend(yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp21 := yyvsp21 + 1
	yyvsp3 := yyvsp3 -2
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
when 97 then
--|#line 712 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 712")
end

			yyvs21.item (yyvsp21).extend(yyvs3.item (yyvsp3))
			yyval21 := yyvs21.item (yyvsp21)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp3 := yyvsp3 -1
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 98 then
--|#line 717 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 717")
end

			create yyval21.make(0)
			yyval21.extend(yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp21 := yyvsp21 + 1
	yyvsp3 := yyvsp3 -1
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
when 99 then
--|#line 724 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 724")
end

			create {PROPER_INTERVAL [REAL]} yyval31.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), True, True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp31 := yyvsp31 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -2
	if yyvsp31 >= yyvsc31 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs31")
		end
		yyvsc31 := yyvsc31 + yyInitial_yyvs_size
		yyvs31 := yyspecial_routines31.aliased_resized_area (yyvs31, yyvsc31)
	end
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
when 100 then
--|#line 728 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 728")
end

			create {PROPER_INTERVAL [REAL]} yyval31.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), False, True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp31 := yyvsp31 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp3 := yyvsp3 -2
	if yyvsp31 >= yyvsc31 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs31")
		end
		yyvsc31 := yyvsc31 + yyInitial_yyvs_size
		yyvs31 := yyspecial_routines31.aliased_resized_area (yyvs31, yyvsc31)
	end
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
when 101 then
--|#line 732 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 732")
end

			create {PROPER_INTERVAL [REAL]} yyval31.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), True, False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp31 := yyvsp31 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp3 := yyvsp3 -2
	if yyvsp31 >= yyvsc31 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs31")
		end
		yyvsc31 := yyvsc31 + yyInitial_yyvs_size
		yyvs31 := yyspecial_routines31.aliased_resized_area (yyvs31, yyvsc31)
	end
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
when 102 then
--|#line 736 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 736")
end

			create {PROPER_INTERVAL [REAL]} yyval31.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), False, False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp31 := yyvsp31 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp3 := yyvsp3 -2
	if yyvsp31 >= yyvsc31 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs31")
		end
		yyvsc31 := yyvsc31 + yyInitial_yyvs_size
		yyvs31 := yyspecial_routines31.aliased_resized_area (yyvs31, yyvsc31)
	end
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
when 103 then
--|#line 740 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 740")
end

			create {PROPER_INTERVAL [REAL]} yyval31.make_lower_unbounded(yyvs3.item (yyvsp3), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp31 := yyvsp31 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp31 >= yyvsc31 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs31")
		end
		yyvsc31 := yyvsc31 + yyInitial_yyvs_size
		yyvs31 := yyspecial_routines31.aliased_resized_area (yyvs31, yyvsc31)
	end
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
when 104 then
--|#line 744 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 744")
end

			create {PROPER_INTERVAL [REAL]} yyval31.make_lower_unbounded(yyvs3.item (yyvsp3), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp31 := yyvsp31 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp31 >= yyvsc31 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs31")
		end
		yyvsc31 := yyvsc31 + yyInitial_yyvs_size
		yyvs31 := yyspecial_routines31.aliased_resized_area (yyvs31, yyvsc31)
	end
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
when 105 then
--|#line 748 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 748")
end

			create {PROPER_INTERVAL [REAL]} yyval31.make_upper_unbounded(yyvs3.item (yyvsp3), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp31 := yyvsp31 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp31 >= yyvsc31 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs31")
		end
		yyvsc31 := yyvsc31 + yyInitial_yyvs_size
		yyvs31 := yyspecial_routines31.aliased_resized_area (yyvs31, yyvsc31)
	end
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
when 106 then
--|#line 752 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 752")
end

			create {PROPER_INTERVAL [REAL]} yyval31.make_upper_unbounded(yyvs3.item (yyvsp3), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp31 := yyvsp31 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	if yyvsp31 >= yyvsc31 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs31")
		end
		yyvsc31 := yyvsc31 + yyInitial_yyvs_size
		yyvs31 := yyspecial_routines31.aliased_resized_area (yyvs31, yyvsc31)
	end
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
when 107 then
--|#line 756 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 756")
end

			create {POINT_INTERVAL [REAL]} yyval31.make(yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp31 := yyvsp31 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp3 := yyvsp3 -1
	if yyvsp31 >= yyvsc31 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs31")
		end
		yyvsc31 := yyvsc31 + yyInitial_yyvs_size
		yyvs31 := yyspecial_routines31.aliased_resized_area (yyvs31, yyvsc31)
	end
	yyspecial_routines31.force (yyvs31, yyval31, yyvsp31)
end
when 108 then
--|#line 762 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 762")
end

			create yyval38.make(0)
			yyval38.extend(yyvs31.item (yyvsp31 - 1))
			yyval38.extend(yyvs31.item (yyvsp31))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp38 := yyvsp38 + 1
	yyvsp31 := yyvsp31 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp38 >= yyvsc38 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs38")
		end
		yyvsc38 := yyvsc38 + yyInitial_yyvs_size
		yyvs38 := yyspecial_routines38.aliased_resized_area (yyvs38, yyvsc38)
	end
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
when 109 then
--|#line 768 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 768")
end

			yyvs38.item (yyvsp38).extend(yyvs31.item (yyvsp31))
			yyval38 := yyvs38.item (yyvsp38)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp31 := yyvsp31 -1
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
when 110 then
--|#line 773 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 773")
end

			create yyval38.make(0)
			yyval38.extend(yyvs31.item (yyvsp31))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp38 := yyvsp38 + 1
	yyvsp31 := yyvsp31 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp38 >= yyvsc38 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs38")
		end
		yyvsc38 := yyvsc38 + yyInitial_yyvs_size
		yyvs38 := yyspecial_routines38.aliased_resized_area (yyvs38, yyvsc38)
	end
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
when 111 then
--|#line 780 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 780")
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
when 112 then
--|#line 784 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 784")
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
when 113 then
--|#line 790 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 790")
end

			create yyval23.make(0)
			yyval23.extend(yyvs6.item (yyvsp6 - 1))
			yyval23.extend(yyvs6.item (yyvsp6))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp23 := yyvsp23 + 1
	yyvsp6 := yyvsp6 -2
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
when 114 then
--|#line 796 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 796")
end

			yyvs23.item (yyvsp23).extend(yyvs6.item (yyvsp6))
			yyval23 := yyvs23.item (yyvsp23)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp6 := yyvsp6 -1
	yyspecial_routines23.force (yyvs23, yyval23, yyvsp23)
end
when 115 then
--|#line 801 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 801")
end

			create yyval23.make(0)
			yyval23.extend(yyvs6.item (yyvsp6))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp23 := yyvsp23 + 1
	yyvsp6 := yyvsp6 -1
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
when 116 then
--|#line 808 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 808")
end

			yyval5 := yyvs5.item (yyvsp5)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 117 then
--|#line 814 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 814")
end

			create yyval22.make(0)
			yyval22.extend(yyvs5.item (yyvsp5 - 1))
			yyval22.extend(yyvs5.item (yyvsp5))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp22 := yyvsp22 + 1
	yyvsp5 := yyvsp5 -2
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
when 118 then
--|#line 820 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 820")
end

			yyvs22.item (yyvsp22).extend(yyvs5.item (yyvsp5))
			yyval22 := yyvs22.item (yyvsp22)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
when 119 then
--|#line 825 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 825")
end

			create yyval22.make(0)
			yyval22.extend(yyvs5.item (yyvsp5))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp22 := yyvsp22 + 1
	yyvsp5 := yyvsp5 -1
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
when 120 then
--|#line 832 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 832")
end

			create yyval7.make_from_string(yyvs4.item (yyvsp4))
		
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
when 121 then
--|#line 838 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 838")
end

			create yyval24.make(0)
			yyval24.extend (yyvs7.item (yyvsp7 - 1))
			yyval24.extend (yyvs7.item (yyvsp7))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp24 := yyvsp24 + 1
	yyvsp7 := yyvsp7 -2
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
when 122 then
--|#line 844 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 844")
end

			yyvs24.item (yyvsp24).extend (yyvs7.item (yyvsp7))
			yyval24 := yyvs24.item (yyvsp24)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp7 := yyvsp7 -1
	yyspecial_routines24.force (yyvs24, yyval24, yyvsp24)
end
when 123 then
--|#line 849 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 849")
end

			create yyval24.make(0)
			yyval24.extend (yyvs7.item (yyvsp7))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp24 := yyvsp24 + 1
	yyvsp7 := yyvsp7 -1
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
when 124 then
--|#line 856 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 856")
end

			create {PROPER_INTERVAL [ISO8601_DATE]} yyval33.make_bounded(yyvs7.item (yyvsp7 - 1), yyvs7.item (yyvsp7), True, True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp33 := yyvsp33 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp7 := yyvsp7 -2
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 125 then
--|#line 860 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 860")
end

			create {PROPER_INTERVAL [ISO8601_DATE]} yyval33.make_bounded(yyvs7.item (yyvsp7 - 1), yyvs7.item (yyvsp7), False, True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp33 := yyvsp33 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp7 := yyvsp7 -2
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 126 then
--|#line 864 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 864")
end

			create {PROPER_INTERVAL [ISO8601_DATE]} yyval33.make_bounded(yyvs7.item (yyvsp7 - 1), yyvs7.item (yyvsp7), True, False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp33 := yyvsp33 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp7 := yyvsp7 -2
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 127 then
--|#line 868 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 868")
end

			create {PROPER_INTERVAL [ISO8601_DATE]} yyval33.make_bounded(yyvs7.item (yyvsp7 - 1), yyvs7.item (yyvsp7), False, False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp33 := yyvsp33 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp7 := yyvsp7 -2
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 128 then
--|#line 872 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 872")
end

			create {PROPER_INTERVAL [ISO8601_DATE]} yyval33.make_lower_unbounded(yyvs7.item (yyvsp7), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp33 := yyvsp33 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp7 := yyvsp7 -1
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 129 then
--|#line 876 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 876")
end

			create {PROPER_INTERVAL [ISO8601_DATE]} yyval33.make_lower_unbounded(yyvs7.item (yyvsp7), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp33 := yyvsp33 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp7 := yyvsp7 -1
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 130 then
--|#line 880 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 880")
end

			create {PROPER_INTERVAL [ISO8601_DATE]} yyval33.make_upper_unbounded(yyvs7.item (yyvsp7), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp33 := yyvsp33 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp7 := yyvsp7 -1
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 131 then
--|#line 884 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 884")
end

			create {PROPER_INTERVAL [ISO8601_DATE]} yyval33.make_upper_unbounded(yyvs7.item (yyvsp7), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp33 := yyvsp33 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp7 := yyvsp7 -1
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 132 then
--|#line 888 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 888")
end

			create {POINT_INTERVAL [ISO8601_DATE]} yyval33.make (yyvs7.item (yyvsp7))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp33 := yyvsp33 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp7 := yyvsp7 -1
	if yyvsp33 >= yyvsc33 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs33")
		end
		yyvsc33 := yyvsc33 + yyInitial_yyvs_size
		yyvs33 := yyspecial_routines33.aliased_resized_area (yyvs33, yyvsc33)
	end
	yyspecial_routines33.force (yyvs33, yyval33, yyvsp33)
end
when 133 then
--|#line 894 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 894")
end

			create yyval40.make(0)
			yyval40.extend(yyvs33.item (yyvsp33 - 1))
			yyval40.extend(yyvs33.item (yyvsp33))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp40 := yyvsp40 + 1
	yyvsp33 := yyvsp33 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 134 then
--|#line 900 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 900")
end

			yyvs40.item (yyvsp40).extend(yyvs33.item (yyvsp33))
			yyval40 := yyvs40.item (yyvsp40)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp33 := yyvsp33 -1
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 135 then
--|#line 905 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 905")
end

			create yyval40.make(0)
			yyval40.extend(yyvs33.item (yyvsp33))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp40 := yyvsp40 + 1
	yyvsp33 := yyvsp33 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp40 >= yyvsc40 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs40")
		end
		yyvsc40 := yyvsc40 + yyInitial_yyvs_size
		yyvs40 := yyspecial_routines40.aliased_resized_area (yyvs40, yyvsc40)
	end
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 136 then
--|#line 912 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 912")
end

			create yyval9.make_from_string(yyvs4.item (yyvsp4))
		
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
when 137 then
--|#line 918 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 918")
end

			create yyval25.make(0)
			yyval25.extend(yyvs9.item (yyvsp9 - 1))
			yyval25.extend(yyvs9.item (yyvsp9))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp25 := yyvsp25 + 1
	yyvsp9 := yyvsp9 -2
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
when 138 then
--|#line 924 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 924")
end

			yyvs25.item (yyvsp25).extend(yyvs9.item (yyvsp9))
			yyval25 := yyvs25.item (yyvsp25)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp9 := yyvsp9 -1
	yyspecial_routines25.force (yyvs25, yyval25, yyvsp25)
end
when 139 then
--|#line 929 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 929")
end

			create yyval25.make(0)
			yyval25.extend(yyvs9.item (yyvsp9))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp25 := yyvsp25 + 1
	yyvsp9 := yyvsp9 -1
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
when 140 then
--|#line 936 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 936")
end

			create {PROPER_INTERVAL [ISO8601_TIME]} yyval32.make_bounded(yyvs9.item (yyvsp9 - 1), yyvs9.item (yyvsp9), True, True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp9 := yyvsp9 -2
	if yyvsp32 >= yyvsc32 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs32")
		end
		yyvsc32 := yyvsc32 + yyInitial_yyvs_size
		yyvs32 := yyspecial_routines32.aliased_resized_area (yyvs32, yyvsc32)
	end
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 141 then
--|#line 940 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 940")
end

			create {PROPER_INTERVAL [ISO8601_TIME]} yyval32.make_bounded(yyvs9.item (yyvsp9 - 1), yyvs9.item (yyvsp9), False, True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp9 := yyvsp9 -2
	if yyvsp32 >= yyvsc32 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs32")
		end
		yyvsc32 := yyvsc32 + yyInitial_yyvs_size
		yyvs32 := yyspecial_routines32.aliased_resized_area (yyvs32, yyvsc32)
	end
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 142 then
--|#line 944 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 944")
end

			create {PROPER_INTERVAL [ISO8601_TIME]} yyval32.make_bounded(yyvs9.item (yyvsp9 - 1), yyvs9.item (yyvsp9), True, False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp9 := yyvsp9 -2
	if yyvsp32 >= yyvsc32 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs32")
		end
		yyvsc32 := yyvsc32 + yyInitial_yyvs_size
		yyvs32 := yyspecial_routines32.aliased_resized_area (yyvs32, yyvsc32)
	end
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 143 then
--|#line 948 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 948")
end

			create {PROPER_INTERVAL [ISO8601_TIME]} yyval32.make_bounded(yyvs9.item (yyvsp9 - 1), yyvs9.item (yyvsp9), False, False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp9 := yyvsp9 -2
	if yyvsp32 >= yyvsc32 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs32")
		end
		yyvsc32 := yyvsc32 + yyInitial_yyvs_size
		yyvs32 := yyspecial_routines32.aliased_resized_area (yyvs32, yyvsc32)
	end
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 144 then
--|#line 952 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 952")
end

			create {PROPER_INTERVAL [ISO8601_TIME]} yyval32.make_lower_unbounded(yyvs9.item (yyvsp9), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp9 := yyvsp9 -1
	if yyvsp32 >= yyvsc32 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs32")
		end
		yyvsc32 := yyvsc32 + yyInitial_yyvs_size
		yyvs32 := yyspecial_routines32.aliased_resized_area (yyvs32, yyvsc32)
	end
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 145 then
--|#line 956 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 956")
end

			create {PROPER_INTERVAL [ISO8601_TIME]} yyval32.make_lower_unbounded(yyvs9.item (yyvsp9), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp9 := yyvsp9 -1
	if yyvsp32 >= yyvsc32 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs32")
		end
		yyvsc32 := yyvsc32 + yyInitial_yyvs_size
		yyvs32 := yyspecial_routines32.aliased_resized_area (yyvs32, yyvsc32)
	end
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 146 then
--|#line 960 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 960")
end

			create {PROPER_INTERVAL [ISO8601_TIME]} yyval32.make_upper_unbounded(yyvs9.item (yyvsp9), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp9 := yyvsp9 -1
	if yyvsp32 >= yyvsc32 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs32")
		end
		yyvsc32 := yyvsc32 + yyInitial_yyvs_size
		yyvs32 := yyspecial_routines32.aliased_resized_area (yyvs32, yyvsc32)
	end
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 147 then
--|#line 964 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 964")
end

			create {PROPER_INTERVAL [ISO8601_TIME]} yyval32.make_upper_unbounded(yyvs9.item (yyvsp9), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp9 := yyvsp9 -1
	if yyvsp32 >= yyvsc32 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs32")
		end
		yyvsc32 := yyvsc32 + yyInitial_yyvs_size
		yyvs32 := yyspecial_routines32.aliased_resized_area (yyvs32, yyvsc32)
	end
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 148 then
--|#line 968 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 968")
end

			create {POINT_INTERVAL [ISO8601_TIME]} yyval32.make (yyvs9.item (yyvsp9))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp32 := yyvsp32 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp9 := yyvsp9 -1
	if yyvsp32 >= yyvsc32 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs32")
		end
		yyvsc32 := yyvsc32 + yyInitial_yyvs_size
		yyvs32 := yyspecial_routines32.aliased_resized_area (yyvs32, yyvsc32)
	end
	yyspecial_routines32.force (yyvs32, yyval32, yyvsp32)
end
when 149 then
--|#line 974 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 974")
end

			create yyval39.make(0)
			yyval39.extend(yyvs32.item (yyvsp32 - 1))
			yyval39.extend(yyvs32.item (yyvsp32))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp39 := yyvsp39 + 1
	yyvsp32 := yyvsp32 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 150 then
--|#line 980 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 980")
end

			yyvs39.item (yyvsp39).extend(yyvs32.item (yyvsp32))
			yyval39 := yyvs39.item (yyvsp39)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp32 := yyvsp32 -1
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 151 then
--|#line 985 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 985")
end

			create yyval39.make(0)
			yyval39.extend(yyvs32.item (yyvsp32))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp39 := yyvsp39 + 1
	yyvsp32 := yyvsp32 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp39 >= yyvsc39 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs39")
		end
		yyvsc39 := yyvsc39 + yyInitial_yyvs_size
		yyvs39 := yyspecial_routines39.aliased_resized_area (yyvs39, yyvsc39)
	end
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 152 then
--|#line 992 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 992")
end

			create yyval8.make_from_string(yyvs4.item (yyvsp4))
		
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
when 153 then
--|#line 998 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 998")
end

			create yyval26.make(0)
			yyval26.extend(yyvs8.item (yyvsp8 - 1))
			yyval26.extend(yyvs8.item (yyvsp8))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp26 := yyvsp26 + 1
	yyvsp8 := yyvsp8 -2
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
when 154 then
--|#line 1004 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1004")
end

			yyvs26.item (yyvsp26).extend(yyvs8.item (yyvsp8))
			yyval26 := yyvs26.item (yyvsp26)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp8 := yyvsp8 -1
	yyspecial_routines26.force (yyvs26, yyval26, yyvsp26)
end
when 155 then
--|#line 1009 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1009")
end

			create yyval26.make(0)
			yyval26.extend(yyvs8.item (yyvsp8))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp26 := yyvsp26 + 1
	yyvsp8 := yyvsp8 -1
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
when 156 then
--|#line 1016 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1016")
end

			create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval34.make_bounded(yyvs8.item (yyvsp8 - 1), yyvs8.item (yyvsp8), True, True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp34 := yyvsp34 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp8 := yyvsp8 -2
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
--|#line 1020 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1020")
end

			create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval34.make_bounded(yyvs8.item (yyvsp8 - 1), yyvs8.item (yyvsp8), False, True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp34 := yyvsp34 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp8 := yyvsp8 -2
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
--|#line 1024 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1024")
end

			create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval34.make_bounded(yyvs8.item (yyvsp8 - 1), yyvs8.item (yyvsp8), True, False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp34 := yyvsp34 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp8 := yyvsp8 -2
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
--|#line 1028 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1028")
end

			create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval34.make_bounded(yyvs8.item (yyvsp8 - 1), yyvs8.item (yyvsp8), False, False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp34 := yyvsp34 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp8 := yyvsp8 -2
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
--|#line 1032 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1032")
end

			create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval34.make_lower_unbounded(yyvs8.item (yyvsp8), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp34 := yyvsp34 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp8 := yyvsp8 -1
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
--|#line 1036 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1036")
end

			create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval34.make_lower_unbounded(yyvs8.item (yyvsp8), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp34 := yyvsp34 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp8 := yyvsp8 -1
	if yyvsp34 >= yyvsc34 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs34")
		end
		yyvsc34 := yyvsc34 + yyInitial_yyvs_size
		yyvs34 := yyspecial_routines34.aliased_resized_area (yyvs34, yyvsc34)
	end
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 162 then
--|#line 1040 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1040")
end

			create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval34.make_upper_unbounded(yyvs8.item (yyvsp8), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp34 := yyvsp34 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp8 := yyvsp8 -1
	if yyvsp34 >= yyvsc34 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs34")
		end
		yyvsc34 := yyvsc34 + yyInitial_yyvs_size
		yyvs34 := yyspecial_routines34.aliased_resized_area (yyvs34, yyvsc34)
	end
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 163 then
--|#line 1044 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1044")
end

			create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval34.make_upper_unbounded(yyvs8.item (yyvsp8), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp34 := yyvsp34 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp8 := yyvsp8 -1
	if yyvsp34 >= yyvsc34 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs34")
		end
		yyvsc34 := yyvsc34 + yyInitial_yyvs_size
		yyvs34 := yyspecial_routines34.aliased_resized_area (yyvs34, yyvsc34)
	end
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 164 then
--|#line 1048 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1048")
end

			create {POINT_INTERVAL [ISO8601_DATE_TIME]} yyval34.make (yyvs8.item (yyvsp8))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp34 := yyvsp34 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp8 := yyvsp8 -1
	if yyvsp34 >= yyvsc34 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs34")
		end
		yyvsc34 := yyvsc34 + yyInitial_yyvs_size
		yyvs34 := yyspecial_routines34.aliased_resized_area (yyvs34, yyvsc34)
	end
	yyspecial_routines34.force (yyvs34, yyval34, yyvsp34)
end
when 165 then
--|#line 1054 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1054")
end

			create yyval41.make(0)
			yyval41.extend(yyvs34.item (yyvsp34 - 1))
			yyval41.extend(yyvs34.item (yyvsp34))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp41 := yyvsp41 + 1
	yyvsp34 := yyvsp34 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 166 then
--|#line 1060 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1060")
end

			yyvs41.item (yyvsp41).extend(yyvs34.item (yyvsp34))
			yyval41 := yyvs41.item (yyvsp41)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp34 := yyvsp34 -1
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 167 then
--|#line 1065 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1065")
end

			create yyval41.make(0)
			yyval41.extend(yyvs34.item (yyvsp34))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp41 := yyvsp41 + 1
	yyvsp34 := yyvsp34 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp41 >= yyvsc41 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs41")
		end
		yyvsc41 := yyvsc41 + yyInitial_yyvs_size
		yyvs41 := yyspecial_routines41.aliased_resized_area (yyvs41, yyvsc41)
	end
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 168 then
--|#line 1072 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1072")
end

			create yyval10.make_from_string(yyvs4.item (yyvsp4))
		
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
when 169 then
--|#line 1078 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1078")
end

			create yyval27.make(0)
			yyval27.extend(yyvs10.item (yyvsp10 - 1))
			yyval27.extend(yyvs10.item (yyvsp10))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp27 := yyvsp27 + 1
	yyvsp10 := yyvsp10 -2
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
when 170 then
--|#line 1084 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1084")
end

			yyvs27.item (yyvsp27).extend(yyvs10.item (yyvsp10))
			yyval27 := yyvs27.item (yyvsp27)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp10 := yyvsp10 -1
	yyspecial_routines27.force (yyvs27, yyval27, yyvsp27)
end
when 171 then
--|#line 1089 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1089")
end

			create yyval27.make(0)
			yyval27.extend(yyvs10.item (yyvsp10))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp27 := yyvsp27 + 1
	yyvsp10 := yyvsp10 -1
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
when 172 then
--|#line 1096 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1096")
end

			create {PROPER_INTERVAL [ISO8601_DURATION]} yyval35.make_bounded(yyvs10.item (yyvsp10 - 1), yyvs10.item (yyvsp10), True, True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp35 := yyvsp35 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp10 := yyvsp10 -2
	if yyvsp35 >= yyvsc35 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs35")
		end
		yyvsc35 := yyvsc35 + yyInitial_yyvs_size
		yyvs35 := yyspecial_routines35.aliased_resized_area (yyvs35, yyvsc35)
	end
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
when 173 then
--|#line 1100 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1100")
end

			create {PROPER_INTERVAL [ISO8601_DURATION]} yyval35.make_bounded(yyvs10.item (yyvsp10 - 1), yyvs10.item (yyvsp10), False, True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp35 := yyvsp35 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp10 := yyvsp10 -2
	if yyvsp35 >= yyvsc35 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs35")
		end
		yyvsc35 := yyvsc35 + yyInitial_yyvs_size
		yyvs35 := yyspecial_routines35.aliased_resized_area (yyvs35, yyvsc35)
	end
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
when 174 then
--|#line 1104 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1104")
end

			create {PROPER_INTERVAL [ISO8601_DURATION]} yyval35.make_bounded(yyvs10.item (yyvsp10 - 1), yyvs10.item (yyvsp10), True, False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp35 := yyvsp35 + 1
	yyvsp1 := yyvsp1 -4
	yyvsp10 := yyvsp10 -2
	if yyvsp35 >= yyvsc35 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs35")
		end
		yyvsc35 := yyvsc35 + yyInitial_yyvs_size
		yyvs35 := yyspecial_routines35.aliased_resized_area (yyvs35, yyvsc35)
	end
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
when 175 then
--|#line 1108 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1108")
end

			create {PROPER_INTERVAL [ISO8601_DURATION]} yyval35.make_bounded(yyvs10.item (yyvsp10 - 1), yyvs10.item (yyvsp10), False, False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp35 := yyvsp35 + 1
	yyvsp1 := yyvsp1 -5
	yyvsp10 := yyvsp10 -2
	if yyvsp35 >= yyvsc35 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs35")
		end
		yyvsc35 := yyvsc35 + yyInitial_yyvs_size
		yyvs35 := yyspecial_routines35.aliased_resized_area (yyvs35, yyvsc35)
	end
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
when 176 then
--|#line 1112 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1112")
end

			create {PROPER_INTERVAL [ISO8601_DURATION]} yyval35.make_lower_unbounded(yyvs10.item (yyvsp10), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp35 := yyvsp35 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp10 := yyvsp10 -1
	if yyvsp35 >= yyvsc35 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs35")
		end
		yyvsc35 := yyvsc35 + yyInitial_yyvs_size
		yyvs35 := yyspecial_routines35.aliased_resized_area (yyvs35, yyvsc35)
	end
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
when 177 then
--|#line 1116 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1116")
end

			create {PROPER_INTERVAL [ISO8601_DURATION]} yyval35.make_lower_unbounded(yyvs10.item (yyvsp10), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp35 := yyvsp35 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp10 := yyvsp10 -1
	if yyvsp35 >= yyvsc35 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs35")
		end
		yyvsc35 := yyvsc35 + yyInitial_yyvs_size
		yyvs35 := yyspecial_routines35.aliased_resized_area (yyvs35, yyvsc35)
	end
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
when 178 then
--|#line 1120 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1120")
end

			create {PROPER_INTERVAL [ISO8601_DURATION]} yyval35.make_upper_unbounded(yyvs10.item (yyvsp10), False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp35 := yyvsp35 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp10 := yyvsp10 -1
	if yyvsp35 >= yyvsc35 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs35")
		end
		yyvsc35 := yyvsc35 + yyInitial_yyvs_size
		yyvs35 := yyspecial_routines35.aliased_resized_area (yyvs35, yyvsc35)
	end
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
when 179 then
--|#line 1124 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1124")
end

			create {PROPER_INTERVAL [ISO8601_DURATION]} yyval35.make_upper_unbounded(yyvs10.item (yyvsp10), True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp35 := yyvsp35 + 1
	yyvsp1 := yyvsp1 -3
	yyvsp10 := yyvsp10 -1
	if yyvsp35 >= yyvsc35 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs35")
		end
		yyvsc35 := yyvsc35 + yyInitial_yyvs_size
		yyvs35 := yyspecial_routines35.aliased_resized_area (yyvs35, yyvsc35)
	end
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
when 180 then
--|#line 1128 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1128")
end

			create {POINT_INTERVAL [ISO8601_DURATION]} yyval35.make (yyvs10.item (yyvsp10))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp35 := yyvsp35 + 1
	yyvsp1 := yyvsp1 -2
	yyvsp10 := yyvsp10 -1
	if yyvsp35 >= yyvsc35 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs35")
		end
		yyvsc35 := yyvsc35 + yyInitial_yyvs_size
		yyvs35 := yyspecial_routines35.aliased_resized_area (yyvs35, yyvsc35)
	end
	yyspecial_routines35.force (yyvs35, yyval35, yyvsp35)
end
when 181 then
--|#line 1134 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1134")
end

			create yyval42.make(0)
			yyval42.extend(yyvs35.item (yyvsp35 - 1))
			yyval42.extend(yyvs35.item (yyvsp35))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp42 := yyvsp42 + 1
	yyvsp35 := yyvsp35 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp42 >= yyvsc42 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs42")
		end
		yyvsc42 := yyvsc42 + yyInitial_yyvs_size
		yyvs42 := yyspecial_routines42.aliased_resized_area (yyvs42, yyvsc42)
	end
	yyspecial_routines42.force (yyvs42, yyval42, yyvsp42)
end
when 182 then
--|#line 1140 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1140")
end

			yyvs42.item (yyvsp42).extend(yyvs35.item (yyvsp35))
			yyval42 := yyvs42.item (yyvsp42)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp35 := yyvsp35 -1
	yyspecial_routines42.force (yyvs42, yyval42, yyvsp42)
end
when 183 then
--|#line 1145 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1145")
end

			create yyval42.make(0)
			yyval42.extend(yyvs35.item (yyvsp35))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp42 := yyvsp42 + 1
	yyvsp35 := yyvsp35 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp42 >= yyvsc42 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs42")
		end
		yyvsc42 := yyvsc42 + yyInitial_yyvs_size
		yyvs42 := yyspecial_routines42.aliased_resized_area (yyvs42, yyvsc42)
	end
	yyspecial_routines42.force (yyvs42, yyval42, yyvsp42)
end
when 184 then
--|#line 1152 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1152")
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
when 185 then
--|#line 1158 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1158")
end

			create yyval28.make(0)
			yyval28.extend(yyvs11.item (yyvsp11 - 1))
			yyval28.extend(yyvs11.item (yyvsp11))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp28 := yyvsp28 + 1
	yyvsp11 := yyvsp11 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp28 >= yyvsc28 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs28")
		end
		yyvsc28 := yyvsc28 + yyInitial_yyvs_size
		yyvs28 := yyspecial_routines28.aliased_resized_area (yyvs28, yyvsc28)
	end
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
when 186 then
--|#line 1164 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1164")
end

			yyvs28.item (yyvsp28).extend(yyvs11.item (yyvsp11))
			yyval28 := yyvs28.item (yyvsp28)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp11 := yyvsp11 -1
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
when 187 then
--|#line 1169 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1169")
end

			create yyval28.make(0)
			yyval28.extend(yyvs11.item (yyvsp11))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp28 := yyvsp28 + 1
	yyvsp11 := yyvsp11 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp28 >= yyvsc28 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs28")
		end
		yyvsc28 := yyvsc28 + yyInitial_yyvs_size
		yyvs28 := yyspecial_routines28.aliased_resized_area (yyvs28, yyvsc28)
	end
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
when 188 then
--|#line 1176 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1176")
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
when 189 then
--|#line 1186 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1186")
end

				attr_nodes.item.put_child(yyvs14.item (yyvsp14))
				yyval14 := yyvs14.item (yyvsp14)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 190 then
--|#line 1193 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1193")
end

			if not obj_key.is_empty then
				create {DT_OBJECT_REFERENCE} yyval14.make_identified(yyvs16.item (yyvsp16), obj_key)
				create obj_key.make_empty
			else
				create {DT_OBJECT_REFERENCE} yyval14.make_anonymous(yyvs16.item (yyvsp16))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp14 := yyvsp14 + 1
	yyvsp16 := yyvsp16 -1
	if yyvsp14 >= yyvsc14 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs14")
		end
		yyvsc14 := yyvsc14 + yyInitial_yyvs_size
		yyvs14 := yyspecial_routines14.aliased_resized_area (yyvs14, yyvsc14)
	end
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 191 then
--|#line 1202 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1202")
end

			if not obj_key.is_empty then
				create {DT_OBJECT_REFERENCE_LIST} yyval14.make_identified(yyvs18.item (yyvsp18), obj_key)
				create obj_key.make_empty
			else
				create {DT_OBJECT_REFERENCE_LIST} yyval14.make_anonymous(yyvs18.item (yyvsp18))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp14 := yyvsp14 + 1
	yyvsp18 := yyvsp18 -1
	if yyvsp14 >= yyvsc14 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs14")
		end
		yyvsc14 := yyvsc14 + yyInitial_yyvs_size
		yyvs14 := yyspecial_routines14.aliased_resized_area (yyvs14, yyvsc14)
	end
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 192 then
--|#line 1214 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1214")
end

			create yyval18.make(0)
			yyval18.extend(yyvs16.item (yyvsp16 - 1))
			yyval18.extend(yyvs16.item (yyvsp16))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp18 := yyvsp18 + 1
	yyvsp16 := yyvsp16 -2
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
when 193 then
--|#line 1220 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1220")
end

			yyvs18.item (yyvsp18).extend(yyvs16.item (yyvsp16))
			yyval18 := yyvs18.item (yyvsp18)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp16 := yyvsp16 -1
	yyspecial_routines18.force (yyvs18, yyval18, yyvsp18)
end
when 194 then
--|#line 1225 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1225")
end

			create yyval18.make(0)
			yyval18.extend(yyvs16.item (yyvsp16))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp18 := yyvsp18 + 1
	yyvsp16 := yyvsp16 -1
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
when 195 then
--|#line 1237 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1237")
end

			create yyval16.make_root
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp16 >= yyvsc16 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs16")
		end
		yyvsc16 := yyvsc16 + yyInitial_yyvs_size
		yyvs16 := yyspecial_routines16.aliased_resized_area (yyvs16, yyvsc16)
	end
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 196 then
--|#line 1241 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1241")
end

			yyval16 := yyvs16.item (yyvsp16)
			yyval16.set_absolute
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 197 then
--|#line 1246 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1246")
end

			yyval16 := yyvs16.item (yyvsp16 - 1)
			yyval16.append_path(yyvs16.item (yyvsp16))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp16 := yyvsp16 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 198 then
--|#line 1253 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1253")
end

			create yyval16.make_relative(yyvs17.item (yyvsp17))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp16 := yyvsp16 + 1
	yyvsp17 := yyvsp17 -1
	if yyvsp16 >= yyvsc16 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs16")
		end
		yyvsc16 := yyvsc16 + yyInitial_yyvs_size
		yyvs16 := yyspecial_routines16.aliased_resized_area (yyvs16, yyvsc16)
	end
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 199 then
--|#line 1257 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1257")
end

			yyval16 := yyvs16.item (yyvsp16)
			yyval16.append_segment(yyvs17.item (yyvsp17))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp17 := yyvsp17 -1
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 200 then
--|#line 1264 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1264")
end

			create yyval17.make_with_object_id(yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp17 := yyvsp17 + 1
	yyvsp4 := yyvsp4 -2
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
when 201 then
--|#line 1268 "fast_odin_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'fast_odin_parser.y' at line 1268")
end

			create yyval17.make(yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp17 := yyvsp17 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp17 >= yyvsc17 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs17")
		end
		yyvsc17 := yyvsc17 + yyInitial_yyvs_size
		yyvs17 := yyspecial_routines17.aliased_resized_area (yyvs17, yyvsc17)
	end
	yyspecial_routines17.force (yyvs17, yyval17, yyvsp17)
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
		rescue
			if yy_parsing_status = yyAborted then
				yy_retried := True
				retry
			end
		end

	yy_do_error_action (yy_act: INTEGER)
			-- Execute error action.
		do
			inspect yy_act
			when 387 then
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
			   35,   36,    2,   38,   37,   39,    2,   40,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,   32,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,   33,    2,   34,    2,    2,    2,    2,    2,    2,

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
			   25,   26,   27,   28,   29,   30,   31, yyDummy>>)
		end

	yyr1_template: SPECIAL [INTEGER]
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,   93,   93,   93,   94,   94,   94,   95,   96,   97,
			   97,   97,   97,   56,   56,   54,   54,   55,   98,   99,
			   99,  100,  101,   52,   52,   53,  102,   58,   58,   57,
			   60,   60,   60,   60,   60,   60,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   85,   85,   85,   85,   85,
			   85,   92,   92,   92,   92,   92,   92,   41,   41,   41,
			   41,   67,   68,   68,   68,   42,   42,   42,   69,   69,
			   69,   79,   79,   79,   79,   79,   79,   79,   79,   79,
			   86,   86,   86,   43,   43,   43,   70,   70,   70,   80,

			   80,   80,   80,   80,   80,   80,   80,   80,   87,   87,
			   87,   44,   44,   72,   72,   72,   45,   71,   71,   71,
			   46,   73,   73,   73,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   89,   89,   89,   48,   74,   74,   74,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   88,
			   88,   88,   47,   75,   75,   75,   83,   83,   83,   83,
			   83,   83,   83,   83,   83,   90,   90,   90,   49,   76,
			   76,   76,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   91,   91,   91,   50,   77,   77,   77,   51,   59,
			   61,   61,   66,   66,   66,   63,   63,   63,   64,   64,

			   65,   65, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    4,    4,    4,    1,    4,   13,   13,
			   13,   13,   13,    1,    1,    1,    1,    1,    4,    4,
			   13,   13,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    4,   13,   14,   14,   14,    1,
			    1,    1,    1,    1,    5,    4,    4,    4,    4,    4,
			    4,    3,    2,    2,    3,    6,    5,    7,    8,    9,
			   10,   12,   15,    4,    1,    1,    1,    1,    1,    1,
			    1,    4,    4,    2,    3,    6,    5,    7,    8,    9,
			   10,   11,   14,   14,   15,   16,   18,   19,   20,   21,
			   22,   23,   24,   25,   26,   27,   28,   29,   30,   31,

			   32,   33,   34,   35,   36,   37,   38,   39,   40,   41,
			   42,   43,    1,   14,    3,    2,    3,    2,    1,    1,
			    4,   16,   17,    1,    1,    1,    1,    2,    3,    7,
			    8,    9,   10,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    3,    7,    8,    9,   10,    2,    3,
			    7,    8,    9,   10,    2,    3,    7,    8,    9,   10,
			    2,    3,    7,    8,    9,   10,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,    4,
			    1,    1,    1,    2,    1,    1,    1,    3,    1,    6,
			    1,    5,    1,    7,    1,    8,    1,    9,    1,   10,
			    1,   11,   16,    1,   16,   16,    4,    2,    3,    5,
			    6,    7,    9,    8,   10,   11,    1,    1,   30,    1,
			    1,   31,    1,    1,   32,    1,    1,   33,    1,    1,
			   34,    1,    1,   35,   30,   31,   32,   33,   34,   35,
			    4,   17,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    2,    1,    3,    1,    7,    1,    8,
			    1,    9,    1,   10,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    2,    1,    3,    1,    7,    1,    8,    1,    9,    1,
			   10,    2,    1,    3,    1,    7,    1,    8,    1,    9,
			    1,   10,    1,    2,    1,    3,    1,    7,    1,    8,
			    1,    9,    1,   10,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER]
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    2,    3,    4,    4,    4,    4,    4,
			    4,    4,    4,    4,    4,    4,    5,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER]
			-- Template for `yydefact'
		once
			Result := yyfixed_array (<<
			    0,    0,   26,    8,   70,   69,    3,    0,   13,   23,
			   14,   15,    2,    1,    4,    0,    0,    0,    0,    0,
			   24,   16,    0,    5,    0,    0,    0,   19,    0,    0,
			   68,   67,    6,   26,    0,    9,   27,   10,   11,    7,
			    0,    0,  112,  111,  116,  188,  168,  152,  136,  120,
			   71,   93,   75,   37,   38,   39,   40,   41,   43,   42,
			   44,   45,    0,   36,   17,   20,    0,   25,  195,    0,
			   12,  184,   71,   37,   38,   39,   40,   41,   43,   42,
			   44,   34,    0,    0,   30,  190,  191,   46,   47,   48,
			   50,   49,   51,   52,   53,   54,   35,   31,   55,   56,

			   58,   57,   59,   60,   32,   61,   62,   64,   63,   65,
			   66,   33,   26,   28,   95,   77,   94,   76,   22,   21,
			  201,  196,  198,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,   29,  189,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,   89,    0,  107,    0,

			  132,    0,  164,    0,  148,    0,  180,    0,   74,   72,
			    0,    0,   80,   78,    0,    0,   98,   96,  115,  113,
			  119,  117,  123,  121,  155,  153,  139,  137,  171,  169,
			  187,  185,  197,  194,  192,  193,   73,   79,   97,  118,
			  114,  122,  138,  154,  170,  186,    0,   92,   90,    0,
			  110,  108,    0,  151,  149,    0,  135,  133,    0,  167,
			  165,    0,  183,  181,   91,  109,  150,  134,  166,  182,
			    0,  199,   88,  106,  131,  163,  147,  179,   86,  104,
			  129,  161,  145,  177,   87,    0,  105,    0,  130,    0,
			  162,    0,  146,    0,  178,    0,   85,  103,  128,  160,

			  144,  176,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  200,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,   81,    0,   99,    0,  124,    0,  156,    0,
			  140,    0,  172,    0,   82,    0,  100,    0,  125,    0,
			  157,    0,  141,    0,  173,   83,  101,  126,  158,  142,
			  174,   84,  102,  127,  159,  143,  175,    0,    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			   34,   73,   74,   75,   76,   77,   78,   79,   80,   81,
			   61,    8,    9,   10,   11,   35,   36,   37,   38,   82,
			   83,   84,   85,  121,  122,   86,   63,   87,   88,   89,
			   90,   91,   92,   93,   94,   95,   96,   97,   98,   99,
			  100,  101,  102,  103,  104,  105,  106,  107,  108,  109,
			  110,  111,  387,   13,   14,   15,   39,   16,   26,   27,
			   28,   17, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			  232,  369,  457, -32768, -32768, -32768, -32768,  472, -32768, -32768,
			 -32768, -32768, -32768,    2, -32768,  468,  455,  434,  450,  449,
			 -32768, -32768,  434, -32768,  137,  186,  138, -32768,  465,   19,
			 -32768, -32768, -32768,    7,  466, -32768, -32768, -32768, -32768, -32768,
			  368,  356, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768,  408, -32768, -32768, -32768,  137, -32768,  402,  218,
			 -32768, -32768,  445,  444,  443,  442,  441,  440,  439,  438,
			  437,  436,  454,  453, -32768,  151,  433,  432,  431,  430,
			  429,  428,  427,  426,  425,  424,  423, -32768,  422,  421,

			  420,  419,  418,  417, -32768,  416,  415,  414,  413,  412,
			  409, -32768,   50, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			  407,  353, -32768,  141,  141,  141,  141,  326,  322,  321,
			  312,  311,  307,  205,   46,  119,  275,   65,  190,   71,
			    3,  202,  219, -32768, -32768,  402,   -7,  405,  406,    0,
			   31,  410,  346,  371,  267,  136,  196,  411,  336,  334,
			  330,  328,  233,  197,  403,  401,  400,  399,  398,  397,
			  404,  402,  396,  395,  394,  391,  389,  388,  386,  385,
			  384,  383,  382,  381,  301,  298,  286,  285,  266,  256,
			  380,  379,  378,  377,  376,  375, -32768,   39, -32768,   89,

			 -32768,   66, -32768,  148, -32768,  116, -32768,  195, -32768, -32768,
			  393,  392, -32768, -32768,  390,  387, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768,  353, -32768,  352,  352, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768,  178, -32768, -32768,  255,
			 -32768, -32768,   69, -32768, -32768,  225, -32768, -32768,  135, -32768,
			 -32768,  235, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			  344, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768,   18, -32768,   86, -32768,   62,
			 -32768,   30, -32768,  105, -32768,  158, -32768, -32768, -32768, -32768,

			 -32768, -32768,    0,  367,   31,  366,  371,  365,  136,  364,
			  267,  363,  196,  361,    0,    0,    0,    0,   31,   31,
			   31,   31,  267,  267,  267,  267,  371,  371,  371,  371,
			  136,  136,  136,  136,  196,  196,  196,  196, -32768,    0,
			  360,   31,  359,  371,  357,  136,  351,  267,  323,  196,
			  313,  300, -32768,  273, -32768,  263, -32768,  246, -32768,  213,
			 -32768,  193, -32768,  170, -32768,  165, -32768,  143, -32768,   99,
			 -32768,   28, -32768,  -15, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768,  117,  110, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			  447,   51,   43,  -23,  -19,   11,  -17,  -21,  -25, -130,
			 -32768, -32768,   -2, -32768,   -6,  435,  458, -32768, -32768, -32768,
			 -32768,  469,  230,  282,  257, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  161,  125,
			  113,  108,  103,   95, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768,  474,  126, -32768,  349, -32768, -32768,  467,
			 -32768, -32768, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   60,   21,   55,   52,   59,   20,   56,  386,   58,    3,
			   52,   51,  231,   48,  233,   72,   49,   48,   47,   46,
			   71,   52,   45,   44,  226,   70,    3,  245,   21,   69,
			   43,   42,   20,   68,   22,   51,   57,   67,  211,  210,
			  -18,   47,   52,  339,  132,   41,   40,   68,  131,   52,
			  385,   22,  130,   52,   51,  345,  211,  210,   72,   49,
			   48,   47,   46,   71,  302,   45,   44,  212,   54,  215,
			  214,   49,   69,   43,   42,   49,   53,  211,  210,   48,
			  129,   44,   47,  -18,  211,  210,  220,  343,   41,   40,
			   51,  306,  224,   51,  325,  324,  323,  322,  177,  183,

			  189,  195,  176,  182,  188,  194,  175,  181,  187,  193,
			  389,  341,  128,  219,  304,   48,  229,  388,  221,  227,
			  127,  384,  225,   51,  215,  214,   48,  215,  214,  240,
			  347,  244,  239,  242,  174,  180,  186,  192,  243,   23,
			  216,  310,    5,    4,   52,   51,   47,   47,   32,  223,
			   49,   48,   47,   46,   33,   23,   64,  215,  214,   47,
			  333,  332,  331,  330,  241,  383,  173,  179,  185,  191,
			   46,   25,    1,  308,  172,  178,  184,  190,  217,   41,
			   40,   52,  313,  349,  311,  213,  309,  382,  146,   52,
			   51,  145,  381,  238,   50,   49,   48,   47,   46,   49,

			  237,   45,   44,  317,  316,  315,  314,   46,   46,   43,
			   42,  222,  307,  209,   46,  380,  211,  210,  262,  261,
			  312,   52,   51,  228,   41,   40,  208,   49,   48,   47,
			   46,  131,   71,    6,   49,  379,  132,    5,    4,    3,
			  230,  130,  305,  126,  125,  124,  123,   46,  303,    2,
			  329,  328,  327,  326,  259,  258,   41,   40,  263,   51,
			  337,  336,  335,  334,  269,  260,  129,    1,  378,  257,
			  350,  268,  348,  254,  346,  267,  295,   48,  294,  266,
			  321,  320,  319,  318,  251,  377,  293,  361,  292,  359,
			  265,  357,  128,  215,  214,  376,  218,  127,   43,   42,

			  344,  176,  182,  188,  194,  291,  289,  290,  288,  177,
			  183,  189,  195,  175,  181,  187,  193,  355,  287,  248,
			  286,  285,  375,  284,  373,  264,  371,  207,  369,  206,
			  342,  205,  203,  204,  202,  374,  340,  174,  180,  186,
			  192,  201,  199,  200,  198,  372,  197,  353,  196,  256,
			  255,  253,  252,  351,  367,  250,  249,  247,  246,  117,
			  116,  173,  179,  185,  191,  172,  178,  184,  190,   43,
			   42,  115,  114,  370,   19,   18,  234,  235,  338,  368,
			   49,  366,  364,  362,  365,  360,  358,  356,  354,  352,
			  363,  116,  145,  171,  114,  117,  115,  301,  300,  299,

			  298,  297,  296,  283,  282,  281,  280,  279,  278,  120,
			  277,  276,  270,  275,  236,  119,  274,  273,  272,  261,
			  258,  255,  252,  249,   71,  246,   44,  232,  271,    0,
			    0,    0,    0,    0,    0,   12,    0,    0,    0,    0,
			  170,    3,  118,    0,    0,   68,  169,    7,    0,  168,
			  167,  166,  165,  164,  163,  162,  161,  160,  159,  158,
			  157,  156,  155,  154,  153,  152,  151,  150,  149,  148,
			  147,  144,  143,  142,  141,  140,  139,  138,  137,  136,
			  135,  134,  133,  112,   66,   31,   30,   24,   25,    2,
			  -18,   29,  113,   65,   62, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			   25,    7,   25,    3,   25,    7,   25,   22,   25,    7,
			    3,    4,  142,   10,   21,    8,    9,   10,   11,   12,
			   13,    3,   15,   16,   21,   18,    7,  157,   34,   22,
			   23,   24,   34,   40,   32,    4,   25,   18,   38,   39,
			   33,   11,    3,   25,   69,   38,   39,   40,   69,    3,
			   22,   32,   69,    3,    4,   25,   38,   39,    8,    9,
			   10,   11,   12,   13,   25,   15,   16,   21,   25,   38,
			   39,    9,   22,   23,   24,    9,   25,   38,   39,   10,
			   69,   16,   11,   33,   38,   39,   21,   25,   38,   39,
			    4,   25,   21,    4,   25,   26,   27,   28,  123,  124,

			  125,  126,  123,  124,  125,  126,  123,  124,  125,  126,
			    0,   25,   69,  136,   25,   10,  141,    0,  137,  140,
			   69,   22,  139,    4,   38,   39,   10,   38,   39,  152,
			   25,  156,  151,  154,  123,  124,  125,  126,  155,   13,
			   21,   25,    5,    6,    3,    4,   11,   11,   22,  138,
			    9,   10,   11,   12,   17,   29,   18,   38,   39,   11,
			   25,   26,   27,   28,  153,   22,  123,  124,  125,  126,
			   12,   33,   35,   25,  123,  124,  125,  126,  135,   38,
			   39,    3,  207,   25,  205,  134,  203,   22,   37,    3,
			    4,   40,   22,  150,    8,    9,   10,   11,   12,    9,

			  149,   15,   16,   25,   26,   27,   28,   12,   12,   23,
			   24,   21,  201,    8,   12,   22,   38,   39,   21,   22,
			   25,    3,    4,   21,   38,   39,   21,    9,   10,   11,
			   12,  252,   13,    1,    9,   22,  261,    5,    6,    7,
			   21,  258,  199,   25,   26,   27,   28,   12,  197,   17,
			   25,   26,   27,   28,   21,   22,   38,   39,  163,    4,
			   25,   26,   27,   28,  169,  162,  255,   35,   22,  161,
			  295,  168,  293,  160,  291,  167,   20,   10,   22,  166,
			   25,   26,   27,   28,  159,   22,   20,  312,   22,  310,
			  165,  308,  249,   38,   39,   22,   21,  246,   23,   24,

			  289,  322,  323,  324,  325,   20,   20,   22,   22,  334,
			  335,  336,  337,  330,  331,  332,  333,  306,   20,  158,
			   22,   20,   22,   22,  349,  164,  347,   20,  345,   22,
			  287,   20,   20,   22,   22,   22,  285,  326,  327,  328,
			  329,   20,   20,   22,   22,   22,   20,  304,   22,   21,
			   22,   21,   22,  302,  343,   21,   22,   21,   22,    3,
			    4,  318,  319,  320,  321,  314,  315,  316,  317,   23,
			   24,    3,    4,   22,    5,    6,  146,  147,   34,   22,
			    9,   22,   22,   22,  341,   22,   22,   22,   22,   22,
			  339,    4,   40,   40,    4,    3,    3,   22,   22,   22,

			   22,   22,   22,   22,   22,   22,   22,   22,   22,    7,
			   22,   22,    8,   22,    8,   66,   22,   22,   22,   22,
			   22,   22,   22,   22,   13,   22,   16,  145,  171,   -1,
			   -1,   -1,   -1,   -1,   -1,    0,   -1,   -1,   -1,   -1,
			   33,    7,   34,   -1,   -1,   40,   37,    0,   -1,   37,
			   37,   37,   37,   37,   37,   37,   37,   37,   37,   37,
			   37,   37,   37,   37,   37,   37,   37,   37,   37,   37,
			   37,   18,   18,   37,   37,   37,   37,   37,   37,   37,
			   37,   37,   37,   17,   19,   36,   36,   19,   33,   17,
			   33,   17,   34,   26,   25, yyDummy>>)
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

	yyvs7: SPECIAL [ISO8601_DATE]
			-- Stack for semantic values of type ISO8601_DATE

	yyvsc7: INTEGER
			-- Capacity of semantic value stack `yyvs7'

	yyvsp7: INTEGER
			-- Top of semantic value stack `yyvs7'

	yyspecial_routines7: KL_SPECIAL_ROUTINES [ISO8601_DATE]
			-- Routines that ought to be in SPECIAL [ISO8601_DATE]

	yyvs8: SPECIAL [ISO8601_DATE_TIME]
			-- Stack for semantic values of type ISO8601_DATE_TIME

	yyvsc8: INTEGER
			-- Capacity of semantic value stack `yyvs8'

	yyvsp8: INTEGER
			-- Top of semantic value stack `yyvs8'

	yyspecial_routines8: KL_SPECIAL_ROUTINES [ISO8601_DATE_TIME]
			-- Routines that ought to be in SPECIAL [ISO8601_DATE_TIME]

	yyvs9: SPECIAL [ISO8601_TIME]
			-- Stack for semantic values of type ISO8601_TIME

	yyvsc9: INTEGER
			-- Capacity of semantic value stack `yyvs9'

	yyvsp9: INTEGER
			-- Top of semantic value stack `yyvs9'

	yyspecial_routines9: KL_SPECIAL_ROUTINES [ISO8601_TIME]
			-- Routines that ought to be in SPECIAL [ISO8601_TIME]

	yyvs10: SPECIAL [ISO8601_DURATION]
			-- Stack for semantic values of type ISO8601_DURATION

	yyvsc10: INTEGER
			-- Capacity of semantic value stack `yyvs10'

	yyvsp10: INTEGER
			-- Top of semantic value stack `yyvs10'

	yyspecial_routines10: KL_SPECIAL_ROUTINES [ISO8601_DURATION]
			-- Routines that ought to be in SPECIAL [ISO8601_DURATION]

	yyvs11: SPECIAL [TERMINOLOGY_CODE]
			-- Stack for semantic values of type TERMINOLOGY_CODE

	yyvsc11: INTEGER
			-- Capacity of semantic value stack `yyvs11'

	yyvsp11: INTEGER
			-- Top of semantic value stack `yyvs11'

	yyspecial_routines11: KL_SPECIAL_ROUTINES [TERMINOLOGY_CODE]
			-- Routines that ought to be in SPECIAL [TERMINOLOGY_CODE]

	yyvs12: SPECIAL [URI]
			-- Stack for semantic values of type URI

	yyvsc12: INTEGER
			-- Capacity of semantic value stack `yyvs12'

	yyvsp12: INTEGER
			-- Top of semantic value stack `yyvs12'

	yyspecial_routines12: KL_SPECIAL_ROUTINES [URI]
			-- Routines that ought to be in SPECIAL [URI]

	yyvs13: SPECIAL [DT_COMPLEX_OBJECT]
			-- Stack for semantic values of type DT_COMPLEX_OBJECT

	yyvsc13: INTEGER
			-- Capacity of semantic value stack `yyvs13'

	yyvsp13: INTEGER
			-- Top of semantic value stack `yyvs13'

	yyspecial_routines13: KL_SPECIAL_ROUTINES [DT_COMPLEX_OBJECT]
			-- Routines that ought to be in SPECIAL [DT_COMPLEX_OBJECT]

	yyvs14: SPECIAL [DT_OBJECT_LEAF]
			-- Stack for semantic values of type DT_OBJECT_LEAF

	yyvsc14: INTEGER
			-- Capacity of semantic value stack `yyvs14'

	yyvsp14: INTEGER
			-- Top of semantic value stack `yyvs14'

	yyspecial_routines14: KL_SPECIAL_ROUTINES [DT_OBJECT_LEAF]
			-- Routines that ought to be in SPECIAL [DT_OBJECT_LEAF]

	yyvs15: SPECIAL [ANY]
			-- Stack for semantic values of type ANY

	yyvsc15: INTEGER
			-- Capacity of semantic value stack `yyvs15'

	yyvsp15: INTEGER
			-- Top of semantic value stack `yyvs15'

	yyspecial_routines15: KL_SPECIAL_ROUTINES [ANY]
			-- Routines that ought to be in SPECIAL [ANY]

	yyvs16: SPECIAL [OG_PATH]
			-- Stack for semantic values of type OG_PATH

	yyvsc16: INTEGER
			-- Capacity of semantic value stack `yyvs16'

	yyvsp16: INTEGER
			-- Top of semantic value stack `yyvs16'

	yyspecial_routines16: KL_SPECIAL_ROUTINES [OG_PATH]
			-- Routines that ought to be in SPECIAL [OG_PATH]

	yyvs17: SPECIAL [OG_PATH_ITEM]
			-- Stack for semantic values of type OG_PATH_ITEM

	yyvsc17: INTEGER
			-- Capacity of semantic value stack `yyvs17'

	yyvsp17: INTEGER
			-- Top of semantic value stack `yyvs17'

	yyspecial_routines17: KL_SPECIAL_ROUTINES [OG_PATH_ITEM]
			-- Routines that ought to be in SPECIAL [OG_PATH_ITEM]

	yyvs18: SPECIAL [ARRAYED_LIST [OG_PATH]]
			-- Stack for semantic values of type ARRAYED_LIST [OG_PATH]

	yyvsc18: INTEGER
			-- Capacity of semantic value stack `yyvs18'

	yyvsp18: INTEGER
			-- Top of semantic value stack `yyvs18'

	yyspecial_routines18: KL_SPECIAL_ROUTINES [ARRAYED_LIST [OG_PATH]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [OG_PATH]]

	yyvs19: SPECIAL [ARRAYED_LIST [STRING]]
			-- Stack for semantic values of type ARRAYED_LIST [STRING]

	yyvsc19: INTEGER
			-- Capacity of semantic value stack `yyvs19'

	yyvsp19: INTEGER
			-- Top of semantic value stack `yyvs19'

	yyspecial_routines19: KL_SPECIAL_ROUTINES [ARRAYED_LIST [STRING]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [STRING]]

	yyvs20: SPECIAL [ARRAYED_LIST [INTEGER]]
			-- Stack for semantic values of type ARRAYED_LIST [INTEGER]

	yyvsc20: INTEGER
			-- Capacity of semantic value stack `yyvs20'

	yyvsp20: INTEGER
			-- Top of semantic value stack `yyvs20'

	yyspecial_routines20: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTEGER]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTEGER]]

	yyvs21: SPECIAL [ARRAYED_LIST [REAL]]
			-- Stack for semantic values of type ARRAYED_LIST [REAL]

	yyvsc21: INTEGER
			-- Capacity of semantic value stack `yyvs21'

	yyvsp21: INTEGER
			-- Top of semantic value stack `yyvs21'

	yyspecial_routines21: KL_SPECIAL_ROUTINES [ARRAYED_LIST [REAL]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [REAL]]

	yyvs22: SPECIAL [ARRAYED_LIST [CHARACTER]]
			-- Stack for semantic values of type ARRAYED_LIST [CHARACTER]

	yyvsc22: INTEGER
			-- Capacity of semantic value stack `yyvs22'

	yyvsp22: INTEGER
			-- Top of semantic value stack `yyvs22'

	yyspecial_routines22: KL_SPECIAL_ROUTINES [ARRAYED_LIST [CHARACTER]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [CHARACTER]]

	yyvs23: SPECIAL [ARRAYED_LIST [BOOLEAN]]
			-- Stack for semantic values of type ARRAYED_LIST [BOOLEAN]

	yyvsc23: INTEGER
			-- Capacity of semantic value stack `yyvs23'

	yyvsp23: INTEGER
			-- Top of semantic value stack `yyvs23'

	yyspecial_routines23: KL_SPECIAL_ROUTINES [ARRAYED_LIST [BOOLEAN]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [BOOLEAN]]

	yyvs24: SPECIAL [ARRAYED_LIST [ISO8601_DATE]]
			-- Stack for semantic values of type ARRAYED_LIST [ISO8601_DATE]

	yyvsc24: INTEGER
			-- Capacity of semantic value stack `yyvs24'

	yyvsp24: INTEGER
			-- Top of semantic value stack `yyvs24'

	yyspecial_routines24: KL_SPECIAL_ROUTINES [ARRAYED_LIST [ISO8601_DATE]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [ISO8601_DATE]]

	yyvs25: SPECIAL [ARRAYED_LIST [ISO8601_TIME]]
			-- Stack for semantic values of type ARRAYED_LIST [ISO8601_TIME]

	yyvsc25: INTEGER
			-- Capacity of semantic value stack `yyvs25'

	yyvsp25: INTEGER
			-- Top of semantic value stack `yyvs25'

	yyspecial_routines25: KL_SPECIAL_ROUTINES [ARRAYED_LIST [ISO8601_TIME]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [ISO8601_TIME]]

	yyvs26: SPECIAL [ARRAYED_LIST [ISO8601_DATE_TIME]]
			-- Stack for semantic values of type ARRAYED_LIST [ISO8601_DATE_TIME]

	yyvsc26: INTEGER
			-- Capacity of semantic value stack `yyvs26'

	yyvsp26: INTEGER
			-- Top of semantic value stack `yyvs26'

	yyspecial_routines26: KL_SPECIAL_ROUTINES [ARRAYED_LIST [ISO8601_DATE_TIME]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [ISO8601_DATE_TIME]]

	yyvs27: SPECIAL [ARRAYED_LIST [ISO8601_DURATION]]
			-- Stack for semantic values of type ARRAYED_LIST [ISO8601_DURATION]

	yyvsc27: INTEGER
			-- Capacity of semantic value stack `yyvs27'

	yyvsp27: INTEGER
			-- Top of semantic value stack `yyvs27'

	yyspecial_routines27: KL_SPECIAL_ROUTINES [ARRAYED_LIST [ISO8601_DURATION]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [ISO8601_DURATION]]

	yyvs28: SPECIAL [ARRAYED_LIST [TERMINOLOGY_CODE]]
			-- Stack for semantic values of type ARRAYED_LIST [TERMINOLOGY_CODE]

	yyvsc28: INTEGER
			-- Capacity of semantic value stack `yyvs28'

	yyvsp28: INTEGER
			-- Top of semantic value stack `yyvs28'

	yyspecial_routines28: KL_SPECIAL_ROUTINES [ARRAYED_LIST [TERMINOLOGY_CODE]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [TERMINOLOGY_CODE]]

	yyvs29: SPECIAL [ARRAYED_LIST [ANY]]
			-- Stack for semantic values of type ARRAYED_LIST [ANY]

	yyvsc29: INTEGER
			-- Capacity of semantic value stack `yyvs29'

	yyvsp29: INTEGER
			-- Top of semantic value stack `yyvs29'

	yyspecial_routines29: KL_SPECIAL_ROUTINES [ARRAYED_LIST [ANY]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [ANY]]

	yyvs30: SPECIAL [INTERVAL [INTEGER]]
			-- Stack for semantic values of type INTERVAL [INTEGER]

	yyvsc30: INTEGER
			-- Capacity of semantic value stack `yyvs30'

	yyvsp30: INTEGER
			-- Top of semantic value stack `yyvs30'

	yyspecial_routines30: KL_SPECIAL_ROUTINES [INTERVAL [INTEGER]]
			-- Routines that ought to be in SPECIAL [INTERVAL [INTEGER]]

	yyvs31: SPECIAL [INTERVAL [REAL]]
			-- Stack for semantic values of type INTERVAL [REAL]

	yyvsc31: INTEGER
			-- Capacity of semantic value stack `yyvs31'

	yyvsp31: INTEGER
			-- Top of semantic value stack `yyvs31'

	yyspecial_routines31: KL_SPECIAL_ROUTINES [INTERVAL [REAL]]
			-- Routines that ought to be in SPECIAL [INTERVAL [REAL]]

	yyvs32: SPECIAL [INTERVAL [ISO8601_TIME]]
			-- Stack for semantic values of type INTERVAL [ISO8601_TIME]

	yyvsc32: INTEGER
			-- Capacity of semantic value stack `yyvs32'

	yyvsp32: INTEGER
			-- Top of semantic value stack `yyvs32'

	yyspecial_routines32: KL_SPECIAL_ROUTINES [INTERVAL [ISO8601_TIME]]
			-- Routines that ought to be in SPECIAL [INTERVAL [ISO8601_TIME]]

	yyvs33: SPECIAL [INTERVAL [ISO8601_DATE]]
			-- Stack for semantic values of type INTERVAL [ISO8601_DATE]

	yyvsc33: INTEGER
			-- Capacity of semantic value stack `yyvs33'

	yyvsp33: INTEGER
			-- Top of semantic value stack `yyvs33'

	yyspecial_routines33: KL_SPECIAL_ROUTINES [INTERVAL [ISO8601_DATE]]
			-- Routines that ought to be in SPECIAL [INTERVAL [ISO8601_DATE]]

	yyvs34: SPECIAL [INTERVAL [ISO8601_DATE_TIME]]
			-- Stack for semantic values of type INTERVAL [ISO8601_DATE_TIME]

	yyvsc34: INTEGER
			-- Capacity of semantic value stack `yyvs34'

	yyvsp34: INTEGER
			-- Top of semantic value stack `yyvs34'

	yyspecial_routines34: KL_SPECIAL_ROUTINES [INTERVAL [ISO8601_DATE_TIME]]
			-- Routines that ought to be in SPECIAL [INTERVAL [ISO8601_DATE_TIME]]

	yyvs35: SPECIAL [INTERVAL [ISO8601_DURATION]]
			-- Stack for semantic values of type INTERVAL [ISO8601_DURATION]

	yyvsc35: INTEGER
			-- Capacity of semantic value stack `yyvs35'

	yyvsp35: INTEGER
			-- Top of semantic value stack `yyvs35'

	yyspecial_routines35: KL_SPECIAL_ROUTINES [INTERVAL [ISO8601_DURATION]]
			-- Routines that ought to be in SPECIAL [INTERVAL [ISO8601_DURATION]]

	yyvs36: SPECIAL [INTERVAL [PART_COMPARABLE]]
			-- Stack for semantic values of type INTERVAL [PART_COMPARABLE]

	yyvsc36: INTEGER
			-- Capacity of semantic value stack `yyvs36'

	yyvsp36: INTEGER
			-- Top of semantic value stack `yyvs36'

	yyspecial_routines36: KL_SPECIAL_ROUTINES [INTERVAL [PART_COMPARABLE]]
			-- Routines that ought to be in SPECIAL [INTERVAL [PART_COMPARABLE]]

	yyvs37: SPECIAL [ARRAYED_LIST [INTERVAL [INTEGER]]]
			-- Stack for semantic values of type ARRAYED_LIST [INTERVAL [INTEGER]]

	yyvsc37: INTEGER
			-- Capacity of semantic value stack `yyvs37'

	yyvsp37: INTEGER
			-- Top of semantic value stack `yyvs37'

	yyspecial_routines37: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTERVAL [INTEGER]]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTERVAL [INTEGER]]]

	yyvs38: SPECIAL [ARRAYED_LIST [INTERVAL [REAL]]]
			-- Stack for semantic values of type ARRAYED_LIST [INTERVAL [REAL]]

	yyvsc38: INTEGER
			-- Capacity of semantic value stack `yyvs38'

	yyvsp38: INTEGER
			-- Top of semantic value stack `yyvs38'

	yyspecial_routines38: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTERVAL [REAL]]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTERVAL [REAL]]]

	yyvs39: SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_TIME]]]
			-- Stack for semantic values of type ARRAYED_LIST [INTERVAL [ISO8601_TIME]]

	yyvsc39: INTEGER
			-- Capacity of semantic value stack `yyvs39'

	yyvsp39: INTEGER
			-- Top of semantic value stack `yyvs39'

	yyspecial_routines39: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTERVAL [ISO8601_TIME]]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_TIME]]]

	yyvs40: SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_DATE]]]
			-- Stack for semantic values of type ARRAYED_LIST [INTERVAL [ISO8601_DATE]]

	yyvsc40: INTEGER
			-- Capacity of semantic value stack `yyvs40'

	yyvsp40: INTEGER
			-- Top of semantic value stack `yyvs40'

	yyspecial_routines40: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTERVAL [ISO8601_DATE]]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_DATE]]]

	yyvs41: SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_DATE_TIME]]]
			-- Stack for semantic values of type ARRAYED_LIST [INTERVAL [ISO8601_DATE_TIME]]

	yyvsc41: INTEGER
			-- Capacity of semantic value stack `yyvs41'

	yyvsp41: INTEGER
			-- Top of semantic value stack `yyvs41'

	yyspecial_routines41: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTERVAL [ISO8601_DATE_TIME]]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_DATE_TIME]]]

	yyvs42: SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_DURATION]]]
			-- Stack for semantic values of type ARRAYED_LIST [INTERVAL [ISO8601_DURATION]]

	yyvsc42: INTEGER
			-- Capacity of semantic value stack `yyvs42'

	yyvsp42: INTEGER
			-- Top of semantic value stack `yyvs42'

	yyspecial_routines42: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTERVAL [ISO8601_DURATION]]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTERVAL [ISO8601_DURATION]]]

	yyvs43: SPECIAL [ARRAYED_LIST [INTERVAL [PART_COMPARABLE]]]
			-- Stack for semantic values of type ARRAYED_LIST [INTERVAL [PART_COMPARABLE]]

	yyvsc43: INTEGER
			-- Capacity of semantic value stack `yyvs43'

	yyvsp43: INTEGER
			-- Top of semantic value stack `yyvs43'

	yyspecial_routines43: KL_SPECIAL_ROUTINES [ARRAYED_LIST [INTERVAL [PART_COMPARABLE]]]
			-- Routines that ought to be in SPECIAL [ARRAYED_LIST [INTERVAL [PART_COMPARABLE]]]

feature {NONE} -- Constants

	yyFinal: INTEGER = 389
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 41
			-- Number of tokens

	yyLast: INTEGER = 494
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 286
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER = 103
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



feature {NONE} -- Initialization

	make
			-- Create a new parser.
		do
			make_scanner
			make_parser_skeleton
			create complex_object_nodes.make(0)
			create attr_nodes.make(0)
			create obj_key.make_empty
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

			complex_object_nodes.wipe_out
			attr_nodes.wipe_out

			set_input_buffer (new_string_buffer (in_text))
			parse
		end

feature -- Access

	source_start_line: INTEGER
			-- offset of source in other document, else 0

	output: detachable DT_COMPLEX_OBJECT
			-- parsed structure

	error_loc: STRING
		do
			create Result.make_empty
		end

feature {NONE} -- Parse Tree

	complex_object_nodes: ARRAYED_STACK [DT_COMPLEX_OBJECT]
	complex_object_node: DT_COMPLEX_OBJECT

	attr_nodes: ARRAYED_STACK [DT_ATTRIBUTE]
	attr_node: DT_ATTRIBUTE

	obj_key: STRING
			-- qualifier of last rel name; use for next object creation

feature {NONE} -- Implementation 
	

end
