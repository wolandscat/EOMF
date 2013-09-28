note
	component:   "Eiffel Object Modelling Framework"
	description: "Parser for Object Data Instance Notation (ODIN)"
	keywords:    "ODIN, data syntax"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2004- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ODIN_PARSER

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

	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

	ISO8601_ROUTINES
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
--|#line 126 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 126")
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
--|#line 134 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 134")
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
--|#line 142 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 142")
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
--|#line 154 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 154")
end

debug("ODIN_parse")
	io.put_string(indent + "attr_val complete%N")
end

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 5 then
--|#line 160 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 160")
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
--|#line 166 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 166")
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
--|#line 175 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 175")
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
--|#line 185 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 185")
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
--|#line 220 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 220")
end

			abort_with_error (ec_SDAT, Void)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 10 then
--|#line 229 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 229")
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
--|#line 236 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 236")
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
--|#line 237 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 237")
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
--|#line 238 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 238")
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
when 14 then
--|#line 247 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 247")
end

			yyval13 := yyvs13.item (yyvsp13)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 15 then
--|#line 251 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 251")
end

			yyval13 := yyvs13.item (yyvsp13)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 16 then
--|#line 260 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 260")
end

			yyval13 := yyvs13.item (yyvsp13)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines13.force (yyvs13, yyval13, yyvsp13)
end
when 17 then
--|#line 264 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 264")
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
--|#line 283 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 283")
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
--|#line 336 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 336")
end

			-- if obj_key is set, it means we are inside a keyed object, and we have hit more keyed objects
			if not obj_key.is_empty then
				create complex_object_node.make_identified (obj_key)
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
--|#line 380 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 380")
end

debug("ODIN_parse")
	io.put_string(indent + "one keyed object%N")
end

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 21 then
--|#line 386 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 386")
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
--|#line 394 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 394")
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
--|#line 402 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 402")
end

			obj_key := yyvs15.item (yyvsp15).out

debug("ODIN_parse")
		io.put_string(indent + "object_key: " + obj_key +
			" (setting " + attr_nodes.item.im_attr_name + " to Multiple)%N")
end
			if not attr_nodes.is_empty then
				attr_nodes.item.set_container_type
			else
				abort_with_error (ec_SGEE, <<attr_node.im_attr_name>>)
			end

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp15 := yyvsp15 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 24 then
--|#line 422 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 422")
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
--|#line 429 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 429")
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
--|#line 447 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 447")
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
--|#line 459 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 459")
end

			-- if parent attr is not multiple, create an anon object; else an object identified by a key
			if attr_nodes.is_empty or else not attr_nodes.item.is_container_type then
debug("ODIN_parse")
	io.put_string(indent + "single_attr_object_complex_head: create complex_object_node.make_anonymous%N")
end
				create complex_object_node.make_anonymous
			else
debug("ODIN_parse")
	io.put_string(indent + "single_attr_object_complex_head: create complex_object_node.make (" + obj_key + ")%N")
end
				create complex_object_node.make_identified (obj_key)
				create obj_key.make_empty
			end

			-- now put the new object under its attribute, if one exists
			if not attr_nodes.is_empty then
				if not attr_nodes.item.has_child_with_id (complex_object_node.id) then
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
--|#line 501 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 501")
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
--|#line 508 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 508")
end

debug("ODIN_parse")
	io.put_string(indent + "typed primitive_object_block; type = " + yyvs4.item (yyvsp4) + "%N")
end
			yyvs14.item (yyvsp14).set_visible_type_name (yyvs4.item (yyvsp4))
			yyval14 := yyvs14.item (yyvsp14)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 -1
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 30 then
--|#line 522 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 522")
end

			yyval14 := yyvs14.item (yyvsp14)
			create obj_key.make_empty
debug("ODIN_parse")
	io.put_string(indent + "untyped_primitive_object_block; attr_nodes(<<" +
			attr_nodes.item.im_attr_name + ">>).item.put_child(<<" +
			yyval14.as_string + ">>)%N")
end
			if not attr_nodes.item.has_child_with_id (yyval14.id) then
				attr_nodes.item.put_child (yyval14)
			else
				abort_with_error (ec_VOKU, <<yyval14.id, attr_nodes.item.im_attr_name >>)
			end

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines14.force (yyvs14, yyval14, yyvsp14)
end
when 31 then
--|#line 539 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 539")
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
when 32 then
--|#line 547 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 547")
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
when 33 then
--|#line 555 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 555")
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
when 34 then
--|#line 563 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 563")
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
when 35 then
--|#line 571 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 571")
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
when 36 then
--|#line 579 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 579")
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
when 37 then
--|#line 589 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 589")
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
when 38 then
--|#line 593 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 593")
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
when 39 then
--|#line 597 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 597")
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
when 40 then
--|#line 601 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 601")
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
when 41 then
--|#line 605 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 605")
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
when 42 then
--|#line 609 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 609")
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
when 43 then
--|#line 613 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 613")
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
when 44 then
--|#line 617 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 617")
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
when 45 then
--|#line 621 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 621")
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
when 46 then
--|#line 625 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 625")
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
when 47 then
--|#line 631 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 631")
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
when 48 then
--|#line 635 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 635")
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
when 49 then
--|#line 639 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 639")
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
when 50 then
--|#line 643 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 643")
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
when 51 then
--|#line 647 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 647")
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
when 52 then
--|#line 651 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 651")
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
when 53 then
--|#line 655 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 655")
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
when 54 then
--|#line 659 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 659")
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
when 55 then
--|#line 663 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 663")
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
when 56 then
--|#line 669 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 669")
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
when 57 then
--|#line 673 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 673")
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
when 58 then
--|#line 677 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 677")
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
when 59 then
--|#line 681 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 681")
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
when 60 then
--|#line 685 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 685")
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
when 61 then
--|#line 689 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 689")
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
when 62 then
--|#line 695 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 695")
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
when 63 then
--|#line 699 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 699")
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
when 64 then
--|#line 703 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 703")
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
when 65 then
--|#line 707 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 707")
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
when 66 then
--|#line 711 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 711")
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
when 67 then
--|#line 715 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 715")
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
when 68 then
--|#line 721 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 721")
end

			yyval4 := yyvs4.item (yyvsp4)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 69 then
