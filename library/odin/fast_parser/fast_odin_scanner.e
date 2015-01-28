note
	component:   "Eiffel Object Modelling Framework"
	description: "Fast non-validating scanner for ODIN syntax texts"
	keywords:    "Fast, non-validating, scanner, ODIN"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class FAST_ODIN_SCANNER

inherit
	YY_FULL_SCANNER_SKELETON
		rename
			make as make_scanner_skeleton,
			reset as reset_scanner_skeleton,
			output as print_out
		end

	FAST_ODIN_TOKENS
		export
			{NONE} all
		end

	UT_CHARACTER_CODES
		export
			{NONE} all
		end

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
			yy_accept := yy_accept_template
		end

	yy_execute_action (yy_act: INTEGER)
			-- Execute semantic action.
		do
if yy_act <= 34 then
if yy_act <= 17 then
if yy_act <= 9 then
if yy_act <= 5 then
if yy_act <= 3 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 55 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 55")
end
-- Ignore separators
else
--|#line 56 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 56")
end
in_lineno := in_lineno + text_count
end
else
--|#line 61 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 61")
end
-- Ignore comments
end
else
if yy_act = 4 then
--|#line 62 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 62")
end
in_lineno := in_lineno + 1
else
--|#line 66 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 66")
end
last_token := Minus_code
end
end
else
if yy_act <= 7 then
if yy_act = 6 then
--|#line 67 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 67")
end
last_token := Plus_code
else
--|#line 68 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 68")
end
last_token := Star_code
end
else
if yy_act = 8 then
--|#line 69 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 69")
end
last_token := Slash_code
else
--|#line 70 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 70")
end
last_token := Caret_code
end
end
end
else
if yy_act <= 13 then
if yy_act <= 11 then
if yy_act = 10 then
--|#line 71 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 71")
end
last_token := Dot_code
else
--|#line 72 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 72")
end
last_token := Semicolon_code
end
else
if yy_act = 12 then
--|#line 73 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 73")
end
last_token := Comma_code
else
--|#line 74 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 74")
end
last_token := Colon_code
end
end
else
if yy_act <= 15 then
if yy_act = 14 then
--|#line 75 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 75")
end
last_token := Exclamation_code
else
--|#line 76 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 76")
end
last_token := Left_parenthesis_code
end
else
if yy_act = 16 then
--|#line 77 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 77")
end
last_token := Right_parenthesis_code
else
--|#line 78 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 78")
end
last_token := Dollar_code
end
end
end
end
else
if yy_act <= 26 then
if yy_act <= 22 then
if yy_act <= 20 then
if yy_act <= 19 then
if yy_act = 18 then
--|#line 79 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 79")
end
last_token := Question_mark_code
else
--|#line 81 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 81")
end

			if in_interval then
				in_interval := False
			elseif start_block_received then
				in_interval := True
				start_block_received := False
			end
			last_token := SYM_INTERVAL_DELIM
		
end
else
--|#line 91 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 91")
end
last_token := Left_bracket_code
end
else
if yy_act = 21 then
--|#line 92 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 92")
end
last_token := Right_bracket_code
else
--|#line 94 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 94")
end
last_token := SYM_EQ
end
end
else
if yy_act <= 24 then
if yy_act = 23 then
--|#line 96 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 96")
end
last_token := SYM_GE
else
--|#line 97 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 97")
end
last_token := SYM_LE
end
else
if yy_act = 25 then
--|#line 99 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 99")
end

			if in_interval then
				last_token := SYM_LT
				start_block_received := False
			else
				last_token := SYM_START_DBLOCK
				start_block_received := True
				block_depth := block_depth + 1
			end
		
else
--|#line 110 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 110")
end

			if in_interval then
				last_token := SYM_GT
			else
				last_token := SYM_END_DBLOCK
				block_depth := block_depth - 1
			end
		
end
end
end
else
if yy_act <= 30 then
if yy_act <= 28 then
if yy_act = 27 then
--|#line 119 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 119")
end
last_token := SYM_ELLIPSIS
else
--|#line 120 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 120")
end
last_token := SYM_LIST_CONTINUE
end
else
if yy_act = 29 then
--|#line 124 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 124")
end
last_token := SYM_TRUE
else
--|#line 126 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 126")
end
last_token := SYM_FALSE
end
end
else
if yy_act <= 32 then
if yy_act = 31 then
--|#line 129 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 129")
end

	last_token := V_URI
	last_string_value := text

else
--|#line 135 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 135")
end

					last_token := V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 33 then
--|#line 140 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 140")
end

					last_token := V_TERMINOLOGY_ID
					last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 147 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 147")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
