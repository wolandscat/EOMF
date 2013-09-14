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
if yy_act <= 36 then
if yy_act <= 18 then
if yy_act <= 9 then
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
if yy_act = 8 then
	yy_position := yy_position + 1
--|#line 71 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 71")
end
last_token := Slash_code
else
	yy_position := yy_position + 1
--|#line 72 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 72")
end
last_token := Caret_code
end
end
end
else
if yy_act <= 14 then
if yy_act <= 12 then
if yy_act <= 11 then
if yy_act = 10 then
	yy_position := yy_position + 1
--|#line 73 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 73")
end
last_token := Dot_code
else
	yy_position := yy_position + 1
--|#line 74 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 74")
end
last_token := Semicolon_code
end
else
	yy_position := yy_position + 1
--|#line 75 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 75")
end
last_token := Comma_code
end
else
if yy_act = 13 then
	yy_position := yy_position + 1
--|#line 76 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 76")
end
last_token := Colon_code
else
	yy_position := yy_position + 1
--|#line 77 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 77")
end
last_token := Exclamation_code
end
end
else
if yy_act <= 16 then
if yy_act = 15 then
	yy_position := yy_position + 1
--|#line 78 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 78")
end
last_token := Left_parenthesis_code
else
	yy_position := yy_position + 1
--|#line 79 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 79")
end
last_token := Right_parenthesis_code
end
else
if yy_act = 17 then
	yy_position := yy_position + 1
--|#line 80 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 80")
end
last_token := Dollar_code
else
	yy_position := yy_position + 1
--|#line 81 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 81")
end
last_token := Question_mark_code
end
end
end
end
else
if yy_act <= 27 then
if yy_act <= 23 then
if yy_act <= 21 then
if yy_act <= 20 then
if yy_act = 19 then
	yy_position := yy_position + 1
--|#line 83 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 83")
end

			if in_interval then
				in_interval := False
			elseif start_block_received then
				in_interval := True
				start_block_received := False
			end
			last_token := SYM_INTERVAL_DELIM
		
else
	yy_position := yy_position + 1
--|#line 93 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 93")
end
last_token := Left_bracket_code
end
else
	yy_position := yy_position + 1
--|#line 94 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 94")
end
last_token := Right_bracket_code
end
else
if yy_act = 22 then
	yy_position := yy_position + 1
--|#line 96 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 96")
end
last_token := SYM_EQ
else
	yy_position := yy_position + 2
--|#line 98 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 98")
end
last_token := SYM_GE
end
end
else
if yy_act <= 25 then
if yy_act = 24 then
	yy_position := yy_position + 2
--|#line 99 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 99")
end
last_token := SYM_LE
else
	yy_position := yy_position + 1
--|#line 101 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 101")
end

			if in_interval then
				last_token := SYM_LT
				start_block_received := False
			else
				last_token := SYM_START_DBLOCK
				start_block_received := True
				block_depth := block_depth + 1
			end
		
end
else
if yy_act = 26 then
	yy_position := yy_position + 1
--|#line 112 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 112")
end

			if in_interval then
				last_token := SYM_GT
			else
				last_token := SYM_END_DBLOCK
				block_depth := block_depth - 1
			end
		
else
	yy_position := yy_position + 2
--|#line 121 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 121")
end
last_token := SYM_ELLIPSIS
end
end
end
else
if yy_act <= 32 then
if yy_act <= 30 then
if yy_act <= 29 then
if yy_act = 28 then
	yy_position := yy_position + 3
--|#line 122 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 122")
end
last_token := SYM_LIST_CONTINUE
else
	yy_position := yy_position + 4
--|#line 126 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 126")
end
last_token := SYM_TRUE
end
else
	yy_position := yy_position + 5
--|#line 128 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 128")
end
last_token := SYM_FALSE
end
else
if yy_act = 31 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 131 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 131")
end

	last_token := V_URI
	last_string_value := text

else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 137 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 137")
end

					last_token := V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
end
else
if yy_act <= 34 then
if yy_act = 33 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 142 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 142")
end

					last_token := V_TERMINOLOGY_ID
					last_string_value := text_substring (2, text_count - 1)
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 147 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 147")
end

					last_token := ERR_V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
end
else
if yy_act = 35 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 154 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 154")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 155 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 155")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
end
end
end
end
end
else
if yy_act <= 54 then
if yy_act <= 45 then
if yy_act <= 41 then
if yy_act <= 39 then
if yy_act <= 38 then
if yy_act = 37 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 156 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 156")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 163 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 163")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 164 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 164")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
end
else
if yy_act = 40 then
	yy_position := yy_position + 10