--|#line 725 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 725")
end

			yyval4 := yyvs4.item (yyvsp4)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 70 then
--|#line 729 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 729")
end

			yyval4 := yyvs4.item (yyvsp4)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 71 then
--|#line 733 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 733")
end

			yyval4 := yyvs4.item (yyvsp4)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 72 then
--|#line 742 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 742")
end

			yyval4 := yyvs4.item (yyvsp4)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 73 then
--|#line 748 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 748")
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
when 74 then
--|#line 754 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 754")
end

			yyvs19.item (yyvsp19).extend(yyvs4.item (yyvsp4))
			yyval19 := yyvs19.item (yyvsp19)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 75 then
--|#line 762 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 762")
end

			yyval19 := yyvs19.item (yyvsp19)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
when 76 then
--|#line 766 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 766")
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
when 77 then
--|#line 773 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 773")
end

			yyval2 := yyvs2.item (yyvsp2)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 78 then
--|#line 776 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 776")
end

			yyval2 := yyvs2.item (yyvsp2)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 79 then
--|#line 779 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 779")
end

			yyval2 := - yyvs2.item (yyvsp2)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 80 then
--|#line 784 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 784")
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
when 81 then
--|#line 790 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 790")
end

			yyvs20.item (yyvsp20).extend(yyvs2.item (yyvsp2))
			yyval20 := yyvs20.item (yyvsp20)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
when 82 then
--|#line 795 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 795")
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
when 83 then
--|#line 802 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 802")
end

			if yyvs2.item (yyvsp2 - 1) <= yyvs2.item (yyvsp2) then
				create {PROPER_INTERVAL [INTEGER]} yyval30.make_bounded(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs2.item (yyvsp2 - 1).out, yyvs2.item (yyvsp2).out>>)
			end

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
when 84 then
--|#line 810 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 810")
end

			if yyvs2.item (yyvsp2 - 1) <= yyvs2.item (yyvsp2) then
				create {PROPER_INTERVAL [INTEGER]} yyval30.make_bounded(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs2.item (yyvsp2 - 1).out, yyvs2.item (yyvsp2).out>>)
			end

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
when 85 then
--|#line 818 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 818")
end

			if yyvs2.item (yyvsp2 - 1) <= yyvs2.item (yyvsp2) then
				create {PROPER_INTERVAL [INTEGER]} yyval30.make_bounded(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs2.item (yyvsp2 - 1).out, yyvs2.item (yyvsp2).out>>)
			end

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
when 86 then
--|#line 826 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 826")
end

			if yyvs2.item (yyvsp2 - 1) <= yyvs2.item (yyvsp2) then
				create {PROPER_INTERVAL [INTEGER]} yyval30.make_bounded (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs2.item (yyvsp2 - 1).out, yyvs2.item (yyvsp2).out>>)
			end

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
when 87 then
--|#line 834 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 834")
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
when 88 then
--|#line 838 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 838")
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
when 89 then
--|#line 842 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 842")
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
when 90 then
--|#line 846 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 846")
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
when 91 then
--|#line 850 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 850")
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
when 92 then
--|#line 856 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 856")
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
when 93 then
--|#line 862 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 862")
end

			yyvs37.item (yyvsp37).extend(yyvs30.item (yyvsp30))
			yyval37 := yyvs37.item (yyvsp37)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp30 := yyvsp30 -1
	yyspecial_routines37.force (yyvs37, yyval37, yyvsp37)
end
when 94 then
--|#line 867 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 867")
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
when 95 then
--|#line 874 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 874")
end

			yyval3 := yyvs3.item (yyvsp3)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 96 then
--|#line 878 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 878")
end

			yyval3 := yyvs3.item (yyvsp3)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 97 then
--|#line 882 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 882")
end

			yyval3 := - yyvs3.item (yyvsp3)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 98 then
--|#line 888 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 888")
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
when 99 then
--|#line 894 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 894")
end

			yyvs21.item (yyvsp21).extend(yyvs3.item (yyvsp3))
			yyval21 := yyvs21.item (yyvsp21)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp3 := yyvsp3 -1
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
when 100 then
--|#line 899 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 899")
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
when 101 then
--|#line 906 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 906")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create {PROPER_INTERVAL [REAL]} yyval31.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>)
			end

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
when 102 then
--|#line 914 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 914")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create {PROPER_INTERVAL [REAL]} yyval31.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>)
			end

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
when 103 then
--|#line 922 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 922")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create {PROPER_INTERVAL [REAL]} yyval31.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>)
			end

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
when 104 then
--|#line 930 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 930")
end

			if yyvs3.item (yyvsp3 - 1) <= yyvs3.item (yyvsp3) then
				create {PROPER_INTERVAL [REAL]} yyval31.make_bounded(yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs3.item (yyvsp3 - 1).out, yyvs3.item (yyvsp3).out>>)
			end

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
when 105 then
--|#line 938 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 938")
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
when 106 then
--|#line 942 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 942")
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
when 107 then
--|#line 946 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 946")
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
when 108 then
--|#line 950 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 950")
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
when 109 then
--|#line 954 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 954")
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
when 110 then
--|#line 960 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 960")
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
when 111 then
--|#line 966 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 966")
end

			yyvs38.item (yyvsp38).extend(yyvs31.item (yyvsp31))
			yyval38 := yyvs38.item (yyvsp38)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp31 := yyvsp31 -1
	yyspecial_routines38.force (yyvs38, yyval38, yyvsp38)
