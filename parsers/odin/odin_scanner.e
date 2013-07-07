note
	component:   "Eiffel Object Modelling Framework"
	description: "Scanner for dADL syntax items"
	keywords:    "ADL, dADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2004- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ODIN_SCANNER

inherit
	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton,
			output as print_out
		end

	ODIN_TOKENS
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
			Result := (INITIAL <= sc and sc <= IN_CADL_BLOCK)
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
if yy_act <= 39 then
if yy_act <= 20 then
if yy_act <= 10 then
if yy_act <= 5 then
if yy_act <= 3 then
if yy_act <= 2 then
if yy_act = 1 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 57 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 57")
end
-- Ignore separators
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 58 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 58")
end
in_lineno := in_lineno + text_count
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 63 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 63")
end
-- Ignore comments
end
else
if yy_act = 4 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 64 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 64")
end
in_lineno := in_lineno + 1
else
	yy_position := yy_position + 1
--|#line 68 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 68")
end
last_token := Minus_code
end
end
else
if yy_act <= 8 then
if yy_act <= 7 then
if yy_act = 6 then
	yy_position := yy_position + 1
--|#line 69 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 69")
end
last_token := Plus_code
else
	yy_position := yy_position + 1
--|#line 70 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 70")
end
last_token := Star_code
end
else
	yy_position := yy_position + 1
--|#line 71 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 71")
end
last_token := Slash_code
end
else
if yy_act = 9 then
	yy_position := yy_position + 1
--|#line 72 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 72")
end
last_token := Caret_code
else
	yy_position := yy_position + 1
--|#line 73 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 73")
end
last_token := Dot_code
end
end
end
else
if yy_act <= 15 then
if yy_act <= 13 then
if yy_act <= 12 then
if yy_act = 11 then
	yy_position := yy_position + 1
--|#line 74 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 74")
end
last_token := Semicolon_code
else
	yy_position := yy_position + 1
--|#line 75 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 75")
end
last_token := Comma_code
end
else
	yy_position := yy_position + 1
--|#line 76 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 76")
end
last_token := Colon_code
end
else
if yy_act = 14 then
	yy_position := yy_position + 1
--|#line 77 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 77")
end
last_token := Exclamation_code
else
	yy_position := yy_position + 1
--|#line 78 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 78")
end
last_token := Left_parenthesis_code
end
end
else
if yy_act <= 18 then
if yy_act <= 17 then
if yy_act = 16 then
	yy_position := yy_position + 1
--|#line 79 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 79")
end
last_token := Right_parenthesis_code
else
	yy_position := yy_position + 1
--|#line 80 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 80")
end
last_token := Dollar_code
end
else
	yy_position := yy_position + 2
--|#line 81 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 81")
end
last_token := SYM_DT_UNKNOWN
end
else
if yy_act = 19 then
	yy_position := yy_position + 1
--|#line 82 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 82")
end
last_token := Question_mark_code
else
	yy_position := yy_position + 1
--|#line 84 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 84")
end

			if in_interval then
				in_interval := False
			elseif start_block_received then
				in_interval := True
				start_block_received := False
			end
			last_token := SYM_INTERVAL_DELIM
		
end
end
end
end
else
if yy_act <= 30 then
if yy_act <= 25 then
if yy_act <= 23 then
if yy_act <= 22 then
if yy_act = 21 then
	yy_position := yy_position + 1
--|#line 94 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 94")
end
last_token := Left_bracket_code
else
	yy_position := yy_position + 1
--|#line 95 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 95")
end
last_token := Right_bracket_code
end
else
	yy_position := yy_position + 1
--|#line 97 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 97")
end
last_token := SYM_EQ
end
else
if yy_act = 24 then
	yy_position := yy_position + 2
--|#line 99 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 99")
end
last_token := SYM_GE
else
	yy_position := yy_position + 2
--|#line 100 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 100")
end
last_token := SYM_LE
end
end
else
if yy_act <= 28 then
if yy_act <= 27 then
if yy_act = 26 then
	yy_position := yy_position + 1
--|#line 102 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 102")
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
	yy_position := yy_position + 1
--|#line 113 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 113")
end

			if in_interval then
				last_token := SYM_GT
			else
				last_token := SYM_END_DBLOCK
				block_depth := block_depth - 1
			end
		
end
else
	yy_position := yy_position + 2
--|#line 122 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 122")
end
last_token := SYM_ELLIPSIS
end
else
if yy_act = 29 then
	yy_position := yy_position + 3
--|#line 123 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 123")
end
last_token := SYM_LIST_CONTINUE
else
	yy_position := yy_position + 4
--|#line 127 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 127")
end
last_token := SYM_TRUE
end
end
end
else
if yy_act <= 35 then
if yy_act <= 33 then
if yy_act <= 32 then
if yy_act = 31 then
	yy_position := yy_position + 5
--|#line 129 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 129")
end
last_token := SYM_FALSE
else
	yy_position := yy_position + 8
--|#line 131 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 131")
end
last_token := SYM_INFINITY
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 134 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 134")
end

	last_token := V_URI
	last_string_value := text

end
else
if yy_act = 34 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 140 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 140")
end

					last_token := V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 145 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 145")
end

					last_token := V_TERMINOLOGY_ID
					last_string_value := text_substring (2, text_count - 1)
			
end
end
else
if yy_act <= 37 then
if yy_act = 36 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 150 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 150")
end

					last_token := ERR_V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 155 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 155")