--|#line 171 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 171")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
else
	yy_position := yy_position + 7
--|#line 172 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 172")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
end
end
else
if yy_act <= 43 then
if yy_act = 42 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 182 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 182")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 183 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 183")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
end
else
if yy_act = 44 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 189 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 189")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 194 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 194")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
end
end
end
else
if yy_act <= 50 then
if yy_act <= 48 then
if yy_act <= 47 then
if yy_act = 46 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 199 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 199")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 206 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 206")
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
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 217 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 217")
end
		-- got an open brace
				in_buffer.append_string (text)
				cadl_depth := cadl_depth + 1
			
end
else
if yy_act = 49 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 221 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 221")
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
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 238 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 238")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
end
end
else
if yy_act <= 52 then
if yy_act = 51 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 239 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 239")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 246 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 246")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
end
else
if yy_act = 53 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 247 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 247")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 254 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 254")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
end
end
end
end
else
if yy_act <= 63 then
if yy_act <= 59 then
if yy_act <= 57 then
if yy_act <= 56 then
if yy_act = 55 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 259 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 259")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
else
	yy_position := yy_position + 2
--|#line 267 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 267")
end
in_buffer.append_character ('\')
end
else
	yy_position := yy_position + 2
--|#line 269 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 269")
end
in_buffer.append_character ('"')
end
else
if yy_act = 58 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 271 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 271")
end

				in_buffer.append_string (text)
	
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 275 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 275")
end
in_buffer.append_string (text)
end
end
else
if yy_act <= 61 then
if yy_act = 60 then
	yy_position := yy_position + 1
--|#line 277 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 277")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 282 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 282")
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
if yy_act = 62 then
	yy_position := yy_position + 1
--|#line 295 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 295")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
else
	yy_position := yy_position + 3
--|#line 305 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 305")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
end
end
end
else
if yy_act <= 68 then
if yy_act <= 66 then
if yy_act <= 65 then
if yy_act = 64 then
	yy_position := yy_position + 4
--|#line 307 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 307")
end
last_token := V_CHARACTER; last_character_value := '%N'
else
	yy_position := yy_position + 4
--|#line 308 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 308")
end
last_token := V_CHARACTER; last_character_value := '%R'
end
else
	yy_position := yy_position + 4
--|#line 309 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 309")
end
last_token := V_CHARACTER; last_character_value := '%T'
end
else
if yy_act = 67 then
	yy_position := yy_position + 4
--|#line 310 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 310")
end
last_token := V_CHARACTER; last_character_value := '%''
else
	yy_position := yy_position + 4
--|#line 311 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 311")
end
last_token := V_CHARACTER; last_character_value := '%H'
end
end
else
if yy_act <= 70 then
if yy_act = 69 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 313 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 313")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
else
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 314 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 314")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
end
else
if yy_act = 71 then
	yy_position := yy_position + 1
--|#line 318 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 318")
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
			create an_array.make_filled (0, 0, 1381)
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
			   31,   31,   31,   32,   31,   31,   31,   33,   31,   31,
			   34,   31,   31,   31,   31,   35,    8,   36,   37,    8,
			   38,   38,   38,   38,   39,   38,   38,   38,   38,   38,
			   38,   40,   38,   38,   38,   41,   42,    8,    8,    8,
			    8,    8,    8,    8,    8,    8,   44,   53,   60,   54,
			   45,   44,   53,   70,   54,   45,   55,   70,   55,   55,
			   64,   80,   65,   65,   65,   65,   65,   64,  195,   67,

			   67,   67,   67,   67,   82,   86,   66,   72,   55,  184,
			   55,   55,   81,   66,  178,   61,   87,  197,  197,   46,
			   75,  121,   70,   86,   46,   83,   70,   66,   72,  107,
			  107,  107,  107,  107,   66,   73,   73,   73,   73,   73,
			  162,   75,  121,   86,   47,   48,   49,   50,   51,   47,
			   48,   49,   50,   51,   86,   88,  173,   74,   77,   77,
			   77,   77,   77,   78,   86,   70,   89,   89,   89,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   70,   90,  121,  162,   77,
			   79,   79,   79,   79,   79,   79,   79,   79,   79,   79,

			   79,   79,   79,   79,   79,   92,   92,  152,  122,   99,
			   86,   70,  138,  137,   86,   91,   91,   91,  100,  100,
			  100,  100,  100,   70,   70,   93,   93,   93,   64,   86,
			  108,  108,  108,  108,  108,  109,  118,  118,  118,  118,
			  118,  113,  123,  110,   66,  110,  101,   86,  111,  111,
			  111,  111,  111,  123,  105,  136,  105,  105,  102,  103,
			  119,  104,  113,  123,   64,   66,  108,  108,  108,  108,
			  108,   89,   89,   89,  124,   89,   89,   89,   70,  153,
			   66,  119,   86,  133,  134,  134,  134,  134,  134,  141,
			  141,  141,  141,  125,  126,  127,  128,  129,   70,   70,

			  153,   66,   70,  111,  111,  111,  111,  111,  130,  130,
			  130,   70,  135,   74,  153,   73,   73,   73,   73,   73,
			  107,  107,  107,  107,  107,  155,  151,  155,  114,  132,
			   95,  171,  143,  115,  139,  154,  171,   86,  163,  116,
			  117,  120,   70,  131,  131,  131,  155,  151,  156,  114,
			   86,   86,  171,  143,  115,  139,  174,  172,  174,  163,
			  116,  117,  223,  187,  187,  187,  175,   64,  112,  140,
			  140,  140,  140,  140,  111,  111,  111,  111,  111,  106,
			   86,  105,   98,   66,   86,   58,   56,  176,   95,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,

			   77,   77,   77,   77,   66,   70,   86,   70,   86,   69,
			   70,   89,   89,   89,   90,   70,   86,   68,  144,  144,
			  144,  144,  144,  145,  145,  145,  145,  145,  146,  146,
			  146,  146,  146,   86,  133,  134,  134,  134,  134,  134,
			   74,   91,   91,   91,   63,   74,   92,   92,   62,   58,
			   74,   70,  161,  161,  161,  161,  161,   56,  223,  223,
			  147,  223,  147,  223,  118,  118,  118,  118,  118,   93,
			   93,   93,  164,  164,  164,  164,  164,   89,   89,   89,
			  148,  157,  149,  157,  223,  150,  158,  158,  158,  158,
			  158,  223,  223,  223,   89,   89,   89,  223,  223,  168,

			  223,  148,  168,  149,  159,   64,  150,  160,  160,  160,
			  160,  160,  144,  144,  144,  144,  144,  183,  183,  183,
			  183,   66,  145,  145,  145,  145,  145,  223,  223,  223,
			   71,  146,  146,  146,  146,  146,  223,   71,  200,   70,
			  200,  223,   66,  223,  179,  223,   71,   70,  201,  115,
			  223,   71,  165,  165,  165,  165,  165,  223,   71,  223,
			  166,  166,  166,  166,  166,  223,  223,   71,  223,  202,
			  115,  167,  168,  167,  167,  168,  167,  167,  167,  167,
			  167,  167,  167,  167,  167,  169,  169,  167,  169,  169,
			  169,  169,  169,  167,  167,  167,  167,  167,  167,  169,

			  169,  169,  169,  169,  169,  169,  169,  169,  169,  169,
			  169,  169,  169,  169,  169,  167,  167,  170,  167,  169,
			  169,  169,  169,  169,  169,  169,  169,  169,  169,  169,
			  169,  169,  169,  169,  169,  167,  167,  167,  167,  167,
			  167,  167,  167,  167,  167,  167,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,   64,  223,  160,  160,
			  160,  160,  160,  164,  164,  164,  164,  164,  167,  223,
			  223,  167,   66,  165,  165,  165,  165,  165,  166,  166,
			  166,  166,  166,  223,  177,  189,  190,  189,  190,   71,
			  223,  223,  223,   66,   71,  223,   71,  181,  181,  181,

			  181,  181,  223,  223,  223,  177,  204,  204,  204,  204,
			   71,  223,  223,  180,  223,   71,  191,   71,  182,  182,
			  182,  182,  182,  185,  185,  185,  185,  185,  186,  186,
			  186,  186,  186,  188,  188,  188,  188,  188,  192,  192,
			  192,  192,  192,  176,  176,  176,  176,  176,  193,  193,
			  193,  193,  193,  194,  194,  194,  194,  194,  196,  196,
			  196,  196,  196,  189,  223,  189,  223,  223,  194,  194,
			  194,  194,  194,  198,  198,  198,  198,  198,  199,  199,
			  199,  199,  199,  191,  191,  191,  191,  191,  203,  203,
			  203,  203,  203,  223,  191,  205,  205,  205,  205,  205,

			  206,  206,  206,  206,  206,  207,  207,  207,  207,  207,
			  208,  223,  208,  202,  202,  202,  202,  202,  223,  223,
			  209,  211,  211,  211,  211,  211,  212,  212,  212,  212,
			  213,  213,  213,  213,  213,  214,  214,  214,  214,  214,
			  223,  210,  215,  215,  215,  215,  215,  216,  217,  216,
			  217,  210,  210,  210,  210,  210,  219,  219,  219,  219,
			  219,  220,  220,  220,  220,  220,  221,  221,  221,  221,
			  221,  223,  223,  223,  216,  223,  216,  223,  218,  220,
			  220,  220,  220,  220,  222,  222,  222,  222,  222,  218,
			  218,  218,  218,  218,  223,  223,  223,  223,  223,  223,

			  223,  223,  223,  223,  223,  218,   43,   43,   43,   43,
			   43,   43,   43,   43,   43,   43,   43,   43,   43,   43,
			   43,   43,   43,   43,   43,   43,   43,   43,   43,   43,
			   43,   43,   43,   43,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   57,  223,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,  223,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   59,  223,   59,   59,   59,   59,   59,   59,   59,   59, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			   59,   59,   59,   59,   59,   59,   59,   59,   59,   59,
			   59,   59,   59,   59,   59,   59,   59,   59,   71,  223,
			  223,  223,  223,  223,  223,   71,   71,   71,  223,  223,
			   71,   71,   71,  223,   71,   71,   71,   71,   71,   71,
			   76,   76,  223,   76,   76,   76,   76,   76,  223,  223,
			   76,   76,   76,  223,   76,   76,   76,   76,   76,   76,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,  223,  223,   84,   84,   85,  223,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,

			   85,   85,   85,   85,   85,  223,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			  223,   94,   94,   94,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,  223,  223,
			   96,   96,   97,  223,   97,   97,   97,   97,   97,   97,
			   97,   97,   97,   97,   97,   97,   97,   97,   97,   97,
			   97,   97,   97,   97,   97,   97,   97,   97,   97,   97,

			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   78,   78,
			  223,  223,   78,   78,   78,   78,   78,   78,   78,   78,
			  223,  223,   78,   78,   78,  223,   78,   78,   78,   78,
			   78,   78,  223,  223,   78,   78,  142,  223,  223,  223,
			  142,  223,  223,  142,  142,  142,  142,  142,  142,  142,
			  142,  223,  142,  142,  142,  142,  142,  142,  167,  167,
			  167,  167,  167,  167,  167,  167,  167,  167,  167,  167,
			  167,  167,  167,  167,  167,  167,  167,  167,  167,  167,

			  167,  167,  167,  167,  167,  167,    7,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223, yy_Dummy>>,
			1, 382, 1000)
		end

	yy_chk_template: SPECIAL [INTEGER]
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1381)
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
			    1,    1,    1,    1,    1,    1,    3,    5,   14,    5,
			    3,    4,    6,   32,    6,    4,    9,   34,    9,    9,
			   23,   39,   23,   23,   23,   23,   23,   24,  192,   24,

			   24,   24,   24,   24,   40,   47,   23,   32,   55,  181,
			   55,   55,   39,   24,  167,   14,   46,  195,  195,    3,
			   34,   80,   33,   48,    4,   40,  163,   23,   32,   64,
			   64,   64,   64,   64,   24,   33,   33,   33,   33,   33,
			  162,   34,   80,   50,    3,    3,    3,    3,    3,    4,
			    4,    4,    4,    4,   49,   46,  159,   33,   38,   38,
			   38,   38,   38,   38,   51,  151,   47,   47,   47,   38,
			   38,   38,   38,   38,   38,   38,   38,   38,   38,   38,
			   38,   38,   38,   38,   38,  150,   48,   81,  142,   38,
			   38,   38,   38,   38,   38,   38,   38,   38,   38,   38,

			   38,   38,   38,   38,   38,   50,   50,  120,   81,   61,
			   90,   72,  104,  103,   91,   49,   49,   49,   61,   61,
			   61,   61,   61,   74,   75,   51,   51,   51,   65,   89,
			   65,   65,   65,   65,   65,   65,   74,   74,   74,   74,
			   74,   72,   82,   66,   65,   66,   61,   92,   66,   66,
			   66,   66,   66,   83,  105,  102,  105,  105,   61,   61,
			   75,   61,   72,   82,   67,   65,   67,   67,   67,   67,
			   67,   90,   90,   90,   83,   91,   91,   91,  114,  121,
			   67,   75,   93,  100,  100,  100,  100,  100,  100,  109,
			  109,  109,  109,   89,   89,   89,   89,   89,  113,  119,

			  121,   67,   73,  110,  110,  110,  110,  110,   92,   92,
			   92,  143,  101,  114,  122,   73,   73,   73,   73,   73,
			  107,  107,  107,  107,  107,  123,  119,  124,   73,   99,
			   94,  153,  113,   73,  107,  122,  154,   85,  143,   73,
			   73,   76,   71,   93,   93,   93,  123,  119,  124,   73,
			  125,  126,  153,  113,   73,  107,  161,  154,  161,  143,
			   73,   73,   77,  184,  184,  184,  161,  108,   70,  108,
			  108,  108,  108,  108,  111,  111,  111,  111,  111,   63,
			  127,   62,   59,  108,  128,   57,   56,  161,   52,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,

			   77,   77,   77,   77,  108,  115,   43,   31,  129,   29,
			  116,  125,  125,  125,  126,  117,  130,   27,  115,  115,
			  115,  115,  115,  116,  116,  116,  116,  116,  117,  117,
			  117,  117,  117,  131,  134,  134,  134,  134,  134,  134,
			  115,  127,  127,  127,   21,  116,  128,  128,   20,   12,
			  117,  118,  141,  141,  141,  141,  141,   10,    7,    0,
			  118,    0,  118,    0,  118,  118,  118,  118,  118,  129,
			  129,  129,  147,  147,  147,  147,  147,  130,  130,  130,
			  118,  139,  118,  139,    0,  118,  139,  139,  139,  139,
			  139,    0,    0,    0,  131,  131,  131,    0,    0,  168,

			    0,  118,  168,  118,  140,  140,  118,  140,  140,  140,
			  140,  140,  144,  144,  144,  144,  144,  175,  175,  175,
			  175,  140,  145,  145,  145,  145,  145,    0,    0,    0,
			  144,  146,  146,  146,  146,  146,    0,  144,  199,  148,
			  199,    0,  140,    0,  168,    0,  145,  149,  199,  146,
			    0,  144,  148,  148,  148,  148,  148,    0,  144,    0,
			  149,  149,  149,  149,  149,    0,    0,  145,    0,  199,
			  146,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,

			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  157,  157,  157,  157,
			  157,  158,  158,  158,  158,  158,  160,    0,  160,  160,
			  160,  160,  160,  164,  164,  164,  164,  164,  169,    0,
			    0,  169,  160,  165,  165,  165,  165,  165,  166,  166,
			  166,  166,  166,    0,  164,  186,  186,  186,  186,  165,
			    0,    0,    0,  160,  166,    0,  166,  173,  173,  173,

			  173,  173,    0,    0,    0,  164,  201,  201,  201,  201,
			  165,    0,    0,  169,    0,  166,  186,  166,  174,  174,
			  174,  174,  174,  182,  182,  182,  182,  182,  183,  183,
			  183,  183,  183,  185,  185,  185,  185,  185,  187,  187,
			  187,  187,  187,  188,  188,  188,  188,  188,  189,  189,
			  189,  189,  189,  190,  190,  190,  190,  190,  193,  193,
			  193,  193,  193,  194,    0,  194,    0,    0,  194,  194,
			  194,  194,  194,  196,  196,  196,  196,  196,  197,  197,
			  197,  197,  197,  198,  198,  198,  198,  198,  200,  200,
			  200,  200,  200,    0,  194,  203,  203,  203,  203,  203,

			  204,  204,  204,  204,  204,  205,  205,  205,  205,  205,
			  206,    0,  206,  207,  207,  207,  207,  207,    0,    0,
			  206,  208,  208,  208,  208,  208,  209,  209,  209,  209,
			  211,  211,  211,  211,  211,  212,  212,  212,  212,  212,
			    0,  206,  213,  213,  213,  213,  213,  214,  214,  214,
			  214,  215,  215,  215,  215,  215,  216,  216,  216,  216,
			  216,  217,  217,  217,  217,  217,  219,  219,  219,  219,
			  219,    0,    0,    0,  220,    0,  220,    0,  214,  220,
			  220,  220,  220,  220,  221,  221,  221,  221,  221,  222,
			  222,  222,  222,  222,    0,    0,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,  220,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  225,  225,  225,  225,  225,  225,
			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  225,  226,    0,  226,  226,  226,  226,  226,  226,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,    0,
			  226,  226,  226,  226,  226,  226,  226,  226,  226,  226,
			  227,    0,  227,  227,  227,  227,  227,  227,  227,  227, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
		do
			yy_array_subcopy (an_array, <<
			  227,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  227,  227,  227,  227,  227,  227,  227,  228,    0,
			    0,    0,    0,    0,    0,  228,  228,  228,    0,    0,
			  228,  228,  228,    0,  228,  228,  228,  228,  228,  228,
			  229,  229,    0,  229,  229,  229,  229,  229,    0,    0,
			  229,  229,  229,    0,  229,  229,  229,  229,  229,  229,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,  230,  230,  230,  230,  230,  230,
			  230,  230,  230,  230,    0,    0,  230,  230,  231,    0,
			  231,  231,  231,  231,  231,  231,  231,  231,  231,  231,

			  231,  231,  231,  231,  231,    0,  231,  231,  231,  231,
			  231,  231,  231,  231,  231,  231,  232,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			  232,  232,  232,  232,  232,  232,  232,  232,  232,  232,
			    0,  232,  232,  232,  233,  233,  233,  233,  233,  233,
			  233,  233,  233,  233,  233,  233,  233,  233,  233,  233,
			  233,  233,  233,  233,  233,  233,  233,  233,    0,    0,
			  233,  233,  234,    0,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  234,  234,  234,  234,  234,  234,

			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  236,  236,
			    0,    0,  236,  236,  236,  236,  236,  236,  236,  236,
			    0,    0,  236,  236,  236,    0,  236,  236,  236,  236,
			  236,  236,    0,    0,  236,  236,  237,    0,    0,    0,
			  237,    0,    0,  237,  237,  237,  237,  237,  237,  237,
			  237,    0,  237,  237,  237,  237,  237,  237,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238,

			  238,  238,  238,  238,  238,  238,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223, yy_Dummy>>,
			1, 382, 1000)
		end

	yy_base_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   73,   78,   12,   17,  458, 1306,   84,
			  454, 1306,  442, 1306,   69, 1306, 1306, 1306, 1306, 1306,
			  433,  428, 1306,   74,   81, 1306, 1306,  391, 1306,  383,
			 1306,  402,   78,  117,   82,    0, 1306, 1306,  140,   62,
			   66,    0, 1306,  399, 1306, 1306,  109,   98,  116,  147,
			  136,  157,  321,    0, 1306,  106,  383,  378, 1306,  373,
			    0,  200,  378,  363,  111,  212,  230,  248, 1306, 1306,
			  343,  337,  206,  297,  218,  219,  318,  339,    0,    0,
			   86,  152,  201,  212,    0,  330, 1306, 1306, 1306,  222,
			  203,  207,  240,  275,  263, 1306,    0, 1306, 1306,  320,

			  266,  303,  246,  204,  203,  252, 1306,  302,  351,  271,
			  285,  356,    0,  293,  273,  400,  405,  410,  446,  294,
			  184,  240,  275,  293,  295,  343,  344,  373,  377,  401,
			  409,  426, 1306, 1306,  417, 1306, 1306, 1306, 1306,  468,
			  489,  434,  161,  306,  494,  504,  513,  454,  534,  542,
			  180,  160,  570,  299,  304,    0,    0,  628,  633,  138,
			  640,  343,  113,  121,  645,  655,  660,   67,  497,  666,
			 1306,    0,    0,  679,  700,  499, 1306, 1306, 1306, 1306,
			 1306,   94,  705,  710,  345,  715,  672,  720,  725,  730,
			  735, 1306,   58,  740,  750,   99,  755,  760,  765,  525,

			  770,  688, 1306,  777,  782,  787,  797,  795,  803,  808,
			 1306,  812,  817,  824,  834,  833,  838,  843, 1306,  848,
			  861,  866,  871, 1306,  905,  933,  961,  989, 1015, 1035,
			 1059, 1087, 1115, 1143, 1171, 1199, 1227, 1253, 1277, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,  223,    1,  224,  224,  225,  225,  223,  223,  223,
			  223,  223,  226,  223,  227,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  228,  228,  228,  228,  229,  223,  223,  223,   38,
			   38,  230,  223,  231,  223,  223,  223,  231,  231,  231,
			  231,  231,  232,  233,  223,  223,  223,  226,  223,  234,
			  234,  234,  235,  223,  223,  223,  223,  223,  223,  223,
			  223,  228,  228,  228,  228,  228,  229,   38,  236,   38,
			   77,   38,   77,   38,  230,  231,  223,  223,  223,  231,
			  231,  231,  231,  231,  232,  223,  233,  223,  223,  223,

			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  237,  228,  228,  228,  228,  228,  228,  228,
			  223,   77,   38,   77,   38,  231,  231,  231,  231,  231,
			  231,  231,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  237,  228,   73,  144,  144,  223,  228,  228,
			  228,  228,  223,   77,   38,   77,   38,  223,  223,  223,
			  223,  223,  237,  228,  223,  118,  118,  238,  238,  152,
			  223,   77,   38,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,

			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,    0,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223,  223,  223,  223, yy_Dummy>>)
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
			   33,   30,   34,   30,   30,   30,   35,   36,   30,   30,
			   37,   30,   38,   39,   40,   41,   30,   42,   30,   43,
			   44,   45,   46,   47,   48,   49,    1,   50,   51,   51,

			   52,   53,   54,   51,   55,   51,   51,   51,   56,   57,
			   58,   51,   51,   51,   59,   60,   61,   62,   51,   63,
			   51,   64,   51,   65,   66,   67,    1,    1,   68,   68,
			   68,   68,   68,   68,   68,   68,   68,   68,   68,   68,
			   68,   68,   68,   68,   69,   69,   69,   69,   69,   69,
			   69,   69,   69,   69,   69,   69,   69,   69,   69,   69,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,    1,    1,   71,   71,   71,   71,   71,   71,

			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   72,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   74,   75,   75,   75,   75,   75,   75,   75,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_meta_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    2,    1,    3,    1,    4,    1,    1,
			    5,    6,    1,    1,    7,    8,    9,    1,   10,   10,
			   10,   11,   12,    1,    1,   13,    1,   14,    1,   10,
			   10,   10,   10,   10,   10,   10,   10,   10,   10,   10,
			   10,   15,   16,   10,   17,    1,   18,    1,    4,   10,
			   10,   10,   10,   10,   10,   10,   10,   10,   10,   19,
			   20,   21,   22,   23,   24,   25,    4,   26,   27,   27,
			   27,   27,   27,   27,   27,   28, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,   73,   71,    1,
			    2,   14,   55,   17,   71,   15,   16,    7,    6,   12,
			    5,   10,    8,   50,   50,   13,   11,   25,   22,   26,
			   18,   44,   44,   43,   44,   20,   21,    9,   46,   46,
			   46,   47,   19,   59,   60,   61,   62,   59,   59,   59,
			   59,   59,   72,   48,   49,    1,    2,   55,   54,   69,
			   69,   69,    3,   27,    0,   50,    0,   50,   24,   23,
			    0,   44,   44,   44,   42,   44,    0,   46,   31,   46,
			   46,   46,   46,   46,   47,   59,   61,   57,   56,   58,
			   59,   59,   59,   59,    0,   49,   48,   69,   63,   69,

			   69,   69,   69,   69,   69,    4,   28,   52,   50,    0,
			    0,   51,    0,   44,   43,   43,   43,   43,   44,   44,
			    0,   46,   46,   46,   46,   59,   59,   59,   59,   59,
			   59,   59,   67,   70,   70,   68,   64,   65,   66,    0,
			   50,    0,    0,   44,   44,   44,   44,    0,   42,   42,
			   42,   29,    0,   46,   46,   29,   29,    0,   53,    0,
			   50,   39,   45,   30,    0,   44,   44,    0,    0,    0,
			   33,   30,   30,    0,    0,    0,   39,   42,   34,   33,
			   32,   41,    0,    0,    0,    0,   38,    0,    0,    0,
			    0,   38,   40,    0,   38,    0,    0,    0,    0,   37,

			    0,    0,   37,    0,    0,    0,   36,    0,    0,    0,
			   36,    0,    0,    0,   35,    0,    0,    0,   35,    0,
			   35,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 1306
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 223
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 224
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

	yyNb_rules: INTEGER = 72
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 73
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

end