end
when 112 then
--|#line 971 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 971")
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
when 113 then
--|#line 978 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 978")
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
when 114 then
--|#line 982 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 982")
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
when 115 then
--|#line 988 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 988")
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
when 116 then
--|#line 994 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 994")
end

			yyvs23.item (yyvsp23).extend(yyvs6.item (yyvsp6))
			yyval23 := yyvs23.item (yyvsp23)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp6 := yyvsp6 -1
	yyspecial_routines23.force (yyvs23, yyval23, yyvsp23)
end
when 117 then
--|#line 999 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 999")
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
when 118 then
--|#line 1006 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1006")
end

			yyval5 := yyvs5.item (yyvsp5)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 119 then
--|#line 1012 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1012")
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
when 120 then
--|#line 1018 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1018")
end

			yyvs22.item (yyvsp22).extend(yyvs5.item (yyvsp5))
			yyval22 := yyvs22.item (yyvsp22)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
when 121 then
--|#line 1023 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1023")
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
when 122 then
--|#line 1030 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1030")
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
when 123 then
--|#line 1040 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1040")
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
when 124 then
--|#line 1046 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1046")
end

			yyvs24.item (yyvsp24).extend (yyvs7.item (yyvsp7))
			yyval24 := yyvs24.item (yyvsp24)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp7 := yyvsp7 -1
	yyspecial_routines24.force (yyvs24, yyval24, yyvsp24)
end
when 125 then
--|#line 1051 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1051")
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
when 126 then
--|#line 1058 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1058")
end

			if yyvs7.item (yyvsp7 - 1) <= yyvs7.item (yyvsp7) then
				create {PROPER_INTERVAL [ISO8601_DATE]} yyval33.make_bounded(yyvs7.item (yyvsp7 - 1), yyvs7.item (yyvsp7), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs7.item (yyvsp7 - 1).out, yyvs7.item (yyvsp7).out>>)
			end

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
when 127 then
--|#line 1066 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1066")
end

			if yyvs7.item (yyvsp7 - 1) <= yyvs7.item (yyvsp7) then
				create {PROPER_INTERVAL [ISO8601_DATE]} yyval33.make_bounded(yyvs7.item (yyvsp7 - 1), yyvs7.item (yyvsp7), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs7.item (yyvsp7 - 1).out, yyvs7.item (yyvsp7).out>>)
			end

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
when 128 then
--|#line 1074 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1074")
end

			if yyvs7.item (yyvsp7 - 1) <= yyvs7.item (yyvsp7) then
				create {PROPER_INTERVAL [ISO8601_DATE]} yyval33.make_bounded(yyvs7.item (yyvsp7 - 1), yyvs7.item (yyvsp7), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs7.item (yyvsp7 - 1).out, yyvs7.item (yyvsp7).out>>)
			end

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
when 129 then
--|#line 1082 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1082")
end

			if yyvs7.item (yyvsp7 - 1) <= yyvs7.item (yyvsp7) then
				create {PROPER_INTERVAL [ISO8601_DATE]} yyval33.make_bounded(yyvs7.item (yyvsp7 - 1), yyvs7.item (yyvsp7), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs7.item (yyvsp7 - 1).out, yyvs7.item (yyvsp7).out>>)
			end

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
when 130 then
--|#line 1090 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1090")
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
when 131 then
--|#line 1094 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1094")
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
when 132 then
--|#line 1098 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1098")
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
when 133 then
--|#line 1102 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1102")
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
when 134 then
--|#line 1106 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1106")
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
when 135 then
--|#line 1112 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1112")
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
when 136 then
--|#line 1118 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1118")
end

			yyvs40.item (yyvsp40).extend(yyvs33.item (yyvsp33))
			yyval40 := yyvs40.item (yyvsp40)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp33 := yyvsp33 -1
	yyspecial_routines40.force (yyvs40, yyval40, yyvsp40)
end
when 137 then
--|#line 1123 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1123")
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
when 138 then
--|#line 1130 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1130")
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
when 139 then
--|#line 1140 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1140")
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
when 140 then
--|#line 1146 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1146")
end

			yyvs25.item (yyvsp25).extend(yyvs9.item (yyvsp9))
			yyval25 := yyvs25.item (yyvsp25)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp9 := yyvsp9 -1
	yyspecial_routines25.force (yyvs25, yyval25, yyvsp25)
