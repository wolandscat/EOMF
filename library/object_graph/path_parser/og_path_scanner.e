note
	component:   "Eiffel Object Modelling Framework"
	description: "Scanner for Object Graph PathS"
	keywords:    "OG_PATH scanner"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class OG_PATH_SCANNER

inherit
	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton,
			output as print_out
		end

	OG_PATH_TOKENS
		export
			{NONE} all
		end

	UT_CHARACTER_CODES
		export
			{NONE} all
		end

	KL_IMPORTED_INTEGER_ROUTINES
	KL_IMPORTED_STRING_ROUTINES
	KL_SHARED_PLATFORM
	KL_SHARED_EXCEPTIONS
	KL_SHARED_ARGUMENTS

create
	make

feature -- Status report

	valid_start_condition (sc: INTEGER): BOOLEAN
			-- Is `sc' a valid start condition?
		do
			Result := (INITIAL <= sc and sc <= IN_STR)
		end

feature {NONE} -- Implementation

	yy_build_tables
			-- Build scanner tables.
		do
			yy_nxt := yy_nxt_template
			yy_chk := yy_chk_template
			yy_base := yy_base_template
			yy_def := yy_def_template
			yy_ec := yy_ec_template
			yy_meta := yy_meta_template
			yy_accept := yy_accept_template
		end

	yy_execute_action (yy_act: INTEGER)
			-- Execute semantic action.
		do
			inspect yy_act
when 1 then
--|#line 57 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 57")
end
last_token := Dot_code
when 2 then
--|#line 58 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 58")
end
last_token := Slash_code
when 3 then
--|#line 60 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 60")
end
last_token := Left_bracket_code
when 4 then
--|#line 61 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 61")
end
last_token := Right_bracket_code
when 5 then
--|#line 63 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 63")
end
last_token := Left_parenthesis_code
when 6 then
--|#line 64 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 64")
end
last_token := Right_parenthesis_code
when 7 then
--|#line 66 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 66")
end
last_token := SYM_MOVABLE_LEADER
when 8 then
--|#line 69 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 69")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
when 9 then
--|#line 75 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 75")
end

					last_token := V_ANY_PREDICATE
					last_string_value := text_substring (2, text_count - 1)
			
when 10 then
--|#line 81 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 81")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
when 11 then
--|#line 87 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 87")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
when 12 then
--|#line 92 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 92")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
when 13 then
--|#line 100 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 100")
end
in_buffer.append_character ('\')
when 14 then
--|#line 102 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 102")
end
in_buffer.append_character ('"')
when 15 then
--|#line 104 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 104")
end

				in_buffer.append_string (text)
	
when 16 then
--|#line 108 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 108")
end
in_buffer.append_string (text)
when 17 then
--|#line 110 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 110")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
when 18 then
--|#line 115 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 115")
end
						-- match final end of string
				last_token := V_STRING

				if text_count > 1 then
					in_buffer.append_string (text_substring (1, text_count - 1))
				end

				create str_.make (in_buffer.count)
				str_.append_string (in_buffer)
				in_buffer.wipe_out
				last_string_value := str_
				set_start_condition (INITIAL)
			
when 19 then
--|#line 128 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 128")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
when 20 then
--|#line 138 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 138")
end
;
when 21 then
--|#line 0 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 0")
end
default_action
			else
				last_token := yyError_token
				fatal_error ("fatal scanner internal error: no action found")
			end
		end

	yy_execute_eof_action (yy_sc: INTEGER)
			-- Execute EOF semantic action.
		do
			inspect yy_sc
when 0 then
--|#line 137 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 137")
end
terminate
when 1 then
--|#line 130 "og_path_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'og_path_scanner.l' at line 130")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
			else
				terminate
			end
		end

feature {NONE} -- Table templates

	yy_nxt_template: SPECIAL [INTEGER]
			-- Template for `yy_nxt'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 310)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			    0,   33,    7,    8,    9,   10,   32,   11,   12,   25,
			   13,   25,   14,   41,   15,    7,    8,    9,   10,   29,
			   11,   12,   32,   13,   29,   14,   30,   15,   17,   18,
			   30,   30,   34,   31,   26,   31,   37,   19,   32,   32,
			   35,   33,   32,   32,   20,   21,   22,   23,   24,   17,
			   18,   39,   39,   37,   27,   30,   39,   39,   19,   30,
			   30,   28,   26,   50,   28,   20,   21,   22,   23,   24,
			   32,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   36,   36,   36,   32,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   38,   38,   38,

			   32,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   40,   40,   40,   29,   29,   50,   29,   50,
			   50,   42,   29,   29,   32,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   43,
			   44,   45,   46,   47,   32,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   36,   36,   36,   32,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   36,   36,   36,   32,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   48,   48,   48,   32,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   50,   49,   49,   49,   32,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   36,   36,   36,   32,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   38,   38,   38,   32,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   40,   40,   40,   32,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   36,   36,   36,   32,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   36,   36,   36,    6,
			    6,    6,    6,   16,   16,   16,   16,    5,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,

			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50, yy_Dummy>>,
			1, 111, 200)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 310)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,   33,    1,    1,    1,    1,   31,    1,    1,   53,
			    1,   53,    1,   28,    1,    2,    2,    2,    2,   13,
			    2,    2,   21,    2,   13,    2,   15,    2,    3,    3,
			   15,   15,   19,   55,   25,   55,   21,    3,   23,   44,
			   19,   17,   16,   46,    3,    3,    3,    3,    3,    4,
			    4,   23,   23,   44,   12,   30,   46,   46,    4,   30,
			   30,   54,    8,    5,   54,    4,    4,    4,    4,    4,
			   20,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,   20,   20,   20,   22,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,   22,   22,   22,

			   24,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,   24,   24,   24,   29,   29,    0,   29,    0,
			    0,   29,   29,   29,   36,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   36,
			   36,   36,   36,   36,   37,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,   37,   37,   37,   38,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,   38,   38,   38,   39,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,   39,   39,   39,   40,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0, yy_Dummy>>,
			1, 200, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,   40,   40,   40,   43,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,   43,   43,   43,   45,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,   45,   45,   45,   47,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,   47,   47,   47,   48,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,   48,   48,   48,   49,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,   49,   49,   49,   51,
			   51,   51,   51,   52,   52,   52,   52,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,

			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50, yy_Dummy>>,
			1, 111, 200)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,   13,   26,   47,   63,  287,  287,   59,  287,
			  287,  287,   46,   10,  287,   17,   39,   40,  287,   29,
			   67,   19,   82,   35,   97,   31,  287,  287,    1,  109,
			   46,    3,  287,    0,  287,  287,  121,  141,  156,  171,
			  186,  287,  287,  201,   36,  216,   40,  231,  246,  261,
			  287,  278,  282,    7,   60,   31, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,   51,   51,   52,   52,   50,   50,   50,   53,   50,
			   50,   50,   50,   54,   50,   50,   55,   50,   50,   50,
			   55,   55,   55,   55,   55,   53,   50,   50,   54,   54,
			   50,   55,   50,   50,   50,   50,   55,   55,   55,   55,
			   55,   50,   50,   55,   55,   55,   55,   55,   55,   55,
			    0,   50,   50,   50,   50,   50, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 257)
			yy_ec_template_1 (an_array)
			an_array.area.fill_with (9, 65, 90)
			yy_ec_template_2 (an_array)
			an_array.area.fill_with (14, 97, 122)
			yy_ec_template_3 (an_array)
			an_array.area.fill_with (17, 160, 191)
			an_array.area.fill_with (23, 192, 193)
			an_array.area.fill_with (18, 194, 223)
			yy_ec_template_4 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_ec_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    0,   23,   23,   23,   23,   23,   23,   23,   23,    1,
			    2,   23,   23,    1,   23,   23,   23,   23,   23,   23,
			   23,   23,   23,   23,   23,   23,   23,   23,   23,   23,
			   23,   23,    1,   23,    3,   23,   23,   23,   23,   23,
			    4,    5,   23,   23,   23,    6,    7,    8,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,   23,   23,
			   23,   23,   23,   23,   23, yy_Dummy>>,
			1, 65, 0)
		end

	yy_ec_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			   10,   11,   12,   23,   13,   23, yy_Dummy>>,
			1, 6, 91)
		end

	yy_ec_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			   23,   23,   23,   23,   23,   15,   15,   15,   15,   15,
			   15,   15,   15,   15,   15,   15,   15,   15,   15,   15,
			   15,   16,   16,   16,   16,   16,   16,   16,   16,   16,
			   16,   16,   16,   16,   16,   16,   16, yy_Dummy>>,
			1, 37, 123)
		end

	yy_ec_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			   19,   20,   20,   20,   20,   20,   20,   20,   20,   20,
			   20,   20,   20,   20,   20,   20,   21,   22,   22,   22,
			   22,   22,   22,   22,   23,   23,   23,   23,   23,   23,
			   23,   23,   23,   23, yy_Dummy>>,
			1, 34, 224)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    4,    1,    4,    4,    4,    4,    4,    4,    4,
			    2,    3,    2,    4,    4,    4,    4,    4,    4,    4,
			    4,    4,    4,    4, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,   22,   20,   21,   12,    5,
			    6,    1,    2,    3,    4,   10,   16,   17,   18,   19,
			   16,   16,   16,   16,   16,   12,   11,    7,    0,    0,
			   10,   16,   18,   17,   14,   13,   15,   16,   16,   16,
			   16,    9,    8,   16,   16,   16,   16,   16,   16,   16,
			    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 287
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 50
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 51
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 23
			-- Equivalence code for NULL character

	yyMax_symbol_equiv_class: INTEGER = 256
			-- All symbols greater than this symbol will have
			-- the same equivalence class as this symbol

	yyReject_used: BOOLEAN = false
			-- Is `reject' called?

	yyVariable_trail_context: BOOLEAN = false
			-- Is there a regular expression with
			-- both leading and trailing parts having
			-- variable length?

	yyReject_or_variable_trail_context: BOOLEAN = false
			-- Is `reject' called or is there a
			-- regular expression with both leading
			-- and trailing parts having variable length?

	yyNb_rules: INTEGER = 21
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 22
			-- End of buffer rule code

	yyLine_used: BOOLEAN = false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN = false
			-- Is `position' used?

	INITIAL: INTEGER = 0
	IN_STR: INTEGER = 1
			-- Start condition codes

feature -- User-defined features



feature {NONE} -- Local variables

	i_, nb_: INTEGER
	char_: CHARACTER
	str_: STRING
	code_: INTEGER

feature {NONE} -- Initialization

	make
			-- Create a new scanner.
		do
			make_compressed_scanner_skeleton
			create in_buffer.make (Init_buffer_size)
			in_lineno := 1
			create str_.make_empty
			create last_string_value.make_empty
		end

feature -- Initialization

	reset
			-- Reset scanner before scanning next input.
		do
			reset_compressed_scanner_skeleton
			in_lineno := 1
			in_buffer.wipe_out
		end

feature -- Access

	in_buffer: STRING
			-- Buffer for lexical tokens

	in_lineno: INTEGER
			-- Current line number

	is_operator: BOOLEAN
			-- Parsing an operator declaration?

feature {NONE} -- Constants

	Init_buffer_size: INTEGER = 256
				-- Initial size for `in_buffer'

invariant
	in_buffer_not_void: in_buffer /= Void

end