end
end
end
end
else
if yy_act <= 51 then
if yy_act <= 43 then
if yy_act <= 39 then
if yy_act <= 37 then
if yy_act <= 36 then
if yy_act = 35 then
--|#line 148 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 148")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
--|#line 149 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 149")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
--|#line 156 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 156")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
else
if yy_act = 38 then
--|#line 157 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 157")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
--|#line 164 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 164")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
end
else
if yy_act <= 41 then
if yy_act = 40 then
--|#line 165 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 165")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
--|#line 175 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 175")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
else
if yy_act = 42 then
--|#line 176 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 176")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
--|#line 182 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 182")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
end
end
end
else
if yy_act <= 47 then
if yy_act <= 45 then
if yy_act = 44 then
--|#line 187 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 187")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
else
--|#line 192 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 192")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
end
else
if yy_act = 46 then
--|#line 200 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 200")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
else
--|#line 201 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 201")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
end
end
else
if yy_act <= 49 then
if yy_act = 48 then
--|#line 208 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 208")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
--|#line 209 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 209")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
else
if yy_act = 50 then
--|#line 216 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 216")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
else
--|#line 221 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 221")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
end
end
end
end
else
if yy_act <= 60 then
if yy_act <= 56 then
if yy_act <= 54 then
if yy_act <= 53 then
if yy_act = 52 then
--|#line 229 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 229")
end
in_buffer.append_character ('\')
else
--|#line 231 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 231")
end
in_buffer.append_character ('"')
end
else
--|#line 233 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 233")
end

				in_buffer.append_string (text)
	
end
else
if yy_act = 55 then
--|#line 237 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 237")
end
in_buffer.append_string (text)
else
--|#line 239 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 239")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
end
end
else
if yy_act <= 58 then
if yy_act = 57 then
--|#line 244 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 244")
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
			
else
--|#line 257 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 257")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
end
else
if yy_act = 59 then
--|#line 267 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 267")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
else
--|#line 269 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 269")
end
last_token := V_CHARACTER; last_character_value := '%N'
end
end
end
else
if yy_act <= 64 then
if yy_act <= 62 then
if yy_act = 61 then
--|#line 270 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 270")
end
last_token := V_CHARACTER; last_character_value := '%R'
else
--|#line 271 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 271")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
else
if yy_act = 63 then
--|#line 272 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 272")
end
last_token := V_CHARACTER; last_character_value := '%''
else
--|#line 273 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 273")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
else
if yy_act <= 66 then
if yy_act = 65 then
--|#line 275 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 275")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
--|#line 276 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 276")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 67 then
--|#line 280 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 280")
end
;
else
--|#line 0 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 0")
end
default_action
end
end
end
end
end
end
		end

	yy_execute_eof_action (yy_sc: INTEGER)
			-- Execute EOF semantic action.
		do
			inspect yy_sc
when 0 then
--|#line 279 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 279")
end
terminate
when 1 then
--|#line 259 "fast_odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'fast_odin_scanner.l' at line 259")
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
			create an_array.make_filled (0, 0, 53969)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			yy_nxt_template_3 (an_array)
			yy_nxt_template_4 (an_array)
			yy_nxt_template_5 (an_array)
			yy_nxt_template_6 (an_array)
			yy_nxt_template_7 (an_array)
			yy_nxt_template_8 (an_array)
			yy_nxt_template_9 (an_array)
			yy_nxt_template_10 (an_array)
			yy_nxt_template_11 (an_array)
			yy_nxt_template_12 (an_array)
			yy_nxt_template_13 (an_array)
			yy_nxt_template_14 (an_array)
			yy_nxt_template_15 (an_array)
			yy_nxt_template_16 (an_array)
			yy_nxt_template_17 (an_array)
			yy_nxt_template_18 (an_array)
			yy_nxt_template_19 (an_array)
			yy_nxt_template_20 (an_array)
			yy_nxt_template_21 (an_array)
			yy_nxt_template_22 (an_array)
			yy_nxt_template_23 (an_array)
			yy_nxt_template_24 (an_array)
			yy_nxt_template_25 (an_array)
			yy_nxt_template_26 (an_array)
			yy_nxt_template_27 (an_array)
			yy_nxt_template_28 (an_array)
			yy_nxt_template_29 (an_array)
			yy_nxt_template_30 (an_array)
			yy_nxt_template_31 (an_array)
			yy_nxt_template_32 (an_array)
			yy_nxt_template_33 (an_array)
			yy_nxt_template_34 (an_array)
			yy_nxt_template_35 (an_array)
			yy_nxt_template_36 (an_array)
			yy_nxt_template_37 (an_array)
			yy_nxt_template_38 (an_array)
			yy_nxt_template_39 (an_array)
			yy_nxt_template_40 (an_array)
			yy_nxt_template_41 (an_array)
			yy_nxt_template_42 (an_array)
			yy_nxt_template_43 (an_array)
			yy_nxt_template_44 (an_array)
			yy_nxt_template_45 (an_array)
			yy_nxt_template_46 (an_array)
			yy_nxt_template_47 (an_array)
			yy_nxt_template_48 (an_array)
			yy_nxt_template_49 (an_array)
			yy_nxt_template_50 (an_array)
			yy_nxt_template_51 (an_array)
			yy_nxt_template_52 (an_array)
			yy_nxt_template_53 (an_array)
			yy_nxt_template_54 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    5,    6,    6,
			    6,    6,    6,    6,    6,    6,    7,    8,    6,    6,
			    7,    6,    6,    6,    6,    6,    6,    6,    6,    6,
			    6,    6,    6,    6,    6,    6,    6,    6,    6,    7,
			    9,   10,    6,   11,    6,    6,   12,   13,   14,   15,

			   16,   17,   18,   19,   20,   21,   21,   21,   22,   22,
			   22,   22,   22,   22,   22,   23,   24,   25,   26,   27,
			   28,    6,   29,   29,   29,   29,   29,   30,   29,   29,
			   29,   29,   29,   29,   29,   29,   29,   31,   29,   29,
			   29,   32,   29,   29,   29,   29,   29,   29,   33,    6,
			   34,   35,    6,    6,   36,   36,   36,   36,   36,   37,
			   36,   36,   36,   36,   36,   36,   36,   36,   36,   36,
			   36,   36,   36,   38,   36,   36,   36,   36,   36,   36,
			    6,   39,    6,    6,    6,    6,    6,    6,    6,    6,
			    6,    6,    6,    6,    6,    6,    6,    6,    6,    6,

			    6,    6,    6,    6,    6,    6,    6,    6,    6,    6,
			    6,    6,    6,    6,    6,    6,    6,    6,    6,    6,
			    6,    6,    6,    6,    6,    6,    6,    6,    6,    6,
			    6,    6,    6,    6,    6,    6,    6,    6,    6,    6,
			    6,    6,    6,    6,    6,    6,    6,    6,    6,    6,
			    6,    6,    6,    6,    6,    6,    6,    6,    6,    6,
			    6,    6,    6,    6,    6,    6,    6,    6,    6,    6,
			    6,    6,    6,    6,    6,    6,    6,    6,    6,    6,
			    6,    6,    6,    6,    6,    6,    6,    6,    6,    6,
			    6,    6,    6,    6,    6,    6,    6,    6,    6,    6,

			    6,    6,    6,    6,    6,    6,    6,    6,    6,    6,
			    6,    6,    6,    6,    5,    6,    6,    6,    6,    6,
			    6,    6,    6,    7,    8,    6,    6,    7,    6,    6,
			    6,    6,    6,    6,    6,    6,    6,    6,    6,    6,
			    6,    6,    6,    6,    6,    6,    7,    9,   10,    6,
			   11,    6,    6,   12,   13,   14,   15,   16,   17,   18,
			   19,   20,   21,   21,   21,   22,   22,   22,   22,   22,
			   22,   22,   23,   24,   25,   26,   27,   28,    6,   29,
			   29,   29,   29,   29,   30,   29,   29,   29,   29,   29,
			   29,   29,   29,   29,   31,   29,   29,   29,   32,   29,

			   29,   29,   29,   29,   29,   33,    6,   34,   35,    6,
			    6,   36,   36,   36,   36,   36,   37,   36,   36,   36,
			   36,   36,   36,   36,   36,   36,   36,   36,   36,   36,
			   38,   36,   36,   36,   36,   36,   36,    6,   39,    6,
			    6,    6,    6,    6,    6,    6,    6,    6,    6,    6,
			    6,    6,    6,    6,    6,    6,    6,    6,    6,    6,
			    6,    6,    6,    6,    6,    6,    6,    6,    6,    6,
			    6,    6,    6,    6,    6,    6,    6,    6,    6,    6,
			    6,    6,    6,    6,    6,    6,    6,    6,    6,    6,
			    6,    6,    6,    6,    6,    6,    6,    6,    6,    6,

			    6,    6,    6,    6,    6,    6,    6,    6,    6,    6,
			    6,    6,    6,    6,    6,    6,    6,    6,    6,    6,
			    6,    6,    6,    6,    6,    6,    6,    6,    6,    6,
			    6,    6,    6,    6,    6,    6,    6,    6,    6,    6,
			    6,    6,    6,    6,    6,    6,    6,    6,    6,    6,
			    6,    6,    6,    6,    6,    6,    6,    6,    6,    6,
			    6,    6,    6,    6,    6,    6,    6,    6,    6,    6,
			    6,    5,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   41,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,

			   40,   40,   40,   40,   40,   42,   40,   40,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   43,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,

			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   40,   44,   44,   44,   44,   44,
			   44,   44,   44,   44,   44,   44,   44,   44,   44,   44,
			   44,   44,   44,   44,   44,   44,   44,   44,   44,   44,
			   44,   44,   44,   44,   44,   45,   46,   46,   46,   46, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   47,   48,   48,   48,   48,   48,   48,   48,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,    5,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   41,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   42,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,

			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   43,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,

			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   44,   44,   44,   44,   44,   44,   44,   44,
			   44,   44,   44,   44,   44,   44,   44,   44,   44,   44,
			   44,   44,   44,   44,   44,   44,   44,   44,   44,   44,
			   44,   44,   45,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   47,   48,
			   48,   48,   48,   48,   48,   48,   40,   40,   40,   40,
			   40,   40,   40,   40,   40,   -5,   -5,   -5,   -5,   -5,
			   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,

			   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,
			   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,
			   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,
			   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,
			   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,
			   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,
			   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,
			   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,
			   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,
			   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,

			   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,
			   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,
			   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,
			   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,
			   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,
			   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,
			   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,
			   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,
			   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,
			   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,

			   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,
			   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,
			   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,
			   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,   -5,
			   -5,   -5,    5,   -6,   -6,   -6,   -6,   -6,   -6,   -6,
			   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,
			   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,
			   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,
			   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,
			   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,

			   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,
			   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,
			   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,
			   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,
			   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,
			   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,
			   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,
			   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,
			   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,
			   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,

			   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,
			   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,
			   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,
			   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,
			   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,
			   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,
			   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,
			   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,
			   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,
			   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,   -6,    5,

			   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   49,   -7,
			   -7,   -7,   49,   -7,   -7,   -7,   -7,   -7,   -7,   -7,
			   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,
			   -7,   49,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,
			   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,
			   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,
			   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,
			   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,
			   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,
			   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,

			   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,
			   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,
			   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,
			   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,
			   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,
			   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,
			   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,
			   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,
			   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,
			   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,
			   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,
			   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,
			   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,
			   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,   -7,
			   -7,   -7,   -7,   -7,   -7,   -7,    5,   -8,   -8,   -8,
			   -8,   -8,   -8,   -8,   -8,   -8,   50,   -8,   -8,   -8,
			   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,
			   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,
			   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,

			   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,
			   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,
			   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,
			   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,
			   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,
			   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,
			   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,
			   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,
			   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,
			   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,

			   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,
			   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,
			   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,
			   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,
			   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,
			   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,
			   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,
			   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,
			   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,
			   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,

			   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,   -8,
			   -8,   -8,   -8,    5,   -9,   -9,   -9,   -9,   -9,   -9,
			   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,
			   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,
			   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,
			   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,
			   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,
			   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,
			   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,
			   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,

			   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,
			   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,
			   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,
			   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,
			   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,
			   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,
			   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,
			   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,
			   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,
			   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,

			   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,
			   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,
			   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,
			   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,
			   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,
			   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,
			   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,   -9,
			    5,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			  -10,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,

			   51,   51,   51,   51,   52,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,  -10,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,

			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,

			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,    5,  -11,  -11,
			  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,
			  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,
			  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,
			  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,
			  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,
			  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,
			  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,

			  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,
			  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,
			  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,
			  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,
			  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,
			  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,
			  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,
			  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,
			  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,
			  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11, yy_Dummy>>,
			1, 1000, 2000)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,
			  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,
			  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,
			  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,
			  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,
			  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,
			  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,
			  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,
			  -11,  -11,  -11,  -11,    5,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,  -12,   53,   53,   53,   53,   53,

			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   54,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   55,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,

			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,

			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,    5,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,
			  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,
			  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,
			  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,
			  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,
			  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,

			  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,
			  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,
			  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,
			  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,
			  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,
			  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,
			  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,
			  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,
			  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,
			  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,

			  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,
			  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,
			  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,
			  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,
			  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,
			  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,
			  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,
			  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,
			  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,
			  -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13,    5,  -14,

			  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,
			  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,
			  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,
			  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,
			  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,
			  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,
			  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,
			  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,
			  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,
			  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,

			  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,
			  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,
			  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,
			  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,
			  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,
			  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,
			  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,
			  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,
			  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,
			  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,

			  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,
			  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,
			  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,
			  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,
			  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,
			  -14,  -14,  -14,  -14,  -14,    5,  -15,  -15,  -15,  -15,
			  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,
			  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,
			  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,
			  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,

			  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,
			  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,
			  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,
			  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,
			  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,
			  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,
			  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,
			  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,
			  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,
			  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15, yy_Dummy>>,
			1, 1000, 3000)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,
			  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,
			  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,
			  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,
			  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,
			  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,
			  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,
			  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,
			  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,
			  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,

			  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,  -15,
			  -15,  -15,    5,  -16,  -16,  -16,  -16,  -16,  -16,  -16,
			  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,
			  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,
			  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,
			  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,
			  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,
			  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,
			  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,
			  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,

			  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,
			  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,
			  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,
			  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,
			  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,
			  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,
			  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,
			  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,
			  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,
			  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,

			  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,
			  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,
			  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,
			  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,
			  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,
			  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,
			  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,    5,
			  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,
			  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,
			  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,

			  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,
			  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,
			  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,
			  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,
			  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,
			  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,
			  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,
			  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,
			  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,
			  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,

			  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,
			  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,
			  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,
			  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,
			  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,
			  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,
			  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,
			  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,
			  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,
			  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,

			  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,
			  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,
			  -17,  -17,  -17,  -17,  -17,  -17,    5,  -18,  -18,  -18,
			  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,
			  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,
			  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,
			  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,
			  -18,   56,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,
			  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,
			  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,

			  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,
			  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,
			  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,
			  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,
			  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,
			  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,
			  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,
			  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,
			  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,
			  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,

			  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,
			  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,
			  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,
			  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,
			  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,
			  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,
			  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,
			  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,
			  -18,  -18,  -18,    5,  -19,  -19,  -19,  -19,  -19,  -19,
			  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,

			  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,
			  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,
			  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,   57,
			  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,
			  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,
			  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,
			  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,
			  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,
			  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,
			  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19, yy_Dummy>>,
			1, 1000, 4000)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,
			  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,
			  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,
			  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,
			  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,
			  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,
			  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,
			  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,
			  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,
			  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,

			  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,
			  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,
			  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,
			  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,  -19,
			    5,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,
			  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,
			  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,
			  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,
			  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,
			  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,

			  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,
			  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,
			  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,
			  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,
			  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,
			  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,
			  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,
			  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,
			  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,
			  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,

			  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,
			  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,
			  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,
			  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,
			  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,
			  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,
			  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,
			  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,
			  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,
			  -20,  -20,  -20,  -20,  -20,  -20,  -20,    5,  -21,  -21,

			  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,
			  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,
			  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,
			  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,
			  -21,  -21,  -21,   58,  -21,   59,   59,   59,   59,   59,
			   59,   59,   59,   59,   59,  -21,  -21,  -21,  -21,  -21,
			  -21,  -21,  -21,  -21,  -21,  -21,   60,  -21,  -21,  -21,
			  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,
			  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,
			  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,   60,  -21,

			  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,
			  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,
			  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,
			  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,
			  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,
			  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,
			  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,
			  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,
			  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,
			  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,

			  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,
			  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,
			  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,
			  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,
			  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,
			  -21,  -21,  -21,  -21,    5,  -22,  -22,  -22,  -22,  -22,
			  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,
			  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,
			  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,
			  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,

			   58,  -22,   61,   61,   61,   61,   61,   61,   61,   61,
			   61,   61,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,
			  -22,  -22,  -22,   60,  -22,  -22,  -22,  -22,  -22,  -22,
			  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,
			  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,
			  -22,  -22,  -22,  -22,  -22,   60,  -22,  -22,  -22,  -22,
			  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,
			  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,
			  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,
			  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,

			  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,
			  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,
			  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,
			  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,
			  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,
			  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,
			  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,
			  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,
			  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,
			  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,

			  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,
			  -22,    5,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,
			  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,
			  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,
			  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,
			  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,
			  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,
			  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,
			  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,
			  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23, yy_Dummy>>,
			1, 1000, 5000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,
			  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,
			  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,
			  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,
			  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,
			  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,
			  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,
			  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,
			  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,
			  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,

			  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,
			  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,
			  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,
			  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,
			  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,
			  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,
			  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,    5,  -24,
			  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,
			  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,
			  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,

			  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,
			  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,
			  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,
			  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,
			  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,
			  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,
			  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,
			  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,
			  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,
			  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,

			  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,
			  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,
			  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,
			  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,
			  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,
			  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,
			  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,
			  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,
			  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,
			  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,

			  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,
			  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,
			  -24,  -24,  -24,  -24,  -24,    5,  -25,  -25,  -25,  -25,
			  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,
			  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,
			  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,
			  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,
			  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,
			  -25,  -25,  -25,  -25,  -25,  -25,   62,  -25,  -25,  -25,
			  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,

			  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,
			  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,
			  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,
			  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,
			  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,
			  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,
			  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,
			  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,
			  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,
			  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,

			  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,
			  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,
			  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,
			  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,
			  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,
			  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,
			  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,
			  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,  -25,
			  -25,  -25,    5,  -26,  -26,  -26,  -26,  -26,  -26,  -26,
			  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,

			  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,
			  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,
			  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,
			  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,
			  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,
			  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,
			  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,
			  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,
			  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,
			  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,

			  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,
			  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,
			  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,
			  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,
			  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,
			  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,
			  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,
			  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,
			  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,
			  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,

			  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,
			  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,
			  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,
			  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,    5,
			  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,
			  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,
			  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,
			  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,
			  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,
			  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27, yy_Dummy>>,
			1, 1000, 6000)
		end

	yy_nxt_template_8 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			   63,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,
			  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,
			  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,
			  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,
			  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,
			  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,
			  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,
			  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,
			  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,
			  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,

			  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,
			  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,
			  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,
			  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,
			  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,
			  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,
			  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,
			  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,
			  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,
			  -27,  -27,  -27,  -27,  -27,  -27,    5,  -28,  -28,  -28,

			  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,
			  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,
			  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,
			  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,
			  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,
			  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,
			  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,
			  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,
			  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,
			  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,

			  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,
			  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,
			  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,
			  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,
			  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,
			  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,
			  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,
			  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,
			  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,
			  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,

			  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,
			  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,
			  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,
			  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,
			  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,
			  -28,  -28,  -28,    5,  -29,  -29,  -29,  -29,  -29,  -29,
			  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,
			  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,
			  -29,  -29,  -29,  -29,  -29,   64,  -29,  -29,  -29,  -29,
			  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,

			  -29,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,  -29,  -29,  -29,  -29,  -29,  -29,  -29,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,  -29,  -29,  -29,  -29,   65,  -29,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,  -29,  -29,  -29,  -29,
			  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,
			  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,

			  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,
			  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,
			  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,
			  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,
			  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,
			  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,
			  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,
			  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,
			  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,
			  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,

			  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,
			    5,  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,
			  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,
			  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,
			  -30,  -30,   64,  -30,  -30,  -30,  -30,  -30,  -30,  -30,
			  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,  -30,  -30,
			  -30,  -30,  -30,  -30,  -30,   66,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,

			   65,  -30,  -30,  -30,  -30,   65,  -30,   66,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,  -30,  -30,  -30,  -30,  -30,  -30,  -30,
			  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,
			  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,
			  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,
			  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,
			  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,
			  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,

			  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,
			  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,
			  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,
			  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,
			  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,
			  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,
			  -30,  -30,  -30,  -30,  -30,  -30,  -30,    5,  -31,  -31,
			  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,
			  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,
			  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,   64, yy_Dummy>>,
			1, 1000, 7000)
		end

	yy_nxt_template_9 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,
			  -31,  -31,  -31,  -31,  -31,   67,   67,   67,   67,   67,
			   67,   67,   67,   67,   67,  -31,  -31,  -31,  -31,  -31,
			  -31,  -31,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   68,   65,   65,   65,   65,   65,   65,  -31,  -31,
			  -31,  -31,   65,  -31,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,

			  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,
			  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,
			  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,
			  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,
			  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,
			  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,
			  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,
			  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,
			  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,
			  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,

			  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,
			  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,  -31,
			  -31,  -31,  -31,  -31,    5,  -32,  -32,  -32,  -32,  -32,
			  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,
			  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,
			  -32,  -32,  -32,  -32,  -32,  -32,   64,  -32,  -32,  -32,
			  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,
			  -32,  -32,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,  -32,  -32,  -32,  -32,  -32,  -32,  -32,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,

			   65,   65,   65,   65,   65,   65,   69,   65,   65,   65,
			   65,   65,   65,   65,   65,  -32,  -32,  -32,  -32,   65,
			  -32,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   69,   65,
			   65,   65,   65,   65,   65,   65,   65,  -32,  -32,  -32,
			  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,
			  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,
			  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,
			  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,
			  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,

			  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,
			  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,
			  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,
			  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,
			  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,
			  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,
			  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,
			  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,
			  -32,    5,  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,
			  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,

			  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,
			  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,
			  -33,   70,   70,  -33,  -33,  -33,   70,   70,  -33,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,  -33,
			  -33,  -33,  -33,  -33,  -33,  -33,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,  -33,  -33,  -33,  -33,   70,  -33,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,

			   70,   70,   70,   70,  -33,  -33,  -33,  -33,  -33,  -33,
			  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,
			  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,
			  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,
			  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,
			  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,
			  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,
			  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,
			  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,
			  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,

			  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,
			  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,
			  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,
			  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,    5,  -34,
			  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,
			  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,
			  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,
			  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,
			  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,
			  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,

			  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,
			  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,
			  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,
			  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,
			  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,
			  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,
			  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,
			  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,
			  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,
			  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,

			  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,
			  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,
			  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,
			  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,
			  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,
			  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,
			  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,
			  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,
			  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,
			  -34,  -34,  -34,  -34,  -34,    5,  -35,  -35,  -35,  -35, yy_Dummy>>,
			1, 1000, 8000)
		end

	yy_nxt_template_10 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,
			  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,
			  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,
			  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,
			  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,
			  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,
			  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,
			  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,
			  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,
			  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,

			  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,
			  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,
			  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,
			  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,
			  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,
			  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,
			  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,
			  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,
			  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,
			  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,

			  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,
			  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,
			  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,
			  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,
			  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,
			  -35,  -35,    5,  -36,  -36,  -36,  -36,  -36,  -36,  -36,
			  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,
			  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,
			  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,
			  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,

			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   72,  -36,  -36,  -36,  -36,  -36,  -36,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,  -36,  -36,  -36,  -36,   71,  -36,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,  -36,  -36,  -36,  -36,  -36,
			  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,
			  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,

			  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,
			  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,
			  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,
			  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,
			  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,
			  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,
			  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,
			  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,
			  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,
			  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,

			  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,    5,
			  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,
			  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,
			  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,
			  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,
			  -37,  -37,  -37,  -37,  -37,  -37,  -37,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   72,  -37,  -37,
			  -37,  -37,  -37,  -37,   74,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,

			  -37,  -37,  -37,  -37,   71,  -37,   75,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,
			  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,
			  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,
			  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,
			  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,
			  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,
			  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,

			  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,
			  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,
			  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,
			  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,
			  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,
			  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,
			  -37,  -37,  -37,  -37,  -37,  -37,    5,  -38,  -38,  -38,
			  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,
			  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,
			  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,

			  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,
			  -38,  -38,  -38,  -38,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   72,  -38,  -38,  -38,  -38,  -38,
			  -38,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   76,   71,
			   71,   71,   71,   71,   71,   71,   71,  -38,  -38,  -38,
			  -38,   71,  -38,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   77,   73,   73,   73,   73,   73,   73,   73,   73,  -38,
			  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,

			  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,
			  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,
			  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,
			  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,
			  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,
			  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,
			  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,
			  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,
			  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,
			  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38, yy_Dummy>>,
			1, 1000, 9000)
		end

	yy_nxt_template_11 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,
			  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,
			  -38,  -38,  -38,    5,  -39,  -39,  -39,  -39,  -39,  -39,
			  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,
			  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,
			  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,
			  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,
			  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,
			  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,
			  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,

			  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,
			  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,
			  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,
			  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,
			  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,
			  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,
			  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,
			  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,
			  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,
			  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,

			  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,
			  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,
			  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,
			  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,
			  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,
			  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,
			  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,
			  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39,
			    5,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			  -40,   78,   78,   78,   78,   78,   78,   78,   78,   78,

			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   79,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,  -40,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,

			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,

			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,    5,  -41,  -41,
			  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,
			  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,
			  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,
			  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,
			  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,
			  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,

			  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,
			  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,
			  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,
			  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,
			  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,
			  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,
			  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,
			  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,
			  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,
			  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,

			  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,
			  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,
			  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,
			  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,
			  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,
			  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,
			  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,
			  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,
			  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41,
			  -41,  -41,  -41,  -41,    5,  -42,  -42,  -42,  -42,  -42,

			  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,
			  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,
			  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,
			  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,
			  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,
			  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,
			  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,
			  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,
			  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,
			  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,

			  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,
			  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,
			  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,
			  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,
			  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,
			  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,
			  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,
			  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,
			  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,
			  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42, yy_Dummy>>,
			1, 1000, 10000)
		end

	yy_nxt_template_12 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,
			  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,
			  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,
			  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,
			  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,
			  -42,    5,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,
			  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,
			  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,
			  -43,  -43,  -43,  -43,  -43,   80,  -43,  -43,  -43,  -43,
			  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,

			  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,
			  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,
			  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,
			  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,
			  -43,  -43,  -43,   81,  -43,  -43,  -43,  -43,  -43,  -43,
			  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,
			  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,
			  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,
			  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,
			  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,

			  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,
			  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,
			  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,
			  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,
			  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,
			  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,
			  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,
			  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,
			  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,
			  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,

			  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,    5,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,  -44,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   79,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,

			  -44,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,

			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,    5,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,  -45,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   79,

			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,  -45,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,

			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   83,   83,   83,   83,   83,
			   83,   83,   83,   83,   83,   83,   83,   83,   83,   83,
			   83,   83,   83,   83,   83,   83,   83,   83,   83,   83,
			   83,   83,   83,   83,   83,   83,   83,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,

			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,    5,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,  -46,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   79,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,

			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,  -46,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84, yy_Dummy>>,
			1, 1000, 11000)
		end

	yy_nxt_template_13 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,    5,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,  -47,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,

			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   79,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,  -47,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,

			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,

			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,    5,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,  -48,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   79,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,

			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,  -48,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,

			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,    5,  -49,  -49,  -49,  -49,  -49,  -49,

			  -49,  -49,   49,  -49,  -49,  -49,   49,  -49,  -49,  -49,
			  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,
			  -49,  -49,  -49,  -49,  -49,   49,  -49,  -49,  -49,  -49,
			  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,
			  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,
			  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,
			  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,
			  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,
			  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,
			  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,

			  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,
			  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,
			  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,
			  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,
			  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,
			  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,
			  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,
			  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,
			  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,
			  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,

			  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,
			  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,
			  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,
			  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,
			  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,  -49,
			    5,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,
			   50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,
			  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,
			  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,
			  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,

			  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,
			  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,
			  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,
			  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,
			  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,
			  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,
			  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,
			  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,
			  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,
			  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50, yy_Dummy>>,
			1, 1000, 12000)
		end

	yy_nxt_template_14 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,
			  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,
			  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,
			  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,
			  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,
			  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,
			  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,
			  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,
			  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,
			  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,

			  -50,  -50,  -50,  -50,  -50,  -50,  -50,    5,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,  -51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   52,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,  -51,

			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,

			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,    5,  -52,  -52,  -52,  -52,  -52,
			  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,
			  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,
			  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,

			  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,
			  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,
			  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,
			  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,
			  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,
			  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,
			  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,
			  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,
			  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,
			  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,

			  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,
			  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,
			  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,
			  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,
			  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,
			  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,
			  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,
			  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,
			  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,
			  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,

			  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,
			  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,
			  -52,    5,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,  -53,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   88,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,

			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,

			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,    5,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,  -54,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,

			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87, yy_Dummy>>,
			1, 1000, 13000)
		end

	yy_nxt_template_15 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,

			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,    5,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,  -55,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   89,   87,   87,   87,   87,   87,
			   87,   87,   87,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   87,   87,   87,   87,   87,   87,   87,

			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   91,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   92,   87,   87,   87,   93,
			   87,   94,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,

			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,    5,   56,   56,   56,   56,   56,   56,   56,

			   56,   56,   95,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,

			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,

			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,    5,
			  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,
			  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,
			  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,
			  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,
			  -57,  -57,  -57,  -57,  -57,   96,  -57,  -57,  -57,  -57,

			  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,
			  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,
			  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,
			  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,
			  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,
			  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,
			  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,
			  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,
			  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,
			  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,

			  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,
			  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,
			  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,
			  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,
			  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,
			  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,
			  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,
			  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,
			  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,
			  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,

			  -57,  -57,  -57,  -57,  -57,  -57,    5,  -58,  -58,  -58,
			  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,
			  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,
			  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,
			  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,
			  -58,  -58,  -58,  -58,   97,   97,   97,   97,   97,   97,
			   97,   97,   97,   97,  -58,  -58,  -58,  -58,  -58,  -58,
			  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,
			  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,
			  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58, yy_Dummy>>,
			1, 1000, 14000)
		end

	yy_nxt_template_16 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,
			  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,
			  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,
			  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,
			  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,
			  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,
			  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,
			  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,
			  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,
			  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,

			  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,
			  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,
			  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,
			  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,
			  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,
			  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,
			  -58,  -58,  -58,    5,  -59,  -59,  -59,  -59,  -59,  -59,
			  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,
			  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,
			  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,

			  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,   58,
			  -59,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   99,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,
			  -59,  -59,   60,  -59,  -59,  -59,  -59,  -59,  -59,  -59,
			  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,
			  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,
			  -59,  -59,  -59,  -59,   60,  -59,  -59,  -59,  -59,  -59,
			  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,
			  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,
			  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,

			  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,
			  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,
			  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,
			  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,
			  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,
			  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,
			  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,
			  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,
			  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,
			  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,

			  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,
			  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,
			    5,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,
			  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,
			  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,
			  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,
			  -60,  -60,  -60,  100,  -60,  100,  -60,  -60,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  -60,  -60,
			  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,
			  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,

			  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,
			  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,
			  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,
			  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,
			  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,
			  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,
			  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,
			  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,
			  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,
			  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,

			  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,
			  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,
			  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,
			  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,
			  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,
			  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,
			  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,
			  -60,  -60,  -60,  -60,  -60,  -60,  -60,    5,  -61,  -61,
			  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,
			  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,

			  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,
			  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,
			  -61,  -61,  -61,   58,  -61,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,  -61,  -61,  -61,  -61,  -61,
			  -61,  -61,  -61,  -61,  -61,  -61,   60,  -61,  -61,  -61,
			  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,
			  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,
			  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,   60,  -61,
			  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,
			  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,

			  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,
			  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,
			  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,
			  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,
			  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,
			  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,
			  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,
			  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,
			  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,
			  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,

			  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,
			  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,
			  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,
			  -61,  -61,  -61,  -61,    5,  -62,  -62,  -62,  -62,  -62,
			  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,
			  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,
			  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,
			  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,
			  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,
			  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62, yy_Dummy>>,
			1, 1000, 15000)
		end

	yy_nxt_template_17 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,
			  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,
			  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,
			  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,
			  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,
			  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,
			  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,
			  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,
			  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,
			  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,

			  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,
			  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,
			  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,
			  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,
			  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,
			  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,
			  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,
			  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,
			  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,
			  -62,    5,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,

			  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,
			  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,
			  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,
			  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,
			  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,
			  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,
			  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,
			  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,
			  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,
			  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,

			  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,
			  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,
			  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,
			  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,
			  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,
			  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,
			  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,
			  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,
			  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,
			  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,

			  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,
			  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,
			  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,
			  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,
			  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,    5,  -64,
			  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,
			  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,
			  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,
			  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,
			  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,

			  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  102,  -64,
			  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,
			  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,
			  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,
			  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,
			  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,
			  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,
			  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,
			  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,
			  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,

			  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,
			  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,
			  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,
			  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,
			  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,
			  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,
			  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,
			  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,
			  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,
			  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,

			  -64,  -64,  -64,  -64,  -64,    5,  -65,  -65,  -65,  -65,
			  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,
			  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,
			  -65,  -65,  -65,  -65,  -65,  -65,  -65,   64,  -65,  -65,
			  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,
			  -65,  -65,  -65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,  -65,  -65,  -65,  -65,

			   65,  -65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,  -65,  -65,
			  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,
			  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,
			  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,
			  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,
			  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,
			  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,
			  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,

			  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,
			  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,
			  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,
			  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,
			  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,
			  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,
			  -65,  -65,    5,  -66,  -66,  -66,  -66,  -66,  -66,  -66,
			  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,
			  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,
			  -66,  -66,  -66,  -66,   64,  -66,  -66,  -66,  -66,  -66, yy_Dummy>>,
			1, 1000, 16000)
		end

	yy_nxt_template_18 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			  -66,  -66,  -66,  -66,  -66,  -66,  -66,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,  103,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,  -66,  -66,  -66,  -66,   65,  -66,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			  103,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,  -66,  -66,  -66,  -66,  -66,
			  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,

			  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,
			  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,
			  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,
			  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,
			  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,
			  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,
			  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,
			  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,
			  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,
			  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,

			  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,
			  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,    5,
			  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,
			  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,
			  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,
			  -67,   64,  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,
			  -67,  -67,  -67,  -67,  -67,  -67,  -67,   67,   67,   67,
			   67,   67,   67,   67,   67,   67,   67,  -67,  -67,  -67,
			  -67,  -67,  -67,  -67,   65,   65,   65,  104,   65,   65,
			   65,   65,   65,   65,   65,   65,  105,   65,   65,   65,

			   65,   65,   65,   65,   65,   65,  106,   65,  107,   65,
			  -67,  -67,  -67,  -67,   65,  -67,   65,   65,   65,  104,
			   65,   65,   65,   65,   65,   65,   65,   65,  105,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,  106,   65,
			  107,   65,  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,
			  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,
			  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,
			  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,
			  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,
			  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,

			  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,
			  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,
			  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,
			  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,
			  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,
			  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,
			  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,
			  -67,  -67,  -67,  -67,  -67,  -67,    5,  -68,  -68,  -68,
			  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,
			  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,

			  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,   64,  -68,
			  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,
			  -68,  -68,  -68,  -68,  108,  108,  108,  108,  108,  108,
			  108,  108,  108,  108,  -68,  -68,  -68,  -68,  -68,  -68,
			  -68,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,  -68,  -68,  -68,
			  -68,   65,  -68,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,  -68,

			  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,
			  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,
			  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,
			  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,
			  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,
			  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,
			  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,
			  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,
			  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,
			  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,

			  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,
			  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,
			  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,
			  -68,  -68,  -68,    5,  -69,  -69,  -69,  -69,  -69,  -69,
			  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,
			  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,
			  -69,  -69,  -69,  -69,  -69,   64,  -69,  -69,  -69,  -69,
			  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,
			  -69,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,  -69,  -69,  -69,  -69,  -69,  -69,  -69,   65,   65,

			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,  109,   65,
			   65,   65,   65,   65,  -69,  -69,  -69,  -69,   65,  -69,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			  109,   65,   65,   65,   65,   65,  -69,  -69,  -69,  -69,
			  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,
			  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,
			  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,
			  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,

			  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,
			  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,
			  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,
			  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,
			  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,
			  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,
			  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,
			  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,
			  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,
			    5,  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70, yy_Dummy>>,
			1, 1000, 17000)
		end

	yy_nxt_template_19 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,
			  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,
			  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,
			   70,   70,  -70,  -70,  -70,   70,   70,  -70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,  110,  -70,
			  -70,  -70,  -70,  -70,  -70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,  -70,  -70,  -70,  -70,   70,  -70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,

			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,
			  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,
			  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,
			  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,
			  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,
			  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,
			  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,
			  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,
			  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,

			  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,
			  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,
			  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,
			  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,
			  -70,  -70,  -70,  -70,  -70,  -70,  -70,    5,  -71,  -71,
			  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,
			  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,
			  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,
			  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,
			  -71,  -71,  -71,  -71,  -71,   71,   71,   71,   71,   71,

			   71,   71,   71,   71,   71,  -71,  -71,  -71,  -71,  -71,
			  -71,  -71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,  -71,  -71,
			  -71,  -71,   71,  -71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,
			  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,
			  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,

			  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,
			  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,
			  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,
			  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,
			  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,
			  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,
			  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,
			  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,
			  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,
			  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,

			  -71,  -71,  -71,  -71,    5,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,  -72,   72,  -72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,  -72,   72,  -72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,  -72,   72,  -72,   72,

			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,  -72,  -72,  -72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,

			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,    5,  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,
			  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,
			  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,
			  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,

			  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   72,
			  -73,  -73,  -73,  -73,  -73,  -73,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,  -73,  -73,  -73,  -73,   71,  -73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,  -73,  -73,  -73,  -73,  -73,  -73,
			  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,

			  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,
			  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,
			  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,
			  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,
			  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,
			  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,
			  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,
			  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,
			  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,
			  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73, yy_Dummy>>,
			1, 1000, 18000)
		end

	yy_nxt_template_20 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,
			  -73,  -73,  -73,  -73,  -73,  -73,  -73,  -73,    5,  -74,
			  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,
			  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,
			  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,
			  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,
			  -74,  -74,  -74,  -74,  -74,  -74,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,  -74,  -74,  -74,  -74,
			  -74,  -74,  -74,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,  111,   71,   71,   71,   71,   71,

			   71,   71,   71,   71,   71,   71,   71,   71,   71,  -74,
			  -74,  -74,  -74,   71,  -74,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,  111,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,
			  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,
			  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,
			  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,
			  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,
			  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,

			  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,
			  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,
			  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,
			  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,
			  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,
			  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,
			  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,  -74,
			  -74,  -74,  -74,  -74,  -74,    5,  -75,  -75,  -75,  -75,
			  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,
			  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,

			  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,
			  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,
			  -75,  -75,  -75,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   72,  -75,  -75,  -75,  -75,  -75,  -75,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,  111,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,  -75,  -75,  -75,  -75,
			   71,  -75,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,  112,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,  -75,  -75,

			  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,
			  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,
			  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,
			  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,
			  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,
			  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,
			  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,
			  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,
			  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,
			  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,

			  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,
			  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,
			  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,  -75,
			  -75,  -75,    5,  -76,  -76,  -76,  -76,  -76,  -76,  -76,
			  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,
			  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,
			  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,
			  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			  -76,  -76,  -76,  -76,  -76,  -76,  -76,   71,   71,   71,

			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,  113,   71,   71,
			   71,   71,   71,  -76,  -76,  -76,  -76,   71,  -76,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,  113,
			   71,   71,   71,   71,   71,  -76,  -76,  -76,  -76,  -76,
			  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,
			  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,
			  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,
			  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,

			  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,
			  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,
			  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,
			  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,
			  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,
			  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,
			  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,
			  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,
			  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,  -76,    5,
			  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,

			  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,
			  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,
			  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,
			  -77,  -77,  -77,  -77,  -77,  -77,  -77,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   72,  -77,  -77,
			  -77,  -77,  -77,  -77,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,  113,   71,   71,   71,   71,   71,
			  -77,  -77,  -77,  -77,   71,  -77,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,

			   73,   73,   73,   73,   73,   73,  114,   73,   73,   73,
			   73,   73,  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,
			  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,
			  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,
			  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,
			  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,
			  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,
			  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,
			  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,
			  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77, yy_Dummy>>,
			1, 1000, 19000)
		end

	yy_nxt_template_21 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,
			  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,
			  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,
			  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,  -77,
			  -77,  -77,  -77,  -77,  -77,  -77,    5,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,  -78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   79,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,

			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,  -78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,

			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,

			   78,   78,   78,    5,  -79,  -79,  -79,  -79,  -79,  -79,
			  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,
			  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,
			  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,
			  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,
			  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,
			  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,
			  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,
			  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,
			  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,

			  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,
			  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,
			  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,
			  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,
			  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,
			  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,
			  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,
			  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,
			  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,
			  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,

			  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,
			  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,
			  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,
			  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,
			  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,
			  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,  -79,
			    5,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,
			  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,
			  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,
			  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,

			  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,
			  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,
			  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,
			  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,
			  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,
			  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,
			  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,
			  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,
			  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,
			  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,

			  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,
			  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,
			  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,
			  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,
			  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,
			  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,
			  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,
			  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,
			  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,
			  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,

			  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,  -80,
			  -80,  -80,  -80,  -80,  -80,  -80,  -80,    5,  -81,  -81,
			  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,
			  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,
			  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,
			  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,
			  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,
			  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,
			  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,
			  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,

			  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,
			  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,
			  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,
			  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,
			  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,
			  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,
			  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,
			  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,
			  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,
			  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81, yy_Dummy>>,
			1, 1000, 20000)
		end

	yy_nxt_template_22 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,
			  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,
			  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,
			  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,
			  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,
			  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,
			  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,  -81,
			  -81,  -81,  -81,  -81,    5,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,  -82,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,

			   78,   78,   78,   78,   78,   78,   78,   78,   79,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,  -82,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,

			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,  115,  115,
			  115,  115,  115,  115,  115,  115,  115,  115,  115,  115,
			  115,  115,  115,  115,  115,  115,  115,  115,  115,  115,
			  115,  115,  115,  115,  115,  115,  115,  115,  116,  117,

			  117,  117,  117,  117,  117,  117,  117,  117,  117,  117,
			  117,  117,  117,  117,  118,  119,  119,  119,  119,  119,
			  119,  119,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,    5,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,  -83,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   79,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,

			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,  -83,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,

			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,    5,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,  -84,   78,

			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   79,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			  -84,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,

			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,

			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,    5,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,  -85,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   79,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,

			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,  -85,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,  120,  120,  120,  120,  120,  120,  120,
			  120,  120,  120,  120,  120,  120,  120,  120,  120,  120,
			  120,  120,  120,  120,  120,  120,  120,  120,  120,  120, yy_Dummy>>,
			1, 1000, 21000)
		end

	yy_nxt_template_23 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  120,  120,  120,  120,  120,  120,  120,  120,  120,  120,
			  120,  120,  120,  120,  120,  120,  120,  120,  120,  120,
			  120,  120,  120,  120,  120,  120,  120,  120,  120,  120,
			  120,  120,  120,  120,  120,  120,  120,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,

			   78,   78,    5,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,  -86,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   79,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,  -86,   78,   78,   78,   78,   78,

			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			  121,  121,  121,  121,  121,  121,  121,  121,  121,  121,
			  121,  121,  121,  121,  121,  121,  121,  121,  121,  121,
			  121,  121,  121,  121,  121,  121,  121,  121,  121,  121,
			  121,  121,  121,  121,  121,  121,  121,  121,  121,  121,
			  121,  121,  121,  121,  121,  121,  121,  121,  121,  121,
			  121,  121,  121,  121,  121,  121,  121,  121,  121,  121,
			  121,  121,  121,  121,   78,   78,   78,   78,   78,   78,

			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,    5,
			  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,
			  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,
			  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,
			  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,

			  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,
			  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,
			  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,
			  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,
			  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,
			  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,
			  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,
			  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,
			  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,
			  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,

			  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,
			  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,
			  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,
			  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,
			  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,
			  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,
			  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,
			  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,
			  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,
			  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,

			  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,  -87,
			  -87,  -87,  -87,  -87,  -87,  -87,    5,  -88,  -88,  -88,
			  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,
			  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,
			  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,
			  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,
			  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,
			  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,
			  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,
			  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,

			  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,
			  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,
			  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,
			  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,
			  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,
			  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,
			  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,
			  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,
			  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,
			  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,

			  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,
			  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,
			  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,
			  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,
			  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,
			  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,
			  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,  -88,
			  -88,  -88,  -88,    5,  -89,  -89,  -89,  -89,  -89,  -89,
			  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,
			  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,

			  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,
			  -89,  -89,  122,  -89,  -89,  -89,  -89,  -89,  -89,  -89,
			  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,
			  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,
			  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,
			  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,
			  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,
			  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,
			  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,
			  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89, yy_Dummy>>,
			1, 1000, 22000)
		end

	yy_nxt_template_24 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,
			  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,
			  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,
			  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,
			  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,
			  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,
			  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,
			  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,
			  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,
			  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,

			  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,
			  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,
			  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,  -89,
			    5,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,
			  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,
			  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,
			  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,
			  -90,  -90,  -90,  -90,  -90,  -90,  -90,  123,  124,  124,
			  124,  124,  124,  124,  124,  124,  124,  124,  -90,  -90,
			  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,

			  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,
			  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,
			  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,
			  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,
			  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,
			  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,
			  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,
			  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,
			  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,
			  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,

			  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,
			  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,
			  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,
			  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,
			  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,
			  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,
			  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,
			  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,  -90,
			  -90,  -90,  -90,  -90,  -90,  -90,  -90,    5,  -91,  -91,
			  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,

			  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,
			  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,
			  -91,  -91,  -91,  -91,  -91,  -91,  125,  -91,  -91,  -91,
			  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,
			  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,
			  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,
			  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,
			  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,
			  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,
			  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,

			  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,
			  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,
			  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,
			  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,
			  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,
			  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,
			  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,
			  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,
			  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,
			  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,

			  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,
			  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,
			  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,
			  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,  -91,
			  -91,  -91,  -91,  -91,    5,  -92,  -92,  -92,  -92,  -92,
			  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,
			  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,
			  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,
			  -92,  -92,  -92,  126,  -92,  -92,  -92,  -92,  -92,  -92,
			  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,

			  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,
			  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,
			  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,
			  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,
			  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,
			  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,
			  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,
			  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,
			  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,
			  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,

			  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,
			  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,
			  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,
			  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,
			  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,
			  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,
			  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,
			  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,
			  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,
			  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,  -92,

			  -92,    5,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,
			  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,
			  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,
			  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,
			  127,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,
			  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,
			  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,
			  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,
			  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,
			  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93, yy_Dummy>>,
			1, 1000, 23000)
		end

	yy_nxt_template_25 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,
			  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,
			  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,
			  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,
			  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,
			  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,
			  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,
			  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,
			  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,
			  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,

			  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,
			  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,
			  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,
			  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,
			  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,
			  -93,  -93,  -93,  -93,  -93,  -93,  -93,  -93,    5,  -94,
			  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,
			  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,
			  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,
			  -94,  -94,  -94,  -94,  -94,  -94,  -94,  128,  -94,  -94,

			  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,
			  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,
			  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,
			  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,
			  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,
			  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,
			  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,
			  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,
			  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,
			  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,

			  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,
			  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,
			  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,
			  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,
			  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,
			  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,
			  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,
			  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,
			  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,
			  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,

			  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,  -94,
			  -94,  -94,  -94,  -94,  -94,    5,  -95,  -95,  -95,  -95,
			  -95,  -95,  -95,  -95,   95,  -95,  -95,  -95,   95,  -95,
			  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,
			  -95,  -95,  -95,  -95,  -95,  -95,  -95,   95,  -95,  -95,
			  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,
			  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,
			  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,
			  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,
			  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,

			  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,
			  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,
			  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,
			  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,
			  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,
			  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,
			  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,
			  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,
			  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,
			  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,

			  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,
			  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,
			  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,
			  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,
			  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,
			  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,
			  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,  -95,
			  -95,  -95,    5,  -96,  -96,  -96,  -96,  -96,  -96,  -96,
			  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,
			  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,

			  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,
			  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,
			  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,
			  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,
			  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,
			  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,
			  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,
			  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,
			  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,
			  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,

			  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,
			  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,
			  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,
			  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,
			  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,
			  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,
			  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,
			  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,
			  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,
			  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,

			  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,
			  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,
			  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,  -96,    5,
			  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,
			  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,
			  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,
			  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,
			  -97,  -97,  -97,  -97,  -97,  -97,  -97,   97,   97,   97,
			   97,   97,   97,   97,   97,   97,   97,  -97,  -97,  -97,
			  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  129,  -97, yy_Dummy>>,
			1, 1000, 24000)
		end

	yy_nxt_template_26 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,
			  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,
			  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,
			  129,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,
			  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,
			  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,
			  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,
			  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,
			  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,
			  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,

			  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,
			  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,
			  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,
			  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,
			  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,
			  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,
			  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,
			  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,  -97,
			  -97,  -97,  -97,  -97,  -97,  -97,    5,  -98,  -98,  -98,
			  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,

			  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,
			  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,
			  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,
			  -98,  -98,   58,  -98,  130,  130,  130,  130,  130,  130,
			  130,  130,  130,  130,  -98,  -98,  -98,  -98,  -98,  -98,
			  -98,  -98,  -98,  -98,  -98,   60,  -98,  -98,  -98,  -98,
			  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,
			  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,
			  -98,  -98,  -98,  -98,  -98,  -98,  -98,   60,  -98,  -98,
			  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,

			  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,
			  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,
			  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,
			  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,
			  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,
			  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,
			  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,
			  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,
			  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,
			  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,

			  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,
			  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,
			  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,
			  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,  -98,
			  -98,  -98,  -98,    5,  -99,  -99,  -99,  -99,  -99,  -99,
			  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,
			  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,
			  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,
			  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,
			  -99,  131,  131,  131,  131,  131,  131,  131,  -99,  -99,

			  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,
			  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,
			  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,
			  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,
			  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,
			  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,
			  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,
			  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,
			  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,
			  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,

			  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,
			  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,
			  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,
			  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,
			  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,
			  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,
			  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,
			  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,
			  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,
			  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,  -99,

			    5, -100, -100, -100, -100, -100, -100, -100, -100, -100,
			 -100, -100, -100, -100, -100, -100, -100, -100, -100, -100,
			 -100, -100, -100, -100, -100, -100, -100, -100, -100, -100,
			 -100, -100, -100, -100, -100, -100, -100, -100, -100, -100,
			 -100, -100, -100, -100, -100, -100, -100, -100,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101, -100, -100,
			 -100, -100, -100, -100, -100, -100, -100, -100, -100, -100,
			 -100, -100, -100, -100, -100, -100, -100, -100, -100, -100,
			 -100, -100, -100, -100, -100, -100, -100, -100, -100, -100,
			 -100, -100, -100, -100, -100, -100, -100, -100, -100, -100,

			 -100, -100, -100, -100, -100, -100, -100, -100, -100, -100,
			 -100, -100, -100, -100, -100, -100, -100, -100, -100, -100,
			 -100, -100, -100, -100, -100, -100, -100, -100, -100, -100,
			 -100, -100, -100, -100, -100, -100, -100, -100, -100, -100,
			 -100, -100, -100, -100, -100, -100, -100, -100, -100, -100,
			 -100, -100, -100, -100, -100, -100, -100, -100, -100, -100,
			 -100, -100, -100, -100, -100, -100, -100, -100, -100, -100,
			 -100, -100, -100, -100, -100, -100, -100, -100, -100, -100,
			 -100, -100, -100, -100, -100, -100, -100, -100, -100, -100,
			 -100, -100, -100, -100, -100, -100, -100, -100, -100, -100,

			 -100, -100, -100, -100, -100, -100, -100, -100, -100, -100,
			 -100, -100, -100, -100, -100, -100, -100, -100, -100, -100,
			 -100, -100, -100, -100, -100, -100, -100, -100, -100, -100,
			 -100, -100, -100, -100, -100, -100, -100, -100, -100, -100,
			 -100, -100, -100, -100, -100, -100, -100, -100, -100, -100,
			 -100, -100, -100, -100, -100, -100, -100,    5, -101, -101,
			 -101, -101, -101, -101, -101, -101, -101, -101, -101, -101,
			 -101, -101, -101, -101, -101, -101, -101, -101, -101, -101,
			 -101, -101, -101, -101, -101, -101, -101, -101, -101, -101,
			 -101, -101, -101, -101, -101, -101, -101, -101, -101, -101, yy_Dummy>>,
			1, 1000, 25000)
		end

	yy_nxt_template_27 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			 -101, -101, -101, -101, -101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101, -101, -101, -101, -101, -101,
			 -101, -101, -101, -101, -101, -101, -101, -101, -101, -101,
			 -101, -101, -101, -101, -101, -101, -101, -101, -101, -101,
			 -101, -101, -101, -101, -101, -101, -101, -101, -101, -101,
			 -101, -101, -101, -101, -101, -101, -101, -101, -101, -101,
			 -101, -101, -101, -101, -101, -101, -101, -101, -101, -101,
			 -101, -101, -101, -101, -101, -101, -101, -101, -101, -101,
			 -101, -101, -101, -101, -101, -101, -101, -101, -101, -101,
			 -101, -101, -101, -101, -101, -101, -101, -101, -101, -101,

			 -101, -101, -101, -101, -101, -101, -101, -101, -101, -101,
			 -101, -101, -101, -101, -101, -101, -101, -101, -101, -101,
			 -101, -101, -101, -101, -101, -101, -101, -101, -101, -101,
			 -101, -101, -101, -101, -101, -101, -101, -101, -101, -101,
			 -101, -101, -101, -101, -101, -101, -101, -101, -101, -101,
			 -101, -101, -101, -101, -101, -101, -101, -101, -101, -101,
			 -101, -101, -101, -101, -101, -101, -101, -101, -101, -101,
			 -101, -101, -101, -101, -101, -101, -101, -101, -101, -101,
			 -101, -101, -101, -101, -101, -101, -101, -101, -101, -101,
			 -101, -101, -101, -101, -101, -101, -101, -101, -101, -101,

			 -101, -101, -101, -101, -101, -101, -101, -101, -101, -101,
			 -101, -101, -101, -101,    5, -102, -102, -102, -102, -102,
			 -102, -102, -102, -102, -102, -102, -102, -102, -102, -102,
			 -102, -102, -102, -102, -102, -102, -102, -102, -102, -102,
			 -102, -102, -102, -102, -102, -102,  132, -102, -102, -102,
			 -102, -102, -102, -102, -102, -102, -102, -102,  132, -102,
			 -102, -102,  132,  132,  132,  132,  132,  132,  132,  132,
			  132,  132, -102, -102,  132, -102,  132, -102, -102,  132,
			  132,  132,  132,  132,  132,  132,  132,  132,  132,  132,
			  132,  132,  132,  132,  132,  132,  132,  132,  132,  132,

			  132,  132,  132,  132,  132, -102, -102, -102, -102,  132,
			 -102,  132,  132,  132,  132,  132,  132,  132,  132,  132,
			  132,  132,  132,  132,  132,  132,  132,  132,  132,  132,
			  132,  132,  132,  132,  132,  132,  132, -102, -102, -102,
			 -102, -102, -102, -102, -102, -102, -102, -102, -102, -102,
			 -102, -102, -102, -102, -102, -102, -102, -102, -102, -102,
			 -102, -102, -102, -102, -102, -102, -102, -102, -102, -102,
			 -102, -102, -102, -102, -102, -102, -102, -102, -102, -102,
			 -102, -102, -102, -102, -102, -102, -102, -102, -102, -102,
			 -102, -102, -102, -102, -102, -102, -102, -102, -102, -102,

			 -102, -102, -102, -102, -102, -102, -102, -102, -102, -102,
			 -102, -102, -102, -102, -102, -102, -102, -102, -102, -102,
			 -102, -102, -102, -102, -102, -102, -102, -102, -102, -102,
			 -102, -102, -102, -102, -102, -102, -102, -102, -102, -102,
			 -102, -102, -102, -102, -102, -102, -102, -102, -102, -102,
			 -102, -102, -102, -102, -102, -102, -102, -102, -102, -102,
			 -102, -102, -102, -102, -102, -102, -102, -102, -102, -102,
			 -102,    5, -103, -103, -103, -103, -103, -103, -103, -103,
			 -103, -103, -103, -103, -103, -103, -103, -103, -103, -103,
			 -103, -103, -103, -103, -103, -103, -103, -103, -103, -103,

			 -103, -103, -103,   64, -103, -103, -103, -103, -103, -103,
			 -103, -103, -103, -103, -103, -103, -103, -103, -103,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65, -103,
			 -103, -103, -103, -103, -103, -103,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,  133,   65,   65,   65,   65,   65,
			   65,   65, -103, -103, -103, -103,   65, -103,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,  133,   65,   65,   65,
			   65,   65,   65,   65, -103, -103, -103, -103, -103, -103,

			 -103, -103, -103, -103, -103, -103, -103, -103, -103, -103,
			 -103, -103, -103, -103, -103, -103, -103, -103, -103, -103,
			 -103, -103, -103, -103, -103, -103, -103, -103, -103, -103,
			 -103, -103, -103, -103, -103, -103, -103, -103, -103, -103,
			 -103, -103, -103, -103, -103, -103, -103, -103, -103, -103,
			 -103, -103, -103, -103, -103, -103, -103, -103, -103, -103,
			 -103, -103, -103, -103, -103, -103, -103, -103, -103, -103,
			 -103, -103, -103, -103, -103, -103, -103, -103, -103, -103,
			 -103, -103, -103, -103, -103, -103, -103, -103, -103, -103,
			 -103, -103, -103, -103, -103, -103, -103, -103, -103, -103,

			 -103, -103, -103, -103, -103, -103, -103, -103, -103, -103,
			 -103, -103, -103, -103, -103, -103, -103, -103, -103, -103,
			 -103, -103, -103, -103, -103, -103, -103, -103,    5, -104,
			 -104, -104, -104, -104, -104, -104, -104, -104, -104, -104,
			 -104, -104, -104, -104, -104, -104, -104, -104, -104, -104,
			 -104, -104, -104, -104, -104, -104, -104, -104, -104, -104,
			   64, -104, -104, -104, -104, -104, -104, -104, -104, -104,
			 -104, -104, -104, -104, -104, -104,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65, -104, -104, -104, -104,
			 -104, -104, -104,   65,   65,   65,   65,   65,   65,   65,

			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   68,   65,   65,   65,   65,   65,   65, -104,
			 -104, -104, -104,   65, -104,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65, -104, -104, -104, -104, -104, -104, -104, -104, -104,
			 -104, -104, -104, -104, -104, -104, -104, -104, -104, -104,
			 -104, -104, -104, -104, -104, -104, -104, -104, -104, -104,
			 -104, -104, -104, -104, -104, -104, -104, -104, -104, -104,
			 -104, -104, -104, -104, -104, -104, -104, -104, -104, -104,

			 -104, -104, -104, -104, -104, -104, -104, -104, -104, -104,
			 -104, -104, -104, -104, -104, -104, -104, -104, -104, -104,
			 -104, -104, -104, -104, -104, -104, -104, -104, -104, -104,
			 -104, -104, -104, -104, -104, -104, -104, -104, -104, -104,
			 -104, -104, -104, -104, -104, -104, -104, -104, -104, -104,
			 -104, -104, -104, -104, -104, -104, -104, -104, -104, -104,
			 -104, -104, -104, -104, -104, -104, -104, -104, -104, -104,
			 -104, -104, -104, -104, -104, -104, -104, -104, -104, -104,
			 -104, -104, -104, -104, -104,    5, -105, -105, -105, -105,
			 -105, -105, -105, -105, -105, -105, -105, -105, -105, -105, yy_Dummy>>,
			1, 1000, 26000)
		end

	yy_nxt_template_28 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			 -105, -105, -105, -105, -105, -105, -105, -105, -105, -105,
			 -105, -105, -105, -105, -105, -105, -105,   64, -105, -105,
			 -105, -105, -105, -105, -105, -105, -105, -105, -105, -105,
			 -105, -105, -105,  134,  134,  134,  134,  134,  134,  134,
			  134,  134,  134, -105, -105, -105, -105, -105, -105, -105,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   68,
			   65,   65,   65,   65,   65,   65, -105, -105, -105, -105,
			   65, -105,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,

			   65,   65,   65,   65,   65,   65,   65,   65, -105, -105,
			 -105, -105, -105, -105, -105, -105, -105, -105, -105, -105,
			 -105, -105, -105, -105, -105, -105, -105, -105, -105, -105,
			 -105, -105, -105, -105, -105, -105, -105, -105, -105, -105,
			 -105, -105, -105, -105, -105, -105, -105, -105, -105, -105,
			 -105, -105, -105, -105, -105, -105, -105, -105, -105, -105,
			 -105, -105, -105, -105, -105, -105, -105, -105, -105, -105,
			 -105, -105, -105, -105, -105, -105, -105, -105, -105, -105,
			 -105, -105, -105, -105, -105, -105, -105, -105, -105, -105,
			 -105, -105, -105, -105, -105, -105, -105, -105, -105, -105,

			 -105, -105, -105, -105, -105, -105, -105, -105, -105, -105,
			 -105, -105, -105, -105, -105, -105, -105, -105, -105, -105,
			 -105, -105, -105, -105, -105, -105, -105, -105, -105, -105,
			 -105, -105, -105, -105, -105, -105, -105, -105, -105, -105,
			 -105, -105,    5, -106, -106, -106, -106, -106, -106, -106,
			 -106, -106, -106, -106, -106, -106, -106, -106, -106, -106,
			 -106, -106, -106, -106, -106, -106, -106, -106, -106, -106,
			 -106, -106, -106, -106,   64, -106, -106, -106, -106, -106,
			 -106, -106, -106, -106, -106, -106, -106, -106, -106, -106,
			  135,  135,  135,  135,  135,  135,  135,  135,  135,  135,

			 -106, -106, -106, -106, -106, -106, -106,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   68,   65,   65,   65,
			   65,   65,   65, -106, -106, -106, -106,   65, -106,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65, -106, -106, -106, -106, -106,
			 -106, -106, -106, -106, -106, -106, -106, -106, -106, -106,
			 -106, -106, -106, -106, -106, -106, -106, -106, -106, -106,
			 -106, -106, -106, -106, -106, -106, -106, -106, -106, -106,

			 -106, -106, -106, -106, -106, -106, -106, -106, -106, -106,
			 -106, -106, -106, -106, -106, -106, -106, -106, -106, -106,
			 -106, -106, -106, -106, -106, -106, -106, -106, -106, -106,
			 -106, -106, -106, -106, -106, -106, -106, -106, -106, -106,
			 -106, -106, -106, -106, -106, -106, -106, -106, -106, -106,
			 -106, -106, -106, -106, -106, -106, -106, -106, -106, -106,
			 -106, -106, -106, -106, -106, -106, -106, -106, -106, -106,
			 -106, -106, -106, -106, -106, -106, -106, -106, -106, -106,
			 -106, -106, -106, -106, -106, -106, -106, -106, -106, -106,
			 -106, -106, -106, -106, -106, -106, -106, -106, -106,    5,

			 -107, -107, -107, -107, -107, -107, -107, -107, -107, -107,
			 -107, -107, -107, -107, -107, -107, -107, -107, -107, -107,
			 -107, -107, -107, -107, -107, -107, -107, -107, -107, -107,
			 -107,   64, -107, -107, -107, -107, -107, -107, -107, -107,
			 -107, -107, -107, -107, -107, -107, -107,  136,  136,  136,
			  136,  136,  136,  136,  136,  136,  136, -107, -107, -107,
			 -107, -107, -107, -107,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   68,   65,   65,   65,   65,   65,   65,
			 -107, -107, -107, -107,   65, -107,   65,   65,   65,   65,

			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65, -107, -107, -107, -107, -107, -107, -107, -107,
			 -107, -107, -107, -107, -107, -107, -107, -107, -107, -107,
			 -107, -107, -107, -107, -107, -107, -107, -107, -107, -107,
			 -107, -107, -107, -107, -107, -107, -107, -107, -107, -107,
			 -107, -107, -107, -107, -107, -107, -107, -107, -107, -107,
			 -107, -107, -107, -107, -107, -107, -107, -107, -107, -107,
			 -107, -107, -107, -107, -107, -107, -107, -107, -107, -107,
			 -107, -107, -107, -107, -107, -107, -107, -107, -107, -107,

			 -107, -107, -107, -107, -107, -107, -107, -107, -107, -107,
			 -107, -107, -107, -107, -107, -107, -107, -107, -107, -107,
			 -107, -107, -107, -107, -107, -107, -107, -107, -107, -107,
			 -107, -107, -107, -107, -107, -107, -107, -107, -107, -107,
			 -107, -107, -107, -107, -107, -107, -107, -107, -107, -107,
			 -107, -107, -107, -107, -107, -107,    5, -108, -108, -108,
			 -108, -108, -108, -108, -108, -108, -108, -108, -108, -108,
			 -108, -108, -108, -108, -108, -108, -108, -108, -108, -108,
			 -108, -108, -108, -108, -108, -108, -108, -108,   64, -108,
			 -108, -108, -108, -108, -108, -108, -108, -108, -108, -108,

			  137, -108,  137, -108,  108,  108,  108,  108,  108,  108,
			  108,  108,  108,  108, -108, -108, -108, -108, -108, -108,
			 -108,   65,   65,   65,   65,   65,   65,   65,  138,   65,
			   65,   65,   65,  139,   65,   65,   65,   65,   65,  140,
			   65,   65,   65,   65,   65,   65,   65, -108, -108, -108,
			 -108,   65, -108,   65,   65,   65,   65,   65,   65,   65,
			  138,   65,   65,   65,   65,  139,   65,   65,   65,   65,
			   65,  140,   65,   65,   65,   65,   65,   65,   65, -108,
			 -108, -108, -108, -108, -108, -108, -108, -108, -108, -108,
			 -108, -108, -108, -108, -108, -108, -108, -108, -108, -108,

			 -108, -108, -108, -108, -108, -108, -108, -108, -108, -108,
			 -108, -108, -108, -108, -108, -108, -108, -108, -108, -108,
			 -108, -108, -108, -108, -108, -108, -108, -108, -108, -108,
			 -108, -108, -108, -108, -108, -108, -108, -108, -108, -108,
			 -108, -108, -108, -108, -108, -108, -108, -108, -108, -108,
			 -108, -108, -108, -108, -108, -108, -108, -108, -108, -108,
			 -108, -108, -108, -108, -108, -108, -108, -108, -108, -108,
			 -108, -108, -108, -108, -108, -108, -108, -108, -108, -108,
			 -108, -108, -108, -108, -108, -108, -108, -108, -108, -108,
			 -108, -108, -108, -108, -108, -108, -108, -108, -108, -108, yy_Dummy>>,
			1, 1000, 27000)
		end

	yy_nxt_template_29 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			 -108, -108, -108, -108, -108, -108, -108, -108, -108, -108,
			 -108, -108, -108,    5, -109, -109, -109, -109, -109, -109,
			 -109, -109, -109, -109, -109, -109, -109, -109, -109, -109,
			 -109, -109, -109, -109, -109, -109, -109, -109, -109, -109,
			 -109, -109, -109, -109, -109,   64, -109, -109, -109, -109,
			 -109, -109, -109, -109, -109, -109, -109, -109, -109, -109,
			 -109,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65, -109, -109, -109, -109, -109, -109, -109,   65,   65,
			   65,   65,  141,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,

			   65,   65,   65,   65, -109, -109, -109, -109,   65, -109,
			   65,   65,   65,   65,  141,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65, -109, -109, -109, -109,
			 -109, -109, -109, -109, -109, -109, -109, -109, -109, -109,
			 -109, -109, -109, -109, -109, -109, -109, -109, -109, -109,
			 -109, -109, -109, -109, -109, -109, -109, -109, -109, -109,
			 -109, -109, -109, -109, -109, -109, -109, -109, -109, -109,
			 -109, -109, -109, -109, -109, -109, -109, -109, -109, -109,
			 -109, -109, -109, -109, -109, -109, -109, -109, -109, -109,

			 -109, -109, -109, -109, -109, -109, -109, -109, -109, -109,
			 -109, -109, -109, -109, -109, -109, -109, -109, -109, -109,
			 -109, -109, -109, -109, -109, -109, -109, -109, -109, -109,
			 -109, -109, -109, -109, -109, -109, -109, -109, -109, -109,
			 -109, -109, -109, -109, -109, -109, -109, -109, -109, -109,
			 -109, -109, -109, -109, -109, -109, -109, -109, -109, -109,
			 -109, -109, -109, -109, -109, -109, -109, -109, -109, -109,
			    5, -110, -110, -110, -110, -110, -110, -110, -110, -110,
			 -110, -110, -110, -110, -110, -110, -110, -110, -110, -110,
			 -110, -110, -110, -110, -110, -110, -110, -110, -110, -110,

			 -110, -110, -110, -110, -110, -110, -110, -110, -110, -110,
			 -110, -110, -110, -110, -110, -110, -110, -110, -110, -110,
			 -110, -110, -110, -110, -110, -110, -110, -110,  142, -110,
			 -110, -110, -110, -110, -110, -110, -110, -110, -110, -110,
			 -110, -110, -110, -110, -110, -110, -110, -110, -110, -110,
			 -110, -110, -110, -110, -110, -110, -110, -110, -110, -110,
			 -110, -110, -110, -110, -110, -110, -110, -110, -110, -110,
			 -110, -110, -110, -110, -110, -110, -110, -110, -110, -110,
			 -110, -110, -110, -110, -110, -110, -110, -110, -110, -110,
			 -110, -110, -110, -110, -110, -110, -110, -110, -110, -110,

			 -110, -110, -110, -110, -110, -110, -110, -110, -110, -110,
			 -110, -110, -110, -110, -110, -110, -110, -110, -110, -110,
			 -110, -110, -110, -110, -110, -110, -110, -110, -110, -110,
			 -110, -110, -110, -110, -110, -110, -110, -110, -110, -110,
			 -110, -110, -110, -110, -110, -110, -110, -110, -110, -110,
			 -110, -110, -110, -110, -110, -110, -110, -110, -110, -110,
			 -110, -110, -110, -110, -110, -110, -110, -110, -110, -110,
			 -110, -110, -110, -110, -110, -110, -110, -110, -110, -110,
			 -110, -110, -110, -110, -110, -110, -110, -110, -110, -110,
			 -110, -110, -110, -110, -110, -110, -110, -110, -110, -110,

			 -110, -110, -110, -110, -110, -110, -110, -110, -110, -110,
			 -110, -110, -110, -110, -110, -110, -110, -110, -110, -110,
			 -110, -110, -110, -110, -110, -110, -110,    5, -111, -111,
			 -111, -111, -111, -111, -111, -111, -111, -111, -111, -111,
			 -111, -111, -111, -111, -111, -111, -111, -111, -111, -111,
			 -111, -111, -111, -111, -111, -111, -111, -111, -111, -111,
			 -111, -111, -111, -111, -111, -111, -111, -111, -111, -111,
			 -111, -111, -111, -111, -111,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71, -111, -111, -111, -111, -111,
			 -111, -111,   71,   71,   71,   71,   71,   71,   71,   71,

			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			  143,   71,   71,   71,   71,   71,   71,   71, -111, -111,
			 -111, -111,   71, -111,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,  143,   71,   71,   71,   71,   71,   71,   71,
			 -111, -111, -111, -111, -111, -111, -111, -111, -111, -111,
			 -111, -111, -111, -111, -111, -111, -111, -111, -111, -111,
			 -111, -111, -111, -111, -111, -111, -111, -111, -111, -111,
			 -111, -111, -111, -111, -111, -111, -111, -111, -111, -111,
			 -111, -111, -111, -111, -111, -111, -111, -111, -111, -111,

			 -111, -111, -111, -111, -111, -111, -111, -111, -111, -111,
			 -111, -111, -111, -111, -111, -111, -111, -111, -111, -111,
			 -111, -111, -111, -111, -111, -111, -111, -111, -111, -111,
			 -111, -111, -111, -111, -111, -111, -111, -111, -111, -111,
			 -111, -111, -111, -111, -111, -111, -111, -111, -111, -111,
			 -111, -111, -111, -111, -111, -111, -111, -111, -111, -111,
			 -111, -111, -111, -111, -111, -111, -111, -111, -111, -111,
			 -111, -111, -111, -111, -111, -111, -111, -111, -111, -111,
			 -111, -111, -111, -111,    5, -112, -112, -112, -112, -112,
			 -112, -112, -112, -112, -112, -112, -112, -112, -112, -112,

			 -112, -112, -112, -112, -112, -112, -112, -112, -112, -112,
			 -112, -112, -112, -112, -112, -112, -112, -112, -112, -112,
			 -112, -112, -112, -112, -112, -112, -112, -112, -112, -112,
			 -112, -112,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   72, -112, -112, -112, -112, -112, -112,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,  143,   71,   71,
			   71,   71,   71,   71,   71, -112, -112, -112, -112,   71,
			 -112,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,  144,

			   73,   73,   73,   73,   73,   73,   73, -112, -112, -112,
			 -112, -112, -112, -112, -112, -112, -112, -112, -112, -112,
			 -112, -112, -112, -112, -112, -112, -112, -112, -112, -112,
			 -112, -112, -112, -112, -112, -112, -112, -112, -112, -112,
			 -112, -112, -112, -112, -112, -112, -112, -112, -112, -112,
			 -112, -112, -112, -112, -112, -112, -112, -112, -112, -112,
			 -112, -112, -112, -112, -112, -112, -112, -112, -112, -112,
			 -112, -112, -112, -112, -112, -112, -112, -112, -112, -112,
			 -112, -112, -112, -112, -112, -112, -112, -112, -112, -112,
			 -112, -112, -112, -112, -112, -112, -112, -112, -112, -112, yy_Dummy>>,
			1, 1000, 28000)
		end

	yy_nxt_template_30 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			 -112, -112, -112, -112, -112, -112, -112, -112, -112, -112,
			 -112, -112, -112, -112, -112, -112, -112, -112, -112, -112,
			 -112, -112, -112, -112, -112, -112, -112, -112, -112, -112,
			 -112, -112, -112, -112, -112, -112, -112, -112, -112, -112,
			 -112,    5, -113, -113, -113, -113, -113, -113, -113, -113,
			 -113, -113, -113, -113, -113, -113, -113, -113, -113, -113,
			 -113, -113, -113, -113, -113, -113, -113, -113, -113, -113,
			 -113, -113, -113, -113, -113, -113, -113, -113, -113, -113,
			 -113, -113, -113, -113, -113, -113, -113, -113, -113,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71, -113,

			 -113, -113, -113, -113, -113, -113,   71,   71,   71,   71,
			  145,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71, -113, -113, -113, -113,   71, -113,   71,   71,
			   71,   71,  145,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71, -113, -113, -113, -113, -113, -113,
			 -113, -113, -113, -113, -113, -113, -113, -113, -113, -113,
			 -113, -113, -113, -113, -113, -113, -113, -113, -113, -113,
			 -113, -113, -113, -113, -113, -113, -113, -113, -113, -113,

			 -113, -113, -113, -113, -113, -113, -113, -113, -113, -113,
			 -113, -113, -113, -113, -113, -113, -113, -113, -113, -113,
			 -113, -113, -113, -113, -113, -113, -113, -113, -113, -113,
			 -113, -113, -113, -113, -113, -113, -113, -113, -113, -113,
			 -113, -113, -113, -113, -113, -113, -113, -113, -113, -113,
			 -113, -113, -113, -113, -113, -113, -113, -113, -113, -113,
			 -113, -113, -113, -113, -113, -113, -113, -113, -113, -113,
			 -113, -113, -113, -113, -113, -113, -113, -113, -113, -113,
			 -113, -113, -113, -113, -113, -113, -113, -113, -113, -113,
			 -113, -113, -113, -113, -113, -113, -113, -113,    5, -114,

			 -114, -114, -114, -114, -114, -114, -114, -114, -114, -114,
			 -114, -114, -114, -114, -114, -114, -114, -114, -114, -114,
			 -114, -114, -114, -114, -114, -114, -114, -114, -114, -114,
			 -114, -114, -114, -114, -114, -114, -114, -114, -114, -114,
			 -114, -114, -114, -114, -114, -114,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   72, -114, -114, -114,
			 -114, -114, -114,   71,   71,   71,   71,  145,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71, -114,
			 -114, -114, -114,   71, -114,   73,   73,   73,   73,  146,

			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73, -114, -114, -114, -114, -114, -114, -114, -114, -114,
			 -114, -114, -114, -114, -114, -114, -114, -114, -114, -114,
			 -114, -114, -114, -114, -114, -114, -114, -114, -114, -114,
			 -114, -114, -114, -114, -114, -114, -114, -114, -114, -114,
			 -114, -114, -114, -114, -114, -114, -114, -114, -114, -114,
			 -114, -114, -114, -114, -114, -114, -114, -114, -114, -114,
			 -114, -114, -114, -114, -114, -114, -114, -114, -114, -114,
			 -114, -114, -114, -114, -114, -114, -114, -114, -114, -114,

			 -114, -114, -114, -114, -114, -114, -114, -114, -114, -114,
			 -114, -114, -114, -114, -114, -114, -114, -114, -114, -114,
			 -114, -114, -114, -114, -114, -114, -114, -114, -114, -114,
			 -114, -114, -114, -114, -114, -114, -114, -114, -114, -114,
			 -114, -114, -114, -114, -114, -114, -114, -114, -114, -114,
			 -114, -114, -114, -114, -114,    5,   78,   78,   78,   78,
			   78,   78,   78,   78,   78, -115,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   79,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,

			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78, -115,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,

			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,

			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,    5,   78,   78,   78,   78,   78,   78,   78,
			   78,   78, -116,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   79,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,

			   78,   78,   78,   78, -116,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   83,   83,   83,   83,   83,   83,   83,   83,
			   83,   83,   83,   83,   83,   83,   83,   83,   83,   83,
			   83,   83,   83,   83,   83,   83,   83,   83,   83,   83, yy_Dummy>>,
			1, 1000, 29000)
		end

	yy_nxt_template_31 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			   83,   83,   83,   83,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,    5,
			   78,   78,   78,   78,   78,   78,   78,   78,   78, -117,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,

			   78,   78,   78,   79,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78, -117,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   84,   84,   84,

			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,

			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,    5,   78,   78,   78,
			   78,   78,   78,   78,   78,   78, -118,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   79,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,

			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78, -118,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,

			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,    5,   78,   78,   78,   78,   78,   78,
			   78,   78,   78, -119,   78,   78,   78,   78,   78,   78,

			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   79,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78, -119,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,

			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,

			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			    5,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			 -120,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   79,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,

			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78, -120,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82, yy_Dummy>>,
			1, 1000, 30000)
		end

	yy_nxt_template_32 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,    5,   78,   78,

			   78,   78,   78,   78,   78,   78,   78, -121,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   79,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78, -121,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,

			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,

			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,    5, -122, -122, -122, -122, -122,
			 -122, -122, -122, -122, -122, -122, -122, -122, -122, -122,
			 -122, -122, -122, -122, -122, -122, -122, -122, -122, -122,
			 -122, -122, -122, -122, -122, -122, -122, -122, -122, -122,
			 -122, -122, -122, -122, -122, -122, -122, -122, -122, -122,

			 -122, -122, -122, -122, -122, -122, -122, -122, -122, -122,
			 -122, -122, -122, -122, -122, -122, -122, -122, -122, -122,
			 -122, -122, -122, -122, -122, -122, -122, -122, -122, -122,
			 -122, -122, -122, -122, -122, -122, -122, -122, -122, -122,
			 -122, -122, -122, -122, -122, -122, -122, -122, -122, -122,
			 -122, -122, -122, -122, -122, -122, -122, -122, -122, -122,
			 -122, -122, -122, -122, -122, -122, -122, -122, -122, -122,
			 -122, -122, -122, -122, -122, -122, -122, -122, -122, -122,
			 -122, -122, -122, -122, -122, -122, -122, -122, -122, -122,
			 -122, -122, -122, -122, -122, -122, -122, -122, -122, -122,

			 -122, -122, -122, -122, -122, -122, -122, -122, -122, -122,
			 -122, -122, -122, -122, -122, -122, -122, -122, -122, -122,
			 -122, -122, -122, -122, -122, -122, -122, -122, -122, -122,
			 -122, -122, -122, -122, -122, -122, -122, -122, -122, -122,
			 -122, -122, -122, -122, -122, -122, -122, -122, -122, -122,
			 -122, -122, -122, -122, -122, -122, -122, -122, -122, -122,
			 -122, -122, -122, -122, -122, -122, -122, -122, -122, -122,
			 -122, -122, -122, -122, -122, -122, -122, -122, -122, -122,
			 -122, -122, -122, -122, -122, -122, -122, -122, -122, -122,
			 -122, -122, -122, -122, -122, -122, -122, -122, -122, -122,

			 -122, -122, -122, -122, -122, -122, -122, -122, -122, -122,
			 -122,    5, -123, -123, -123, -123, -123, -123, -123, -123,
			 -123, -123, -123, -123, -123, -123, -123, -123, -123, -123,
			 -123, -123, -123, -123, -123, -123, -123, -123, -123, -123,
			 -123, -123, -123, -123, -123, -123, -123, -123, -123, -123,
			 -123, -123, -123, -123, -123, -123, -123, -123, -123, -123,
			 -123, -123, -123, -123, -123, -123, -123, -123, -123, -123,
			 -123, -123, -123, -123, -123, -123, -123, -123, -123, -123,
			 -123, -123, -123, -123, -123, -123, -123, -123, -123, -123,
			 -123, -123, -123, -123, -123, -123, -123, -123, -123, -123,

			 -123, -123, -123, -123, -123, -123, -123, -123, -123, -123,
			 -123, -123, -123, -123, -123, -123, -123, -123, -123, -123,
			 -123, -123, -123, -123, -123, -123, -123, -123, -123, -123,
			 -123, -123, -123, -123, -123, -123, -123, -123, -123, -123,
			 -123, -123, -123, -123, -123, -123, -123, -123, -123, -123,
			 -123, -123, -123, -123, -123, -123, -123, -123, -123, -123,
			 -123, -123, -123, -123, -123, -123, -123, -123, -123, -123,
			 -123, -123, -123, -123, -123, -123, -123, -123, -123, -123,
			 -123, -123, -123, -123, -123, -123, -123, -123, -123, -123,
			 -123, -123, -123, -123, -123, -123, -123, -123, -123, -123,

			 -123, -123, -123, -123, -123, -123, -123, -123, -123, -123,
			 -123, -123, -123, -123, -123, -123, -123, -123, -123, -123,
			 -123, -123, -123, -123, -123, -123, -123, -123, -123, -123,
			 -123, -123, -123, -123, -123, -123, -123, -123, -123, -123,
			 -123, -123, -123, -123, -123, -123, -123, -123, -123, -123,
			 -123, -123, -123, -123, -123, -123, -123, -123, -123, -123,
			 -123, -123, -123, -123, -123, -123, -123, -123,    5, -124,
			 -124, -124, -124, -124, -124, -124, -124, -124, -124, -124,
			 -124, -124, -124, -124, -124, -124, -124, -124, -124, -124,
			 -124, -124, -124, -124, -124, -124, -124, -124, -124, -124,

			 -124, -124, -124, -124, -124, -124, -124, -124, -124, -124,
			 -124, -124, -124, -124, -124,  123,  124,  124,  124,  124,
			  124,  124,  124,  124,  124,  124, -124, -124, -124, -124,
			 -124, -124, -124, -124, -124, -124, -124, -124, -124, -124,
			 -124, -124, -124, -124, -124, -124, -124, -124, -124, -124,
			 -124, -124, -124, -124, -124, -124, -124, -124, -124, -124,
			 -124, -124, -124, -124, -124, -124, -124, -124, -124, -124,
			 -124, -124, -124, -124, -124, -124, -124, -124, -124, -124,
			 -124, -124, -124, -124, -124, -124, -124, -124, -124, -124,
			 -124, -124, -124, -124, -124, -124, -124, -124, -124, -124, yy_Dummy>>,
			1, 1000, 31000)
		end

	yy_nxt_template_33 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			 -124, -124, -124, -124, -124, -124, -124, -124, -124, -124,
			 -124, -124, -124, -124, -124, -124, -124, -124, -124, -124,
			 -124, -124, -124, -124, -124, -124, -124, -124, -124, -124,
			 -124, -124, -124, -124, -124, -124, -124, -124, -124, -124,
			 -124, -124, -124, -124, -124, -124, -124, -124, -124, -124,
			 -124, -124, -124, -124, -124, -124, -124, -124, -124, -124,
			 -124, -124, -124, -124, -124, -124, -124, -124, -124, -124,
			 -124, -124, -124, -124, -124, -124, -124, -124, -124, -124,
			 -124, -124, -124, -124, -124, -124, -124, -124, -124, -124,
			 -124, -124, -124, -124, -124, -124, -124, -124, -124, -124,

			 -124, -124, -124, -124, -124, -124, -124, -124, -124, -124,
			 -124, -124, -124, -124, -124, -124, -124, -124, -124, -124,
			 -124, -124, -124, -124, -124,    5, -125, -125, -125, -125,
			 -125, -125, -125, -125, -125, -125, -125, -125, -125, -125,
			 -125, -125, -125, -125, -125, -125, -125, -125, -125, -125,
			 -125, -125, -125, -125, -125, -125, -125, -125, -125, -125,
			 -125, -125, -125, -125, -125, -125, -125, -125, -125, -125,
			 -125, -125, -125, -125, -125, -125, -125, -125, -125, -125,
			 -125, -125, -125, -125, -125, -125, -125, -125, -125, -125,
			 -125, -125, -125, -125, -125, -125, -125, -125, -125, -125,

			 -125, -125, -125, -125, -125, -125, -125, -125, -125, -125,
			 -125, -125, -125, -125, -125, -125, -125, -125, -125, -125,
			 -125, -125, -125, -125, -125, -125, -125, -125, -125, -125,
			 -125, -125, -125, -125, -125, -125, -125, -125, -125, -125,
			 -125, -125, -125, -125, -125, -125, -125, -125, -125, -125,
			 -125, -125, -125, -125, -125, -125, -125, -125, -125, -125,
			 -125, -125, -125, -125, -125, -125, -125, -125, -125, -125,
			 -125, -125, -125, -125, -125, -125, -125, -125, -125, -125,
			 -125, -125, -125, -125, -125, -125, -125, -125, -125, -125,
			 -125, -125, -125, -125, -125, -125, -125, -125, -125, -125,

			 -125, -125, -125, -125, -125, -125, -125, -125, -125, -125,
			 -125, -125, -125, -125, -125, -125, -125, -125, -125, -125,
			 -125, -125, -125, -125, -125, -125, -125, -125, -125, -125,
			 -125, -125, -125, -125, -125, -125, -125, -125, -125, -125,
			 -125, -125, -125, -125, -125, -125, -125, -125, -125, -125,
			 -125, -125, -125, -125, -125, -125, -125, -125, -125, -125,
			 -125, -125, -125, -125, -125, -125, -125, -125, -125, -125,
			 -125, -125, -125, -125, -125, -125, -125, -125, -125, -125,
			 -125, -125,    5, -126, -126, -126, -126, -126, -126, -126,
			 -126, -126, -126, -126, -126, -126, -126, -126, -126, -126,

			 -126, -126, -126, -126, -126, -126, -126, -126, -126, -126,
			 -126, -126, -126, -126, -126, -126, -126, -126, -126, -126,
			 -126, -126, -126, -126, -126, -126, -126, -126, -126, -126,
			 -126, -126, -126, -126, -126, -126, -126, -126, -126, -126,
			 -126, -126, -126, -126, -126, -126, -126, -126, -126, -126,
			 -126, -126, -126, -126, -126, -126, -126, -126, -126, -126,
			 -126, -126, -126, -126, -126, -126, -126, -126, -126, -126,
			 -126, -126, -126, -126, -126, -126, -126, -126, -126, -126,
			 -126, -126, -126, -126, -126, -126, -126, -126, -126, -126,
			 -126, -126, -126, -126, -126, -126, -126, -126, -126, -126,

			 -126, -126, -126, -126, -126, -126, -126, -126, -126, -126,
			 -126, -126, -126, -126, -126, -126, -126, -126, -126, -126,
			 -126, -126, -126, -126, -126, -126, -126, -126, -126, -126,
			 -126, -126, -126, -126, -126, -126, -126, -126, -126, -126,
			 -126, -126, -126, -126, -126, -126, -126, -126, -126, -126,
			 -126, -126, -126, -126, -126, -126, -126, -126, -126, -126,
			 -126, -126, -126, -126, -126, -126, -126, -126, -126, -126,
			 -126, -126, -126, -126, -126, -126, -126, -126, -126, -126,
			 -126, -126, -126, -126, -126, -126, -126, -126, -126, -126,
			 -126, -126, -126, -126, -126, -126, -126, -126, -126, -126,

			 -126, -126, -126, -126, -126, -126, -126, -126, -126, -126,
			 -126, -126, -126, -126, -126, -126, -126, -126, -126, -126,
			 -126, -126, -126, -126, -126, -126, -126, -126, -126, -126,
			 -126, -126, -126, -126, -126, -126, -126, -126, -126,    5,
			 -127, -127, -127, -127, -127, -127, -127, -127, -127, -127,
			 -127, -127, -127, -127, -127, -127, -127, -127, -127, -127,
			 -127, -127, -127, -127, -127, -127, -127, -127, -127, -127,
			 -127, -127, -127, -127, -127, -127, -127, -127, -127, -127,
			 -127, -127, -127, -127, -127, -127, -127, -127, -127, -127,
			 -127, -127, -127, -127, -127, -127, -127, -127, -127, -127,

			 -127, -127, -127, -127, -127, -127, -127, -127, -127, -127,
			 -127, -127, -127, -127, -127, -127, -127, -127, -127, -127,
			 -127, -127, -127, -127, -127, -127, -127, -127, -127, -127,
			 -127, -127, -127, -127, -127, -127, -127, -127, -127, -127,
			 -127, -127, -127, -127, -127, -127, -127, -127, -127, -127,
			 -127, -127, -127, -127, -127, -127, -127, -127, -127, -127,
			 -127, -127, -127, -127, -127, -127, -127, -127, -127, -127,
			 -127, -127, -127, -127, -127, -127, -127, -127, -127, -127,
			 -127, -127, -127, -127, -127, -127, -127, -127, -127, -127,
			 -127, -127, -127, -127, -127, -127, -127, -127, -127, -127,

			 -127, -127, -127, -127, -127, -127, -127, -127, -127, -127,
			 -127, -127, -127, -127, -127, -127, -127, -127, -127, -127,
			 -127, -127, -127, -127, -127, -127, -127, -127, -127, -127,
			 -127, -127, -127, -127, -127, -127, -127, -127, -127, -127,
			 -127, -127, -127, -127, -127, -127, -127, -127, -127, -127,
			 -127, -127, -127, -127, -127, -127, -127, -127, -127, -127,
			 -127, -127, -127, -127, -127, -127, -127, -127, -127, -127,
			 -127, -127, -127, -127, -127, -127, -127, -127, -127, -127,
			 -127, -127, -127, -127, -127, -127, -127, -127, -127, -127,
			 -127, -127, -127, -127, -127, -127,    5, -128, -128, -128,

			 -128, -128, -128, -128, -128, -128, -128, -128, -128, -128,
			 -128, -128, -128, -128, -128, -128, -128, -128, -128, -128,
			 -128, -128, -128, -128, -128, -128, -128, -128, -128, -128,
			 -128, -128, -128, -128, -128, -128, -128, -128, -128, -128,
			 -128, -128, -128, -128, -128, -128, -128, -128, -128, -128,
			 -128, -128, -128, -128, -128, -128, -128, -128, -128, -128,
			 -128, -128, -128, -128, -128, -128, -128, -128, -128, -128,
			 -128, -128, -128, -128, -128, -128, -128, -128, -128, -128,
			 -128, -128, -128, -128, -128, -128, -128, -128, -128, -128,
			 -128, -128, -128, -128, -128, -128, -128, -128, -128, -128, yy_Dummy>>,
			1, 1000, 32000)
		end

	yy_nxt_template_34 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			 -128, -128, -128, -128, -128, -128, -128, -128, -128, -128,
			 -128, -128, -128, -128, -128, -128, -128, -128, -128, -128,
			 -128, -128, -128, -128, -128, -128, -128, -128, -128, -128,
			 -128, -128, -128, -128, -128, -128, -128, -128, -128, -128,
			 -128, -128, -128, -128, -128, -128, -128, -128, -128, -128,
			 -128, -128, -128, -128, -128, -128, -128, -128, -128, -128,
			 -128, -128, -128, -128, -128, -128, -128, -128, -128, -128,
			 -128, -128, -128, -128, -128, -128, -128, -128, -128, -128,
			 -128, -128, -128, -128, -128, -128, -128, -128, -128, -128,
			 -128, -128, -128, -128, -128, -128, -128, -128, -128, -128,

			 -128, -128, -128, -128, -128, -128, -128, -128, -128, -128,
			 -128, -128, -128, -128, -128, -128, -128, -128, -128, -128,
			 -128, -128, -128, -128, -128, -128, -128, -128, -128, -128,
			 -128, -128, -128, -128, -128, -128, -128, -128, -128, -128,
			 -128, -128, -128, -128, -128, -128, -128, -128, -128, -128,
			 -128, -128, -128,    5, -129, -129, -129, -129, -129, -129,
			 -129, -129, -129, -129, -129, -129, -129, -129, -129, -129,
			 -129, -129, -129, -129, -129, -129, -129, -129, -129, -129,
			 -129, -129, -129, -129, -129, -129, -129, -129, -129, -129,
			 -129, -129, -129, -129, -129, -129,  147, -129,  147, -129,

			 -129,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  148, -129, -129, -129, -129, -129, -129, -129, -129, -129,
			 -129, -129, -129, -129, -129, -129, -129, -129, -129, -129,
			 -129, -129, -129, -129, -129, -129, -129, -129, -129, -129,
			 -129, -129, -129, -129, -129, -129, -129, -129, -129, -129,
			 -129, -129, -129, -129, -129, -129, -129, -129, -129, -129,
			 -129, -129, -129, -129, -129, -129, -129, -129, -129, -129,
			 -129, -129, -129, -129, -129, -129, -129, -129, -129, -129,
			 -129, -129, -129, -129, -129, -129, -129, -129, -129, -129,
			 -129, -129, -129, -129, -129, -129, -129, -129, -129, -129,

			 -129, -129, -129, -129, -129, -129, -129, -129, -129, -129,
			 -129, -129, -129, -129, -129, -129, -129, -129, -129, -129,
			 -129, -129, -129, -129, -129, -129, -129, -129, -129, -129,
			 -129, -129, -129, -129, -129, -129, -129, -129, -129, -129,
			 -129, -129, -129, -129, -129, -129, -129, -129, -129, -129,
			 -129, -129, -129, -129, -129, -129, -129, -129, -129, -129,
			 -129, -129, -129, -129, -129, -129, -129, -129, -129, -129,
			 -129, -129, -129, -129, -129, -129, -129, -129, -129, -129,
			 -129, -129, -129, -129, -129, -129, -129, -129, -129, -129,
			 -129, -129, -129, -129, -129, -129, -129, -129, -129, -129,

			 -129, -129, -129, -129, -129, -129, -129, -129, -129, -129,
			    5, -130, -130, -130, -130, -130, -130, -130, -130, -130,
			 -130, -130, -130, -130, -130, -130, -130, -130, -130, -130,
			 -130, -130, -130, -130, -130, -130, -130, -130, -130, -130,
			 -130, -130, -130, -130, -130, -130, -130, -130, -130, -130,
			 -130, -130, -130, -130, -130,  149,   58, -130,  150,  150,
			  150,  150,  150,  150,  150,  150,  150,  150, -130, -130,
			 -130, -130, -130, -130, -130, -130, -130, -130, -130,   60,
			 -130, -130, -130, -130, -130, -130, -130, -130, -130, -130,
			 -130, -130, -130, -130, -130, -130, -130, -130, -130, -130,

			 -130, -130, -130, -130, -130, -130, -130, -130, -130, -130,
			 -130,   60, -130, -130, -130, -130, -130, -130, -130, -130,
			 -130, -130, -130, -130, -130, -130, -130, -130, -130, -130,
			 -130, -130, -130, -130, -130, -130, -130, -130, -130, -130,
			 -130, -130, -130, -130, -130, -130, -130, -130, -130, -130,
			 -130, -130, -130, -130, -130, -130, -130, -130, -130, -130,
			 -130, -130, -130, -130, -130, -130, -130, -130, -130, -130,
			 -130, -130, -130, -130, -130, -130, -130, -130, -130, -130,
			 -130, -130, -130, -130, -130, -130, -130, -130, -130, -130,
			 -130, -130, -130, -130, -130, -130, -130, -130, -130, -130,

			 -130, -130, -130, -130, -130, -130, -130, -130, -130, -130,
			 -130, -130, -130, -130, -130, -130, -130, -130, -130, -130,
			 -130, -130, -130, -130, -130, -130, -130, -130, -130, -130,
			 -130, -130, -130, -130, -130, -130, -130, -130, -130, -130,
			 -130, -130, -130, -130, -130, -130, -130, -130, -130, -130,
			 -130, -130, -130, -130, -130, -130, -130, -130, -130, -130,
			 -130, -130, -130, -130, -130, -130, -130,    5, -131, -131,
			 -131, -131, -131, -131, -131, -131, -131, -131, -131, -131,
			 -131, -131, -131, -131, -131, -131, -131, -131, -131, -131,
			 -131, -131, -131, -131, -131, -131, -131, -131, -131, -131,

			 -131, -131, -131, -131, -131, -131, -131, -131, -131, -131,
			 -131, -131, -131, -131, -131,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151, -131, -131, -131, -131, -131,
			 -131, -131, -131, -131, -131, -131, -131, -131, -131, -131,
			 -131, -131, -131, -131, -131, -131, -131, -131, -131, -131,
			 -131, -131, -131, -131, -131, -131, -131, -131, -131, -131,
			 -131, -131, -131, -131, -131, -131, -131, -131, -131, -131,
			 -131, -131, -131, -131, -131, -131, -131, -131, -131, -131,
			 -131, -131, -131, -131, -131, -131, -131, -131, -131, -131,
			 -131, -131, -131, -131, -131, -131, -131, -131, -131, -131,

			 -131, -131, -131, -131, -131, -131, -131, -131, -131, -131,
			 -131, -131, -131, -131, -131, -131, -131, -131, -131, -131,
			 -131, -131, -131, -131, -131, -131, -131, -131, -131, -131,
			 -131, -131, -131, -131, -131, -131, -131, -131, -131, -131,
			 -131, -131, -131, -131, -131, -131, -131, -131, -131, -131,
			 -131, -131, -131, -131, -131, -131, -131, -131, -131, -131,
			 -131, -131, -131, -131, -131, -131, -131, -131, -131, -131,
			 -131, -131, -131, -131, -131, -131, -131, -131, -131, -131,
			 -131, -131, -131, -131, -131, -131, -131, -131, -131, -131,
			 -131, -131, -131, -131, -131, -131, -131, -131, -131, -131,

			 -131, -131, -131, -131, -131, -131, -131, -131, -131, -131,
			 -131, -131, -131, -131, -131, -131, -131, -131, -131, -131,
			 -131, -131, -131, -131,    5, -132, -132, -132, -132, -132,
			 -132, -132, -132, -132, -132, -132, -132, -132, -132, -132,
			 -132, -132, -132, -132, -132, -132, -132, -132, -132, -132,
			 -132, -132, -132, -132, -132, -132,  132, -132, -132, -132,
			 -132, -132, -132, -132, -132, -132, -132, -132,  132, -132,
			 -132, -132,  132,  132,  132,  132,  132,  132,  132,  132,
			  132,  132, -132, -132,  132, -132,  152, -132, -132,  132,
			  132,  132,  132,  132,  132,  132,  132,  132,  132,  132, yy_Dummy>>,
			1, 1000, 33000)
		end

	yy_nxt_template_35 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  132,  132,  132,  132,  132,  132,  132,  132,  132,  132,
			  132,  132,  132,  132,  132, -132, -132, -132, -132,  132,
			 -132,  132,  132,  132,  132,  132,  132,  132,  132,  132,
			  132,  132,  132,  132,  132,  132,  132,  132,  132,  132,
			  132,  132,  132,  132,  132,  132,  132, -132, -132, -132,
			 -132, -132, -132, -132, -132, -132, -132, -132, -132, -132,
			 -132, -132, -132, -132, -132, -132, -132, -132, -132, -132,
			 -132, -132, -132, -132, -132, -132, -132, -132, -132, -132,
			 -132, -132, -132, -132, -132, -132, -132, -132, -132, -132,
			 -132, -132, -132, -132, -132, -132, -132, -132, -132, -132,

			 -132, -132, -132, -132, -132, -132, -132, -132, -132, -132,
			 -132, -132, -132, -132, -132, -132, -132, -132, -132, -132,
			 -132, -132, -132, -132, -132, -132, -132, -132, -132, -132,
			 -132, -132, -132, -132, -132, -132, -132, -132, -132, -132,
			 -132, -132, -132, -132, -132, -132, -132, -132, -132, -132,
			 -132, -132, -132, -132, -132, -132, -132, -132, -132, -132,
			 -132, -132, -132, -132, -132, -132, -132, -132, -132, -132,
			 -132, -132, -132, -132, -132, -132, -132, -132, -132, -132,
			 -132,    5, -133, -133, -133, -133, -133, -133, -133, -133,
			 -133, -133, -133, -133, -133, -133, -133, -133, -133, -133,

			 -133, -133, -133, -133, -133, -133, -133, -133, -133, -133,
			 -133, -133, -133,   64, -133, -133, -133, -133, -133, -133,
			 -133, -133, -133, -133, -133, -133, -133, -133, -133,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65, -133,
			 -133, -133, -133, -133, -133, -133,   65,   65,   65,   65,
			  153,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65, -133, -133, -133, -133,   65, -133,   65,   65,
			   65,   65,  153,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,

			   65,   65,   65,   65, -133, -133, -133, -133, -133, -133,
			 -133, -133, -133, -133, -133, -133, -133, -133, -133, -133,
			 -133, -133, -133, -133, -133, -133, -133, -133, -133, -133,
			 -133, -133, -133, -133, -133, -133, -133, -133, -133, -133,
			 -133, -133, -133, -133, -133, -133, -133, -133, -133, -133,
			 -133, -133, -133, -133, -133, -133, -133, -133, -133, -133,
			 -133, -133, -133, -133, -133, -133, -133, -133, -133, -133,
			 -133, -133, -133, -133, -133, -133, -133, -133, -133, -133,
			 -133, -133, -133, -133, -133, -133, -133, -133, -133, -133,
			 -133, -133, -133, -133, -133, -133, -133, -133, -133, -133,

			 -133, -133, -133, -133, -133, -133, -133, -133, -133, -133,
			 -133, -133, -133, -133, -133, -133, -133, -133, -133, -133,
			 -133, -133, -133, -133, -133, -133, -133, -133, -133, -133,
			 -133, -133, -133, -133, -133, -133, -133, -133,    5, -134,
			 -134, -134, -134, -134, -134, -134, -134, -134, -134, -134,
			 -134, -134, -134, -134, -134, -134, -134, -134, -134, -134,
			 -134, -134, -134, -134, -134, -134, -134, -134, -134, -134,
			   64, -134, -134, -134, -134, -134, -134, -134, -134, -134,
			 -134, -134, -134, -134, -134, -134,  134,  134,  134,  134,
			  134,  134,  134,  134,  134,  134, -134, -134, -134, -134,

			 -134, -134, -134,   65,   65,   65,  104,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,  106,   65,   65,   65, -134,
			 -134, -134, -134,   65, -134,   65,   65,   65,  104,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,  106,   65,   65,
			   65, -134, -134, -134, -134, -134, -134, -134, -134, -134,
			 -134, -134, -134, -134, -134, -134, -134, -134, -134, -134,
			 -134, -134, -134, -134, -134, -134, -134, -134, -134, -134,
			 -134, -134, -134, -134, -134, -134, -134, -134, -134, -134,

			 -134, -134, -134, -134, -134, -134, -134, -134, -134, -134,
			 -134, -134, -134, -134, -134, -134, -134, -134, -134, -134,
			 -134, -134, -134, -134, -134, -134, -134, -134, -134, -134,
			 -134, -134, -134, -134, -134, -134, -134, -134, -134, -134,
			 -134, -134, -134, -134, -134, -134, -134, -134, -134, -134,
			 -134, -134, -134, -134, -134, -134, -134, -134, -134, -134,
			 -134, -134, -134, -134, -134, -134, -134, -134, -134, -134,
			 -134, -134, -134, -134, -134, -134, -134, -134, -134, -134,
			 -134, -134, -134, -134, -134, -134, -134, -134, -134, -134,
			 -134, -134, -134, -134, -134,    5, -135, -135, -135, -135,

			 -135, -135, -135, -135, -135, -135, -135, -135, -135, -135,
			 -135, -135, -135, -135, -135, -135, -135, -135, -135, -135,
			 -135, -135, -135, -135, -135, -135, -135,   64, -135, -135,
			 -135, -135, -135, -135, -135, -135, -135, -135, -135, -135,
			 -135, -135, -135,  135,  135,  135,  135,  135,  135,  135,
			  135,  135,  135, -135, -135, -135, -135, -135, -135, -135,
			   65,   65,   65,  104,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65, -135, -135, -135, -135,
			   65, -135,   65,   65,   65,  104,   65,   65,   65,   65,

			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65, -135, -135,
			 -135, -135, -135, -135, -135, -135, -135, -135, -135, -135,
			 -135, -135, -135, -135, -135, -135, -135, -135, -135, -135,
			 -135, -135, -135, -135, -135, -135, -135, -135, -135, -135,
			 -135, -135, -135, -135, -135, -135, -135, -135, -135, -135,
			 -135, -135, -135, -135, -135, -135, -135, -135, -135, -135,
			 -135, -135, -135, -135, -135, -135, -135, -135, -135, -135,
			 -135, -135, -135, -135, -135, -135, -135, -135, -135, -135,
			 -135, -135, -135, -135, -135, -135, -135, -135, -135, -135,

			 -135, -135, -135, -135, -135, -135, -135, -135, -135, -135,
			 -135, -135, -135, -135, -135, -135, -135, -135, -135, -135,
			 -135, -135, -135, -135, -135, -135, -135, -135, -135, -135,
			 -135, -135, -135, -135, -135, -135, -135, -135, -135, -135,
			 -135, -135, -135, -135, -135, -135, -135, -135, -135, -135,
			 -135, -135,    5, -136, -136, -136, -136, -136, -136, -136,
			 -136, -136, -136, -136, -136, -136, -136, -136, -136, -136,
			 -136, -136, -136, -136, -136, -136, -136, -136, -136, -136,
			 -136, -136, -136, -136,   64, -136, -136, -136, -136, -136,
			 -136, -136, -136, -136, -136, -136, -136, -136, -136, -136, yy_Dummy>>,
			1, 1000, 34000)
		end

	yy_nxt_template_36 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  136,  136,  136,  136,  136,  136,  136,  136,  136,  136,
			 -136, -136, -136, -136, -136, -136, -136,   65,   65,   65,
			  104,   65,   65,   65,   65,   65,   65,   65,   65,  105,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,  106,
			   65,   65,   65, -136, -136, -136, -136,   65, -136,   65,
			   65,   65,  104,   65,   65,   65,   65,   65,   65,   65,
			   65,  105,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,  106,   65,   65,   65, -136, -136, -136, -136, -136,
			 -136, -136, -136, -136, -136, -136, -136, -136, -136, -136,
			 -136, -136, -136, -136, -136, -136, -136, -136, -136, -136,

			 -136, -136, -136, -136, -136, -136, -136, -136, -136, -136,
			 -136, -136, -136, -136, -136, -136, -136, -136, -136, -136,
			 -136, -136, -136, -136, -136, -136, -136, -136, -136, -136,
			 -136, -136, -136, -136, -136, -136, -136, -136, -136, -136,
			 -136, -136, -136, -136, -136, -136, -136, -136, -136, -136,
			 -136, -136, -136, -136, -136, -136, -136, -136, -136, -136,
			 -136, -136, -136, -136, -136, -136, -136, -136, -136, -136,
			 -136, -136, -136, -136, -136, -136, -136, -136, -136, -136,
			 -136, -136, -136, -136, -136, -136, -136, -136, -136, -136,
			 -136, -136, -136, -136, -136, -136, -136, -136, -136, -136,

			 -136, -136, -136, -136, -136, -136, -136, -136, -136,    5,
			 -137, -137, -137, -137, -137, -137, -137, -137, -137, -137,
			 -137, -137, -137, -137, -137, -137, -137, -137, -137, -137,
			 -137, -137, -137, -137, -137, -137, -137, -137, -137, -137,
			 -137, -137, -137, -137, -137, -137, -137, -137, -137, -137,
			 -137, -137, -137, -137, -137, -137, -137,  154,  154,  154,
			  154,  154,  154,  154,  154,  154,  154, -137, -137, -137,
			 -137, -137, -137, -137, -137, -137, -137, -137, -137, -137,
			 -137, -137, -137, -137, -137, -137, -137, -137, -137, -137,
			 -137, -137, -137, -137, -137, -137, -137, -137, -137, -137,

			 -137, -137, -137, -137, -137, -137, -137, -137, -137, -137,
			 -137, -137, -137, -137, -137, -137, -137, -137, -137, -137,
			 -137, -137, -137, -137, -137, -137, -137, -137, -137, -137,
			 -137, -137, -137, -137, -137, -137, -137, -137, -137, -137,
			 -137, -137, -137, -137, -137, -137, -137, -137, -137, -137,
			 -137, -137, -137, -137, -137, -137, -137, -137, -137, -137,
			 -137, -137, -137, -137, -137, -137, -137, -137, -137, -137,
			 -137, -137, -137, -137, -137, -137, -137, -137, -137, -137,
			 -137, -137, -137, -137, -137, -137, -137, -137, -137, -137,
			 -137, -137, -137, -137, -137, -137, -137, -137, -137, -137,

			 -137, -137, -137, -137, -137, -137, -137, -137, -137, -137,
			 -137, -137, -137, -137, -137, -137, -137, -137, -137, -137,
			 -137, -137, -137, -137, -137, -137, -137, -137, -137, -137,
			 -137, -137, -137, -137, -137, -137, -137, -137, -137, -137,
			 -137, -137, -137, -137, -137, -137, -137, -137, -137, -137,
			 -137, -137, -137, -137, -137, -137, -137, -137, -137, -137,
			 -137, -137, -137, -137, -137, -137,    5, -138, -138, -138,
			 -138, -138, -138, -138, -138, -138, -138, -138, -138, -138,
			 -138, -138, -138, -138, -138, -138, -138, -138, -138, -138,
			 -138, -138, -138, -138, -138, -138, -138, -138,   64, -138,

			 -138, -138, -138, -138, -138, -138, -138, -138, -138, -138,
			 -138, -138, -138, -138,  155,  155,  155,  155,  155,  155,
			  155,  155,  155,  155, -138, -138, -138, -138, -138, -138,
			 -138,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65, -138, -138, -138,
			 -138,   65, -138,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65, -138,
			 -138, -138, -138, -138, -138, -138, -138, -138, -138, -138,

			 -138, -138, -138, -138, -138, -138, -138, -138, -138, -138,
			 -138, -138, -138, -138, -138, -138, -138, -138, -138, -138,
			 -138, -138, -138, -138, -138, -138, -138, -138, -138, -138,
			 -138, -138, -138, -138, -138, -138, -138, -138, -138, -138,
			 -138, -138, -138, -138, -138, -138, -138, -138, -138, -138,
			 -138, -138, -138, -138, -138, -138, -138, -138, -138, -138,
			 -138, -138, -138, -138, -138, -138, -138, -138, -138, -138,
			 -138, -138, -138, -138, -138, -138, -138, -138, -138, -138,
			 -138, -138, -138, -138, -138, -138, -138, -138, -138, -138,
			 -138, -138, -138, -138, -138, -138, -138, -138, -138, -138,

			 -138, -138, -138, -138, -138, -138, -138, -138, -138, -138,
			 -138, -138, -138, -138, -138, -138, -138, -138, -138, -138,
			 -138, -138, -138,    5, -139, -139, -139, -139, -139, -139,
			 -139, -139, -139, -139, -139, -139, -139, -139, -139, -139,
			 -139, -139, -139, -139, -139, -139, -139, -139, -139, -139,
			 -139, -139, -139, -139, -139,   64, -139, -139, -139, -139,
			 -139, -139, -139, -139, -139, -139, -139, -139, -139, -139,
			 -139,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156, -139, -139, -139, -139, -139, -139, -139,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,

			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65, -139, -139, -139, -139,   65, -139,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65, -139, -139, -139, -139,
			 -139, -139, -139, -139, -139, -139, -139, -139, -139, -139,
			 -139, -139, -139, -139, -139, -139, -139, -139, -139, -139,
			 -139, -139, -139, -139, -139, -139, -139, -139, -139, -139,
			 -139, -139, -139, -139, -139, -139, -139, -139, -139, -139,
			 -139, -139, -139, -139, -139, -139, -139, -139, -139, -139,

			 -139, -139, -139, -139, -139, -139, -139, -139, -139, -139,
			 -139, -139, -139, -139, -139, -139, -139, -139, -139, -139,
			 -139, -139, -139, -139, -139, -139, -139, -139, -139, -139,
			 -139, -139, -139, -139, -139, -139, -139, -139, -139, -139,
			 -139, -139, -139, -139, -139, -139, -139, -139, -139, -139,
			 -139, -139, -139, -139, -139, -139, -139, -139, -139, -139,
			 -139, -139, -139, -139, -139, -139, -139, -139, -139, -139,
			 -139, -139, -139, -139, -139, -139, -139, -139, -139, -139,
			    5, -140, -140, -140, -140, -140, -140, -140, -140, -140,
			 -140, -140, -140, -140, -140, -140, -140, -140, -140, -140, yy_Dummy>>,
			1, 1000, 35000)
		end

	yy_nxt_template_37 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			 -140, -140, -140, -140, -140, -140, -140, -140, -140, -140,
			 -140, -140,   64, -140, -140, -140, -140, -140, -140, -140,
			 -140, -140, -140, -140, -140, -140, -140, -140,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65, -140, -140,
			 -140, -140, -140, -140, -140,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65, -140, -140, -140, -140,   65, -140,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,

			   65,   65,   65, -140, -140, -140, -140, -140, -140, -140,
			 -140, -140, -140, -140, -140, -140, -140, -140, -140, -140,
			 -140, -140, -140, -140, -140, -140, -140, -140, -140, -140,
			 -140, -140, -140, -140, -140, -140, -140, -140, -140, -140,
			 -140, -140, -140, -140, -140, -140, -140, -140, -140, -140,
			 -140, -140, -140, -140, -140, -140, -140, -140, -140, -140,
			 -140, -140, -140, -140, -140, -140, -140, -140, -140, -140,
			 -140, -140, -140, -140, -140, -140, -140, -140, -140, -140,
			 -140, -140, -140, -140, -140, -140, -140, -140, -140, -140,
			 -140, -140, -140, -140, -140, -140, -140, -140, -140, -140,

			 -140, -140, -140, -140, -140, -140, -140, -140, -140, -140,
			 -140, -140, -140, -140, -140, -140, -140, -140, -140, -140,
			 -140, -140, -140, -140, -140, -140, -140, -140, -140, -140,
			 -140, -140, -140, -140, -140, -140, -140,    5, -141, -141,
			 -141, -141, -141, -141, -141, -141, -141, -141, -141, -141,
			 -141, -141, -141, -141, -141, -141, -141, -141, -141, -141,
			 -141, -141, -141, -141, -141, -141, -141, -141, -141,   64,
			 -141, -141, -141, -141, -141, -141, -141, -141, -141, -141,
			 -141, -141, -141, -141, -141,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65, -141, -141, -141, -141, -141,

			 -141, -141,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65, -141, -141,
			 -141, -141,   65, -141,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			 -141, -141, -141, -141, -141, -141, -141, -141, -141, -141,
			 -141, -141, -141, -141, -141, -141, -141, -141, -141, -141,
			 -141, -141, -141, -141, -141, -141, -141, -141, -141, -141,
			 -141, -141, -141, -141, -141, -141, -141, -141, -141, -141,

			 -141, -141, -141, -141, -141, -141, -141, -141, -141, -141,
			 -141, -141, -141, -141, -141, -141, -141, -141, -141, -141,
			 -141, -141, -141, -141, -141, -141, -141, -141, -141, -141,
			 -141, -141, -141, -141, -141, -141, -141, -141, -141, -141,
			 -141, -141, -141, -141, -141, -141, -141, -141, -141, -141,
			 -141, -141, -141, -141, -141, -141, -141, -141, -141, -141,
			 -141, -141, -141, -141, -141, -141, -141, -141, -141, -141,
			 -141, -141, -141, -141, -141, -141, -141, -141, -141, -141,
			 -141, -141, -141, -141, -141, -141, -141, -141, -141, -141,
			 -141, -141, -141, -141,    5, -142, -142, -142, -142, -142,

			 -142, -142, -142,  157, -142, -142, -142, -142, -142, -142,
			 -142, -142, -142, -142, -142, -142, -142, -142, -142, -142,
			 -142, -142, -142, -142, -142, -142,  157, -142, -142, -142,
			 -142, -142, -142, -142, -142, -142, -142, -142, -142,  158,
			  158, -142,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158, -142, -142, -142, -142, -142, -142, -142,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158, -142, -142,  159, -142,  158,
			 -142,  158,  158,  158,  158,  158,  158,  158,  158,  158,

			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158, -142, -142, -142,
			 -142, -142, -142, -142, -142, -142, -142, -142, -142, -142,
			 -142, -142, -142, -142, -142, -142, -142, -142, -142, -142,
			 -142, -142, -142, -142, -142, -142, -142, -142, -142, -142,
			 -142, -142, -142, -142, -142, -142, -142, -142, -142, -142,
			 -142, -142, -142, -142, -142, -142, -142, -142, -142, -142,
			 -142, -142, -142, -142, -142, -142, -142, -142, -142, -142,
			 -142, -142, -142, -142, -142, -142, -142, -142, -142, -142,
			 -142, -142, -142, -142, -142, -142, -142, -142, -142, -142,

			 -142, -142, -142, -142, -142, -142, -142, -142, -142, -142,
			 -142, -142, -142, -142, -142, -142, -142, -142, -142, -142,
			 -142, -142, -142, -142, -142, -142, -142, -142, -142, -142,
			 -142, -142, -142, -142, -142, -142, -142, -142, -142, -142,
			 -142, -142, -142, -142, -142, -142, -142, -142, -142, -142,
			 -142,    5, -143, -143, -143, -143, -143, -143, -143, -143,
			 -143, -143, -143, -143, -143, -143, -143, -143, -143, -143,
			 -143, -143, -143, -143, -143, -143, -143, -143, -143, -143,
			 -143, -143, -143, -143, -143, -143, -143, -143, -143, -143,
			 -143, -143, -143, -143, -143, -143, -143, -143, -143,   71,

			   71,   71,   71,   71,   71,   71,   71,   71,   71, -143,
			 -143, -143, -143, -143, -143, -143,   71,   71,   71,   71,
			  160,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71, -143, -143, -143, -143,   71, -143,   71,   71,
			   71,   71,  160,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71, -143, -143, -143, -143, -143, -143,
			 -143, -143, -143, -143, -143, -143, -143, -143, -143, -143,
			 -143, -143, -143, -143, -143, -143, -143, -143, -143, -143,

			 -143, -143, -143, -143, -143, -143, -143, -143, -143, -143,
			 -143, -143, -143, -143, -143, -143, -143, -143, -143, -143,
			 -143, -143, -143, -143, -143, -143, -143, -143, -143, -143,
			 -143, -143, -143, -143, -143, -143, -143, -143, -143, -143,
			 -143, -143, -143, -143, -143, -143, -143, -143, -143, -143,
			 -143, -143, -143, -143, -143, -143, -143, -143, -143, -143,
			 -143, -143, -143, -143, -143, -143, -143, -143, -143, -143,
			 -143, -143, -143, -143, -143, -143, -143, -143, -143, -143,
			 -143, -143, -143, -143, -143, -143, -143, -143, -143, -143,
			 -143, -143, -143, -143, -143, -143, -143, -143, -143, -143, yy_Dummy>>,
			1, 1000, 36000)
		end

	yy_nxt_template_38 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			 -143, -143, -143, -143, -143, -143, -143, -143,    5, -144,
			 -144, -144, -144, -144, -144, -144, -144, -144, -144, -144,
			 -144, -144, -144, -144, -144, -144, -144, -144, -144, -144,
			 -144, -144, -144, -144, -144, -144, -144, -144, -144, -144,
			 -144, -144, -144, -144, -144, -144, -144, -144, -144, -144,
			 -144, -144, -144, -144, -144, -144,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   72, -144, -144, -144,
			 -144, -144, -144,   71,   71,   71,   71,  160,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71, -144,

			 -144, -144, -144,   71, -144,   73,   73,   73,   73,  161,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73, -144, -144, -144, -144, -144, -144, -144, -144, -144,
			 -144, -144, -144, -144, -144, -144, -144, -144, -144, -144,
			 -144, -144, -144, -144, -144, -144, -144, -144, -144, -144,
			 -144, -144, -144, -144, -144, -144, -144, -144, -144, -144,
			 -144, -144, -144, -144, -144, -144, -144, -144, -144, -144,
			 -144, -144, -144, -144, -144, -144, -144, -144, -144, -144,
			 -144, -144, -144, -144, -144, -144, -144, -144, -144, -144,

			 -144, -144, -144, -144, -144, -144, -144, -144, -144, -144,
			 -144, -144, -144, -144, -144, -144, -144, -144, -144, -144,
			 -144, -144, -144, -144, -144, -144, -144, -144, -144, -144,
			 -144, -144, -144, -144, -144, -144, -144, -144, -144, -144,
			 -144, -144, -144, -144, -144, -144, -144, -144, -144, -144,
			 -144, -144, -144, -144, -144, -144, -144, -144, -144, -144,
			 -144, -144, -144, -144, -144,    5, -145, -145, -145, -145,
			 -145, -145, -145, -145, -145, -145, -145, -145, -145, -145,
			 -145, -145, -145, -145, -145, -145, -145, -145, -145, -145,
			 -145, -145, -145, -145, -145, -145, -145, -145, -145, -145,

			 -145, -145, -145, -145, -145, -145, -145, -145, -145, -145,
			 -145, -145, -145,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71, -145, -145, -145, -145, -145, -145, -145,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71, -145, -145, -145, -145,
			   71, -145,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71, -145, -145,
			 -145, -145, -145, -145, -145, -145, -145, -145, -145, -145,

			 -145, -145, -145, -145, -145, -145, -145, -145, -145, -145,
			 -145, -145, -145, -145, -145, -145, -145, -145, -145, -145,
			 -145, -145, -145, -145, -145, -145, -145, -145, -145, -145,
			 -145, -145, -145, -145, -145, -145, -145, -145, -145, -145,
			 -145, -145, -145, -145, -145, -145, -145, -145, -145, -145,
			 -145, -145, -145, -145, -145, -145, -145, -145, -145, -145,
			 -145, -145, -145, -145, -145, -145, -145, -145, -145, -145,
			 -145, -145, -145, -145, -145, -145, -145, -145, -145, -145,
			 -145, -145, -145, -145, -145, -145, -145, -145, -145, -145,
			 -145, -145, -145, -145, -145, -145, -145, -145, -145, -145,

			 -145, -145, -145, -145, -145, -145, -145, -145, -145, -145,
			 -145, -145, -145, -145, -145, -145, -145, -145, -145, -145,
			 -145, -145,    5, -146, -146, -146, -146, -146, -146, -146,
			 -146, -146, -146, -146, -146, -146, -146, -146, -146, -146,
			 -146, -146, -146, -146, -146, -146, -146, -146, -146, -146,
			 -146, -146, -146, -146, -146, -146, -146, -146, -146, -146,
			 -146, -146, -146, -146, -146, -146, -146, -146, -146, -146,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   72, -146, -146, -146, -146, -146, -146,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,

			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71, -146, -146, -146, -146,   71, -146,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73, -146, -146, -146, -146, -146,
			 -146, -146, -146, -146, -146, -146, -146, -146, -146, -146,
			 -146, -146, -146, -146, -146, -146, -146, -146, -146, -146,
			 -146, -146, -146, -146, -146, -146, -146, -146, -146, -146,
			 -146, -146, -146, -146, -146, -146, -146, -146, -146, -146,
			 -146, -146, -146, -146, -146, -146, -146, -146, -146, -146,

			 -146, -146, -146, -146, -146, -146, -146, -146, -146, -146,
			 -146, -146, -146, -146, -146, -146, -146, -146, -146, -146,
			 -146, -146, -146, -146, -146, -146, -146, -146, -146, -146,
			 -146, -146, -146, -146, -146, -146, -146, -146, -146, -146,
			 -146, -146, -146, -146, -146, -146, -146, -146, -146, -146,
			 -146, -146, -146, -146, -146, -146, -146, -146, -146, -146,
			 -146, -146, -146, -146, -146, -146, -146, -146, -146, -146,
			 -146, -146, -146, -146, -146, -146, -146, -146, -146,    5,
			 -147, -147, -147, -147, -147, -147, -147, -147, -147, -147,
			 -147, -147, -147, -147, -147, -147, -147, -147, -147, -147,

			 -147, -147, -147, -147, -147, -147, -147, -147, -147, -147,
			 -147, -147, -147, -147, -147, -147, -147, -147, -147, -147,
			 -147, -147, -147, -147, -147, -147, -147,  148,  148,  148,
			  148,  148,  148,  148,  148,  148,  148, -147, -147, -147,
			 -147, -147, -147, -147, -147, -147, -147, -147, -147, -147,
			 -147, -147, -147, -147, -147, -147, -147, -147, -147, -147,
			 -147, -147, -147, -147, -147, -147, -147, -147, -147, -147,
			 -147, -147, -147, -147, -147, -147, -147, -147, -147, -147,
			 -147, -147, -147, -147, -147, -147, -147, -147, -147, -147,
			 -147, -147, -147, -147, -147, -147, -147, -147, -147, -147,

			 -147, -147, -147, -147, -147, -147, -147, -147, -147, -147,
			 -147, -147, -147, -147, -147, -147, -147, -147, -147, -147,
			 -147, -147, -147, -147, -147, -147, -147, -147, -147, -147,
			 -147, -147, -147, -147, -147, -147, -147, -147, -147, -147,
			 -147, -147, -147, -147, -147, -147, -147, -147, -147, -147,
			 -147, -147, -147, -147, -147, -147, -147, -147, -147, -147,
			 -147, -147, -147, -147, -147, -147, -147, -147, -147, -147,
			 -147, -147, -147, -147, -147, -147, -147, -147, -147, -147,
			 -147, -147, -147, -147, -147, -147, -147, -147, -147, -147,
			 -147, -147, -147, -147, -147, -147, -147, -147, -147, -147, yy_Dummy>>,
			1, 1000, 37000)
		end

	yy_nxt_template_39 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			 -147, -147, -147, -147, -147, -147, -147, -147, -147, -147,
			 -147, -147, -147, -147, -147, -147, -147, -147, -147, -147,
			 -147, -147, -147, -147, -147, -147, -147, -147, -147, -147,
			 -147, -147, -147, -147, -147, -147,    5, -148, -148, -148,
			 -148, -148, -148, -148, -148, -148, -148, -148, -148, -148,
			 -148, -148, -148, -148, -148, -148, -148, -148, -148, -148,
			 -148, -148, -148, -148, -148, -148, -148, -148, -148, -148,
			 -148, -148, -148, -148, -148, -148, -148, -148, -148, -148,
			 -148, -148, -148, -148,  148,  148,  148,  148,  148,  148,
			  148,  148,  148,  148, -148, -148, -148, -148, -148, -148,

			 -148, -148, -148, -148, -148, -148, -148, -148, -148, -148,
			 -148, -148, -148, -148, -148, -148, -148, -148, -148, -148,
			 -148, -148, -148, -148, -148, -148, -148, -148, -148, -148,
			 -148, -148, -148, -148, -148, -148, -148, -148, -148, -148,
			 -148, -148, -148, -148, -148, -148, -148, -148, -148, -148,
			 -148, -148, -148, -148, -148, -148, -148, -148, -148, -148,
			 -148, -148, -148, -148, -148, -148, -148, -148, -148, -148,
			 -148, -148, -148, -148, -148, -148, -148, -148, -148, -148,
			 -148, -148, -148, -148, -148, -148, -148, -148, -148, -148,
			 -148, -148, -148, -148, -148, -148, -148, -148, -148, -148,

			 -148, -148, -148, -148, -148, -148, -148, -148, -148, -148,
			 -148, -148, -148, -148, -148, -148, -148, -148, -148, -148,
			 -148, -148, -148, -148, -148, -148, -148, -148, -148, -148,
			 -148, -148, -148, -148, -148, -148, -148, -148, -148, -148,
			 -148, -148, -148, -148, -148, -148, -148, -148, -148, -148,
			 -148, -148, -148, -148, -148, -148, -148, -148, -148, -148,
			 -148, -148, -148, -148, -148, -148, -148, -148, -148, -148,
			 -148, -148, -148, -148, -148, -148, -148, -148, -148, -148,
			 -148, -148, -148, -148, -148, -148, -148, -148, -148, -148,
			 -148, -148, -148,    5, -149, -149, -149, -149, -149, -149,

			 -149, -149, -149, -149, -149, -149, -149, -149, -149, -149,
			 -149, -149, -149, -149, -149, -149, -149, -149, -149, -149,
			 -149, -149, -149, -149, -149, -149, -149, -149, -149, -149,
			 -149, -149, -149, -149, -149, -149, -149, -149, -149, -149,
			 -149,  162,  162, -149, -149, -149, -149, -149, -149, -149,
			 -149, -149, -149, -149, -149, -149, -149, -149, -149, -149,
			 -149, -149, -149, -149, -149, -149, -149, -149, -149, -149,
			 -149, -149, -149, -149, -149, -149, -149, -149, -149, -149,
			 -149, -149, -149, -149, -149, -149, -149, -149, -149, -149,
			 -149, -149, -149, -149, -149, -149, -149, -149, -149, -149,

			 -149, -149, -149, -149, -149, -149, -149, -149, -149, -149,
			 -149, -149, -149, -149, -149, -149, -149, -149, -149, -149,
			 -149, -149, -149, -149, -149, -149, -149, -149, -149, -149,
			 -149, -149, -149, -149, -149, -149, -149, -149, -149, -149,
			 -149, -149, -149, -149, -149, -149, -149, -149, -149, -149,
			 -149, -149, -149, -149, -149, -149, -149, -149, -149, -149,
			 -149, -149, -149, -149, -149, -149, -149, -149, -149, -149,
			 -149, -149, -149, -149, -149, -149, -149, -149, -149, -149,
			 -149, -149, -149, -149, -149, -149, -149, -149, -149, -149,
			 -149, -149, -149, -149, -149, -149, -149, -149, -149, -149,

			 -149, -149, -149, -149, -149, -149, -149, -149, -149, -149,
			 -149, -149, -149, -149, -149, -149, -149, -149, -149, -149,
			 -149, -149, -149, -149, -149, -149, -149, -149, -149, -149,
			 -149, -149, -149, -149, -149, -149, -149, -149, -149, -149,
			 -149, -149, -149, -149, -149, -149, -149, -149, -149, -149,
			    5, -150, -150, -150, -150, -150, -150, -150, -150, -150,
			 -150, -150, -150, -150, -150, -150, -150, -150, -150, -150,
			 -150, -150, -150, -150, -150, -150, -150, -150, -150, -150,
			 -150, -150, -150, -150, -150, -150, -150, -150, -150, -150,
			 -150, -150, -150, -150, -150, -150,   58, -150,  150,  150,

			  150,  150,  150,  150,  150,  150,  150,  150, -150, -150,
			 -150, -150, -150, -150, -150, -150, -150, -150, -150,   60,
			 -150, -150, -150, -150, -150, -150, -150, -150, -150, -150,
			 -150, -150, -150, -150, -150, -150, -150, -150, -150, -150,
			 -150, -150, -150, -150, -150, -150, -150, -150, -150, -150,
			 -150,   60, -150, -150, -150, -150, -150, -150, -150, -150,
			 -150, -150, -150, -150, -150, -150, -150, -150, -150, -150,
			 -150, -150, -150, -150, -150, -150, -150, -150, -150, -150,
			 -150, -150, -150, -150, -150, -150, -150, -150, -150, -150,
			 -150, -150, -150, -150, -150, -150, -150, -150, -150, -150,

			 -150, -150, -150, -150, -150, -150, -150, -150, -150, -150,
			 -150, -150, -150, -150, -150, -150, -150, -150, -150, -150,
			 -150, -150, -150, -150, -150, -150, -150, -150, -150, -150,
			 -150, -150, -150, -150, -150, -150, -150, -150, -150, -150,
			 -150, -150, -150, -150, -150, -150, -150, -150, -150, -150,
			 -150, -150, -150, -150, -150, -150, -150, -150, -150, -150,
			 -150, -150, -150, -150, -150, -150, -150, -150, -150, -150,
			 -150, -150, -150, -150, -150, -150, -150, -150, -150, -150,
			 -150, -150, -150, -150, -150, -150, -150, -150, -150, -150,
			 -150, -150, -150, -150, -150, -150, -150, -150, -150, -150,

			 -150, -150, -150, -150, -150, -150, -150,    5, -151, -151,
			 -151, -151, -151, -151, -151, -151, -151, -151, -151, -151,
			 -151, -151, -151, -151, -151, -151, -151, -151, -151, -151,
			 -151, -151, -151, -151, -151, -151, -151, -151, -151, -151,
			 -151, -151, -151, -151, -151, -151, -151, -151, -151, -151,
			  163, -151,  163, -151, -151, -151, -151, -151, -151, -151,
			 -151, -151, -151, -151, -151,  164, -151, -151, -151, -151,
			 -151, -151, -151, -151, -151, -151, -151, -151, -151, -151,
			 -151, -151, -151, -151, -151, -151, -151, -151, -151, -151,
			 -151, -151, -151, -151, -151, -151, -151,  165, -151, -151,

			 -151, -151, -151, -151, -151, -151, -151, -151, -151, -151,
			 -151, -151, -151, -151, -151, -151, -151, -151, -151, -151,
			 -151, -151, -151, -151, -151, -151, -151, -151, -151, -151,
			 -151, -151, -151, -151, -151, -151, -151, -151, -151, -151,
			 -151, -151, -151, -151, -151, -151, -151, -151, -151, -151,
			 -151, -151, -151, -151, -151, -151, -151, -151, -151, -151,
			 -151, -151, -151, -151, -151, -151, -151, -151, -151, -151,
			 -151, -151, -151, -151, -151, -151, -151, -151, -151, -151,
			 -151, -151, -151, -151, -151, -151, -151, -151, -151, -151,
			 -151, -151, -151, -151, -151, -151, -151, -151, -151, -151, yy_Dummy>>,
			1, 1000, 38000)
		end

	yy_nxt_template_40 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			 -151, -151, -151, -151, -151, -151, -151, -151, -151, -151,
			 -151, -151, -151, -151, -151, -151, -151, -151, -151, -151,
			 -151, -151, -151, -151, -151, -151, -151, -151, -151, -151,
			 -151, -151, -151, -151, -151, -151, -151, -151, -151, -151,
			 -151, -151, -151, -151, -151, -151, -151, -151, -151, -151,
			 -151, -151, -151, -151, -151, -151, -151, -151, -151, -151,
			 -151, -151, -151, -151,    5, -152, -152, -152, -152, -152,
			 -152, -152, -152, -152, -152, -152, -152, -152, -152, -152,
			 -152, -152, -152, -152, -152, -152, -152, -152, -152, -152,
			 -152, -152, -152, -152, -152, -152,  132, -152, -152, -152,

			 -152, -152, -152, -152, -152, -152, -152, -152,  132, -152,
			 -152, -152,  132,  132,  132,  132,  132,  132,  132,  132,
			  132,  132, -152, -152,  132, -152,  152, -152, -152,  132,
			  132,  132,  132,  132,  132,  132,  132,  132,  132,  132,
			  132,  132,  132,  132,  132,  132,  132,  132,  132,  132,
			  132,  132,  132,  132,  132, -152, -152, -152, -152,  132,
			 -152,  132,  132,  132,  132,  132,  132,  132,  132,  132,
			  132,  132,  132,  132,  132,  132,  132,  132,  132,  132,
			  132,  132,  132,  132,  132,  132,  132, -152, -152, -152,
			 -152, -152, -152, -152, -152, -152, -152, -152, -152, -152,

			 -152, -152, -152, -152, -152, -152, -152, -152, -152, -152,
			 -152, -152, -152, -152, -152, -152, -152, -152, -152, -152,
			 -152, -152, -152, -152, -152, -152, -152, -152, -152, -152,
			 -152, -152, -152, -152, -152, -152, -152, -152, -152, -152,
			 -152, -152, -152, -152, -152, -152, -152, -152, -152, -152,
			 -152, -152, -152, -152, -152, -152, -152, -152, -152, -152,
			 -152, -152, -152, -152, -152, -152, -152, -152, -152, -152,
			 -152, -152, -152, -152, -152, -152, -152, -152, -152, -152,
			 -152, -152, -152, -152, -152, -152, -152, -152, -152, -152,
			 -152, -152, -152, -152, -152, -152, -152, -152, -152, -152,

			 -152, -152, -152, -152, -152, -152, -152, -152, -152, -152,
			 -152, -152, -152, -152, -152, -152, -152, -152, -152, -152,
			 -152,    5, -153, -153, -153, -153, -153, -153, -153, -153,
			 -153, -153, -153, -153, -153, -153, -153, -153, -153, -153,
			 -153, -153, -153, -153, -153, -153, -153, -153, -153, -153,
			 -153, -153, -153,   64, -153, -153, -153, -153, -153, -153,
			 -153, -153, -153, -153, -153, -153, -153, -153, -153,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65, -153,
			 -153, -153, -153, -153, -153, -153,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,

			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65, -153, -153, -153, -153,   65, -153,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65, -153, -153, -153, -153, -153, -153,
			 -153, -153, -153, -153, -153, -153, -153, -153, -153, -153,
			 -153, -153, -153, -153, -153, -153, -153, -153, -153, -153,
			 -153, -153, -153, -153, -153, -153, -153, -153, -153, -153,
			 -153, -153, -153, -153, -153, -153, -153, -153, -153, -153,
			 -153, -153, -153, -153, -153, -153, -153, -153, -153, -153,

			 -153, -153, -153, -153, -153, -153, -153, -153, -153, -153,
			 -153, -153, -153, -153, -153, -153, -153, -153, -153, -153,
			 -153, -153, -153, -153, -153, -153, -153, -153, -153, -153,
			 -153, -153, -153, -153, -153, -153, -153, -153, -153, -153,
			 -153, -153, -153, -153, -153, -153, -153, -153, -153, -153,
			 -153, -153, -153, -153, -153, -153, -153, -153, -153, -153,
			 -153, -153, -153, -153, -153, -153, -153, -153, -153, -153,
			 -153, -153, -153, -153, -153, -153, -153, -153,    5, -154,
			 -154, -154, -154, -154, -154, -154, -154, -154, -154, -154,
			 -154, -154, -154, -154, -154, -154, -154, -154, -154, -154,

			 -154, -154, -154, -154, -154, -154, -154, -154, -154, -154,
			 -154, -154, -154, -154, -154, -154, -154, -154, -154, -154,
			 -154, -154, -154, -154, -154, -154,  154,  154,  154,  154,
			  154,  154,  154,  154,  154,  154, -154, -154, -154, -154,
			 -154, -154, -154, -154, -154, -154, -154, -154, -154, -154,
			 -154, -154, -154, -154, -154, -154, -154, -154, -154, -154,
			 -154,  166, -154, -154, -154, -154, -154, -154, -154, -154,
			 -154, -154, -154, -154, -154, -154, -154, -154, -154, -154,
			 -154, -154, -154, -154, -154, -154, -154, -154, -154, -154,
			 -154, -154, -154,  166, -154, -154, -154, -154, -154, -154,

			 -154, -154, -154, -154, -154, -154, -154, -154, -154, -154,
			 -154, -154, -154, -154, -154, -154, -154, -154, -154, -154,
			 -154, -154, -154, -154, -154, -154, -154, -154, -154, -154,
			 -154, -154, -154, -154, -154, -154, -154, -154, -154, -154,
			 -154, -154, -154, -154, -154, -154, -154, -154, -154, -154,
			 -154, -154, -154, -154, -154, -154, -154, -154, -154, -154,
			 -154, -154, -154, -154, -154, -154, -154, -154, -154, -154,
			 -154, -154, -154, -154, -154, -154, -154, -154, -154, -154,
			 -154, -154, -154, -154, -154, -154, -154, -154, -154, -154,
			 -154, -154, -154, -154, -154, -154, -154, -154, -154, -154,

			 -154, -154, -154, -154, -154, -154, -154, -154, -154, -154,
			 -154, -154, -154, -154, -154, -154, -154, -154, -154, -154,
			 -154, -154, -154, -154, -154, -154, -154, -154, -154, -154,
			 -154, -154, -154, -154, -154,    5, -155, -155, -155, -155,
			 -155, -155, -155, -155, -155, -155, -155, -155, -155, -155,
			 -155, -155, -155, -155, -155, -155, -155, -155, -155, -155,
			 -155, -155, -155, -155, -155, -155, -155,   64, -155, -155,
			 -155, -155, -155, -155, -155, -155, -155, -155, -155,  137,
			 -155,  137, -155,  155,  155,  155,  155,  155,  155,  155,
			  155,  155,  155, -155, -155, -155, -155, -155, -155, -155,

			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,  139,   65,   65,   65,   65,   65,  140,   65,
			   65,   65,   65,   65,   65,   65, -155, -155, -155, -155,
			   65, -155,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,  139,   65,   65,   65,   65,   65,
			  140,   65,   65,   65,   65,   65,   65,   65, -155, -155,
			 -155, -155, -155, -155, -155, -155, -155, -155, -155, -155,
			 -155, -155, -155, -155, -155, -155, -155, -155, -155, -155,
			 -155, -155, -155, -155, -155, -155, -155, -155, -155, -155,
			 -155, -155, -155, -155, -155, -155, -155, -155, -155, -155, yy_Dummy>>,
			1, 1000, 39000)
		end

	yy_nxt_template_41 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			 -155, -155, -155, -155, -155, -155, -155, -155, -155, -155,
			 -155, -155, -155, -155, -155, -155, -155, -155, -155, -155,
			 -155, -155, -155, -155, -155, -155, -155, -155, -155, -155,
			 -155, -155, -155, -155, -155, -155, -155, -155, -155, -155,
			 -155, -155, -155, -155, -155, -155, -155, -155, -155, -155,
			 -155, -155, -155, -155, -155, -155, -155, -155, -155, -155,
			 -155, -155, -155, -155, -155, -155, -155, -155, -155, -155,
			 -155, -155, -155, -155, -155, -155, -155, -155, -155, -155,
			 -155, -155, -155, -155, -155, -155, -155, -155, -155, -155,
			 -155, -155,    5, -156, -156, -156, -156, -156, -156, -156,

			 -156, -156, -156, -156, -156, -156, -156, -156, -156, -156,
			 -156, -156, -156, -156, -156, -156, -156, -156, -156, -156,
			 -156, -156, -156, -156,   64, -156, -156, -156, -156, -156,
			 -156, -156, -156, -156, -156, -156,  137, -156,  137, -156,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			 -156, -156, -156, -156, -156, -156, -156,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,  140,   65,   65,   65,   65,
			   65,   65,   65, -156, -156, -156, -156,   65, -156,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,

			   65,   65,   65,   65,   65,   65,   65,  140,   65,   65,
			   65,   65,   65,   65,   65, -156, -156, -156, -156, -156,
			 -156, -156, -156, -156, -156, -156, -156, -156, -156, -156,
			 -156, -156, -156, -156, -156, -156, -156, -156, -156, -156,
			 -156, -156, -156, -156, -156, -156, -156, -156, -156, -156,
			 -156, -156, -156, -156, -156, -156, -156, -156, -156, -156,
			 -156, -156, -156, -156, -156, -156, -156, -156, -156, -156,
			 -156, -156, -156, -156, -156, -156, -156, -156, -156, -156,
			 -156, -156, -156, -156, -156, -156, -156, -156, -156, -156,
			 -156, -156, -156, -156, -156, -156, -156, -156, -156, -156,

			 -156, -156, -156, -156, -156, -156, -156, -156, -156, -156,
			 -156, -156, -156, -156, -156, -156, -156, -156, -156, -156,
			 -156, -156, -156, -156, -156, -156, -156, -156, -156, -156,
			 -156, -156, -156, -156, -156, -156, -156, -156, -156, -156,
			 -156, -156, -156, -156, -156, -156, -156, -156, -156,    5,
			 -157, -157, -157, -157, -157, -157, -157, -157,  157, -157,
			 -157, -157, -157, -157, -157, -157, -157, -157, -157, -157,
			 -157, -157, -157, -157, -157, -157, -157, -157, -157, -157,
			 -157,  157, -157, -157, -157, -157, -157, -157, -157, -157,
			 -157, -157, -157, -157, -157, -157, -157, -157, -157, -157,

			 -157, -157, -157, -157, -157, -157, -157, -157, -157, -157,
			 -157, -157, -157, -157, -157, -157, -157, -157, -157, -157,
			 -157, -157, -157, -157, -157, -157, -157, -157, -157, -157,
			 -157, -157, -157, -157, -157, -157, -157, -157, -157, -157,
			 -157, -157,  159, -157, -157, -157, -157, -157, -157, -157,
			 -157, -157, -157, -157, -157, -157, -157, -157, -157, -157,
			 -157, -157, -157, -157, -157, -157, -157, -157, -157, -157,
			 -157, -157, -157, -157, -157, -157, -157, -157, -157, -157,
			 -157, -157, -157, -157, -157, -157, -157, -157, -157, -157,
			 -157, -157, -157, -157, -157, -157, -157, -157, -157, -157,

			 -157, -157, -157, -157, -157, -157, -157, -157, -157, -157,
			 -157, -157, -157, -157, -157, -157, -157, -157, -157, -157,
			 -157, -157, -157, -157, -157, -157, -157, -157, -157, -157,
			 -157, -157, -157, -157, -157, -157, -157, -157, -157, -157,
			 -157, -157, -157, -157, -157, -157, -157, -157, -157, -157,
			 -157, -157, -157, -157, -157, -157, -157, -157, -157, -157,
			 -157, -157, -157, -157, -157, -157, -157, -157, -157, -157,
			 -157, -157, -157, -157, -157, -157, -157, -157, -157, -157,
			 -157, -157, -157, -157, -157, -157, -157, -157, -157, -157,
			 -157, -157, -157, -157, -157, -157, -157, -157, -157, -157,

			 -157, -157, -157, -157, -157, -157,    5, -158, -158, -158,
			 -158, -158, -158, -158, -158, -158, -158, -158, -158, -158,
			 -158, -158, -158, -158, -158, -158, -158, -158, -158, -158,
			 -158, -158, -158, -158, -158, -158, -158, -158, -158, -158,
			 -158, -158, -158, -158, -158, -158, -158, -158, -158, -158,
			 -158,  158,  158, -158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158, -158, -158, -158, -158, -158, -158,
			 -158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158, -158, -158,  167,

			 -158,  158, -158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158, -158,
			 -158, -158, -158, -158, -158, -158, -158, -158, -158, -158,
			 -158, -158, -158, -158, -158, -158, -158, -158, -158, -158,
			 -158, -158, -158, -158, -158, -158, -158, -158, -158, -158,
			 -158, -158, -158, -158, -158, -158, -158, -158, -158, -158,
			 -158, -158, -158, -158, -158, -158, -158, -158, -158, -158,
			 -158, -158, -158, -158, -158, -158, -158, -158, -158, -158,
			 -158, -158, -158, -158, -158, -158, -158, -158, -158, -158,

			 -158, -158, -158, -158, -158, -158, -158, -158, -158, -158,
			 -158, -158, -158, -158, -158, -158, -158, -158, -158, -158,
			 -158, -158, -158, -158, -158, -158, -158, -158, -158, -158,
			 -158, -158, -158, -158, -158, -158, -158, -158, -158, -158,
			 -158, -158, -158, -158, -158, -158, -158, -158, -158, -158,
			 -158, -158, -158, -158, -158, -158, -158, -158, -158, -158,
			 -158, -158, -158,    5, -159, -159, -159, -159, -159, -159,
			 -159, -159, -159, -159, -159, -159, -159, -159, -159, -159,
			 -159, -159, -159, -159, -159, -159, -159, -159, -159, -159,
			 -159, -159, -159, -159, -159, -159, -159, -159, -159, -159,

			 -159, -159, -159, -159, -159, -159, -159, -159, -159, -159,
			 -159, -159, -159, -159, -159, -159, -159, -159, -159, -159,
			 -159, -159, -159, -159, -159, -159, -159, -159, -159, -159,
			 -159, -159, -159, -159, -159, -159, -159, -159, -159, -159,
			 -159, -159, -159, -159, -159, -159, -159, -159, -159, -159,
			 -159, -159, -159, -159, -159, -159, -159, -159, -159, -159,
			 -159, -159, -159, -159, -159, -159, -159, -159, -159, -159,
			 -159, -159, -159, -159, -159, -159, -159, -159, -159, -159,
			 -159, -159, -159, -159, -159, -159, -159, -159, -159, -159,
			 -159, -159, -159, -159, -159, -159, -159, -159, -159, -159, yy_Dummy>>,
			1, 1000, 40000)
		end

	yy_nxt_template_42 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			 -159, -159, -159, -159, -159, -159, -159, -159, -159, -159,
			 -159, -159, -159, -159, -159, -159, -159, -159, -159, -159,
			 -159, -159, -159, -159, -159, -159, -159, -159, -159, -159,
			 -159, -159, -159, -159, -159, -159, -159, -159, -159, -159,
			 -159, -159, -159, -159, -159, -159, -159, -159, -159, -159,
			 -159, -159, -159, -159, -159, -159, -159, -159, -159, -159,
			 -159, -159, -159, -159, -159, -159, -159, -159, -159, -159,
			 -159, -159, -159, -159, -159, -159, -159, -159, -159, -159,
			 -159, -159, -159, -159, -159, -159, -159, -159, -159, -159,
			 -159, -159, -159, -159, -159, -159, -159, -159, -159, -159,

			 -159, -159, -159, -159, -159, -159, -159, -159, -159, -159,
			 -159, -159, -159, -159, -159, -159, -159, -159, -159, -159,
			    5, -160, -160, -160, -160, -160, -160, -160, -160, -160,
			 -160, -160, -160, -160, -160, -160, -160, -160, -160, -160,
			 -160, -160, -160, -160, -160, -160, -160, -160, -160, -160,
			 -160, -160, -160, -160, -160, -160, -160, -160, -160, -160,
			 -160, -160, -160, -160, -160, -160, -160, -160,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71, -160, -160,
			 -160, -160, -160, -160, -160,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,

			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71, -160, -160, -160, -160,   71, -160,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71, -160, -160, -160, -160, -160, -160, -160,
			 -160, -160, -160, -160, -160, -160, -160, -160, -160, -160,
			 -160, -160, -160, -160, -160, -160, -160, -160, -160, -160,
			 -160, -160, -160, -160, -160, -160, -160, -160, -160, -160,
			 -160, -160, -160, -160, -160, -160, -160, -160, -160, -160,
			 -160, -160, -160, -160, -160, -160, -160, -160, -160, -160,

			 -160, -160, -160, -160, -160, -160, -160, -160, -160, -160,
			 -160, -160, -160, -160, -160, -160, -160, -160, -160, -160,
			 -160, -160, -160, -160, -160, -160, -160, -160, -160, -160,
			 -160, -160, -160, -160, -160, -160, -160, -160, -160, -160,
			 -160, -160, -160, -160, -160, -160, -160, -160, -160, -160,
			 -160, -160, -160, -160, -160, -160, -160, -160, -160, -160,
			 -160, -160, -160, -160, -160, -160, -160, -160, -160, -160,
			 -160, -160, -160, -160, -160, -160, -160,    5, -161, -161,
			 -161, -161, -161, -161, -161, -161, -161, -161, -161, -161,
			 -161, -161, -161, -161, -161, -161, -161, -161, -161, -161,

			 -161, -161, -161, -161, -161, -161, -161, -161, -161, -161,
			 -161, -161, -161, -161, -161, -161, -161, -161, -161, -161,
			 -161, -161, -161, -161, -161,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   72, -161, -161, -161, -161,
			 -161, -161,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71, -161, -161,
			 -161, -161,   71, -161,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,

			 -161, -161, -161, -161, -161, -161, -161, -161, -161, -161,
			 -161, -161, -161, -161, -161, -161, -161, -161, -161, -161,
			 -161, -161, -161, -161, -161, -161, -161, -161, -161, -161,
			 -161, -161, -161, -161, -161, -161, -161, -161, -161, -161,
			 -161, -161, -161, -161, -161, -161, -161, -161, -161, -161,
			 -161, -161, -161, -161, -161, -161, -161, -161, -161, -161,
			 -161, -161, -161, -161, -161, -161, -161, -161, -161, -161,
			 -161, -161, -161, -161, -161, -161, -161, -161, -161, -161,
			 -161, -161, -161, -161, -161, -161, -161, -161, -161, -161,
			 -161, -161, -161, -161, -161, -161, -161, -161, -161, -161,

			 -161, -161, -161, -161, -161, -161, -161, -161, -161, -161,
			 -161, -161, -161, -161, -161, -161, -161, -161, -161, -161,
			 -161, -161, -161, -161, -161, -161, -161, -161, -161, -161,
			 -161, -161, -161, -161,    5, -162, -162, -162, -162, -162,
			 -162, -162, -162, -162, -162, -162, -162, -162, -162, -162,
			 -162, -162, -162, -162, -162, -162, -162, -162, -162, -162,
			 -162, -162, -162, -162, -162, -162, -162, -162, -162, -162,
			 -162, -162, -162, -162, -162, -162, -162, -162, -162, -162,
			 -162, -162,  168,  168,  168,  168,  168,  168,  168,  168,
			  168,  168, -162, -162, -162, -162, -162, -162, -162, -162,

			 -162, -162, -162, -162, -162, -162, -162, -162, -162, -162,
			 -162, -162, -162, -162, -162, -162, -162, -162, -162, -162,
			 -162, -162, -162, -162, -162, -162, -162, -162, -162, -162,
			 -162, -162, -162, -162, -162, -162, -162, -162, -162, -162,
			 -162, -162, -162, -162, -162, -162, -162, -162, -162, -162,
			 -162, -162, -162, -162, -162, -162, -162, -162, -162, -162,
			 -162, -162, -162, -162, -162, -162, -162, -162, -162, -162,
			 -162, -162, -162, -162, -162, -162, -162, -162, -162, -162,
			 -162, -162, -162, -162, -162, -162, -162, -162, -162, -162,
			 -162, -162, -162, -162, -162, -162, -162, -162, -162, -162,

			 -162, -162, -162, -162, -162, -162, -162, -162, -162, -162,
			 -162, -162, -162, -162, -162, -162, -162, -162, -162, -162,
			 -162, -162, -162, -162, -162, -162, -162, -162, -162, -162,
			 -162, -162, -162, -162, -162, -162, -162, -162, -162, -162,
			 -162, -162, -162, -162, -162, -162, -162, -162, -162, -162,
			 -162, -162, -162, -162, -162, -162, -162, -162, -162, -162,
			 -162, -162, -162, -162, -162, -162, -162, -162, -162, -162,
			 -162, -162, -162, -162, -162, -162, -162, -162, -162, -162,
			 -162, -162, -162, -162, -162, -162, -162, -162, -162, -162,
			 -162,    5, -163, -163, -163, -163, -163, -163, -163, -163,

			 -163, -163, -163, -163, -163, -163, -163, -163, -163, -163,
			 -163, -163, -163, -163, -163, -163, -163, -163, -163, -163,
			 -163, -163, -163, -163, -163, -163, -163, -163, -163, -163,
			 -163, -163, -163, -163, -163, -163, -163, -163, -163,  169,
			  169,  169,  169,  169,  169,  169,  169,  169,  169, -163,
			 -163, -163, -163, -163, -163, -163, -163, -163, -163, -163,
			 -163, -163, -163, -163, -163, -163, -163, -163, -163, -163,
			 -163, -163, -163, -163, -163, -163, -163, -163, -163, -163,
			 -163, -163, -163, -163, -163, -163, -163, -163, -163, -163,
			 -163, -163, -163, -163, -163, -163, -163, -163, -163, -163, yy_Dummy>>,
			1, 1000, 41000)
		end

	yy_nxt_template_43 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			 -163, -163, -163, -163, -163, -163, -163, -163, -163, -163,
			 -163, -163, -163, -163, -163, -163, -163, -163, -163, -163,
			 -163, -163, -163, -163, -163, -163, -163, -163, -163, -163,
			 -163, -163, -163, -163, -163, -163, -163, -163, -163, -163,
			 -163, -163, -163, -163, -163, -163, -163, -163, -163, -163,
			 -163, -163, -163, -163, -163, -163, -163, -163, -163, -163,
			 -163, -163, -163, -163, -163, -163, -163, -163, -163, -163,
			 -163, -163, -163, -163, -163, -163, -163, -163, -163, -163,
			 -163, -163, -163, -163, -163, -163, -163, -163, -163, -163,
			 -163, -163, -163, -163, -163, -163, -163, -163, -163, -163,

			 -163, -163, -163, -163, -163, -163, -163, -163, -163, -163,
			 -163, -163, -163, -163, -163, -163, -163, -163, -163, -163,
			 -163, -163, -163, -163, -163, -163, -163, -163, -163, -163,
			 -163, -163, -163, -163, -163, -163, -163, -163, -163, -163,
			 -163, -163, -163, -163, -163, -163, -163, -163,    5, -164,
			 -164, -164, -164, -164, -164, -164, -164, -164, -164, -164,
			 -164, -164, -164, -164, -164, -164, -164, -164, -164, -164,
			 -164, -164, -164, -164, -164, -164, -164, -164, -164, -164,
			 -164, -164, -164, -164, -164, -164, -164, -164, -164, -164,
			 -164, -164, -164, -164, -164, -164,  170,  170,  170,  170,

			  170,  170,  170, -164, -164, -164, -164, -164, -164, -164,
			 -164, -164, -164, -164, -164, -164, -164, -164, -164, -164,
			 -164, -164, -164, -164, -164, -164, -164, -164, -164, -164,
			 -164, -164, -164, -164, -164, -164, -164, -164, -164, -164,
			 -164, -164, -164, -164, -164, -164, -164, -164, -164, -164,
			 -164, -164, -164, -164, -164, -164, -164, -164, -164, -164,
			 -164, -164, -164, -164, -164, -164, -164, -164, -164, -164,
			 -164, -164, -164, -164, -164, -164, -164, -164, -164, -164,
			 -164, -164, -164, -164, -164, -164, -164, -164, -164, -164,
			 -164, -164, -164, -164, -164, -164, -164, -164, -164, -164,

			 -164, -164, -164, -164, -164, -164, -164, -164, -164, -164,
			 -164, -164, -164, -164, -164, -164, -164, -164, -164, -164,
			 -164, -164, -164, -164, -164, -164, -164, -164, -164, -164,
			 -164, -164, -164, -164, -164, -164, -164, -164, -164, -164,
			 -164, -164, -164, -164, -164, -164, -164, -164, -164, -164,
			 -164, -164, -164, -164, -164, -164, -164, -164, -164, -164,
			 -164, -164, -164, -164, -164, -164, -164, -164, -164, -164,
			 -164, -164, -164, -164, -164, -164, -164, -164, -164, -164,
			 -164, -164, -164, -164, -164, -164, -164, -164, -164, -164,
			 -164, -164, -164, -164, -164, -164, -164, -164, -164, -164,

			 -164, -164, -164, -164, -164,    5, -165, -165, -165, -165,
			 -165, -165, -165, -165, -165, -165, -165, -165, -165, -165,
			 -165, -165, -165, -165, -165, -165, -165, -165, -165, -165,
			 -165, -165, -165, -165, -165, -165, -165, -165, -165, -165,
			 -165, -165, -165, -165, -165, -165, -165, -165, -165, -165,
			 -165, -165, -165, -165, -165, -165, -165, -165, -165, -165,
			 -165, -165, -165, -165, -165, -165, -165, -165, -165, -165,
			 -165, -165, -165, -165, -165, -165, -165, -165, -165, -165,
			 -165, -165, -165, -165, -165, -165, -165, -165, -165, -165,
			 -165, -165, -165, -165, -165, -165, -165, -165, -165, -165,

			 -165, -165, -165, -165, -165, -165, -165, -165, -165, -165,
			 -165, -165, -165, -165, -165, -165, -165, -165, -165, -165,
			 -165, -165, -165, -165, -165, -165, -165, -165, -165, -165,
			 -165, -165, -165, -165, -165, -165, -165, -165, -165, -165,
			 -165, -165, -165, -165, -165, -165, -165, -165, -165, -165,
			 -165, -165, -165, -165, -165, -165, -165, -165, -165, -165,
			 -165, -165, -165, -165, -165, -165, -165, -165, -165, -165,
			 -165, -165, -165, -165, -165, -165, -165, -165, -165, -165,
			 -165, -165, -165, -165, -165, -165, -165, -165, -165, -165,
			 -165, -165, -165, -165, -165, -165, -165, -165, -165, -165,

			 -165, -165, -165, -165, -165, -165, -165, -165, -165, -165,
			 -165, -165, -165, -165, -165, -165, -165, -165, -165, -165,
			 -165, -165, -165, -165, -165, -165, -165, -165, -165, -165,
			 -165, -165, -165, -165, -165, -165, -165, -165, -165, -165,
			 -165, -165, -165, -165, -165, -165, -165, -165, -165, -165,
			 -165, -165, -165, -165, -165, -165, -165, -165, -165, -165,
			 -165, -165,    5, -166, -166, -166, -166, -166, -166, -166,
			 -166, -166, -166, -166, -166, -166, -166, -166, -166, -166,
			 -166, -166, -166, -166, -166, -166, -166, -166, -166, -166,
			 -166, -166, -166, -166, -166, -166, -166, -166, -166, -166,

			 -166, -166, -166, -166, -166, -166, -166, -166, -166, -166,
			 -166, -166, -166, -166, -166, -166, -166, -166, -166, -166,
			 -166, -166, -166, -166, -166, -166, -166, -166, -166, -166,
			 -166, -166, -166, -166, -166, -166, -166, -166, -166, -166,
			 -166, -166, -166, -166, -166, -166, -166, -166, -166, -166,
			 -166, -166, -166, -166, -166, -166, -166, -166, -166, -166,
			 -166, -166, -166, -166, -166, -166, -166, -166, -166, -166,
			 -166, -166, -166, -166, -166, -166, -166, -166, -166, -166,
			 -166, -166, -166, -166, -166, -166, -166, -166, -166, -166,
			 -166, -166, -166, -166, -166, -166, -166, -166, -166, -166,

			 -166, -166, -166, -166, -166, -166, -166, -166, -166, -166,
			 -166, -166, -166, -166, -166, -166, -166, -166, -166, -166,
			 -166, -166, -166, -166, -166, -166, -166, -166, -166, -166,
			 -166, -166, -166, -166, -166, -166, -166, -166, -166, -166,
			 -166, -166, -166, -166, -166, -166, -166, -166, -166, -166,
			 -166, -166, -166, -166, -166, -166, -166, -166, -166, -166,
			 -166, -166, -166, -166, -166, -166, -166, -166, -166, -166,
			 -166, -166, -166, -166, -166, -166, -166, -166, -166, -166,
			 -166, -166, -166, -166, -166, -166, -166, -166, -166, -166,
			 -166, -166, -166, -166, -166, -166, -166, -166, -166, -166,

			 -166, -166, -166, -166, -166, -166, -166, -166, -166, -166,
			 -166, -166, -166, -166, -166, -166, -166, -166, -166,    5,
			 -167, -167, -167, -167, -167, -167, -167, -167, -167, -167,
			 -167, -167, -167, -167, -167, -167, -167, -167, -167, -167,
			 -167, -167, -167, -167, -167, -167, -167, -167, -167, -167,
			 -167, -167, -167, -167, -167, -167, -167, -167, -167, -167,
			 -167, -167, -167, -167, -167, -167, -167, -167, -167, -167,
			 -167, -167, -167, -167, -167, -167, -167, -167, -167, -167,
			 -167, -167, -167, -167, -167, -167, -167, -167, -167, -167,
			 -167, -167, -167, -167, -167, -167, -167, -167, -167, -167, yy_Dummy>>,
			1, 1000, 42000)
		end

	yy_nxt_template_44 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			 -167, -167, -167, -167, -167, -167, -167, -167, -167, -167,
			 -167, -167, -167, -167, -167, -167, -167, -167, -167, -167,
			 -167, -167, -167, -167, -167, -167, -167, -167, -167, -167,
			 -167, -167, -167, -167, -167, -167, -167, -167, -167, -167,
			 -167, -167, -167, -167, -167, -167, -167, -167, -167, -167,
			 -167, -167, -167, -167, -167, -167, -167, -167, -167, -167,
			 -167, -167, -167, -167, -167, -167, -167, -167, -167, -167,
			 -167, -167, -167, -167, -167, -167, -167, -167, -167, -167,
			 -167, -167, -167, -167, -167, -167, -167, -167, -167, -167,
			 -167, -167, -167, -167, -167, -167, -167, -167, -167, -167,

			 -167, -167, -167, -167, -167, -167, -167, -167, -167, -167,
			 -167, -167, -167, -167, -167, -167, -167, -167, -167, -167,
			 -167, -167, -167, -167, -167, -167, -167, -167, -167, -167,
			 -167, -167, -167, -167, -167, -167, -167, -167, -167, -167,
			 -167, -167, -167, -167, -167, -167, -167, -167, -167, -167,
			 -167, -167, -167, -167, -167, -167, -167, -167, -167, -167,
			 -167, -167, -167, -167, -167, -167, -167, -167, -167, -167,
			 -167, -167, -167, -167, -167, -167,    5, -168, -168, -168,
			 -168, -168, -168, -168, -168, -168, -168, -168, -168, -168,
			 -168, -168, -168, -168, -168, -168, -168, -168, -168, -168,

			 -168, -168, -168, -168, -168, -168, -168, -168, -168, -168,
			 -168, -168, -168, -168, -168, -168, -168, -168, -168, -168,
			 -168,  171, -168, -168, -168, -168, -168, -168, -168, -168,
			 -168, -168, -168, -168, -168, -168, -168, -168, -168, -168,
			 -168, -168, -168, -168, -168, -168, -168, -168, -168, -168,
			 -168, -168, -168, -168, -168, -168, -168, -168, -168, -168,
			 -168, -168, -168, -168, -168, -168, -168, -168, -168, -168,
			 -168, -168, -168, -168, -168, -168, -168, -168, -168, -168,
			 -168, -168, -168, -168, -168, -168, -168, -168, -168, -168,
			 -168, -168, -168, -168, -168, -168, -168, -168, -168, -168,

			 -168, -168, -168, -168, -168, -168, -168, -168, -168, -168,
			 -168, -168, -168, -168, -168, -168, -168, -168, -168, -168,
			 -168, -168, -168, -168, -168, -168, -168, -168, -168, -168,
			 -168, -168, -168, -168, -168, -168, -168, -168, -168, -168,
			 -168, -168, -168, -168, -168, -168, -168, -168, -168, -168,
			 -168, -168, -168, -168, -168, -168, -168, -168, -168, -168,
			 -168, -168, -168, -168, -168, -168, -168, -168, -168, -168,
			 -168, -168, -168, -168, -168, -168, -168, -168, -168, -168,
			 -168, -168, -168, -168, -168, -168, -168, -168, -168, -168,
			 -168, -168, -168, -168, -168, -168, -168, -168, -168, -168,

			 -168, -168, -168, -168, -168, -168, -168, -168, -168, -168,
			 -168, -168, -168, -168, -168, -168, -168, -168, -168, -168,
			 -168, -168, -168, -168, -168, -168, -168, -168, -168, -168,
			 -168, -168, -168,    5, -169, -169, -169, -169, -169, -169,
			 -169, -169, -169, -169, -169, -169, -169, -169, -169, -169,
			 -169, -169, -169, -169, -169, -169, -169, -169, -169, -169,
			 -169, -169, -169, -169, -169, -169, -169, -169, -169, -169,
			 -169, -169, -169, -169, -169, -169, -169, -169, -169, -169,
			 -169,  172,  172,  172,  172,  172,  172,  172,  172,  172,
			  172, -169, -169, -169, -169, -169, -169, -169, -169, -169,

			 -169, -169, -169, -169, -169, -169, -169, -169, -169, -169,
			 -169, -169, -169, -169, -169, -169, -169, -169, -169, -169,
			 -169, -169, -169, -169, -169, -169, -169, -169, -169, -169,
			 -169, -169, -169, -169, -169, -169, -169, -169, -169, -169,
			 -169, -169, -169, -169, -169, -169, -169, -169, -169, -169,
			 -169, -169, -169, -169, -169, -169, -169, -169, -169, -169,
			 -169, -169, -169, -169, -169, -169, -169, -169, -169, -169,
			 -169, -169, -169, -169, -169, -169, -169, -169, -169, -169,
			 -169, -169, -169, -169, -169, -169, -169, -169, -169, -169,
			 -169, -169, -169, -169, -169, -169, -169, -169, -169, -169,

			 -169, -169, -169, -169, -169, -169, -169, -169, -169, -169,
			 -169, -169, -169, -169, -169, -169, -169, -169, -169, -169,
			 -169, -169, -169, -169, -169, -169, -169, -169, -169, -169,
			 -169, -169, -169, -169, -169, -169, -169, -169, -169, -169,
			 -169, -169, -169, -169, -169, -169, -169, -169, -169, -169,
			 -169, -169, -169, -169, -169, -169, -169, -169, -169, -169,
			 -169, -169, -169, -169, -169, -169, -169, -169, -169, -169,
			 -169, -169, -169, -169, -169, -169, -169, -169, -169, -169,
			 -169, -169, -169, -169, -169, -169, -169, -169, -169, -169,
			    5, -170, -170, -170, -170, -170, -170, -170, -170, -170,

			 -170, -170, -170, -170, -170, -170, -170, -170, -170, -170,
			 -170, -170, -170, -170, -170, -170, -170, -170, -170, -170,
			 -170, -170, -170, -170, -170, -170, -170, -170, -170, -170,
			 -170, -170, -170, -170, -170, -170, -170, -170,  173,  173,
			  173,  173,  173,  173,  173,  173,  173,  173, -170, -170,
			 -170, -170, -170, -170, -170, -170, -170, -170, -170, -170,
			 -170, -170, -170, -170, -170, -170, -170, -170, -170, -170,
			 -170, -170, -170, -170, -170, -170, -170, -170, -170, -170,
			 -170, -170, -170, -170, -170, -170, -170, -170, -170, -170,
			 -170, -170, -170, -170, -170, -170, -170, -170, -170, -170,

			 -170, -170, -170, -170, -170, -170, -170, -170, -170, -170,
			 -170, -170, -170, -170, -170, -170, -170, -170, -170, -170,
			 -170, -170, -170, -170, -170, -170, -170, -170, -170, -170,
			 -170, -170, -170, -170, -170, -170, -170, -170, -170, -170,
			 -170, -170, -170, -170, -170, -170, -170, -170, -170, -170,
			 -170, -170, -170, -170, -170, -170, -170, -170, -170, -170,
			 -170, -170, -170, -170, -170, -170, -170, -170, -170, -170,
			 -170, -170, -170, -170, -170, -170, -170, -170, -170, -170,
			 -170, -170, -170, -170, -170, -170, -170, -170, -170, -170,
			 -170, -170, -170, -170, -170, -170, -170, -170, -170, -170,

			 -170, -170, -170, -170, -170, -170, -170, -170, -170, -170,
			 -170, -170, -170, -170, -170, -170, -170, -170, -170, -170,
			 -170, -170, -170, -170, -170, -170, -170, -170, -170, -170,
			 -170, -170, -170, -170, -170, -170, -170, -170, -170, -170,
			 -170, -170, -170, -170, -170, -170, -170,    5, -171, -171,
			 -171, -171, -171, -171, -171, -171, -171, -171, -171, -171,
			 -171, -171, -171, -171, -171, -171, -171, -171, -171, -171,
			 -171, -171, -171, -171, -171, -171, -171, -171, -171, -171,
			 -171, -171, -171, -171, -171, -171, -171, -171, -171, -171,
			 -171, -171, -171, -171, -171,  174,  174,  174,  174, -171, yy_Dummy>>,
			1, 1000, 43000)
		end

	yy_nxt_template_45 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			 -171, -171, -171, -171, -171, -171, -171, -171, -171, -171,
			 -171, -171, -171, -171, -171, -171, -171, -171, -171, -171,
			 -171, -171, -171, -171, -171, -171, -171, -171, -171, -171,
			 -171, -171, -171, -171, -171, -171, -171, -171, -171, -171,
			 -171, -171, -171, -171, -171, -171, -171, -171, -171, -171,
			 -171, -171, -171, -171, -171, -171, -171, -171, -171, -171,
			 -171, -171, -171, -171, -171, -171, -171, -171, -171, -171,
			 -171, -171, -171, -171, -171, -171, -171, -171, -171, -171,
			 -171, -171, -171, -171, -171, -171, -171, -171, -171, -171,
			 -171, -171, -171, -171, -171, -171, -171, -171, -171, -171,

			 -171, -171, -171, -171, -171, -171, -171, -171, -171, -171,
			 -171, -171, -171, -171, -171, -171, -171, -171, -171, -171,
			 -171, -171, -171, -171, -171, -171, -171, -171, -171, -171,
			 -171, -171, -171, -171, -171, -171, -171, -171, -171, -171,
			 -171, -171, -171, -171, -171, -171, -171, -171, -171, -171,
			 -171, -171, -171, -171, -171, -171, -171, -171, -171, -171,
			 -171, -171, -171, -171, -171, -171, -171, -171, -171, -171,
			 -171, -171, -171, -171, -171, -171, -171, -171, -171, -171,
			 -171, -171, -171, -171, -171, -171, -171, -171, -171, -171,
			 -171, -171, -171, -171, -171, -171, -171, -171, -171, -171,

			 -171, -171, -171, -171,    5, -172, -172, -172, -172, -172,
			 -172, -172, -172, -172, -172, -172, -172, -172, -172, -172,
			 -172, -172, -172, -172, -172, -172, -172, -172, -172, -172,
			 -172, -172, -172, -172, -172, -172, -172, -172, -172, -172,
			 -172, -172, -172, -172, -172, -172, -172, -172, -172, -172,
			 -172, -172,  175,  175,  175,  175,  175,  175,  175,  175,
			  175,  175, -172, -172, -172, -172, -172, -172, -172, -172,
			 -172, -172, -172, -172, -172, -172, -172, -172, -172, -172,
			 -172, -172, -172, -172, -172, -172, -172, -172, -172, -172,
			 -172, -172, -172, -172, -172, -172, -172, -172, -172, -172,

			 -172, -172, -172, -172, -172, -172, -172, -172, -172, -172,
			 -172, -172, -172, -172, -172, -172, -172, -172, -172, -172,
			 -172, -172, -172, -172, -172, -172, -172, -172, -172, -172,
			 -172, -172, -172, -172, -172, -172, -172, -172, -172, -172,
			 -172, -172, -172, -172, -172, -172, -172, -172, -172, -172,
			 -172, -172, -172, -172, -172, -172, -172, -172, -172, -172,
			 -172, -172, -172, -172, -172, -172, -172, -172, -172, -172,
			 -172, -172, -172, -172, -172, -172, -172, -172, -172, -172,
			 -172, -172, -172, -172, -172, -172, -172, -172, -172, -172,
			 -172, -172, -172, -172, -172, -172, -172, -172, -172, -172,

			 -172, -172, -172, -172, -172, -172, -172, -172, -172, -172,
			 -172, -172, -172, -172, -172, -172, -172, -172, -172, -172,
			 -172, -172, -172, -172, -172, -172, -172, -172, -172, -172,
			 -172, -172, -172, -172, -172, -172, -172, -172, -172, -172,
			 -172, -172, -172, -172, -172, -172, -172, -172, -172, -172,
			 -172, -172, -172, -172, -172, -172, -172, -172, -172, -172,
			 -172,    5, -173, -173, -173, -173, -173, -173, -173, -173,
			 -173, -173, -173, -173, -173, -173, -173, -173, -173, -173,
			 -173, -173, -173, -173, -173, -173, -173, -173, -173, -173,
			 -173, -173, -173, -173, -173, -173, -173, -173, -173, -173,

			 -173, -173, -173, -173,  176,  177,  176,  177, -173, -173,
			 -173, -173, -173, -173, -173, -173, -173, -173, -173, -173,
			 -173, -173, -173, -173, -173, -173, -173, -173, -173, -173,
			 -173, -173, -173, -173, -173, -173, -173, -173, -173, -173,
			 -173, -173, -173, -173, -173, -173, -173, -173, -173, -173,
			 -173,  178, -173, -173, -173, -173, -173, -173, -173, -173,
			 -173, -173, -173, -173, -173, -173, -173, -173, -173, -173,
			 -173, -173, -173, -173, -173, -173, -173, -173, -173, -173,
			 -173, -173, -173, -173, -173, -173, -173, -173, -173, -173,
			 -173, -173, -173, -173, -173, -173, -173, -173, -173, -173,

			 -173, -173, -173, -173, -173, -173, -173, -173, -173, -173,
			 -173, -173, -173, -173, -173, -173, -173, -173, -173, -173,
			 -173, -173, -173, -173, -173, -173, -173, -173, -173, -173,
			 -173, -173, -173, -173, -173, -173, -173, -173, -173, -173,
			 -173, -173, -173, -173, -173, -173, -173, -173, -173, -173,
			 -173, -173, -173, -173, -173, -173, -173, -173, -173, -173,
			 -173, -173, -173, -173, -173, -173, -173, -173, -173, -173,
			 -173, -173, -173, -173, -173, -173, -173, -173, -173, -173,
			 -173, -173, -173, -173, -173, -173, -173, -173, -173, -173,
			 -173, -173, -173, -173, -173, -173, -173, -173, -173, -173,

			 -173, -173, -173, -173, -173, -173, -173, -173, -173, -173,
			 -173, -173, -173, -173, -173, -173, -173, -173,    5, -174,
			 -174, -174, -174, -174, -174, -174, -174, -174, -174, -174,
			 -174, -174, -174, -174, -174, -174, -174, -174, -174, -174,
			 -174, -174, -174, -174, -174, -174, -174, -174, -174, -174,
			 -174, -174, -174, -174, -174, -174, -174, -174, -174, -174,
			 -174, -174, -174, -174, -174, -174,  179,  179,  179,  179,
			  179,  179,  179,  179,  179,  179, -174, -174, -174, -174,
			 -174, -174, -174, -174, -174, -174, -174, -174, -174, -174,
			 -174, -174, -174, -174, -174, -174, -174, -174, -174, -174,

			 -174, -174, -174, -174, -174, -174, -174, -174, -174, -174,
			 -174, -174, -174, -174, -174, -174, -174, -174, -174, -174,
			 -174, -174, -174, -174, -174, -174, -174, -174, -174, -174,
			 -174, -174, -174, -174, -174, -174, -174, -174, -174, -174,
			 -174, -174, -174, -174, -174, -174, -174, -174, -174, -174,
			 -174, -174, -174, -174, -174, -174, -174, -174, -174, -174,
			 -174, -174, -174, -174, -174, -174, -174, -174, -174, -174,
			 -174, -174, -174, -174, -174, -174, -174, -174, -174, -174,
			 -174, -174, -174, -174, -174, -174, -174, -174, -174, -174,
			 -174, -174, -174, -174, -174, -174, -174, -174, -174, -174,

			 -174, -174, -174, -174, -174, -174, -174, -174, -174, -174,
			 -174, -174, -174, -174, -174, -174, -174, -174, -174, -174,
			 -174, -174, -174, -174, -174, -174, -174, -174, -174, -174,
			 -174, -174, -174, -174, -174, -174, -174, -174, -174, -174,
			 -174, -174, -174, -174, -174, -174, -174, -174, -174, -174,
			 -174, -174, -174, -174, -174, -174, -174, -174, -174, -174,
			 -174, -174, -174, -174, -174, -174, -174, -174, -174, -174,
			 -174, -174, -174, -174, -174,    5, -175, -175, -175, -175,
			 -175, -175, -175, -175, -175, -175, -175, -175, -175, -175,
			 -175, -175, -175, -175, -175, -175, -175, -175, -175, -175, yy_Dummy>>,
			1, 1000, 44000)
		end

	yy_nxt_template_46 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			 -175, -175, -175, -175, -175, -175, -175, -175, -175, -175,
			 -175, -175, -175, -175, -175, -175, -175, -175, -175, -175,
			 -175, -175, -175,  165,  165,  165,  165,  165,  165,  165,
			  165,  165,  165, -175, -175, -175, -175, -175, -175, -175,
			 -175, -175, -175, -175, -175, -175, -175, -175, -175, -175,
			 -175, -175, -175, -175, -175, -175, -175, -175, -175, -175,
			 -175, -175, -175, -175, -175, -175, -175, -175, -175, -175,
			 -175, -175, -175, -175, -175, -175, -175, -175, -175, -175,
			 -175, -175, -175, -175, -175, -175, -175, -175, -175, -175,
			 -175, -175, -175, -175, -175, -175, -175, -175, -175, -175,

			 -175, -175, -175, -175, -175, -175, -175, -175, -175, -175,
			 -175, -175, -175, -175, -175, -175, -175, -175, -175, -175,
			 -175, -175, -175, -175, -175, -175, -175, -175, -175, -175,
			 -175, -175, -175, -175, -175, -175, -175, -175, -175, -175,
			 -175, -175, -175, -175, -175, -175, -175, -175, -175, -175,
			 -175, -175, -175, -175, -175, -175, -175, -175, -175, -175,
			 -175, -175, -175, -175, -175, -175, -175, -175, -175, -175,
			 -175, -175, -175, -175, -175, -175, -175, -175, -175, -175,
			 -175, -175, -175, -175, -175, -175, -175, -175, -175, -175,
			 -175, -175, -175, -175, -175, -175, -175, -175, -175, -175,

			 -175, -175, -175, -175, -175, -175, -175, -175, -175, -175,
			 -175, -175, -175, -175, -175, -175, -175, -175, -175, -175,
			 -175, -175, -175, -175, -175, -175, -175, -175, -175, -175,
			 -175, -175,    5, -176, -176, -176, -176, -176, -176, -176,
			 -176, -176, -176, -176, -176, -176, -176, -176, -176, -176,
			 -176, -176, -176, -176, -176, -176, -176, -176, -176, -176,
			 -176, -176, -176, -176, -176, -176, -176, -176, -176, -176,
			 -176, -176, -176, -176, -176, -176, -176, -176, -176, -176,
			  180,  180,  180,  180,  180,  180,  180,  180,  180,  180,
			 -176, -176, -176, -176, -176, -176, -176, -176, -176, -176,

			 -176, -176, -176, -176, -176, -176, -176, -176, -176, -176,
			 -176, -176, -176, -176, -176, -176, -176, -176, -176, -176,
			 -176, -176, -176, -176, -176, -176, -176, -176, -176, -176,
			 -176, -176, -176, -176, -176, -176, -176, -176, -176, -176,
			 -176, -176, -176, -176, -176, -176, -176, -176, -176, -176,
			 -176, -176, -176, -176, -176, -176, -176, -176, -176, -176,
			 -176, -176, -176, -176, -176, -176, -176, -176, -176, -176,
			 -176, -176, -176, -176, -176, -176, -176, -176, -176, -176,
			 -176, -176, -176, -176, -176, -176, -176, -176, -176, -176,
			 -176, -176, -176, -176, -176, -176, -176, -176, -176, -176,

			 -176, -176, -176, -176, -176, -176, -176, -176, -176, -176,
			 -176, -176, -176, -176, -176, -176, -176, -176, -176, -176,
			 -176, -176, -176, -176, -176, -176, -176, -176, -176, -176,
			 -176, -176, -176, -176, -176, -176, -176, -176, -176, -176,
			 -176, -176, -176, -176, -176, -176, -176, -176, -176, -176,
			 -176, -176, -176, -176, -176, -176, -176, -176, -176, -176,
			 -176, -176, -176, -176, -176, -176, -176, -176, -176, -176,
			 -176, -176, -176, -176, -176, -176, -176, -176, -176, -176,
			 -176, -176, -176, -176, -176, -176, -176, -176, -176,    5,
			 -177, -177, -177, -177, -177, -177, -177, -177, -177, -177,

			 -177, -177, -177, -177, -177, -177, -177, -177, -177, -177,
			 -177, -177, -177, -177, -177, -177, -177, -177, -177, -177,
			 -177, -177, -177, -177, -177, -177, -177, -177, -177, -177,
			 -177, -177, -177, -177, -177, -177, -177,  181,  181,  181,
			  181,  181,  181,  181,  181,  181,  181, -177, -177, -177,
			 -177, -177, -177, -177, -177, -177, -177, -177, -177, -177,
			 -177, -177, -177, -177, -177, -177, -177, -177, -177, -177,
			 -177, -177, -177, -177, -177, -177, -177, -177, -177, -177,
			 -177, -177, -177, -177, -177, -177, -177, -177, -177, -177,
			 -177, -177, -177, -177, -177, -177, -177, -177, -177, -177,

			 -177, -177, -177, -177, -177, -177, -177, -177, -177, -177,
			 -177, -177, -177, -177, -177, -177, -177, -177, -177, -177,
			 -177, -177, -177, -177, -177, -177, -177, -177, -177, -177,
			 -177, -177, -177, -177, -177, -177, -177, -177, -177, -177,
			 -177, -177, -177, -177, -177, -177, -177, -177, -177, -177,
			 -177, -177, -177, -177, -177, -177, -177, -177, -177, -177,
			 -177, -177, -177, -177, -177, -177, -177, -177, -177, -177,
			 -177, -177, -177, -177, -177, -177, -177, -177, -177, -177,
			 -177, -177, -177, -177, -177, -177, -177, -177, -177, -177,
			 -177, -177, -177, -177, -177, -177, -177, -177, -177, -177,

			 -177, -177, -177, -177, -177, -177, -177, -177, -177, -177,
			 -177, -177, -177, -177, -177, -177, -177, -177, -177, -177,
			 -177, -177, -177, -177, -177, -177, -177, -177, -177, -177,
			 -177, -177, -177, -177, -177, -177, -177, -177, -177, -177,
			 -177, -177, -177, -177, -177, -177,    5, -178, -178, -178,
			 -178, -178, -178, -178, -178, -178, -178, -178, -178, -178,
			 -178, -178, -178, -178, -178, -178, -178, -178, -178, -178,
			 -178, -178, -178, -178, -178, -178, -178, -178, -178, -178,
			 -178, -178, -178, -178, -178, -178, -178, -178, -178, -178,
			 -178, -178, -178, -178, -178, -178, -178, -178, -178, -178,

			 -178, -178, -178, -178, -178, -178, -178, -178, -178, -178,
			 -178, -178, -178, -178, -178, -178, -178, -178, -178, -178,
			 -178, -178, -178, -178, -178, -178, -178, -178, -178, -178,
			 -178, -178, -178, -178, -178, -178, -178, -178, -178, -178,
			 -178, -178, -178, -178, -178, -178, -178, -178, -178, -178,
			 -178, -178, -178, -178, -178, -178, -178, -178, -178, -178,
			 -178, -178, -178, -178, -178, -178, -178, -178, -178, -178,
			 -178, -178, -178, -178, -178, -178, -178, -178, -178, -178,
			 -178, -178, -178, -178, -178, -178, -178, -178, -178, -178,
			 -178, -178, -178, -178, -178, -178, -178, -178, -178, -178,

			 -178, -178, -178, -178, -178, -178, -178, -178, -178, -178,
			 -178, -178, -178, -178, -178, -178, -178, -178, -178, -178,
			 -178, -178, -178, -178, -178, -178, -178, -178, -178, -178,
			 -178, -178, -178, -178, -178, -178, -178, -178, -178, -178,
			 -178, -178, -178, -178, -178, -178, -178, -178, -178, -178,
			 -178, -178, -178, -178, -178, -178, -178, -178, -178, -178,
			 -178, -178, -178, -178, -178, -178, -178, -178, -178, -178,
			 -178, -178, -178, -178, -178, -178, -178, -178, -178, -178,
			 -178, -178, -178, -178, -178, -178, -178, -178, -178, -178,
			 -178, -178, -178, -178, -178, -178, -178, -178, -178, -178, yy_Dummy>>,
			1, 1000, 45000)
		end

	yy_nxt_template_47 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			 -178, -178, -178,    5, -179, -179, -179, -179, -179, -179,
			 -179, -179, -179, -179, -179, -179, -179, -179, -179, -179,
			 -179, -179, -179, -179, -179, -179, -179, -179, -179, -179,
			 -179, -179, -179, -179, -179, -179, -179, -179, -179, -179,
			 -179, -179, -179, -179, -179, -179, -179, -179, -179, -179,
			 -179, -179, -179, -179, -179, -179, -179, -179, -179, -179,
			 -179, -179, -179, -179, -179, -179, -179, -179, -179, -179,
			 -179, -179, -179, -179, -179, -179, -179, -179, -179, -179,
			 -179, -179, -179, -179, -179, -179, -179,  182, -179, -179,
			 -179, -179, -179, -179, -179, -179, -179, -179, -179, -179,

			 -179, -179, -179, -179, -179, -179, -179, -179, -179, -179,
			 -179, -179, -179, -179, -179, -179, -179, -179, -179, -179,
			 -179, -179, -179, -179, -179, -179, -179, -179, -179, -179,
			 -179, -179, -179, -179, -179, -179, -179, -179, -179, -179,
			 -179, -179, -179, -179, -179, -179, -179, -179, -179, -179,
			 -179, -179, -179, -179, -179, -179, -179, -179, -179, -179,
			 -179, -179, -179, -179, -179, -179, -179, -179, -179, -179,
			 -179, -179, -179, -179, -179, -179, -179, -179, -179, -179,
			 -179, -179, -179, -179, -179, -179, -179, -179, -179, -179,
			 -179, -179, -179, -179, -179, -179, -179, -179, -179, -179,

			 -179, -179, -179, -179, -179, -179, -179, -179, -179, -179,
			 -179, -179, -179, -179, -179, -179, -179, -179, -179, -179,
			 -179, -179, -179, -179, -179, -179, -179, -179, -179, -179,
			 -179, -179, -179, -179, -179, -179, -179, -179, -179, -179,
			 -179, -179, -179, -179, -179, -179, -179, -179, -179, -179,
			 -179, -179, -179, -179, -179, -179, -179, -179, -179, -179,
			    5, -180, -180, -180, -180, -180, -180, -180, -180, -180,
			 -180, -180, -180, -180, -180, -180, -180, -180, -180, -180,
			 -180, -180, -180, -180, -180, -180, -180, -180, -180, -180,
			 -180, -180, -180, -180, -180, -180, -180, -180, -180, -180,

			 -180, -180, -180, -180, -180, -180, -180, -180,  183,  183,
			  183,  183,  183,  183,  183,  183,  183,  183, -180, -180,
			 -180, -180, -180, -180, -180, -180, -180, -180, -180, -180,
			 -180, -180, -180, -180, -180, -180, -180, -180, -180, -180,
			 -180, -180, -180, -180, -180, -180, -180, -180, -180, -180,
			 -180, -180, -180, -180, -180, -180, -180, -180, -180, -180,
			 -180, -180, -180, -180, -180, -180, -180, -180, -180, -180,
			 -180, -180, -180, -180, -180, -180, -180, -180, -180, -180,
			 -180, -180, -180, -180, -180, -180, -180, -180, -180, -180,
			 -180, -180, -180, -180, -180, -180, -180, -180, -180, -180,

			 -180, -180, -180, -180, -180, -180, -180, -180, -180, -180,
			 -180, -180, -180, -180, -180, -180, -180, -180, -180, -180,
			 -180, -180, -180, -180, -180, -180, -180, -180, -180, -180,
			 -180, -180, -180, -180, -180, -180, -180, -180, -180, -180,
			 -180, -180, -180, -180, -180, -180, -180, -180, -180, -180,
			 -180, -180, -180, -180, -180, -180, -180, -180, -180, -180,
			 -180, -180, -180, -180, -180, -180, -180, -180, -180, -180,
			 -180, -180, -180, -180, -180, -180, -180, -180, -180, -180,
			 -180, -180, -180, -180, -180, -180, -180, -180, -180, -180,
			 -180, -180, -180, -180, -180, -180, -180, -180, -180, -180,

			 -180, -180, -180, -180, -180, -180, -180, -180, -180, -180,
			 -180, -180, -180, -180, -180, -180, -180,    5, -181, -181,
			 -181, -181, -181, -181, -181, -181, -181, -181, -181, -181,
			 -181, -181, -181, -181, -181, -181, -181, -181, -181, -181,
			 -181, -181, -181, -181, -181, -181, -181, -181, -181, -181,
			 -181, -181, -181, -181, -181, -181, -181, -181, -181, -181,
			  176, -181,  176, -181, -181,  181,  181,  181,  181,  181,
			  181,  181,  181,  181,  181, -181, -181, -181, -181, -181,
			 -181, -181, -181, -181, -181, -181, -181, -181, -181, -181,
			 -181, -181, -181, -181, -181, -181, -181, -181, -181, -181,

			 -181, -181, -181, -181, -181, -181, -181,  178, -181, -181,
			 -181, -181, -181, -181, -181, -181, -181, -181, -181, -181,
			 -181, -181, -181, -181, -181, -181, -181, -181, -181, -181,
			 -181, -181, -181, -181, -181, -181, -181, -181, -181, -181,
			 -181, -181, -181, -181, -181, -181, -181, -181, -181, -181,
			 -181, -181, -181, -181, -181, -181, -181, -181, -181, -181,
			 -181, -181, -181, -181, -181, -181, -181, -181, -181, -181,
			 -181, -181, -181, -181, -181, -181, -181, -181, -181, -181,
			 -181, -181, -181, -181, -181, -181, -181, -181, -181, -181,
			 -181, -181, -181, -181, -181, -181, -181, -181, -181, -181,

			 -181, -181, -181, -181, -181, -181, -181, -181, -181, -181,
			 -181, -181, -181, -181, -181, -181, -181, -181, -181, -181,
			 -181, -181, -181, -181, -181, -181, -181, -181, -181, -181,
			 -181, -181, -181, -181, -181, -181, -181, -181, -181, -181,
			 -181, -181, -181, -181, -181, -181, -181, -181, -181, -181,
			 -181, -181, -181, -181, -181, -181, -181, -181, -181, -181,
			 -181, -181, -181, -181, -181, -181, -181, -181, -181, -181,
			 -181, -181, -181, -181,    5, -182, -182, -182, -182, -182,
			 -182, -182, -182, -182, -182, -182, -182, -182, -182, -182,
			 -182, -182, -182, -182, -182, -182, -182, -182, -182, -182,

			 -182, -182, -182, -182, -182, -182, -182, -182, -182, -182,
			 -182, -182, -182, -182, -182, -182, -182, -182, -182, -182,
			 -182, -182,  184,  184,  184, -182, -182, -182, -182, -182,
			 -182, -182, -182, -182, -182, -182, -182, -182, -182, -182,
			 -182, -182, -182, -182, -182, -182, -182, -182, -182, -182,
			 -182, -182, -182, -182, -182, -182, -182, -182, -182, -182,
			 -182, -182, -182, -182, -182, -182, -182, -182, -182, -182,
			 -182, -182, -182, -182, -182, -182, -182, -182, -182, -182,
			 -182, -182, -182, -182, -182, -182, -182, -182, -182, -182,
			 -182, -182, -182, -182, -182, -182, -182, -182, -182, -182,

			 -182, -182, -182, -182, -182, -182, -182, -182, -182, -182,
			 -182, -182, -182, -182, -182, -182, -182, -182, -182, -182,
			 -182, -182, -182, -182, -182, -182, -182, -182, -182, -182,
			 -182, -182, -182, -182, -182, -182, -182, -182, -182, -182,
			 -182, -182, -182, -182, -182, -182, -182, -182, -182, -182,
			 -182, -182, -182, -182, -182, -182, -182, -182, -182, -182,
			 -182, -182, -182, -182, -182, -182, -182, -182, -182, -182,
			 -182, -182, -182, -182, -182, -182, -182, -182, -182, -182,
			 -182, -182, -182, -182, -182, -182, -182, -182, -182, -182,
			 -182, -182, -182, -182, -182, -182, -182, -182, -182, -182, yy_Dummy>>,
			1, 1000, 46000)
		end

	yy_nxt_template_48 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			 -182, -182, -182, -182, -182, -182, -182, -182, -182, -182,
			 -182, -182, -182, -182, -182, -182, -182, -182, -182, -182,
			 -182, -182, -182, -182, -182, -182, -182, -182, -182, -182,
			 -182,    5, -183, -183, -183, -183, -183, -183, -183, -183,
			 -183, -183, -183, -183, -183, -183, -183, -183, -183, -183,
			 -183, -183, -183, -183, -183, -183, -183, -183, -183, -183,
			 -183, -183, -183, -183, -183, -183, -183, -183, -183, -183,
			 -183, -183, -183, -183, -183, -183, -183, -183, -183,  185,
			  185,  185,  185,  185,  185,  185,  185,  185,  185, -183,
			 -183, -183, -183, -183, -183, -183, -183, -183, -183, -183,

			 -183, -183, -183, -183, -183, -183, -183, -183, -183, -183,
			 -183, -183, -183, -183, -183, -183, -183, -183, -183, -183,
			 -183, -183, -183, -183, -183, -183, -183, -183, -183, -183,
			 -183, -183, -183, -183, -183, -183, -183, -183, -183, -183,
			 -183, -183, -183, -183, -183, -183, -183, -183, -183, -183,
			 -183, -183, -183, -183, -183, -183, -183, -183, -183, -183,
			 -183, -183, -183, -183, -183, -183, -183, -183, -183, -183,
			 -183, -183, -183, -183, -183, -183, -183, -183, -183, -183,
			 -183, -183, -183, -183, -183, -183, -183, -183, -183, -183,
			 -183, -183, -183, -183, -183, -183, -183, -183, -183, -183,

			 -183, -183, -183, -183, -183, -183, -183, -183, -183, -183,
			 -183, -183, -183, -183, -183, -183, -183, -183, -183, -183,
			 -183, -183, -183, -183, -183, -183, -183, -183, -183, -183,
			 -183, -183, -183, -183, -183, -183, -183, -183, -183, -183,
			 -183, -183, -183, -183, -183, -183, -183, -183, -183, -183,
			 -183, -183, -183, -183, -183, -183, -183, -183, -183, -183,
			 -183, -183, -183, -183, -183, -183, -183, -183, -183, -183,
			 -183, -183, -183, -183, -183, -183, -183, -183, -183, -183,
			 -183, -183, -183, -183, -183, -183, -183, -183,    5, -184,
			 -184, -184, -184, -184, -184, -184, -184, -184, -184, -184,

			 -184, -184, -184, -184, -184, -184, -184, -184, -184, -184,
			 -184, -184, -184, -184, -184, -184, -184, -184, -184, -184,
			 -184, -184, -184, -184, -184, -184, -184, -184, -184, -184,
			 -184, -184, -184, -184, -184, -184,  186,  186,  186,  186,
			  186,  186,  186,  186,  186,  186, -184, -184, -184, -184,
			 -184, -184, -184, -184, -184, -184, -184, -184, -184, -184,
			 -184, -184, -184, -184, -184, -184, -184, -184, -184, -184,
			 -184, -184, -184, -184, -184, -184, -184, -184, -184, -184,
			 -184, -184, -184, -184, -184, -184, -184, -184, -184, -184,
			 -184, -184, -184, -184, -184, -184, -184, -184, -184, -184,

			 -184, -184, -184, -184, -184, -184, -184, -184, -184, -184,
			 -184, -184, -184, -184, -184, -184, -184, -184, -184, -184,
			 -184, -184, -184, -184, -184, -184, -184, -184, -184, -184,
			 -184, -184, -184, -184, -184, -184, -184, -184, -184, -184,
			 -184, -184, -184, -184, -184, -184, -184, -184, -184, -184,
			 -184, -184, -184, -184, -184, -184, -184, -184, -184, -184,
			 -184, -184, -184, -184, -184, -184, -184, -184, -184, -184,
			 -184, -184, -184, -184, -184, -184, -184, -184, -184, -184,
			 -184, -184, -184, -184, -184, -184, -184, -184, -184, -184,
			 -184, -184, -184, -184, -184, -184, -184, -184, -184, -184,

			 -184, -184, -184, -184, -184, -184, -184, -184, -184, -184,
			 -184, -184, -184, -184, -184, -184, -184, -184, -184, -184,
			 -184, -184, -184, -184, -184, -184, -184, -184, -184, -184,
			 -184, -184, -184, -184, -184, -184, -184, -184, -184, -184,
			 -184, -184, -184, -184, -184,    5, -185, -185, -185, -185,
			 -185, -185, -185, -185, -185, -185, -185, -185, -185, -185,
			 -185, -185, -185, -185, -185, -185, -185, -185, -185, -185,
			 -185, -185, -185, -185, -185, -185, -185, -185, -185, -185,
			 -185, -185, -185, -185, -185, -185, -185, -185, -185, -185,
			 -185, -185, -185,  178,  178,  178,  178,  178,  178,  178,

			  178,  178,  178, -185, -185, -185, -185, -185, -185, -185,
			 -185, -185, -185, -185, -185, -185, -185, -185, -185, -185,
			 -185, -185, -185, -185, -185, -185, -185, -185, -185, -185,
			 -185, -185, -185, -185, -185, -185, -185, -185, -185, -185,
			 -185, -185, -185, -185, -185, -185, -185, -185, -185, -185,
			 -185, -185, -185, -185, -185, -185, -185, -185, -185, -185,
			 -185, -185, -185, -185, -185, -185, -185, -185, -185, -185,
			 -185, -185, -185, -185, -185, -185, -185, -185, -185, -185,
			 -185, -185, -185, -185, -185, -185, -185, -185, -185, -185,
			 -185, -185, -185, -185, -185, -185, -185, -185, -185, -185,

			 -185, -185, -185, -185, -185, -185, -185, -185, -185, -185,
			 -185, -185, -185, -185, -185, -185, -185, -185, -185, -185,
			 -185, -185, -185, -185, -185, -185, -185, -185, -185, -185,
			 -185, -185, -185, -185, -185, -185, -185, -185, -185, -185,
			 -185, -185, -185, -185, -185, -185, -185, -185, -185, -185,
			 -185, -185, -185, -185, -185, -185, -185, -185, -185, -185,
			 -185, -185, -185, -185, -185, -185, -185, -185, -185, -185,
			 -185, -185, -185, -185, -185, -185, -185, -185, -185, -185,
			 -185, -185, -185, -185, -185, -185, -185, -185, -185, -185,
			 -185, -185, -185, -185, -185, -185, -185, -185, -185, -185,

			 -185, -185,    5, -186, -186, -186, -186, -186, -186, -186,
			 -186, -186, -186, -186, -186, -186, -186, -186, -186, -186,
			 -186, -186, -186, -186, -186, -186, -186, -186, -186, -186,
			 -186, -186, -186, -186, -186, -186, -186, -186, -186, -186,
			 -186, -186, -186, -186, -186,  187, -186,  187, -186, -186,
			 -186, -186, -186, -186, -186, -186, -186, -186, -186, -186,
			  188, -186, -186, -186, -186, -186, -186, -186, -186, -186,
			 -186, -186, -186, -186, -186, -186, -186, -186, -186, -186,
			 -186, -186, -186, -186, -186, -186, -186, -186, -186, -186,
			 -186, -186,  189, -186, -186, -186, -186, -186, -186, -186,

			 -186, -186, -186, -186, -186, -186, -186, -186, -186, -186,
			 -186, -186, -186, -186, -186, -186, -186, -186, -186, -186,
			 -186, -186, -186, -186, -186, -186, -186, -186, -186, -186,
			 -186, -186, -186, -186, -186, -186, -186, -186, -186, -186,
			 -186, -186, -186, -186, -186, -186, -186, -186, -186, -186,
			 -186, -186, -186, -186, -186, -186, -186, -186, -186, -186,
			 -186, -186, -186, -186, -186, -186, -186, -186, -186, -186,
			 -186, -186, -186, -186, -186, -186, -186, -186, -186, -186,
			 -186, -186, -186, -186, -186, -186, -186, -186, -186, -186,
			 -186, -186, -186, -186, -186, -186, -186, -186, -186, -186, yy_Dummy>>,
			1, 1000, 47000)
		end

	yy_nxt_template_49 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			 -186, -186, -186, -186, -186, -186, -186, -186, -186, -186,
			 -186, -186, -186, -186, -186, -186, -186, -186, -186, -186,
			 -186, -186, -186, -186, -186, -186, -186, -186, -186, -186,
			 -186, -186, -186, -186, -186, -186, -186, -186, -186, -186,
			 -186, -186, -186, -186, -186, -186, -186, -186, -186, -186,
			 -186, -186, -186, -186, -186, -186, -186, -186, -186,    5,
			 -187, -187, -187, -187, -187, -187, -187, -187, -187, -187,
			 -187, -187, -187, -187, -187, -187, -187, -187, -187, -187,
			 -187, -187, -187, -187, -187, -187, -187, -187, -187, -187,
			 -187, -187, -187, -187, -187, -187, -187, -187, -187, -187,

			 -187, -187, -187, -187, -187, -187, -187,  190,  190,  190,
			  190,  190,  190,  190,  190,  190,  190, -187, -187, -187,
			 -187, -187, -187, -187, -187, -187, -187, -187, -187, -187,
			 -187, -187, -187, -187, -187, -187, -187, -187, -187, -187,
			 -187, -187, -187, -187, -187, -187, -187, -187, -187, -187,
			 -187, -187, -187, -187, -187, -187, -187, -187, -187, -187,
			 -187, -187, -187, -187, -187, -187, -187, -187, -187, -187,
			 -187, -187, -187, -187, -187, -187, -187, -187, -187, -187,
			 -187, -187, -187, -187, -187, -187, -187, -187, -187, -187,
			 -187, -187, -187, -187, -187, -187, -187, -187, -187, -187,

			 -187, -187, -187, -187, -187, -187, -187, -187, -187, -187,
			 -187, -187, -187, -187, -187, -187, -187, -187, -187, -187,
			 -187, -187, -187, -187, -187, -187, -187, -187, -187, -187,
			 -187, -187, -187, -187, -187, -187, -187, -187, -187, -187,
			 -187, -187, -187, -187, -187, -187, -187, -187, -187, -187,
			 -187, -187, -187, -187, -187, -187, -187, -187, -187, -187,
			 -187, -187, -187, -187, -187, -187, -187, -187, -187, -187,
			 -187, -187, -187, -187, -187, -187, -187, -187, -187, -187,
			 -187, -187, -187, -187, -187, -187, -187, -187, -187, -187,
			 -187, -187, -187, -187, -187, -187, -187, -187, -187, -187,

			 -187, -187, -187, -187, -187, -187, -187, -187, -187, -187,
			 -187, -187, -187, -187, -187, -187,    5, -188, -188, -188,
			 -188, -188, -188, -188, -188, -188, -188, -188, -188, -188,
			 -188, -188, -188, -188, -188, -188, -188, -188, -188, -188,
			 -188, -188, -188, -188, -188, -188, -188, -188, -188, -188,
			 -188, -188, -188, -188, -188, -188, -188, -188, -188, -188,
			 -188, -188, -188, -188,  191,  191,  191,  191,  191,  191,
			  191, -188, -188, -188, -188, -188, -188, -188, -188, -188,
			 -188, -188, -188, -188, -188, -188, -188, -188, -188, -188,
			 -188, -188, -188, -188, -188, -188, -188, -188, -188, -188,

			 -188, -188, -188, -188, -188, -188, -188, -188, -188, -188,
			 -188, -188, -188, -188, -188, -188, -188, -188, -188, -188,
			 -188, -188, -188, -188, -188, -188, -188, -188, -188, -188,
			 -188, -188, -188, -188, -188, -188, -188, -188, -188, -188,
			 -188, -188, -188, -188, -188, -188, -188, -188, -188, -188,
			 -188, -188, -188, -188, -188, -188, -188, -188, -188, -188,
			 -188, -188, -188, -188, -188, -188, -188, -188, -188, -188,
			 -188, -188, -188, -188, -188, -188, -188, -188, -188, -188,
			 -188, -188, -188, -188, -188, -188, -188, -188, -188, -188,
			 -188, -188, -188, -188, -188, -188, -188, -188, -188, -188,

			 -188, -188, -188, -188, -188, -188, -188, -188, -188, -188,
			 -188, -188, -188, -188, -188, -188, -188, -188, -188, -188,
			 -188, -188, -188, -188, -188, -188, -188, -188, -188, -188,
			 -188, -188, -188, -188, -188, -188, -188, -188, -188, -188,
			 -188, -188, -188, -188, -188, -188, -188, -188, -188, -188,
			 -188, -188, -188, -188, -188, -188, -188, -188, -188, -188,
			 -188, -188, -188, -188, -188, -188, -188, -188, -188, -188,
			 -188, -188, -188,    5, -189, -189, -189, -189, -189, -189,
			 -189, -189, -189, -189, -189, -189, -189, -189, -189, -189,
			 -189, -189, -189, -189, -189, -189, -189, -189, -189, -189,

			 -189, -189, -189, -189, -189, -189, -189, -189, -189, -189,
			 -189, -189, -189, -189, -189, -189, -189, -189, -189, -189,
			 -189, -189, -189, -189, -189, -189, -189, -189, -189, -189,
			 -189, -189, -189, -189, -189, -189, -189, -189, -189, -189,
			 -189, -189, -189, -189, -189, -189, -189, -189, -189, -189,
			 -189, -189, -189, -189, -189, -189, -189, -189, -189, -189,
			 -189, -189, -189, -189, -189, -189, -189, -189, -189, -189,
			 -189, -189, -189, -189, -189, -189, -189, -189, -189, -189,
			 -189, -189, -189, -189, -189, -189, -189, -189, -189, -189,
			 -189, -189, -189, -189, -189, -189, -189, -189, -189, -189,

			 -189, -189, -189, -189, -189, -189, -189, -189, -189, -189,
			 -189, -189, -189, -189, -189, -189, -189, -189, -189, -189,
			 -189, -189, -189, -189, -189, -189, -189, -189, -189, -189,
			 -189, -189, -189, -189, -189, -189, -189, -189, -189, -189,
			 -189, -189, -189, -189, -189, -189, -189, -189, -189, -189,
			 -189, -189, -189, -189, -189, -189, -189, -189, -189, -189,
			 -189, -189, -189, -189, -189, -189, -189, -189, -189, -189,
			 -189, -189, -189, -189, -189, -189, -189, -189, -189, -189,
			 -189, -189, -189, -189, -189, -189, -189, -189, -189, -189,
			 -189, -189, -189, -189, -189, -189, -189, -189, -189, -189,

			 -189, -189, -189, -189, -189, -189, -189, -189, -189, -189,
			 -189, -189, -189, -189, -189, -189, -189, -189, -189, -189,
			 -189, -189, -189, -189, -189, -189, -189, -189, -189, -189,
			    5, -190, -190, -190, -190, -190, -190, -190, -190, -190,
			 -190, -190, -190, -190, -190, -190, -190, -190, -190, -190,
			 -190, -190, -190, -190, -190, -190, -190, -190, -190, -190,
			 -190, -190, -190, -190, -190, -190, -190, -190, -190, -190,
			 -190, -190, -190, -190, -190, -190, -190, -190,  192,  192,
			  192,  192,  192,  192,  192,  192,  192,  192, -190, -190,
			 -190, -190, -190, -190, -190, -190, -190, -190, -190, -190,

			 -190, -190, -190, -190, -190, -190, -190, -190, -190, -190,
			 -190, -190, -190, -190, -190, -190, -190, -190, -190, -190,
			 -190, -190, -190, -190, -190, -190, -190, -190, -190, -190,
			 -190, -190, -190, -190, -190, -190, -190, -190, -190, -190,
			 -190, -190, -190, -190, -190, -190, -190, -190, -190, -190,
			 -190, -190, -190, -190, -190, -190, -190, -190, -190, -190,
			 -190, -190, -190, -190, -190, -190, -190, -190, -190, -190,
			 -190, -190, -190, -190, -190, -190, -190, -190, -190, -190,
			 -190, -190, -190, -190, -190, -190, -190, -190, -190, -190,
			 -190, -190, -190, -190, -190, -190, -190, -190, -190, -190, yy_Dummy>>,
			1, 1000, 48000)
		end

	yy_nxt_template_50 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			 -190, -190, -190, -190, -190, -190, -190, -190, -190, -190,
			 -190, -190, -190, -190, -190, -190, -190, -190, -190, -190,
			 -190, -190, -190, -190, -190, -190, -190, -190, -190, -190,
			 -190, -190, -190, -190, -190, -190, -190, -190, -190, -190,
			 -190, -190, -190, -190, -190, -190, -190, -190, -190, -190,
			 -190, -190, -190, -190, -190, -190, -190, -190, -190, -190,
			 -190, -190, -190, -190, -190, -190, -190, -190, -190, -190,
			 -190, -190, -190, -190, -190, -190, -190, -190, -190, -190,
			 -190, -190, -190, -190, -190, -190, -190,    5, -191, -191,
			 -191, -191, -191, -191, -191, -191, -191, -191, -191, -191,

			 -191, -191, -191, -191, -191, -191, -191, -191, -191, -191,
			 -191, -191, -191, -191, -191, -191, -191, -191, -191, -191,
			 -191, -191, -191, -191, -191, -191, -191, -191, -191, -191,
			 -191, -191, -191, -191, -191,  193,  193,  193,  193,  193,
			  193,  193,  193,  193,  193, -191, -191, -191, -191, -191,
			 -191, -191, -191, -191, -191, -191, -191, -191, -191, -191,
			 -191, -191, -191, -191, -191, -191, -191, -191, -191, -191,
			 -191, -191, -191, -191, -191, -191, -191, -191, -191, -191,
			 -191, -191, -191, -191, -191, -191, -191, -191, -191, -191,
			 -191, -191, -191, -191, -191, -191, -191, -191, -191, -191,

			 -191, -191, -191, -191, -191, -191, -191, -191, -191, -191,
			 -191, -191, -191, -191, -191, -191, -191, -191, -191, -191,
			 -191, -191, -191, -191, -191, -191, -191, -191, -191, -191,
			 -191, -191, -191, -191, -191, -191, -191, -191, -191, -191,
			 -191, -191, -191, -191, -191, -191, -191, -191, -191, -191,
			 -191, -191, -191, -191, -191, -191, -191, -191, -191, -191,
			 -191, -191, -191, -191, -191, -191, -191, -191, -191, -191,
			 -191, -191, -191, -191, -191, -191, -191, -191, -191, -191,
			 -191, -191, -191, -191, -191, -191, -191, -191, -191, -191,
			 -191, -191, -191, -191, -191, -191, -191, -191, -191, -191,

			 -191, -191, -191, -191, -191, -191, -191, -191, -191, -191,
			 -191, -191, -191, -191, -191, -191, -191, -191, -191, -191,
			 -191, -191, -191, -191, -191, -191, -191, -191, -191, -191,
			 -191, -191, -191, -191, -191, -191, -191, -191, -191, -191,
			 -191, -191, -191, -191,    5, -192, -192, -192, -192, -192,
			 -192, -192, -192, -192, -192, -192, -192, -192, -192, -192,
			 -192, -192, -192, -192, -192, -192, -192, -192, -192, -192,
			 -192, -192, -192, -192, -192, -192, -192, -192, -192, -192,
			 -192, -192, -192, -192, -192, -192, -192, -192, -192, -192,
			 -192, -192,  194,  194,  194,  194,  194,  194,  194,  194,

			  194,  194, -192, -192, -192, -192, -192, -192, -192, -192,
			 -192, -192, -192, -192, -192, -192, -192, -192, -192, -192,
			 -192, -192, -192, -192, -192, -192, -192, -192, -192, -192,
			 -192, -192, -192, -192, -192, -192, -192, -192, -192, -192,
			 -192, -192, -192, -192, -192, -192, -192, -192, -192, -192,
			 -192, -192, -192, -192, -192, -192, -192, -192, -192, -192,
			 -192, -192, -192, -192, -192, -192, -192, -192, -192, -192,
			 -192, -192, -192, -192, -192, -192, -192, -192, -192, -192,
			 -192, -192, -192, -192, -192, -192, -192, -192, -192, -192,
			 -192, -192, -192, -192, -192, -192, -192, -192, -192, -192,

			 -192, -192, -192, -192, -192, -192, -192, -192, -192, -192,
			 -192, -192, -192, -192, -192, -192, -192, -192, -192, -192,
			 -192, -192, -192, -192, -192, -192, -192, -192, -192, -192,
			 -192, -192, -192, -192, -192, -192, -192, -192, -192, -192,
			 -192, -192, -192, -192, -192, -192, -192, -192, -192, -192,
			 -192, -192, -192, -192, -192, -192, -192, -192, -192, -192,
			 -192, -192, -192, -192, -192, -192, -192, -192, -192, -192,
			 -192, -192, -192, -192, -192, -192, -192, -192, -192, -192,
			 -192, -192, -192, -192, -192, -192, -192, -192, -192, -192,
			 -192, -192, -192, -192, -192, -192, -192, -192, -192, -192,

			 -192,    5, -193, -193, -193, -193, -193, -193, -193, -193,
			 -193, -193, -193, -193, -193, -193, -193, -193, -193, -193,
			 -193, -193, -193, -193, -193, -193, -193, -193, -193, -193,
			 -193, -193, -193, -193, -193, -193, -193, -193, -193, -193,
			 -193, -193, -193, -193,  195, -193,  195, -193, -193, -193,
			 -193, -193, -193, -193, -193, -193, -193, -193, -193,  196,
			 -193, -193, -193, -193, -193, -193, -193, -193, -193, -193,
			 -193, -193, -193, -193, -193, -193, -193, -193, -193, -193,
			 -193, -193, -193, -193, -193, -193, -193, -193, -193, -193,
			 -193,  197, -193, -193, -193, -193, -193, -193, -193, -193,

			 -193, -193, -193, -193, -193, -193, -193, -193, -193, -193,
			 -193, -193, -193, -193, -193, -193, -193, -193, -193, -193,
			 -193, -193, -193, -193, -193, -193, -193, -193, -193, -193,
			 -193, -193, -193, -193, -193, -193, -193, -193, -193, -193,
			 -193, -193, -193, -193, -193, -193, -193, -193, -193, -193,
			 -193, -193, -193, -193, -193, -193, -193, -193, -193, -193,
			 -193, -193, -193, -193, -193, -193, -193, -193, -193, -193,
			 -193, -193, -193, -193, -193, -193, -193, -193, -193, -193,
			 -193, -193, -193, -193, -193, -193, -193, -193, -193, -193,
			 -193, -193, -193, -193, -193, -193, -193, -193, -193, -193,

			 -193, -193, -193, -193, -193, -193, -193, -193, -193, -193,
			 -193, -193, -193, -193, -193, -193, -193, -193, -193, -193,
			 -193, -193, -193, -193, -193, -193, -193, -193, -193, -193,
			 -193, -193, -193, -193, -193, -193, -193, -193, -193, -193,
			 -193, -193, -193, -193, -193, -193, -193, -193, -193, -193,
			 -193, -193, -193, -193, -193, -193, -193, -193,    5, -194,
			 -194, -194, -194, -194, -194, -194, -194, -194, -194, -194,
			 -194, -194, -194, -194, -194, -194, -194, -194, -194, -194,
			 -194, -194, -194, -194, -194, -194, -194, -194, -194, -194,
			 -194, -194, -194, -194, -194, -194, -194, -194, -194, -194,

			 -194, -194, -194, -194, -194, -194,  189,  189,  189,  189,
			  189,  189,  189,  189,  189,  189, -194, -194, -194, -194,
			 -194, -194, -194, -194, -194, -194, -194, -194, -194, -194,
			 -194, -194, -194, -194, -194, -194, -194, -194, -194, -194,
			 -194, -194, -194, -194, -194, -194, -194, -194, -194, -194,
			 -194, -194, -194, -194, -194, -194, -194, -194, -194, -194,
			 -194, -194, -194, -194, -194, -194, -194, -194, -194, -194,
			 -194, -194, -194, -194, -194, -194, -194, -194, -194, -194,
			 -194, -194, -194, -194, -194, -194, -194, -194, -194, -194,
			 -194, -194, -194, -194, -194, -194, -194, -194, -194, -194, yy_Dummy>>,
			1, 1000, 49000)
		end

	yy_nxt_template_51 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			 -194, -194, -194, -194, -194, -194, -194, -194, -194, -194,
			 -194, -194, -194, -194, -194, -194, -194, -194, -194, -194,
			 -194, -194, -194, -194, -194, -194, -194, -194, -194, -194,
			 -194, -194, -194, -194, -194, -194, -194, -194, -194, -194,
			 -194, -194, -194, -194, -194, -194, -194, -194, -194, -194,
			 -194, -194, -194, -194, -194, -194, -194, -194, -194, -194,
			 -194, -194, -194, -194, -194, -194, -194, -194, -194, -194,
			 -194, -194, -194, -194, -194, -194, -194, -194, -194, -194,
			 -194, -194, -194, -194, -194, -194, -194, -194, -194, -194,
			 -194, -194, -194, -194, -194, -194, -194, -194, -194, -194,

			 -194, -194, -194, -194, -194, -194, -194, -194, -194, -194,
			 -194, -194, -194, -194, -194,    5, -195, -195, -195, -195,
			 -195, -195, -195, -195, -195, -195, -195, -195, -195, -195,
			 -195, -195, -195, -195, -195, -195, -195, -195, -195, -195,
			 -195, -195, -195, -195, -195, -195, -195, -195, -195, -195,
			 -195, -195, -195, -195, -195, -195, -195, -195, -195, -195,
			 -195, -195, -195,  198,  198,  198,  198,  198,  198,  198,
			  198,  198,  198, -195, -195, -195, -195, -195, -195, -195,
			 -195, -195, -195, -195, -195, -195, -195, -195, -195, -195,
			 -195, -195, -195, -195, -195, -195, -195, -195, -195, -195,

			 -195, -195, -195, -195, -195, -195, -195, -195, -195, -195,
			 -195, -195, -195, -195, -195, -195, -195, -195, -195, -195,
			 -195, -195, -195, -195, -195, -195, -195, -195, -195, -195,
			 -195, -195, -195, -195, -195, -195, -195, -195, -195, -195,
			 -195, -195, -195, -195, -195, -195, -195, -195, -195, -195,
			 -195, -195, -195, -195, -195, -195, -195, -195, -195, -195,
			 -195, -195, -195, -195, -195, -195, -195, -195, -195, -195,
			 -195, -195, -195, -195, -195, -195, -195, -195, -195, -195,
			 -195, -195, -195, -195, -195, -195, -195, -195, -195, -195,
			 -195, -195, -195, -195, -195, -195, -195, -195, -195, -195,

			 -195, -195, -195, -195, -195, -195, -195, -195, -195, -195,
			 -195, -195, -195, -195, -195, -195, -195, -195, -195, -195,
			 -195, -195, -195, -195, -195, -195, -195, -195, -195, -195,
			 -195, -195, -195, -195, -195, -195, -195, -195, -195, -195,
			 -195, -195, -195, -195, -195, -195, -195, -195, -195, -195,
			 -195, -195, -195, -195, -195, -195, -195, -195, -195, -195,
			 -195, -195, -195, -195, -195, -195, -195, -195, -195, -195,
			 -195, -195,    5, -196, -196, -196, -196, -196, -196, -196,
			 -196, -196, -196, -196, -196, -196, -196, -196, -196, -196,
			 -196, -196, -196, -196, -196, -196, -196, -196, -196, -196,

			 -196, -196, -196, -196, -196, -196, -196, -196, -196, -196,
			 -196, -196, -196, -196, -196, -196, -196, -196, -196, -196,
			  199,  199,  199,  199,  199,  199,  199, -196, -196, -196,
			 -196, -196, -196, -196, -196, -196, -196, -196, -196, -196,
			 -196, -196, -196, -196, -196, -196, -196, -196, -196, -196,
			 -196, -196, -196, -196, -196, -196, -196, -196, -196, -196,
			 -196, -196, -196, -196, -196, -196, -196, -196, -196, -196,
			 -196, -196, -196, -196, -196, -196, -196, -196, -196, -196,
			 -196, -196, -196, -196, -196, -196, -196, -196, -196, -196,
			 -196, -196, -196, -196, -196, -196, -196, -196, -196, -196,

			 -196, -196, -196, -196, -196, -196, -196, -196, -196, -196,
			 -196, -196, -196, -196, -196, -196, -196, -196, -196, -196,
			 -196, -196, -196, -196, -196, -196, -196, -196, -196, -196,
			 -196, -196, -196, -196, -196, -196, -196, -196, -196, -196,
			 -196, -196, -196, -196, -196, -196, -196, -196, -196, -196,
			 -196, -196, -196, -196, -196, -196, -196, -196, -196, -196,
			 -196, -196, -196, -196, -196, -196, -196, -196, -196, -196,
			 -196, -196, -196, -196, -196, -196, -196, -196, -196, -196,
			 -196, -196, -196, -196, -196, -196, -196, -196, -196, -196,
			 -196, -196, -196, -196, -196, -196, -196, -196, -196, -196,

			 -196, -196, -196, -196, -196, -196, -196, -196, -196, -196,
			 -196, -196, -196, -196, -196, -196, -196, -196, -196, -196,
			 -196, -196, -196, -196, -196, -196, -196, -196, -196,    5,
			 -197, -197, -197, -197, -197, -197, -197, -197, -197, -197,
			 -197, -197, -197, -197, -197, -197, -197, -197, -197, -197,
			 -197, -197, -197, -197, -197, -197, -197, -197, -197, -197,
			 -197, -197, -197, -197, -197, -197, -197, -197, -197, -197,
			 -197, -197, -197, -197, -197, -197, -197, -197, -197, -197,
			 -197, -197, -197, -197, -197, -197, -197, -197, -197, -197,
			 -197, -197, -197, -197, -197, -197, -197, -197, -197, -197,

			 -197, -197, -197, -197, -197, -197, -197, -197, -197, -197,
			 -197, -197, -197, -197, -197, -197, -197, -197, -197, -197,
			 -197, -197, -197, -197, -197, -197, -197, -197, -197, -197,
			 -197, -197, -197, -197, -197, -197, -197, -197, -197, -197,
			 -197, -197, -197, -197, -197, -197, -197, -197, -197, -197,
			 -197, -197, -197, -197, -197, -197, -197, -197, -197, -197,
			 -197, -197, -197, -197, -197, -197, -197, -197, -197, -197,
			 -197, -197, -197, -197, -197, -197, -197, -197, -197, -197,
			 -197, -197, -197, -197, -197, -197, -197, -197, -197, -197,
			 -197, -197, -197, -197, -197, -197, -197, -197, -197, -197,

			 -197, -197, -197, -197, -197, -197, -197, -197, -197, -197,
			 -197, -197, -197, -197, -197, -197, -197, -197, -197, -197,
			 -197, -197, -197, -197, -197, -197, -197, -197, -197, -197,
			 -197, -197, -197, -197, -197, -197, -197, -197, -197, -197,
			 -197, -197, -197, -197, -197, -197, -197, -197, -197, -197,
			 -197, -197, -197, -197, -197, -197, -197, -197, -197, -197,
			 -197, -197, -197, -197, -197, -197, -197, -197, -197, -197,
			 -197, -197, -197, -197, -197, -197, -197, -197, -197, -197,
			 -197, -197, -197, -197, -197, -197,    5, -198, -198, -198,
			 -198, -198, -198, -198, -198, -198, -198, -198, -198, -198,

			 -198, -198, -198, -198, -198, -198, -198, -198, -198, -198,
			 -198, -198, -198, -198, -198, -198, -198, -198, -198, -198,
			 -198, -198, -198, -198, -198, -198, -198, -198, -198, -198,
			 -198, -198, -198, -198,  200,  200,  200,  200,  200,  200,
			  200,  200,  200,  200, -198, -198, -198, -198, -198, -198,
			 -198, -198, -198, -198, -198, -198, -198, -198, -198, -198,
			 -198, -198, -198, -198, -198, -198, -198, -198, -198, -198,
			 -198, -198, -198, -198, -198, -198, -198, -198, -198, -198,
			 -198, -198, -198, -198, -198, -198, -198, -198, -198, -198,
			 -198, -198, -198, -198, -198, -198, -198, -198, -198, -198, yy_Dummy>>,
			1, 1000, 50000)
		end

	yy_nxt_template_52 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			 -198, -198, -198, -198, -198, -198, -198, -198, -198, -198,
			 -198, -198, -198, -198, -198, -198, -198, -198, -198, -198,
			 -198, -198, -198, -198, -198, -198, -198, -198, -198, -198,
			 -198, -198, -198, -198, -198, -198, -198, -198, -198, -198,
			 -198, -198, -198, -198, -198, -198, -198, -198, -198, -198,
			 -198, -198, -198, -198, -198, -198, -198, -198, -198, -198,
			 -198, -198, -198, -198, -198, -198, -198, -198, -198, -198,
			 -198, -198, -198, -198, -198, -198, -198, -198, -198, -198,
			 -198, -198, -198, -198, -198, -198, -198, -198, -198, -198,
			 -198, -198, -198, -198, -198, -198, -198, -198, -198, -198,

			 -198, -198, -198, -198, -198, -198, -198, -198, -198, -198,
			 -198, -198, -198, -198, -198, -198, -198, -198, -198, -198,
			 -198, -198, -198, -198, -198, -198, -198, -198, -198, -198,
			 -198, -198, -198, -198, -198, -198, -198, -198, -198, -198,
			 -198, -198, -198,    5, -199, -199, -199, -199, -199, -199,
			 -199, -199, -199, -199, -199, -199, -199, -199, -199, -199,
			 -199, -199, -199, -199, -199, -199, -199, -199, -199, -199,
			 -199, -199, -199, -199, -199, -199, -199, -199, -199, -199,
			 -199, -199, -199, -199, -199, -199, -199, -199, -199, -199,
			 -199,  201,  201,  201,  201,  201,  201,  201,  201,  201,

			  201, -199, -199, -199, -199, -199, -199, -199, -199, -199,
			 -199, -199, -199, -199, -199, -199, -199, -199, -199, -199,
			 -199, -199, -199, -199, -199, -199, -199, -199, -199, -199,
			 -199, -199, -199, -199, -199, -199, -199, -199, -199, -199,
			 -199, -199, -199, -199, -199, -199, -199, -199, -199, -199,
			 -199, -199, -199, -199, -199, -199, -199, -199, -199, -199,
			 -199, -199, -199, -199, -199, -199, -199, -199, -199, -199,
			 -199, -199, -199, -199, -199, -199, -199, -199, -199, -199,
			 -199, -199, -199, -199, -199, -199, -199, -199, -199, -199,
			 -199, -199, -199, -199, -199, -199, -199, -199, -199, -199,

			 -199, -199, -199, -199, -199, -199, -199, -199, -199, -199,
			 -199, -199, -199, -199, -199, -199, -199, -199, -199, -199,
			 -199, -199, -199, -199, -199, -199, -199, -199, -199, -199,
			 -199, -199, -199, -199, -199, -199, -199, -199, -199, -199,
			 -199, -199, -199, -199, -199, -199, -199, -199, -199, -199,
			 -199, -199, -199, -199, -199, -199, -199, -199, -199, -199,
			 -199, -199, -199, -199, -199, -199, -199, -199, -199, -199,
			 -199, -199, -199, -199, -199, -199, -199, -199, -199, -199,
			 -199, -199, -199, -199, -199, -199, -199, -199, -199, -199,
			 -199, -199, -199, -199, -199, -199, -199, -199, -199, -199,

			    5, -200, -200, -200, -200, -200, -200, -200, -200, -200,
			 -200, -200, -200, -200, -200, -200, -200, -200, -200, -200,
			 -200, -200, -200, -200, -200, -200, -200, -200, -200, -200,
			 -200, -200, -200, -200, -200, -200, -200, -200, -200, -200,
			 -200, -200, -200, -200, -200, -200, -200, -200,  202,  202,
			  202,  202,  202,  202,  202,  202,  202,  202, -200, -200,
			 -200, -200, -200, -200, -200, -200, -200, -200, -200, -200,
			 -200, -200, -200, -200, -200, -200, -200, -200, -200, -200,
			 -200, -200, -200, -200, -200, -200, -200, -200, -200, -200,
			 -200, -200, -200, -200, -200, -200, -200, -200, -200, -200,

			 -200, -200, -200, -200, -200, -200, -200, -200, -200, -200,
			 -200, -200, -200, -200, -200, -200, -200, -200, -200, -200,
			 -200, -200, -200, -200, -200, -200, -200, -200, -200, -200,
			 -200, -200, -200, -200, -200, -200, -200, -200, -200, -200,
			 -200, -200, -200, -200, -200, -200, -200, -200, -200, -200,
			 -200, -200, -200, -200, -200, -200, -200, -200, -200, -200,
			 -200, -200, -200, -200, -200, -200, -200, -200, -200, -200,
			 -200, -200, -200, -200, -200, -200, -200, -200, -200, -200,
			 -200, -200, -200, -200, -200, -200, -200, -200, -200, -200,
			 -200, -200, -200, -200, -200, -200, -200, -200, -200, -200,

			 -200, -200, -200, -200, -200, -200, -200, -200, -200, -200,
			 -200, -200, -200, -200, -200, -200, -200, -200, -200, -200,
			 -200, -200, -200, -200, -200, -200, -200, -200, -200, -200,
			 -200, -200, -200, -200, -200, -200, -200, -200, -200, -200,
			 -200, -200, -200, -200, -200, -200, -200, -200, -200, -200,
			 -200, -200, -200, -200, -200, -200, -200,    5, -201, -201,
			 -201, -201, -201, -201, -201, -201, -201, -201, -201, -201,
			 -201, -201, -201, -201, -201, -201, -201, -201, -201, -201,
			 -201, -201, -201, -201, -201, -201, -201, -201, -201, -201,
			 -201, -201, -201, -201, -201, -201, -201, -201, -201, -201,

			  203,  204,  203,  204, -201, -201, -201, -201, -201, -201,
			 -201, -201, -201, -201, -201, -201, -201, -201, -201, -201,
			 -201, -201, -201, -201, -201, -201, -201, -201, -201, -201,
			 -201, -201, -201, -201, -201, -201, -201, -201, -201, -201,
			 -201, -201, -201, -201, -201, -201, -201,  205, -201, -201,
			 -201, -201, -201, -201, -201, -201, -201, -201, -201, -201,
			 -201, -201, -201, -201, -201, -201, -201, -201, -201, -201,
			 -201, -201, -201, -201, -201, -201, -201, -201, -201, -201,
			 -201, -201, -201, -201, -201, -201, -201, -201, -201, -201,
			 -201, -201, -201, -201, -201, -201, -201, -201, -201, -201,

			 -201, -201, -201, -201, -201, -201, -201, -201, -201, -201,
			 -201, -201, -201, -201, -201, -201, -201, -201, -201, -201,
			 -201, -201, -201, -201, -201, -201, -201, -201, -201, -201,
			 -201, -201, -201, -201, -201, -201, -201, -201, -201, -201,
			 -201, -201, -201, -201, -201, -201, -201, -201, -201, -201,
			 -201, -201, -201, -201, -201, -201, -201, -201, -201, -201,
			 -201, -201, -201, -201, -201, -201, -201, -201, -201, -201,
			 -201, -201, -201, -201, -201, -201, -201, -201, -201, -201,
			 -201, -201, -201, -201, -201, -201, -201, -201, -201, -201,
			 -201, -201, -201, -201, -201, -201, -201, -201, -201, -201,

			 -201, -201, -201, -201, -201, -201, -201, -201, -201, -201,
			 -201, -201, -201, -201,    5, -202, -202, -202, -202, -202,
			 -202, -202, -202, -202, -202, -202, -202, -202, -202, -202,
			 -202, -202, -202, -202, -202, -202, -202, -202, -202, -202,
			 -202, -202, -202, -202, -202, -202, -202, -202, -202, -202,
			 -202, -202, -202, -202, -202, -202, -202, -202, -202, -202,
			 -202, -202,  197,  197,  197,  197,  197,  197,  197,  197,
			  197,  197, -202, -202, -202, -202, -202, -202, -202, -202,
			 -202, -202, -202, -202, -202, -202, -202, -202, -202, -202,
			 -202, -202, -202, -202, -202, -202, -202, -202, -202, -202, yy_Dummy>>,
			1, 1000, 51000)
		end

	yy_nxt_template_53 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			 -202, -202, -202, -202, -202, -202, -202, -202, -202, -202,
			 -202, -202, -202, -202, -202, -202, -202, -202, -202, -202,
			 -202, -202, -202, -202, -202, -202, -202, -202, -202, -202,
			 -202, -202, -202, -202, -202, -202, -202, -202, -202, -202,
			 -202, -202, -202, -202, -202, -202, -202, -202, -202, -202,
			 -202, -202, -202, -202, -202, -202, -202, -202, -202, -202,
			 -202, -202, -202, -202, -202, -202, -202, -202, -202, -202,
			 -202, -202, -202, -202, -202, -202, -202, -202, -202, -202,
			 -202, -202, -202, -202, -202, -202, -202, -202, -202, -202,
			 -202, -202, -202, -202, -202, -202, -202, -202, -202, -202,

			 -202, -202, -202, -202, -202, -202, -202, -202, -202, -202,
			 -202, -202, -202, -202, -202, -202, -202, -202, -202, -202,
			 -202, -202, -202, -202, -202, -202, -202, -202, -202, -202,
			 -202, -202, -202, -202, -202, -202, -202, -202, -202, -202,
			 -202, -202, -202, -202, -202, -202, -202, -202, -202, -202,
			 -202, -202, -202, -202, -202, -202, -202, -202, -202, -202,
			 -202, -202, -202, -202, -202, -202, -202, -202, -202, -202,
			 -202,    5, -203, -203, -203, -203, -203, -203, -203, -203,
			 -203, -203, -203, -203, -203, -203, -203, -203, -203, -203,
			 -203, -203, -203, -203, -203, -203, -203, -203, -203, -203,

			 -203, -203, -203, -203, -203, -203, -203, -203, -203, -203,
			 -203, -203, -203, -203, -203, -203, -203, -203, -203,  206,
			  206,  206,  206,  206,  206,  206,  206,  206,  206, -203,
			 -203, -203, -203, -203, -203, -203, -203, -203, -203, -203,
			 -203, -203, -203, -203, -203, -203, -203, -203, -203, -203,
			 -203, -203, -203, -203, -203, -203, -203, -203, -203, -203,
			 -203, -203, -203, -203, -203, -203, -203, -203, -203, -203,
			 -203, -203, -203, -203, -203, -203, -203, -203, -203, -203,
			 -203, -203, -203, -203, -203, -203, -203, -203, -203, -203,
			 -203, -203, -203, -203, -203, -203, -203, -203, -203, -203,

			 -203, -203, -203, -203, -203, -203, -203, -203, -203, -203,
			 -203, -203, -203, -203, -203, -203, -203, -203, -203, -203,
			 -203, -203, -203, -203, -203, -203, -203, -203, -203, -203,
			 -203, -203, -203, -203, -203, -203, -203, -203, -203, -203,
			 -203, -203, -203, -203, -203, -203, -203, -203, -203, -203,
			 -203, -203, -203, -203, -203, -203, -203, -203, -203, -203,
			 -203, -203, -203, -203, -203, -203, -203, -203, -203, -203,
			 -203, -203, -203, -203, -203, -203, -203, -203, -203, -203,
			 -203, -203, -203, -203, -203, -203, -203, -203, -203, -203,
			 -203, -203, -203, -203, -203, -203, -203, -203, -203, -203,

			 -203, -203, -203, -203, -203, -203, -203, -203, -203, -203,
			 -203, -203, -203, -203, -203, -203, -203, -203, -203, -203,
			 -203, -203, -203, -203, -203, -203, -203, -203,    5, -204,
			 -204, -204, -204, -204, -204, -204, -204, -204, -204, -204,
			 -204, -204, -204, -204, -204, -204, -204, -204, -204, -204,
			 -204, -204, -204, -204, -204, -204, -204, -204, -204, -204,
			 -204, -204, -204, -204, -204, -204, -204, -204, -204, -204,
			 -204, -204, -204, -204, -204, -204,  207,  207,  207,  207,
			  207,  207,  207,  207,  207,  207, -204, -204, -204, -204,
			 -204, -204, -204, -204, -204, -204, -204, -204, -204, -204,

			 -204, -204, -204, -204, -204, -204, -204, -204, -204, -204,
			 -204, -204, -204, -204, -204, -204, -204, -204, -204, -204,
			 -204, -204, -204, -204, -204, -204, -204, -204, -204, -204,
			 -204, -204, -204, -204, -204, -204, -204, -204, -204, -204,
			 -204, -204, -204, -204, -204, -204, -204, -204, -204, -204,
			 -204, -204, -204, -204, -204, -204, -204, -204, -204, -204,
			 -204, -204, -204, -204, -204, -204, -204, -204, -204, -204,
			 -204, -204, -204, -204, -204, -204, -204, -204, -204, -204,
			 -204, -204, -204, -204, -204, -204, -204, -204, -204, -204,
			 -204, -204, -204, -204, -204, -204, -204, -204, -204, -204,

			 -204, -204, -204, -204, -204, -204, -204, -204, -204, -204,
			 -204, -204, -204, -204, -204, -204, -204, -204, -204, -204,
			 -204, -204, -204, -204, -204, -204, -204, -204, -204, -204,
			 -204, -204, -204, -204, -204, -204, -204, -204, -204, -204,
			 -204, -204, -204, -204, -204, -204, -204, -204, -204, -204,
			 -204, -204, -204, -204, -204, -204, -204, -204, -204, -204,
			 -204, -204, -204, -204, -204, -204, -204, -204, -204, -204,
			 -204, -204, -204, -204, -204, -204, -204, -204, -204, -204,
			 -204, -204, -204, -204, -204,    5, -205, -205, -205, -205,
			 -205, -205, -205, -205, -205, -205, -205, -205, -205, -205,

			 -205, -205, -205, -205, -205, -205, -205, -205, -205, -205,
			 -205, -205, -205, -205, -205, -205, -205, -205, -205, -205,
			 -205, -205, -205, -205, -205, -205, -205, -205, -205, -205,
			 -205, -205, -205, -205, -205, -205, -205, -205, -205, -205,
			 -205, -205, -205, -205, -205, -205, -205, -205, -205, -205,
			 -205, -205, -205, -205, -205, -205, -205, -205, -205, -205,
			 -205, -205, -205, -205, -205, -205, -205, -205, -205, -205,
			 -205, -205, -205, -205, -205, -205, -205, -205, -205, -205,
			 -205, -205, -205, -205, -205, -205, -205, -205, -205, -205,
			 -205, -205, -205, -205, -205, -205, -205, -205, -205, -205,

			 -205, -205, -205, -205, -205, -205, -205, -205, -205, -205,
			 -205, -205, -205, -205, -205, -205, -205, -205, -205, -205,
			 -205, -205, -205, -205, -205, -205, -205, -205, -205, -205,
			 -205, -205, -205, -205, -205, -205, -205, -205, -205, -205,
			 -205, -205, -205, -205, -205, -205, -205, -205, -205, -205,
			 -205, -205, -205, -205, -205, -205, -205, -205, -205, -205,
			 -205, -205, -205, -205, -205, -205, -205, -205, -205, -205,
			 -205, -205, -205, -205, -205, -205, -205, -205, -205, -205,
			 -205, -205, -205, -205, -205, -205, -205, -205, -205, -205,
			 -205, -205, -205, -205, -205, -205, -205, -205, -205, -205,

			 -205, -205, -205, -205, -205, -205, -205, -205, -205, -205,
			 -205, -205, -205, -205, -205, -205, -205, -205, -205, -205,
			 -205, -205, -205, -205, -205, -205, -205, -205, -205, -205,
			 -205, -205, -205, -205, -205, -205, -205, -205, -205, -205,
			 -205, -205,    5, -206, -206, -206, -206, -206, -206, -206,
			 -206, -206, -206, -206, -206, -206, -206, -206, -206, -206,
			 -206, -206, -206, -206, -206, -206, -206, -206, -206, -206,
			 -206, -206, -206, -206, -206, -206, -206, -206, -206, -206,
			 -206, -206, -206, -206, -206, -206, -206, -206, -206, -206,
			  208,  208,  208,  208,  208,  208,  208,  208,  208,  208, yy_Dummy>>,
			1, 1000, 52000)
		end

	yy_nxt_template_54 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			 -206, -206, -206, -206, -206, -206, -206, -206, -206, -206,
			 -206, -206, -206, -206, -206, -206, -206, -206, -206, -206,
			 -206, -206, -206, -206, -206, -206, -206, -206, -206, -206,
			 -206, -206, -206, -206, -206, -206, -206, -206, -206, -206,
			 -206, -206, -206, -206, -206, -206, -206, -206, -206, -206,
			 -206, -206, -206, -206, -206, -206, -206, -206, -206, -206,
			 -206, -206, -206, -206, -206, -206, -206, -206, -206, -206,
			 -206, -206, -206, -206, -206, -206, -206, -206, -206, -206,
			 -206, -206, -206, -206, -206, -206, -206, -206, -206, -206,
			 -206, -206, -206, -206, -206, -206, -206, -206, -206, -206,

			 -206, -206, -206, -206, -206, -206, -206, -206, -206, -206,
			 -206, -206, -206, -206, -206, -206, -206, -206, -206, -206,
			 -206, -206, -206, -206, -206, -206, -206, -206, -206, -206,
			 -206, -206, -206, -206, -206, -206, -206, -206, -206, -206,
			 -206, -206, -206, -206, -206, -206, -206, -206, -206, -206,
			 -206, -206, -206, -206, -206, -206, -206, -206, -206, -206,
			 -206, -206, -206, -206, -206, -206, -206, -206, -206, -206,
			 -206, -206, -206, -206, -206, -206, -206, -206, -206, -206,
			 -206, -206, -206, -206, -206, -206, -206, -206, -206, -206,
			 -206, -206, -206, -206, -206, -206, -206, -206, -206,    5,

			 -207, -207, -207, -207, -207, -207, -207, -207, -207, -207,
			 -207, -207, -207, -207, -207, -207, -207, -207, -207, -207,
			 -207, -207, -207, -207, -207, -207, -207, -207, -207, -207,
			 -207, -207, -207, -207, -207, -207, -207, -207, -207, -207,
			 -207, -207,  203, -207,  203, -207, -207,  207,  207,  207,
			  207,  207,  207,  207,  207,  207,  207, -207, -207, -207,
			 -207, -207, -207, -207, -207, -207, -207, -207, -207, -207,
			 -207, -207, -207, -207, -207, -207, -207, -207, -207, -207,
			 -207, -207, -207, -207, -207, -207, -207, -207, -207,  205,
			 -207, -207, -207, -207, -207, -207, -207, -207, -207, -207,

			 -207, -207, -207, -207, -207, -207, -207, -207, -207, -207,
			 -207, -207, -207, -207, -207, -207, -207, -207, -207, -207,
			 -207, -207, -207, -207, -207, -207, -207, -207, -207, -207,
			 -207, -207, -207, -207, -207, -207, -207, -207, -207, -207,
			 -207, -207, -207, -207, -207, -207, -207, -207, -207, -207,
			 -207, -207, -207, -207, -207, -207, -207, -207, -207, -207,
			 -207, -207, -207, -207, -207, -207, -207, -207, -207, -207,
			 -207, -207, -207, -207, -207, -207, -207, -207, -207, -207,
			 -207, -207, -207, -207, -207, -207, -207, -207, -207, -207,
			 -207, -207, -207, -207, -207, -207, -207, -207, -207, -207,

			 -207, -207, -207, -207, -207, -207, -207, -207, -207, -207,
			 -207, -207, -207, -207, -207, -207, -207, -207, -207, -207,
			 -207, -207, -207, -207, -207, -207, -207, -207, -207, -207,
			 -207, -207, -207, -207, -207, -207, -207, -207, -207, -207,
			 -207, -207, -207, -207, -207, -207, -207, -207, -207, -207,
			 -207, -207, -207, -207, -207, -207,    5, -208, -208, -208,
			 -208, -208, -208, -208, -208, -208, -208, -208, -208, -208,
			 -208, -208, -208, -208, -208, -208, -208, -208, -208, -208,
			 -208, -208, -208, -208, -208, -208, -208, -208, -208, -208,
			 -208, -208, -208, -208, -208, -208, -208, -208, -208, -208,

			 -208, -208, -208, -208,  209,  209,  209,  209,  209,  209,
			  209,  209,  209,  209, -208, -208, -208, -208, -208, -208,
			 -208, -208, -208, -208, -208, -208, -208, -208, -208, -208,
			 -208, -208, -208, -208, -208, -208, -208, -208, -208, -208,
			 -208, -208, -208, -208, -208, -208, -208, -208, -208, -208,
			 -208, -208, -208, -208, -208, -208, -208, -208, -208, -208,
			 -208, -208, -208, -208, -208, -208, -208, -208, -208, -208,
			 -208, -208, -208, -208, -208, -208, -208, -208, -208, -208,
			 -208, -208, -208, -208, -208, -208, -208, -208, -208, -208,
			 -208, -208, -208, -208, -208, -208, -208, -208, -208, -208,

			 -208, -208, -208, -208, -208, -208, -208, -208, -208, -208,
			 -208, -208, -208, -208, -208, -208, -208, -208, -208, -208,
			 -208, -208, -208, -208, -208, -208, -208, -208, -208, -208,
			 -208, -208, -208, -208, -208, -208, -208, -208, -208, -208,
			 -208, -208, -208, -208, -208, -208, -208, -208, -208, -208,
			 -208, -208, -208, -208, -208, -208, -208, -208, -208, -208,
			 -208, -208, -208, -208, -208, -208, -208, -208, -208, -208,
			 -208, -208, -208, -208, -208, -208, -208, -208, -208, -208,
			 -208, -208, -208, -208, -208, -208, -208, -208, -208, -208,
			 -208, -208, -208, -208, -208, -208, -208, -208, -208, -208,

			 -208, -208, -208, -208, -208, -208, -208, -208, -208, -208,
			 -208, -208, -208,    5, -209, -209, -209, -209, -209, -209,
			 -209, -209, -209, -209, -209, -209, -209, -209, -209, -209,
			 -209, -209, -209, -209, -209, -209, -209, -209, -209, -209,
			 -209, -209, -209, -209, -209, -209, -209, -209, -209, -209,
			 -209, -209, -209, -209, -209, -209, -209, -209, -209, -209,
			 -209,  205,  205,  205,  205,  205,  205,  205,  205,  205,
			  205, -209, -209, -209, -209, -209, -209, -209, -209, -209,
			 -209, -209, -209, -209, -209, -209, -209, -209, -209, -209,
			 -209, -209, -209, -209, -209, -209, -209, -209, -209, -209,

			 -209, -209, -209, -209, -209, -209, -209, -209, -209, -209,
			 -209, -209, -209, -209, -209, -209, -209, -209, -209, -209,
			 -209, -209, -209, -209, -209, -209, -209, -209, -209, -209,
			 -209, -209, -209, -209, -209, -209, -209, -209, -209, -209,
			 -209, -209, -209, -209, -209, -209, -209, -209, -209, -209,
			 -209, -209, -209, -209, -209, -209, -209, -209, -209, -209,
			 -209, -209, -209, -209, -209, -209, -209, -209, -209, -209,
			 -209, -209, -209, -209, -209, -209, -209, -209, -209, -209,
			 -209, -209, -209, -209, -209, -209, -209, -209, -209, -209,
			 -209, -209, -209, -209, -209, -209, -209, -209, -209, -209,

			 -209, -209, -209, -209, -209, -209, -209, -209, -209, -209,
			 -209, -209, -209, -209, -209, -209, -209, -209, -209, -209,
			 -209, -209, -209, -209, -209, -209, -209, -209, -209, -209,
			 -209, -209, -209, -209, -209, -209, -209, -209, -209, -209,
			 -209, -209, -209, -209, -209, -209, -209, -209, -209, -209,
			 -209, -209, -209, -209, -209, -209, -209, -209, -209, -209,
			 -209, -209, -209, -209, -209, -209, -209, -209, -209, -209, yy_Dummy>>,
			1, 970, 53000)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,   69,   67,    1,    2,   14,
			   51,   17,   67,   15,   16,    7,    6,   12,    5,   10,
			    8,   46,   46,   13,   11,   25,   22,   26,   18,   43,
			   43,   42,   43,   20,   21,    9,   45,   45,   45,   19,
			   55,   56,   57,   58,   55,   55,   55,   55,   55,    1,
			    2,   51,   50,   65,   65,   65,    3,   27,    0,   46,
			    0,   46,   24,   23,    0,   43,   43,   43,   41,   43,
			    0,   45,   31,   45,   45,   45,   45,   45,   55,   57,
			   53,   52,   54,   55,   55,   55,   55,   65,   59,   65,
			   65,   65,   65,   65,   65,    4,   28,   48,   46,    0,

			    0,   47,    0,   43,   42,   42,   42,   42,   43,   43,
			    0,   45,   45,   45,   45,   55,   55,   55,   55,   55,
			   55,   55,   63,   66,   66,   64,   60,   61,   62,    0,
			   46,    0,    0,   43,   43,   43,   43,    0,   41,   41,
			   41,   29,    0,   45,   45,   29,   29,    0,   49,    0,
			   46,   38,   44,   30,    0,   43,   43,    0,    0,   33,
			   30,   30,    0,    0,    0,   38,   41,   32,   40,    0,
			    0,    0,    0,   37,    0,    0,    0,    0,   37,   39,
			    0,   37,    0,    0,    0,    0,   36,    0,    0,   36,
			    0,    0,    0,   35,    0,    0,    0,   35,    0,    0,

			    0,   34,    0,    0,    0,   34,    0,   34,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyNull_equiv_class: INTEGER = 256
			-- Equivalence code for NULL character

	yyNb_rows: INTEGER = 257
			-- Number of rows in `yy_nxt'

	yyBacking_up: BOOLEAN = true
			-- Does current scanner back up?
			-- (i.e. does it have non-accepting states)

	yyNb_rules: INTEGER = 68
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 69
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

	in_interval: BOOLEAN

	start_block_received: BOOLEAN

	block_depth: INTEGER

feature {NONE} -- Initialization

	make
			-- Create a new scanner.
		do
			make_scanner_skeleton
			create in_buffer.make (Init_buffer_size)
			in_lineno := 1
			create str_.make_empty
			create last_string_value.make_empty
		end

feature -- Initialization

	reset
			-- Reset scanner before scanning next input.
		do
			reset_scanner_skeleton
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

end