end
when 141 then
--|#line 1151 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1151")
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
when 142 then
--|#line 1158 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1158")
end

			if yyvs9.item (yyvsp9 - 1) <= yyvs9.item (yyvsp9) then
				create {PROPER_INTERVAL [ISO8601_TIME]} yyval32.make_bounded(yyvs9.item (yyvsp9 - 1), yyvs9.item (yyvsp9), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs9.item (yyvsp9 - 1).out, yyvs9.item (yyvsp9).out>>)
			end

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
when 143 then
--|#line 1166 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1166")
end

			if yyvs9.item (yyvsp9 - 1) <= yyvs9.item (yyvsp9) then
				create {PROPER_INTERVAL [ISO8601_TIME]} yyval32.make_bounded(yyvs9.item (yyvsp9 - 1), yyvs9.item (yyvsp9), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs9.item (yyvsp9 - 1).out, yyvs9.item (yyvsp9).out>>)
			end

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
when 144 then
--|#line 1174 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1174")
end

			if yyvs9.item (yyvsp9 - 1) <= yyvs9.item (yyvsp9) then
				create {PROPER_INTERVAL [ISO8601_TIME]} yyval32.make_bounded(yyvs9.item (yyvsp9 - 1), yyvs9.item (yyvsp9), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs9.item (yyvsp9 - 1).out, yyvs9.item (yyvsp9).out>>)
			end

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
when 145 then
--|#line 1182 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1182")
end

			if yyvs9.item (yyvsp9 - 1) <= yyvs9.item (yyvsp9) then
				create {PROPER_INTERVAL [ISO8601_TIME]} yyval32.make_bounded(yyvs9.item (yyvsp9 - 1), yyvs9.item (yyvsp9), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs9.item (yyvsp9 - 1).out, yyvs9.item (yyvsp9).out>>)
			end

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
when 146 then
--|#line 1190 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1190")
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
when 147 then
--|#line 1194 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1194")
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
when 148 then
--|#line 1198 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1198")
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
when 149 then
--|#line 1202 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1202")
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
when 150 then
--|#line 1206 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1206")
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
when 151 then
--|#line 1212 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1212")
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
when 152 then
--|#line 1218 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1218")
end

			yyvs39.item (yyvsp39).extend(yyvs32.item (yyvsp32))
			yyval39 := yyvs39.item (yyvsp39)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp32 := yyvsp32 -1
	yyspecial_routines39.force (yyvs39, yyval39, yyvsp39)
end
when 153 then
--|#line 1223 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1223")
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
when 154 then
--|#line 1230 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1230")
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
when 155 then
--|#line 1240 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1240")
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
when 156 then
--|#line 1246 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1246")
end

			yyvs26.item (yyvsp26).extend(yyvs8.item (yyvsp8))
			yyval26 := yyvs26.item (yyvsp26)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp8 := yyvsp8 -1
	yyspecial_routines26.force (yyvs26, yyval26, yyvsp26)
end
when 157 then
--|#line 1251 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1251")
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
when 158 then
--|#line 1258 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1258")
end

			if yyvs8.item (yyvsp8 - 1) <= yyvs8.item (yyvsp8) then
				create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval34.make_bounded(yyvs8.item (yyvsp8 - 1), yyvs8.item (yyvsp8), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs8.item (yyvsp8 - 1).out, yyvs8.item (yyvsp8).out>>)
			end

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
when 159 then
--|#line 1266 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1266")
end

			if yyvs8.item (yyvsp8 - 1) <= yyvs8.item (yyvsp8) then
				create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval34.make_bounded(yyvs8.item (yyvsp8 - 1), yyvs8.item (yyvsp8), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs8.item (yyvsp8 - 1).out, yyvs8.item (yyvsp8).out>>)
			end

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
when 160 then
--|#line 1274 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1274")
end

			if yyvs8.item (yyvsp8 - 1) <= yyvs8.item (yyvsp8) then
				create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval34.make_bounded(yyvs8.item (yyvsp8 - 1), yyvs8.item (yyvsp8), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs8.item (yyvsp8 - 1).out, yyvs8.item (yyvsp8).out>>)
			end

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
when 161 then
--|#line 1282 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1282")
end

			if yyvs8.item (yyvsp8 - 1) <= yyvs8.item (yyvsp8) then
				create {PROPER_INTERVAL [ISO8601_DATE_TIME]} yyval34.make_bounded(yyvs8.item (yyvsp8 - 1), yyvs8.item (yyvsp8), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs8.item (yyvsp8 - 1).out, yyvs8.item (yyvsp8).out>>)
			end

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
when 162 then
--|#line 1290 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1290")
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
when 163 then
--|#line 1294 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1294")
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
when 164 then
--|#line 1298 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1298")
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
when 165 then
--|#line 1302 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1302")
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
when 166 then
--|#line 1306 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1306")
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
when 167 then
--|#line 1312 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1312")
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
when 168 then
--|#line 1318 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1318")
end

			yyvs41.item (yyvsp41).extend(yyvs34.item (yyvsp34))
			yyval41 := yyvs41.item (yyvsp41)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp34 := yyvsp34 -1
	yyspecial_routines41.force (yyvs41, yyval41, yyvsp41)
end
when 169 then
--|#line 1323 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1323")
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
when 170 then
--|#line 1330 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1330")
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
when 171 then
--|#line 1340 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1340")
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
when 172 then
--|#line 1346 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1346")
end

			yyvs27.item (yyvsp27).extend(yyvs10.item (yyvsp10))
			yyval27 := yyvs27.item (yyvsp27)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp10 := yyvsp10 -1
	yyspecial_routines27.force (yyvs27, yyval27, yyvsp27)