end

					last_token := V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 38 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 160 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 160")
end

					last_token := ERR_V_LOCAL_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 166 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 166")
end

					last_token := V_LOCAL_CODE
					last_string_value := text
			
end
end
end
end
end
else
if yy_act <= 58 then
if yy_act <= 49 then
if yy_act <= 44 then
if yy_act <= 42 then
if yy_act <= 41 then
if yy_act = 40 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 173 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 173")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 174 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 174")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 175 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 175")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
else
if yy_act = 43 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 182 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 182")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 183 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 183")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
end
else
if yy_act <= 47 then
if yy_act <= 46 then
if yy_act = 45 then
	yy_position := yy_position + 10
--|#line 190 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 190")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
	yy_position := yy_position + 7
--|#line 191 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 191")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 201 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 201")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
else
if yy_act = 48 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 202 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 202")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 208 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 208")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
end
end
end
else
if yy_act <= 54 then
if yy_act <= 52 then
if yy_act <= 51 then
if yy_act = 50 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 213 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 213")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 218 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 218")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 225 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 225")
end
				-- beginning of CADL block
				if block_depth = 1 then
					in_buffer.append_string (text)
					set_start_condition (IN_CADL_BLOCK)
					cadl_depth := 1
				else
					last_token := ERR_CADL_MISPLACED
				end
			
end
else
if yy_act = 53 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 236 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 236")
end
		-- got an open brace
				in_buffer.append_string (text)
				cadl_depth := cadl_depth + 1
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 240 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 240")
end
		-- got a close brace
				in_buffer.append_string (text)
				cadl_depth := cadl_depth - 1
				if cadl_depth = 0 then
					set_start_condition (INITIAL)
					last_token := V_CADL_BLOCK
					create last_string_value.make(in_buffer.count)
					last_string_value.append(in_buffer)
					in_lineno := in_lineno + in_buffer.occurrences('%N')
					in_buffer.wipe_out
				end
			
end
end
else
if yy_act <= 56 then
if yy_act = 55 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 257 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 257")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 258 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 258")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
end
else
if yy_act = 57 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 265 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 265")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 266 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 266")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
end
end
end
else
if yy_act <= 68 then
if yy_act <= 63 then
if yy_act <= 61 then
if yy_act <= 60 then
if yy_act = 59 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 273 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 273")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 278 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 278")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
end
else
	yy_position := yy_position + 2
--|#line 286 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 286")
end
in_buffer.append_character ('\')
end
else
if yy_act = 62 then
	yy_position := yy_position + 2
--|#line 288 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 288")
end
in_buffer.append_character ('"')
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 290 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 290")
end

				in_buffer.append_string (text)
	
end
end
else
if yy_act <= 66 then
if yy_act <= 65 then
if yy_act = 64 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 294 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 294")
end
in_buffer.append_string (text)
else
	yy_position := yy_position + 1
--|#line 296 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 296")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 301 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 301")
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
			
end
else
if yy_act = 67 then
	yy_position := yy_position + 1
--|#line 314 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 314")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
else
	yy_position := yy_position + 3
--|#line 324 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 324")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
end
end
end
else
if yy_act <= 73 then
if yy_act <= 71 then
if yy_act <= 70 then
if yy_act = 69 then
	yy_position := yy_position + 4
--|#line 326 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 326")
end
last_token := V_CHARACTER; last_character_value := '%N'
else
	yy_position := yy_position + 4
--|#line 327 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 327")
end
last_token := V_CHARACTER; last_character_value := '%R'
end
else
	yy_position := yy_position + 4
--|#line 328 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 328")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
else
if yy_act = 72 then
	yy_position := yy_position + 4
--|#line 329 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 329")
end
last_token := V_CHARACTER; last_character_value := '%''
else
	yy_position := yy_position + 4
--|#line 330 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 330")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
else
if yy_act <= 75 then
if yy_act = 74 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 332 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 332")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 333 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 333")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 76 then
	yy_position := yy_position + 1
--|#line 337 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 337")
end
;
else
	yy_position := yy_position + 1