end
when 173 then
--|#line 1351 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1351")
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
when 174 then
--|#line 1358 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1358")
end

			if yyvs10.item (yyvsp10 - 1) <= yyvs10.item (yyvsp10) then
				create {PROPER_INTERVAL [ISO8601_DURATION]} yyval35.make_bounded(yyvs10.item (yyvsp10 - 1), yyvs10.item (yyvsp10), True, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs10.item (yyvsp10 - 1).out, yyvs10.item (yyvsp10).out>>)
			end

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
when 175 then
--|#line 1366 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1366")
end

			if yyvs10.item (yyvsp10 - 1) <= yyvs10.item (yyvsp10) then
				create {PROPER_INTERVAL [ISO8601_DURATION]} yyval35.make_bounded(yyvs10.item (yyvsp10 - 1), yyvs10.item (yyvsp10), False, True)
			else
				abort_with_error (ec_VIVLO, <<yyvs10.item (yyvsp10 - 1).out, yyvs10.item (yyvsp10).out>>)
			end

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
when 176 then
--|#line 1374 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1374")
end

			if yyvs10.item (yyvsp10 - 1) <= yyvs10.item (yyvsp10) then
				create {PROPER_INTERVAL [ISO8601_DURATION]} yyval35.make_bounded(yyvs10.item (yyvsp10 - 1), yyvs10.item (yyvsp10), True, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs10.item (yyvsp10 - 1).out, yyvs10.item (yyvsp10).out>>)
			end

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
when 177 then
--|#line 1382 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1382")
end

			if yyvs10.item (yyvsp10 - 1) <= yyvs10.item (yyvsp10) then
				create {PROPER_INTERVAL [ISO8601_DURATION]} yyval35.make_bounded(yyvs10.item (yyvsp10 - 1), yyvs10.item (yyvsp10), False, False)
			else
				abort_with_error (ec_VIVLO, <<yyvs10.item (yyvsp10 - 1).out, yyvs10.item (yyvsp10).out>>)
			end

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
when 178 then
--|#line 1390 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1390")
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
when 179 then
--|#line 1394 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1394")
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
when 180 then
--|#line 1398 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1398")
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
when 181 then
--|#line 1402 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1402")
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
when 182 then
--|#line 1406 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1406")
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
when 183 then
--|#line 1412 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1412")
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
when 184 then
--|#line 1418 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1418")
end

			yyvs42.item (yyvsp42).extend(yyvs35.item (yyvsp35))
			yyval42 := yyvs42.item (yyvsp42)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp35 := yyvsp35 -1
	yyspecial_routines42.force (yyvs42, yyval42, yyvsp42)
end
when 185 then
--|#line 1423 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1423")
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
when 186 then
--|#line 1430 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1430")
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
when 187 then
--|#line 1434 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1434")
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
when 188 then
--|#line 1438 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1438")
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
when 189 then
--|#line 1444 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1444")
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
when 190 then
--|#line 1450 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1450")
end

			yyvs28.item (yyvsp28).extend(yyvs11.item (yyvsp11))
			yyval28 := yyvs28.item (yyvsp28)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp11 := yyvsp11 -1
	yyspecial_routines28.force (yyvs28, yyval28, yyvsp28)
end
when 191 then
--|#line 1455 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1455")
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
when 192 then
--|#line 1462 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1462")
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
when 193 then
--|#line 1472 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1472")
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
when 194 then
--|#line 1488 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1488")
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
when 195 then
--|#line 1497 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1497")
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
when 196 then
--|#line 1509 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1509")
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
when 197 then
--|#line 1515 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1515")
end

			yyvs18.item (yyvsp18).extend(yyvs16.item (yyvsp16))
			yyval18 := yyvs18.item (yyvsp18)

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp16 := yyvsp16 -1
	yyspecial_routines18.force (yyvs18, yyval18, yyvsp18)
end
when 198 then
--|#line 1520 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1520")
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
when 199 then
--|#line 1532 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1532")
end

			create yyval16.make_root
debug("OG_PATH_parse")
	io.put_string("....absolute_path (root); %N")
end

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
when 200 then
--|#line 1539 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1539")
end

			yyval16 := yyvs16.item (yyvsp16)
			yyval16.set_absolute
debug("OG_PATH_parse")
	io.put_string("....absolute_path; %N")
end

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 201 then
--|#line 1547 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1547")
end

			yyval16 := yyvs16.item (yyvsp16 - 1)
			yyval16.append_path(yyvs16.item (yyvsp16))
debug("OG_PATH_parse")
	io.put_string("....absolute_path (appended relative path); %N")
end

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp16 := yyvsp16 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 202 then
--|#line 1557 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1557")
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
when 203 then
--|#line 1561 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1561")
end

			yyval16 := yyvs16.item (yyvsp16)
			yyval16.append_segment(yyvs17.item (yyvsp17))

if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp17 := yyvsp17 -1
	yyspecial_routines16.force (yyvs16, yyval16, yyvsp16)
end
when 204 then
--|#line 1568 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1568")
end

			create yyval17.make_with_object_id(yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4))
debug("OG_PATH_parse")
	io.put_string("...path_segment: " + yyvs4.item (yyvsp4 - 1) + "[" + yyvs4.item (yyvsp4) + "]%N")
end

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
when 205 then
--|#line 1575 "odin_validator.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'odin_validator.y' at line 1575")
end

			create yyval17.make(yyvs4.item (yyvsp4))
debug("OG_PATH_parse")
	io.put_string("...path_segment: " + yyvs4.item (yyvsp4) + "%N")
end

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
			when 391 then
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
			    0,   96,   96,   96,   97,   97,   97,   98,   99,   99,
			  100,  100,  100,  100,   59,   59,   57,   57,   58,  101,
			  102,  102,  103,  104,   55,   55,   56,  105,   61,   61,
			   60,   63,   63,   63,   63,   63,   63,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   88,   88,   88,   88,
			   88,   88,   95,   95,   95,   95,   95,   95,   44,   44,
			   44,   44,   70,   71,   71,   71,   71,   45,   45,   45,
			   72,   72,   72,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   89,   89,   89,   46,   46,   46,   73,   73,

			   73,   83,   83,   83,   83,   83,   83,   83,   83,   83,
			   90,   90,   90,   47,   47,   75,   75,   75,   48,   74,
			   74,   74,   49,   76,   76,   76,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   92,   92,   92,   51,   77,
			   77,   77,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   91,   91,   91,   50,   78,   78,   78,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   93,   93,   93,
			   52,   79,   79,   79,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   94,   94,   94,   53,   53,   53,   80,
			   80,   80,   54,   62,   64,   64,   69,   69,   69,   66,

			   66,   66,   67,   67,   68,   68, yyDummy>>)
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
			    9,   10,   12,   15,    4,    1,    1,    1,    1,    1,
			    4,    1,    1,    4,    4,    4,    2,    3,    6,    5,
			    7,    8,    9,   10,   11,   14,   14,   15,   16,   18,
			   19,   20,   21,   22,   23,   24,   25,   26,   27,   28,

			   29,   30,   31,   32,   33,   34,   35,   36,   37,   38,
			   39,   40,   41,   42,   43,    1,   14,    3,    2,    3,
			    2,    1,    1,    4,   16,   17,    1,    1,    1,    1,
			    2,    3,    7,    8,    9,   10,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    2,    3,    7,    8,    9,
			   10,    2,    3,    7,    8,    9,   10,    2,    3,    7,
			    8,    9,   10,    2,    3,    7,    8,    9,   10,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    4,    1,    1,    1,    2,    1,    1,    1,
			    3,    1,    6,    1,    5,    1,    7,    1,    8,    1,
			    9,    1,   10,    1,   11,   16,    1,   16,   16,    1,
			    4,    2,    3,    5,    6,    7,    9,    8,   10,   11,
			    1,    1,   30,    1,    1,   31,    1,    1,   32,    1,
			    1,   33,    1,    1,   34,    1,    1,   35,   30,   31,
			   32,   33,   34,   35,    4,   17,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    2,    1,    3,
			    1,    7,    1,    8,    1,    9,    1,   10,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    2,    1,    3,    1,    7,    1,
			    8,    1,    9,    1,   10,    2,    1,    3,    1,    7,
			    1,    8,    1,    9,    1,   10,    1,    2,    1,    3,
			    1,    7,    1,    8,    1,    9,    1,   10,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1, yyDummy>>)
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
			    0,    0,   27,    0,   71,   70,    3,    0,   14,   24,
			   15,   16,    2,    1,    4,    0,    0,    0,    0,    0,
			    9,   25,   17,    0,    5,    0,    0,    0,   20,    0,
			    0,   69,   68,    6,   27,    0,   10,   28,   11,   12,
			    7,    0,    0,  114,  113,  118,  192,  170,  154,  138,
			  122,   72,   95,   77,   38,   39,   40,   41,   42,   44,
			   43,   45,   46,    0,   37,   18,   21,    0,   26,  199,
			  188,    0,   13,  187,  186,   72,   38,   39,   40,   41,
			   42,   44,   43,   45,   35,    0,    0,   31,  194,  195,
			   47,   48,   49,   51,   50,   52,   53,   54,   55,   36,

			   32,   56,   57,   59,   58,   60,   61,   33,   62,   63,
			   65,   64,   66,   67,   34,   27,   29,   97,   79,   96,
			   78,   23,   22,  205,  200,  202,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,   30,  193,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   91,

			    0,  109,    0,  134,    0,  166,    0,  150,    0,  182,
			    0,   76,   73,    0,    0,   82,   80,    0,    0,  100,
			   98,  117,  115,  121,  119,  125,  123,  157,  155,  141,
			  139,  173,  171,  191,  189,  201,  198,  196,  197,   75,
			   74,   81,   99,  120,  116,  124,  140,  156,  172,  190,
			    0,   94,   92,    0,  112,  110,    0,  153,  151,    0,
			  137,  135,    0,  169,  167,    0,  185,  183,   93,  111,
			  152,  136,  168,  184,    0,  203,   90,  108,  133,  165,
			  149,  181,   88,  106,  131,  163,  147,  179,   89,    0,
			  107,    0,  132,    0,  164,    0,  148,    0,  180,    0,

			   87,  105,  130,  162,  146,  178,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,  204,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,   83,    0,  101,    0,
			  126,    0,  158,    0,  142,    0,  174,    0,   84,    0,
			  102,    0,  127,    0,  159,    0,  143,    0,  175,   85,
			  103,  128,  160,  144,  176,   86,  104,  129,  161,  145,
			  177,    0,    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			   35,   76,   77,   78,   79,   80,   81,   82,   83,   84,
			   62,    8,    9,   10,   11,   36,   37,   38,   39,   85,
			   86,   87,   88,  124,  125,   89,   64,   90,   91,   92,
			   93,   94,   95,   96,   97,   98,   99,  100,  101,  102,
			  103,  104,  105,  106,  107,  108,  109,  110,  111,  112,
			  113,  114,  391,   13,   14,   15,   40,   16,   27,   28,
			   29,   17, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			  140,  380,  465,    0, -32768, -32768, -32768,  482, -32768, -32768,
			 -32768, -32768, -32768,   56, -32768,  479,  462,  488,  458,  457,
			 -32768, -32768, -32768,  488, -32768,  147,  151,  137, -32768,  474,
			  170, -32768, -32768, -32768,   14,  475, -32768, -32768, -32768, -32768,
			 -32768,  379,  377, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768,  391, -32768, -32768, -32768,  147, -32768,  415,
			 -32768,  200, -32768, -32768, -32768,  452,  451,  450,  449,  448,
			  447,  446,  445,  444,  443,  463,  442, -32768,  290,  441,
			  440,  439,  438,  437,  436,  435,  434,  433,  432,  431,

			 -32768,  430,  429,  428,  427,  426,  425, -32768,  424,  423,
			  422,  420,  419,  418, -32768,  243, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768,  416,  359, -32768,   31,   31,   31,   31,
			  335,  332,  331,  327,  324,  323,  256,   24,  108,  276,
			  239,  110,   -6,   60,  203,  168, -32768, -32768,  415,  -11,
			  384,  240,   51,   75,  421,  354,  375,  181,  338,  201,
			  111,  353,  351,  349,  347,  341,  339,  414,  413,  412,
			  411,  410,  409,  417,  415,  408,  407,  406,  403,  401,
			  400,  398,  397,  396,  395,  394,  393,  315,  314,  305,
			  288,  251,   -9,  392,  390,  389,  388,  387,  386, -32768,

			   45, -32768,   57, -32768,  148, -32768,  153, -32768,   42, -32768,
			  195, -32768, -32768,  405,  404, -32768, -32768,  402,  399, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768,  359, -32768,  357,  357, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			   48, -32768, -32768,  190, -32768, -32768,  260, -32768, -32768,  254,
			 -32768, -32768,  209, -32768, -32768,  296, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768,  361, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,   18,
			 -32768,   54, -32768,   58, -32768,  117, -32768,   -7, -32768,   52,

			 -32768, -32768, -32768, -32768, -32768, -32768,   51,  382,   75,  381,
			  375,  378,  338,  376,  181,  374,  201,  373,   51,   51,
			   51,   51,   75,   75,   75,   75,  181,  181,  181,  181,
			  375,  375,  375,  375,  338,  338,  338,  338,  201,  201,
			  201,  201, -32768,   51,  372,   75,  364,  375,  336,  338,
			  316,  181,  309,  201,  287,  279, -32768,  272, -32768,  242,
			 -32768,  226, -32768,  217, -32768,  199, -32768,  183, -32768,  179,
			 -32768,  164, -32768,  125, -32768,  104, -32768,  -13, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768,   88,   62, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			  454,   71,   43,  -24,  -20,   10,  -18,  -22,  -26,   35,
			 -32768, -32768,   87, -32768,   78,  453,  470, -32768, -32768, -32768,
			 -32768,  478,  244,  292,  265, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  132,  129,
			   61,  -41, -156, -159, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768,  485,  220, -32768,  383, -32768, -32768,  476,
			 -32768, -32768, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   61,   20,   56,   49,   60,   48,   57,  267,   59,  264,
			  390,  236,  299,  273,  298,  272,  227,   53,   52,  351,
			   -8,   53,   75,   50,   49,   48,   47,   53,   74,   73,
			   46,   45,   69,   72,   53,   52,   58,   71,   44,   43,
			   50,   49,   48,   47,  343,  135,  215,   70,   53,  134,
			  -19,   53,   49,  133,   53,   42,   41,   69,   52,  214,
			  213,   52,  393,    3,   47,  214,  213,   50,  314,   55,
			   49,  306,   42,   41,  321,  320,  319,  318,  353,   52,
			  345,  132,  229,  308,  347,   22,  214,  213,  392,  214,
			  213,   23,  214,  213,   21,  218,  217,   54,  218,  217,

			  180,  186,  192,  198,  179,  185,  191,  197,  178,  184,
			  190,  196,   52,   22,  131,  222,  218,  217,  232,   50,
			  224,  230,   21,  261,  228,   74,   73,  389,   48,  271,
			  219,  244,  225,  248,  243,  246,  177,  183,  189,  195,
			  247,    6,  130,  349,   70,    5,    4,    3,  388,  218,
			  217,  226,    5,    4,   53,   52,   65,   50,    2,   51,
			   50,   49,   48,   47,   48,   34,  245,   46,   45,  176,
			  182,  188,  194,   26,  310,   44,   43,    3,    1,  312,
			  234,  220,   74,   73,  317,    1,  315,  387,  313,   68,
			  233,   49,   42,   41,   52,  249,  242,  175,  181,  187,

			  193,   70,  386,   53,   52,   23,  385,   47,  216,   50,
			   49,   48,   47,   47,  311,   47,  325,  324,  323,  322,
			   48,  316,  384,  241,  258,  231,  129,  128,  127,  126,
			  270,  218,  217,   24,  134,  337,  336,  335,  334,  135,
			  383,   42,   41,   33,  133,  309,   53,   52,  240,  382,
			   24,   75,   50,   49,   48,   47,   45,   74,   73,   46,
			   45,  223,  239,   50,  212,  381,   71,   44,   43,  132,
			   49,  307,  297,  354,  296,  352,   70,  350,  211,  -19,
			  333,  332,  331,  330,   42,   41,  329,  328,  327,  326,
			  365,  255,  363,  252,  361,  380,  131,  269,  221,  268,

			   44,   43,  379,  348,  179,  185,  191,  197,   47,  295,
			  378,  294,  180,  186,  192,  198,  178,  184,  190,  196,
			  359,  130,  341,  340,  339,  338,  293,  377,  292,  375,
			  149,  373,  376,  148,  346,  291,  289,  290,  288,  374,
			  177,  183,  189,  195,  210,  208,  209,  207,  206,   48,
			  205,  357,  204,  202,  203,  201,  200,  371,  199,  372,
			  344,  266,  265,  263,  262,  176,  182,  188,  194,  260,
			  259,  257,  256,  254,  253,  251,  250,  355,   44,   43,
			  120,  119,  118,  117,   50,   19,   18,  370,  369,  175,
			  181,  187,  193,  237,  238,  368,  366,  364,  342,  362,

			  148,  360,  174,  119,  358,  356,  117,  120,  118,  305,
			  304,  303,  302,  301,  367,  300,  287,  286,  285,  284,
			  283,  282,  123,  281,  280,  274,  279,   69,  121,  278,
			  277,  276,  265,  262,  259,  256,  253,  250,   45,  275,
			  235,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			  122,    0,  173,   12,    7,    0,    0,    0,  172,  171,
			  170,  147,  169,  168,  167,  166,  165,  164,  163,  162,
			  161,  160,  159,  158,  157,  156,  155,  154,  153,  152,
			  151,  150,  146,  145,  144,  143,  142,  141,  140,  139,
			  138,  137,  136,  115,   67,    3,   32,   31,   26,   25,

			    2,  -19,   30,   66,   63,  116, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			   26,    1,   26,   10,   26,   11,   26,  166,   26,  165,
			   23,   22,   21,  172,   23,  171,   22,    3,    4,   26,
			   20,    3,    8,    9,   10,   11,   12,    3,   14,   15,
			   16,   17,   43,   19,    3,    4,   26,   23,   24,   25,
			    9,   10,   11,   12,   26,   71,   22,   33,    3,   71,
			   36,    3,   10,   71,    3,   41,   42,   43,    4,   41,
			   42,    4,    0,    7,   12,   41,   42,    9,   26,   26,
			   10,   26,   41,   42,   26,   27,   28,   29,   26,    4,
			   26,   71,   22,   26,   26,    7,   41,   42,    0,   41,
			   42,   35,   41,   42,    7,   41,   42,   26,   41,   42,

			  126,  127,  128,  129,  126,  127,  128,  129,  126,  127,
			  128,  129,    4,   35,   71,  139,   41,   42,  144,    9,
			  140,  143,   35,  164,  142,   14,   15,   23,   11,  170,
			   22,  155,   22,  159,  154,  157,  126,  127,  128,  129,
			  158,    1,   71,   26,   33,    5,    6,    7,   23,   41,
			   42,  141,    5,    6,    3,    4,   19,    9,   18,    8,
			    9,   10,   11,   12,   11,   18,  156,   16,   17,  126,
			  127,  128,  129,   36,   26,   24,   25,    7,   38,   26,
			  145,  138,   14,   15,  210,   38,  208,   23,  206,   19,
			   22,   10,   41,   42,    4,  160,  153,  126,  127,  128,

			  129,   33,   23,    3,    4,   35,   23,   12,  137,    9,
			   10,   11,   12,   12,  204,   12,   26,   27,   28,   29,
			   11,   26,   23,  152,  163,   22,   26,   27,   28,   29,
			  169,   41,   42,   13,  256,   26,   27,   28,   29,  265,
			   23,   41,   42,   23,  262,  202,    3,    4,    8,   23,
			   30,    8,    9,   10,   11,   12,   17,   14,   15,   16,
			   17,   22,   22,    9,    8,   23,   23,   24,   25,  259,
			   10,  200,   21,  299,   23,  297,   33,  295,   22,   36,
			   26,   27,   28,   29,   41,   42,   26,   27,   28,   29,
			  316,  162,  314,  161,  312,   23,  253,  168,   22,  167,

			   24,   25,   23,  293,  326,  327,  328,  329,   12,   21,
			   23,   23,  338,  339,  340,  341,  334,  335,  336,  337,
			  310,  250,   26,   27,   28,   29,   21,  353,   23,  351,
			   40,  349,   23,   43,  291,   21,   21,   23,   23,   23,
			  330,  331,  332,  333,   21,   21,   23,   23,   21,   11,
			   23,  308,   21,   21,   23,   23,   21,  347,   23,   23,
			  289,   22,   23,   22,   23,  322,  323,  324,  325,   22,
			   23,   22,   23,   22,   23,   22,   23,  306,   24,   25,
			    3,    4,    3,    4,    9,    5,    6,   23,  345,  318,
			  319,  320,  321,  149,  150,   23,   23,   23,   37,   23,

			   43,   23,   43,    4,   23,   23,    4,    3,    3,   23,
			   23,   23,   23,   23,  343,   23,   23,   23,   23,   23,
			   23,   23,    7,   23,   23,    8,   23,   43,   37,   23,
			   23,   23,   23,   23,   23,   23,   23,   23,   17,  174,
			  148,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   67,   -1,   36,    0,    0,   -1,   -1,   -1,   40,   40,
			   40,   19,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   19,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   18,   20,    7,   39,   39,   36,   20,

			   18,   36,   17,   27,   26,   35, yyDummy>>)
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
			-- Stack for semantic values of type DT_COMPLEX_OBJECT_NODE

	yyvsc13: INTEGER
			-- Capacity of semantic value stack `yyvs13'

	yyvsp13: INTEGER
			-- Top of semantic value stack `yyvs13'

	yyspecial_routines13: KL_SPECIAL_ROUTINES [DT_COMPLEX_OBJECT]
			-- Routines that ought to be in SPECIAL [DT_COMPLEX_OBJECT_NODE]

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

	yyFinal: INTEGER = 393
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 44
			-- Number of tokens

	yyLast: INTEGER = 505
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 289
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER = 106
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

	output: detachable DT_COMPLEX_OBJECT
			-- parsed structure

feature {NONE} -- Parse Tree

	complex_object_nodes: ARRAYED_STACK [DT_COMPLEX_OBJECT]
	complex_object_node: DT_COMPLEX_OBJECT

	attr_nodes: ARRAYED_STACK [DT_ATTRIBUTE]
	attr_node: DT_ATTRIBUTE

	obj_key: STRING
			-- qualifier of last rel name; use for next object creation

	time_vc: TIME_VALIDITY_CHECKER
	date_vc: DATE_VALIDITY_CHECKER

feature {NONE} -- Implementation

	indent: STRING

end