--|#line 0 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 0")
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
when 0, 2 then
--|#line 0 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 0")
end
terminate
when 1 then
--|#line 0 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 0")
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
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1700)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,    8,    9,   10,    9,    9,   11,   12,   13,   14,
			   15,   16,   17,   18,   19,   20,   21,   22,   23,   23,
			   24,   24,   24,   25,   26,   27,   28,   29,   30,   31,
			   31,   31,   31,   32,   31,   33,   31,   31,   31,   34,
			   31,   31,   35,   31,   31,   31,   31,   36,    8,   37,
			   38,    8,   39,   40,   40,   40,   40,   41,   40,   42,
			   40,   40,   40,   40,   40,   43,   40,   40,   40,   44,
			   45,    8,    8,    8,    8,    8,    8,    8,    8,    8,
			   47,   56,   63,   57,   48,   47,   56,   74,   57,   48,
			   58,   74,   58,   58,   67,   97,   68,   68,   68,   68,

			   68,   67,   86,   70,   70,   70,   70,   70,   74,  138,
			   69,   96,   96,   86,   88,   76,   58,   69,   58,   58,
			   77,   64,   81,   81,  240,   49,   74,   81,   81,  135,
			   49,   86,   74,  138,   69,   96,   98,   89,   76,   86,
			  135,   69,   86,   80,   77,   78,   78,   78,   78,   78,
			   86,  226,   50,   51,   52,   53,   54,   50,   51,   52,
			   53,   54,   96,   81,   83,   96,   80,  215,   74,   79,
			   84,   84,   84,   84,   84,   85,   99,   99,   99,  100,
			  212,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,  123,

			  101,  101,  101,   84,   86,   86,   87,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   87,   86,   86,
			   86,   90,  140,  123,   92,  232,  232,  232,  102,  102,
			  103,  103,  103,  115,   74,  115,  115,   86,   86,   74,
			   74,  109,  187,  174,   74,   91,  140,   93,   86,   86,
			  110,  110,  110,  110,  110,  117,  117,  117,  117,  117,
			   67,  206,  118,  118,  118,  118,  118,  119,   96,  173,
			   86,   79,  124,  242,  242,   74,   69,  120,  130,  120,
			  111,   86,  121,  121,  121,  121,  121,   67,   74,  118,
			  118,  118,  118,  118,  112,  113,  124,  114,   74,  140,

			   69,  130,  136,   69,  137,  137,  137,  137,  137,  142,
			   96,  129,  129,  129,  129,  129,   96,   96,  187,   86,
			   86,   74,  178,  141,  173,   74,  142,   69,   74,  138,
			   86,   86,  142,   99,   99,   99,  176,   86,  173,  172,
			   86,   78,   78,   78,   78,   78,  178,   86,   86,  143,
			  180,   86,  157,  139,  125,  163,  156,  162,   86,  176,
			  126,  152,  153,  153,  153,  153,  153,  127,  128,  160,
			  160,  160,  160,   96,  180,   99,   99,   99,  125,  163,
			  162,  149,  149,  149,  126,  144,  145,  146,  147,  148,
			  127,  128,  132,  132,  132,  132,  132,  132,  132,  132,

			  132,  133,  133,  132,  132,  132,  133,  133,  132,  133,
			  133,  133,  133,  133,  134,  132,  132,  132,  132,  132,
			  133,  133,  133,  133,  133,  133,  133,  133,  133,  133,
			  133,  133,  133,  133,  133,  133,  133,  133,  132,  132,
			  100,  132,  133,  133,  133,  133,  133,  133,  133,  133,
			  133,  133,  133,  133,  133,  133,  133,  133,  133,  133,
			  132,  132,  132,  132,  132,  132,  132,  132,  132,  132,
			  132,  268,   96,  121,  121,  121,  121,  121,  155,  117,
			  117,  117,  117,  117,  121,  121,  121,  121,  121,   96,
			  154,  151,  175,  158,  175,  175,  175,  175,  175,   74,

			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,  158,   67,   86,
			  159,  159,  159,  159,  159,  173,  171,   74,  105,  180,
			   86,   96,   74,   74,   69,  178,   96,  150,  150,  150,
			  164,  164,  164,  164,  164,  165,  165,  165,  165,  165,
			  171,   86,   96,  181,   86,  102,  102,   74,   69,  179,
			   96,  131,   86,   96,   79,   86,  189,   96,  202,   79,
			  166,  166,  166,  166,  166,  136,  176,  136,  136,  136,
			  136,  136,  136,  202,  137,  137,  137,  137,  137,   86,
			  189,  204,  202,   74,   79,   74,   99,   99,   99,  177,

			   86,  101,  101,  101,  167,   86,  167,  203,  129,  129,
			  129,  129,  129,  122,  116,  204,   86,  103,  103,  103,
			   74,  115,  194,  224,  168,  194,  230,  169,   99,   99,
			   99,  170,   99,   99,   99,  152,  153,  153,  153,  153,
			  153,  186,  186,  186,  186,  186,  224,  188,  168,  230,
			  182,  169,  182,  108,  170,  183,  183,  183,  183,  183,
			  184,   67,   61,  185,  185,  185,  185,  185,   59,  213,
			   74,  188,  164,  164,  164,  164,  164,   69,  165,  165,
			  165,  165,  165,  166,  166,  166,  166,  166,  207,  105,
			  207,   75,  190,  190,  190,  190,  190,   74,  208,   75,

			  210,   69,  126,   74,   75,  183,  183,  183,  183,  183,
			  191,  191,  191,  191,  191,   75,  192,  192,  192,  192,
			  192,  209,   75,   96,  210,   74,  126,   75,  193,  194,
			  193,  193,  194,  193,  193,  193,  193,  193,  193,  193,
			  193,  193,  195,  195,  193,  195,  195,  195,  195,  195,
			  193,  193,  193,  193,  193,  193,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  193,  193,  196,  193,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  193,  193,  193,  193,

			  193,  193,  193,  193,  193,  193,  193,  197,  198,  197,
			  197,  198,  197,  197,  197,  197,  197,  197,  197,  197,
			  197,  199,  199,  197,  199,  199,  199,  199,  199,  197,
			  197,  197,  197,  197,  197,  199,  199,  199,  199,  199,
			  199,  199,  199,  199,  199,  199,  199,  199,  199,  199,
			  199,  199,  199,  197,  197,  200,  197,  199,  199,  199,
			  199,  199,  199,  199,  199,  199,  199,  199,  199,  199,
			  199,  199,  199,  199,  199,  197,  197,  197,  197,  197,
			  197,  197,  197,  197,  197,  197,  175,  204,  175,  175,
			  175,  175,  175,  183,  183,  183,  183,  183,  193,   73,

			   72,  193,   67,   86,  185,  185,  185,  185,  185,  198,
			  197,  205,  198,  197,   86,  218,   71,   66,   69,  201,
			  190,  190,  190,  190,  190,  191,  191,  191,  191,  191,
			  192,  192,  192,  192,  192,  222,  222,  222,  222,  218,
			   74,   75,   69,  211,  218,  214,   75,   65,   61,   75,
			  220,  220,  220,  220,  220,  224,  216,  217,  221,  221,
			  221,  221,  221,   86,   74,   75,  211,   86,  219,   59,
			   75,  268,  268,   75,   86,  268,  268,  223,  225,  227,
			  227,  227,  227,  227,  228,  228,  228,  228,  228,  230,
			  233,  233,  233,  233,  233,  268,  268,  268,   86,  268, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  223,  268,  268,  268,  229,  234,  235,  234,  235,   86,
			  268,  268,  231,  237,  237,  237,  237,  237,  209,  209,
			  209,  209,  209,  249,  249,  249,  249,  229,  238,  238,
			  238,  238,  238,  239,  239,  239,  239,  239,  236,  241,
			  241,  241,  241,  241,  234,  268,  234,  268,  268,  239,
			  239,  239,  239,  239,  243,  243,  243,  243,  243,  244,
			  244,  244,  244,  244,  236,  236,  236,  236,  236,  245,
			  268,  245,  248,  248,  248,  248,  248,  236,  268,  246,
			  250,  250,  250,  250,  250,  251,  251,  251,  251,  251,
			  252,  252,  252,  252,  252,  253,  268,  253,  257,  257,

			  257,  257,  247,  268,  268,  254,  247,  247,  247,  247,
			  247,  256,  256,  256,  256,  256,  258,  258,  258,  258,
			  258,  259,  259,  259,  259,  259,  268,  268,  255,  260,
			  260,  260,  260,  260,  261,  262,  261,  262,  255,  255,
			  255,  255,  255,  264,  264,  264,  264,  264,  265,  265,
			  265,  265,  265,  266,  266,  266,  266,  266,  267,  267,
			  267,  267,  267,  261,  268,  261,  268,  263,  265,  265,
			  265,  265,  265,  263,  263,  263,  263,  263,  268,  268,
			  268,  268,  268,  268,  268,  268,  268,  268,  268,  268,
			  268,  268,  268,  268,  268,  268,  263,   46,   46,   46,

			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   60,  268,   60,
			   60,   60,   60,   60,   60,   60,   60,   60,   60,   60,
			   60,   60,   60,  268,   60,   60,   60,   60,   60,   60,
			   60,   60,   62,  268,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   75,  268,  268,

			  268,  268,  268,  268,   75,   75,  268,  268,   75,   75,
			   75,  268,   75,   75,   75,   75,   75,   75,   82,   82,
			  268,   82,   82,   82,   82,  268,  268,   82,   82,   82,
			  268,   82,   82,   82,   82,   82,   82,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   95,  268,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,  268,   95,   95,   95,
			   95,   95,   95,   95,   95,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,

			  104,  104,  104,  104,  104,  104,  104,  104,  268,  104,
			  106,  106,  106,  106,  106,  106,  106,  106,  106,  106,
			  106,  106,  106,  106,  106,  106,  106,  106,  106,  106,
			  106,  106,  106,  107,  268,  107,  107,  107,  107,  107,
			  107,  107,  107,  107,  107,  107,  107,  107,  107,  107,
			  107,  107,  107,  107,  107,  107,  107,  107,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   81,   81,  268,   81,   81,   81,   81,
			   81,  268,   81,   81,   81,  268,   81,   81,   81,   81,

			   81,   81,   85,   85,  268,  268,   85,   85,   85,   85,
			   85,   85,   85,   85,  268,   85,   85,   85,  268,   85,
			   85,   85,   85,   85,   85,  161,  268,  268,  268,  161,
			  268,  268,  161,  161,  268,  161,  161,  161,  161,  268,
			  161,  161,  161,  161,  161,  161,  132,  132,  132,  132,
			  132,  132,  132,  132,  132,  132,  132,  132,  132,  132,
			  132,  132,  132,  132,  132,  132,  132,  132,  132,  132,
			  132,  193,  193,  193,  193,  193,  193,  193,  193,  193,
			  193,  193,  193,  193,  193,  193,  193,  193,  193,  193,
			  193,  193,  193,  193,  193,  193,  197,  197,  197,  197,

			  197,  197,  197,  197,  197,  197,  197,  197,  197,  197,
			  197,  197,  197,  197,  197,  197,  197,  197,  197,  197,
			  197,    7,  268,  268,  268,  268,  268,  268,  268,  268,
			  268,  268,  268,  268,  268,  268,  268,  268,  268,  268,
			  268,  268,  268,  268,  268,  268,  268,  268,  268,  268,
			  268,  268,  268,  268,  268,  268,  268,  268,  268,  268,
			  268,  268,  268,  268,  268,  268,  268,  268,  268,  268,
			  268,  268,  268,  268,  268,  268,  268,  268,  268,  268,
			  268,  268,  268,  268,  268,  268,  268,  268,  268,  268,
			  268,  268,  268,  268,  268,  268,  268,  268,  268,  268,

			  268, yy_Dummy>>,
			1, 701, 1000)
		end

	yy_chk_template: SPECIAL [INTEGER]
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1700)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    3,    5,   14,    5,    3,    4,    6,   33,    6,    4,
			    9,   32,    9,    9,   23,   49,   23,   23,   23,   23,

			   23,   24,   40,   24,   24,   24,   24,   24,   35,   88,
			   23,   50,   51,   40,   41,   32,   58,   24,   58,   58,
			   33,   14,   36,   36,  237,    3,  229,   36,   36,   83,
			    4,   86,   34,   88,   23,   52,   49,   41,   32,   41,
			   83,   24,   86,   35,   33,   34,   34,   34,   34,   34,
			   41,  220,    3,    3,    3,    3,    3,    4,    4,    4,
			    4,    4,   53,   36,   36,   54,   35,  197,   76,   34,
			   39,   39,   39,   39,   39,   39,   50,   50,   50,   51,
			  193,   39,   39,   39,   39,   39,   39,   39,   39,   39,
			   39,   39,   39,   39,   39,   39,   39,   39,   39,   76,

			   52,   52,   52,   39,   39,   39,   39,   39,   39,   39,
			   39,   39,   39,   39,   39,   39,   39,   39,   39,   39,
			   39,   42,   90,   76,   43,  226,  226,  226,   53,   53,
			   54,   54,   54,  115,  125,  115,  115,   42,   43,  188,
			   80,   64,  187,  134,   77,   42,   90,   43,   42,   43,
			   64,   64,   64,   64,   64,   67,   67,   67,   67,   67,
			   68,  184,   68,   68,   68,   68,   68,   68,  100,  134,
			  181,  125,   77,  240,  240,  171,   68,   69,   80,   69,
			   64,  181,   69,   69,   69,   69,   69,   70,  170,   70,
			   70,   70,   70,   70,   64,   64,   77,   64,   79,   91,

			   68,   80,   87,   70,   87,   87,   87,   87,   87,   92,
			  101,   79,   79,   79,   79,   79,  102,   99,  161,  203,
			   91,  123,  140,   91,  133,  124,   93,   70,   78,   89,
			  203,   91,   92,  100,  100,  100,  138,   93,  132,  131,
			   87,   78,   78,   78,   78,   78,  140,   89,   93,   93,
			  142,   87,  114,   89,   78,  124,  113,  123,   89,  138,
			   78,  110,  110,  110,  110,  110,  110,   78,   78,  119,
			  119,  119,  119,  145,  142,  101,  101,  101,   78,  124,
			  123,  102,  102,  102,   78,   99,   99,   99,   99,   99,
			   78,   78,   82,   82,   82,   82,   82,   82,   82,   82,

			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			  145,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   84,  103,  120,  120,  120,  120,  120,  112,  117,
			  117,  117,  117,  117,  121,  121,  121,  121,  121,  147,
			  111,  109,  135,  117,  135,  135,  135,  135,  135,  130,

			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,  117,  118,  231,
			  118,  118,  118,  118,  118,  135,  130,  126,  104,  143,
			  231,  144,  127,  163,  118,  141,  146,  103,  103,  103,
			  126,  126,  126,  126,  126,  127,  127,  127,  127,  127,
			  130,  143,  148,  143,  141,  147,  147,  128,  118,  141,
			   95,   81,  143,  149,  126,  141,  163,  150,  176,  127,
			  128,  128,  128,  128,  128,  136,  139,  136,  136,  136,
			  136,  136,  137,  177,  137,  137,  137,  137,  137,  139,
			  163,  178,  176,   75,  128,  129,  144,  144,  144,  139,

			  139,  146,  146,  146,  129,  177,  129,  177,  129,  129,
			  129,  129,  129,   74,   66,  178,  177,  148,  148,  148,
			  162,   65,  194,  218,  129,  194,  224,  129,  149,  149,
			  149,  129,  150,  150,  150,  153,  153,  153,  153,  153,
			  153,  160,  160,  160,  160,  160,  218,  162,  129,  224,
			  158,  129,  158,   62,  129,  158,  158,  158,  158,  158,
			  159,  159,   60,  159,  159,  159,  159,  159,   59,  194,
			  189,  162,  164,  164,  164,  164,  164,  159,  165,  165,
			  165,  165,  165,  166,  166,  166,  166,  166,  186,   55,
			  186,  164,  167,  167,  167,  167,  167,  168,  186,  164,

			  189,  159,  166,  169,  165,  182,  182,  182,  182,  182,
			  168,  168,  168,  168,  168,  164,  169,  169,  169,  169,
			  169,  186,  164,   46,  189,   31,  166,  165,  172,  172,
			  172,  172,  172,  172,  172,  172,  172,  172,  172,  172,
			  172,  172,  172,  172,  172,  172,  172,  172,  172,  172,
			  172,  172,  172,  172,  172,  172,  172,  172,  172,  172,
			  172,  172,  172,  172,  172,  172,  172,  172,  172,  172,
			  172,  172,  172,  172,  172,  172,  172,  172,  172,  172,
			  172,  172,  172,  172,  172,  172,  172,  172,  172,  172,
			  172,  172,  172,  172,  172,  172,  172,  172,  172,  172,

			  172,  172,  172,  172,  172,  172,  172,  174,  174,  174,
			  174,  174,  174,  174,  174,  174,  174,  174,  174,  174,
			  174,  174,  174,  174,  174,  174,  174,  174,  174,  174,
			  174,  174,  174,  174,  174,  174,  174,  174,  174,  174,
			  174,  174,  174,  174,  174,  174,  174,  174,  174,  174,
			  174,  174,  174,  174,  174,  174,  174,  174,  174,  174,
			  174,  174,  174,  174,  174,  174,  174,  174,  174,  174,
			  174,  174,  174,  174,  174,  174,  174,  174,  174,  174,
			  174,  174,  174,  174,  174,  174,  175,  179,  175,  175,
			  175,  175,  175,  183,  183,  183,  183,  183,  195,   30,

			   29,  195,  185,  179,  185,  185,  185,  185,  185,  198,
			  199,  179,  198,  199,  179,  204,   27,   21,  185,  175,
			  190,  190,  190,  190,  190,  191,  191,  191,  191,  191,
			  192,  192,  192,  192,  192,  208,  208,  208,  208,  204,
			  210,  191,  185,  190,  205,  195,  192,   20,   12,  192,
			  206,  206,  206,  206,  206,  219,  198,  199,  207,  207,
			  207,  207,  207,  205,  223,  191,  190,  219,  205,   10,
			  192,    7,    0,  192,  205,    0,    0,  210,  219,  221,
			  221,  221,  221,  221,  222,  222,  222,  222,  222,  225,
			  227,  227,  227,  227,  227,    0,    0,    0,  225,    0, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  210,    0,    0,    0,  223,  228,  228,  228,  228,  225,
			    0,    0,  225,  232,  232,  232,  232,  232,  233,  233,
			  233,  233,  233,  246,  246,  246,  246,  223,  234,  234,
			  234,  234,  234,  235,  235,  235,  235,  235,  228,  238,
			  238,  238,  238,  238,  239,    0,  239,    0,    0,  239,
			  239,  239,  239,  239,  241,  241,  241,  241,  241,  242,
			  242,  242,  242,  242,  243,  243,  243,  243,  243,  244,
			    0,  244,  245,  245,  245,  245,  245,  239,    0,  244,
			  248,  248,  248,  248,  248,  249,  249,  249,  249,  249,
			  250,  250,  250,  250,  250,  251,    0,  251,  254,  254,

			  254,  254,  244,    0,    0,  251,  252,  252,  252,  252,
			  252,  253,  253,  253,  253,  253,  256,  256,  256,  256,
			  256,  257,  257,  257,  257,  257,    0,    0,  251,  258,
			  258,  258,  258,  258,  259,  259,  259,  259,  260,  260,
			  260,  260,  260,  261,  261,  261,  261,  261,  262,  262,
			  262,  262,  262,  264,  264,  264,  264,  264,  266,  266,
			  266,  266,  266,  265,    0,  265,    0,  259,  265,  265,
			  265,  265,  265,  267,  267,  267,  267,  267,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,  265,  269,  269,  269,

			  269,  269,  269,  269,  269,  269,  269,  269,  269,  269,
			  269,  269,  269,  269,  269,  269,  269,  269,  269,  269,
			  269,  269,  270,  270,  270,  270,  270,  270,  270,  270,
			  270,  270,  270,  270,  270,  270,  270,  270,  270,  270,
			  270,  270,  270,  270,  270,  270,  270,  271,    0,  271,
			  271,  271,  271,  271,  271,  271,  271,  271,  271,  271,
			  271,  271,  271,    0,  271,  271,  271,  271,  271,  271,
			  271,  271,  272,    0,  272,  272,  272,  272,  272,  272,
			  272,  272,  272,  272,  272,  272,  272,  272,  272,  272,
			  272,  272,  272,  272,  272,  272,  272,  273,    0,    0,

			    0,    0,    0,    0,  273,  273,    0,    0,  273,  273,
			  273,    0,  273,  273,  273,  273,  273,  273,  274,  274,
			    0,  274,  274,  274,  274,    0,    0,  274,  274,  274,
			    0,  274,  274,  274,  274,  274,  274,  275,  275,  275,
			  275,  275,  275,  275,  275,  275,  275,  275,  275,  275,
			  275,  275,  275,  275,  275,  275,  275,  275,  275,  275,
			  276,    0,  276,  276,  276,  276,  276,  276,  276,  276,
			  276,  276,  276,  276,  276,  276,    0,  276,  276,  276,
			  276,  276,  276,  276,  276,  277,  277,  277,  277,  277,
			  277,  277,  277,  277,  277,  277,  277,  277,  277,  277,

			  277,  277,  277,  277,  277,  277,  277,  277,    0,  277,
			  278,  278,  278,  278,  278,  278,  278,  278,  278,  278,
			  278,  278,  278,  278,  278,  278,  278,  278,  278,  278,
			  278,  278,  278,  279,    0,  279,  279,  279,  279,  279,
			  279,  279,  279,  279,  279,  279,  279,  279,  279,  279,
			  279,  279,  279,  279,  279,  279,  279,  279,  280,  280,
			  280,  280,  280,  280,  280,  280,  280,  280,  280,  280,
			  280,  280,  280,  280,  280,  280,  280,  280,  280,  280,
			  280,  280,  280,  281,  281,    0,  281,  281,  281,  281,
			  281,    0,  281,  281,  281,    0,  281,  281,  281,  281,

			  281,  281,  282,  282,    0,    0,  282,  282,  282,  282,
			  282,  282,  282,  282,    0,  282,  282,  282,    0,  282,
			  282,  282,  282,  282,  282,  283,    0,    0,    0,  283,
			    0,    0,  283,  283,    0,  283,  283,  283,  283,    0,
			  283,  283,  283,  283,  283,  283,  284,  284,  284,  284,
			  284,  284,  284,  284,  284,  284,  284,  284,  284,  284,
			  284,  284,  284,  284,  284,  284,  284,  284,  284,  284,
			  284,  285,  285,  285,  285,  285,  285,  285,  285,  285,
			  285,  285,  285,  285,  285,  285,  285,  285,  285,  285,
			  285,  285,  285,  285,  285,  285,  286,  286,  286,  286,

			  286,  286,  286,  286,  286,  286,  286,  286,  286,  286,
			  286,  286,  286,  286,  286,  286,  286,  286,  286,  286,
			  286,  268,  268,  268,  268,  268,  268,  268,  268,  268,
			  268,  268,  268,  268,  268,  268,  268,  268,  268,  268,
			  268,  268,  268,  268,  268,  268,  268,  268,  268,  268,
			  268,  268,  268,  268,  268,  268,  268,  268,  268,  268,
			  268,  268,  268,  268,  268,  268,  268,  268,  268,  268,
			  268,  268,  268,  268,  268,  268,  268,  268,  268,  268,
			  268,  268,  268,  268,  268,  268,  268,  268,  268,  268,
			  268,  268,  268,  268,  268,  268,  268,  268,  268,  268,

			  268, yy_Dummy>>,
			1, 701, 1000)
		end

	yy_base_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   77,   82,   12,   17,  971, 1621,   88,
			  966, 1621,  941, 1621,   73, 1621, 1621, 1621, 1621, 1621,
			  932,  901, 1621,   78,   85, 1621, 1621,  890, 1621,  874,
			  871,  720,   86,   82,  127,  103,  112, 1621, 1621,  152,
			   48,   85,  183,  184,    0, 1621,  716, 1621, 1621,   88,
			  104,  105,  128,  155,  158,  618,    0, 1621,  114,  665,
			  655, 1621,  644,    0,  232,  618,  598,  237,  244,  264,
			  271, 1621, 1621, 1621,  588,  588,  163,  239,  323,  293,
			  235,  538,  391,   75,  448,    0,   77,  286,   73,  293,
			  189,  266,  266,  283,    0,  553, 1621, 1621, 1621,  310,

			  261,  303,  309,  465,  457, 1621,    0, 1621, 1621,  482,
			  344,  481,  469,  347,  343,  231, 1621,  461,  502,  351,
			  455,  466,    0,  316,  320,  229,  522,  527,  552,  590,
			  494,  316,  289,  275,  220,  476,  559,  566,  295,  535,
			  287,  500,  318,  497,  524,  366,  529,  482,  545,  556,
			  560, 1621, 1621,  618, 1621, 1621, 1621, 1621,  637,  645,
			  623,  291,  615,  528,  654,  660,  665,  674,  692,  698,
			  283,  270,  727, 1621,  806,  870,  536,  551,  553,  849,
			    0,  216,  687,  875,  243,  886,  675,  215,  234,  665,
			  902,  907,  912,  131,  620,  896, 1621,  118,  907,  908,

			 1621, 1621,    0,  265,  880,  909,  932,  940,  917, 1621,
			  935, 1621, 1621, 1621, 1621, 1621, 1621, 1621,  581,  913,
			  136,  961,  966,  959,  581,  944,  207,  972,  992,  121,
			    0,  465,  995, 1000, 1010, 1015, 1621,   82, 1021, 1031,
			  255, 1036, 1041, 1046, 1056, 1054, 1005, 1621, 1062, 1067,
			 1072, 1082, 1088, 1093, 1080, 1621, 1098, 1103, 1111, 1121,
			 1120, 1125, 1130, 1621, 1135, 1150, 1140, 1155, 1621, 1196,
			 1221, 1246, 1271, 1294, 1313, 1336, 1359, 1384, 1409, 1432,
			 1457, 1478, 1501, 1522, 1545, 1570, 1595, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,  268,    1,  269,  269,  270,  270,  268,  268,  268,
			  268,  268,  271,  268,  272,  268,  268,  268,  268,  268,
			  268,  268,  268,  268,  268,  268,  268,  268,  268,  268,
			  268,  273,  273,  273,  273,  273,  274,  268,  268,  268,
			   39,   39,   39,   39,  275,  268,  276,  268,  268,  268,
			  276,  276,  276,  276,  276,  277,  278,  268,  268,  268,
			  271,  268,  279,  279,  279,  280,  268,  268,  268,  268,
			  268,  268,  268,  268,  268,  273,  273,  273,  273,  273,
			  273,  281,  268,   82,   39,  282,   39,   39,   84,   39,
			   84,   39,   84,   39,  275,  276,  268,  268,  268,  276,

			  276,  276,  276,  276,  277,  268,  278,  268,  268,  268,
			  268,  268,  268,  268,  268,  268,  268,  268,  268,  268,
			  268,  268,  283,  273,  273,  273,  273,  273,  273,  273,
			  273,  268,  284,   82,  284,   82,  268,   84,   84,   39,
			   84,   39,   84,   39,  276,  276,  276,  276,  276,  276,
			  276,  268,  268,  268,  268,  268,  268,  268,  268,  268,
			  268,  283,  273,  273,   78,  164,  164,  268,  273,  273,
			  273,  273,  268,  268,  268,   82,   84,   39,   84,   39,
			   84,   39,  268,  268,  268,  268,  268,  283,  273,  273,
			  268,  129,  129,  285,  285,  172,  268,  286,  286,  174,

			  268,  268,   84,   39,   84,   39,  268,  268,  268,  268,
			  273,  268,  268,  268,  268,  268,  268,  268,   84,   39,
			  268,  268,  268,  273,   84,   39,  268,  268,  268,  273,
			   84,   39,  268,  268,  268,  268,  268,  268,  268,  268,
			  268,  268,  268,  268,  268,  268,  268,  268,  268,  268,
			  268,  268,  268,  268,  268,  268,  268,  268,  268,  268,
			  268,  268,  268,  268,  268,  268,  268,  268,    0,  268,
			  268,  268,  268,  268,  268,  268,  268,  268,  268,  268,
			  268,  268,  268,  268,  268,  268,  268, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    4,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    5,    6,    7,    1,    8,    1,    1,    9,
			   10,   11,   12,   13,   14,   15,   16,   17,   18,   18,
			   19,   20,   21,   21,   21,   22,   22,   22,   23,   24,
			   25,   26,   27,   28,    1,   29,   30,   30,   31,   32,
			   33,   30,   34,   35,   30,   30,   36,   37,   38,   30,
			   39,   30,   40,   41,   42,   43,   30,   44,   30,   45,
			   46,   47,   48,   49,   50,   51,    1,   52,   53,   54,

			   55,   56,   57,   53,   58,   59,   53,   53,   60,   61,
			   62,   53,   53,   53,   63,   64,   65,   66,   53,   67,
			   53,   68,   53,   69,   70,   71,    1,    1,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   74,   74,   74,   74,   74,   74,   74,   74,   74,   74,
			   74,   74,   74,   74,   74,   74,   74,   74,   74,   74,
			   74,   74,   74,   74,   74,   74,   74,   74,   74,   74,
			   74,   74,    1,    1,   75,   75,   75,   75,   75,   75,

			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   76,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   78,   79,   79,   79,   79,   79,   79,   79,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_meta_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    2,    1,    3,    1,    4,    1,    1,
			    5,    6,    1,    1,    7,    8,    9,    1,   10,   10,
			   10,   10,   11,   12,    1,   13,    1,   13,    1,   10,
			   10,   10,   10,   10,   10,   10,   10,   10,   10,   10,
			   10,   10,   10,   14,   15,   10,   16,    1,   17,    1,
			    4,   10,   10,   10,   10,   10,   10,   10,   10,   10,
			   10,   10,   10,   18,   19,   20,   21,   22,   23,   24,
			    4,   25,    1,    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,   78,   76,    1,
			    2,   14,   60,   17,   76,   15,   16,    7,    6,   12,
			    5,   10,    8,   55,   55,   13,   11,   26,   23,   27,
			   19,   49,   49,   49,   48,   49,   21,   22,    9,   51,
			   51,   51,   51,   51,   52,   20,   64,   65,   66,   67,
			   64,   64,   64,   64,   64,   77,   53,   54,    1,    2,
			   60,   59,   74,   74,   74,    3,   28,    0,   55,    0,
			   55,   25,   24,   18,    0,   49,   49,   49,   49,   47,
			   49,    0,    0,    0,   51,   33,   51,   51,   51,   51,
			   51,   51,   51,   51,   52,   64,   66,   62,   61,   63,

			   64,   64,   64,   64,    0,   54,   53,   74,   68,   74,
			   74,   74,   74,   74,   74,    4,   29,   57,   55,    0,
			    0,   56,    0,   49,   49,   48,   48,   48,   48,   49,
			   49,    0,    0,    0,    0,    0,   39,   39,   51,   51,
			   51,   51,   51,   51,   64,   64,   64,   64,   64,   64,
			   64,   72,   75,   75,   73,   69,   70,   71,    0,   55,
			    0,    0,   49,   49,   49,   49,   49,    0,   47,   47,
			   47,   30,    0,   38,    0,    0,   51,   51,   51,   51,
			   30,   30,    0,   58,    0,   55,   44,   50,   31,   49,
			    0,   49,   49,    0,    0,    0,   35,    0,    0,    0,

			   35,   37,   31,   31,   51,   51,    0,    0,    0,   44,
			   49,   47,   36,   35,   34,   36,   35,   34,   51,   51,
			   46,    0,    0,   49,   51,   51,    0,    0,   43,   32,
			   32,   32,    0,    0,    0,    0,   43,   45,    0,   43,
			    0,    0,    0,    0,   42,    0,    0,   42,    0,    0,
			    0,   41,    0,    0,    0,   41,    0,    0,    0,   40,
			    0,    0,    0,   40,    0,   40,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 1621
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 268
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 269
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 1
			-- Equivalence code for NULL character

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

	yyNb_rules: INTEGER = 77
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 78
			-- End of buffer rule code

	yyLine_used: BOOLEAN = false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN = true
			-- Is `position' used?

	INITIAL: INTEGER = 0
	IN_STR: INTEGER = 1
	IN_CADL_BLOCK: INTEGER = 2
			-- Start condition codes

feature -- User-defined features



feature {NONE} -- Local variables

	i_, nb_: INTEGER
	char_: CHARACTER
	str_: STRING
	code_: INTEGER

	cadl_depth: INTEGER

	in_interval: BOOLEAN

	start_block_received: BOOLEAN

	block_depth: INTEGER

feature {NONE} -- Initialization

	make
			-- Create a new scanner.
		do
			make_compressed_scanner_skeleton
			create in_buffer.make (Init_buffer_size)
			in_lineno := 1
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

end
