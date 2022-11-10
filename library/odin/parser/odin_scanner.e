note
	component:   "Eiffel Object Modelling Framework"
	description: "Scanner for dADL syntax items"
	keywords:    "ADL, dADL"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2004- The openEHR Foundation <http://www.openEHR.org>"
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
			inspect yy_act
when 1 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 54 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 54")
end
-- Ignore separators
when 2 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 55 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 55")
end
in_lineno := in_lineno + text_count
when 3 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 60 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 60")
end
-- Ignore comments
when 4 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 61 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 61")
end
in_lineno := in_lineno + 1
when 5 then
	yy_position := yy_position + 1
--|#line 65 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 65")
end
last_token := Minus_code
when 6 then
	yy_position := yy_position + 1
--|#line 66 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 66")
end
last_token := Plus_code
when 7 then
	yy_position := yy_position + 1
--|#line 67 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 67")
end
last_token := Star_code
when 8 then
	yy_position := yy_position + 1
--|#line 68 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 68")
end
last_token := Slash_code
when 9 then
	yy_position := yy_position + 1
--|#line 69 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 69")
end
last_token := Caret_code
when 10 then
	yy_position := yy_position + 1
--|#line 70 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 70")
end
last_token := Dot_code
when 11 then
	yy_position := yy_position + 1
--|#line 71 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 71")
end
last_token := Semicolon_code
when 12 then
	yy_position := yy_position + 1
--|#line 72 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 72")
end
last_token := Comma_code
when 13 then
	yy_position := yy_position + 1
--|#line 73 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 73")
end
last_token := Colon_code
when 14 then
	yy_position := yy_position + 1
--|#line 74 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 74")
end
last_token := Exclamation_code
when 15 then
	yy_position := yy_position + 1
--|#line 75 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 75")
end
last_token := Left_parenthesis_code
when 16 then
	yy_position := yy_position + 1
--|#line 76 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 76")
end
last_token := Right_parenthesis_code
when 17 then
	yy_position := yy_position + 1
--|#line 77 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 77")
end
last_token := Dollar_code
when 18 then
	yy_position := yy_position + 1
--|#line 78 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 78")
end
last_token := Question_mark_code
when 19 then
	yy_position := yy_position + 1
--|#line 80 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 80")
end

			if in_interval then
				in_interval := False
			elseif start_block_received then
				in_interval := True
				start_block_received := False
			end
			last_token := SYM_INTERVAL_DELIM
		
when 20 then
	yy_position := yy_position + 1
--|#line 90 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 90")
end
last_token := Left_bracket_code
when 21 then
	yy_position := yy_position + 1
--|#line 91 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 91")
end
last_token := Right_bracket_code
when 22 then
	yy_position := yy_position + 1
--|#line 93 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 93")
end
last_token := SYM_EQ
when 23 then
	yy_position := yy_position + 2
--|#line 95 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 95")
end
last_token := SYM_GE
when 24 then
	yy_position := yy_position + 2
--|#line 96 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 96")
end
last_token := SYM_LE
when 25 then
	yy_position := yy_position + 1
--|#line 98 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 98")
end

			if in_interval then
				last_token := SYM_LT
				start_block_received := False
			else
				last_token := SYM_START_DBLOCK
				start_block_received := True
				block_depth := block_depth + 1
			end
		
when 26 then
	yy_position := yy_position + 1
--|#line 109 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 109")
end

			if in_interval then
				last_token := SYM_GT
			else
				last_token := SYM_END_DBLOCK
				block_depth := block_depth - 1
			end
		
when 27 then
	yy_position := yy_position + 2
--|#line 118 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 118")
end
last_token := SYM_ELLIPSIS
when 28 then
	yy_position := yy_position + 3
--|#line 119 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 119")
end
last_token := SYM_LIST_CONTINUE
when 29 then
	yy_position := yy_position + 4
--|#line 123 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 123")
end
last_token := SYM_TRUE
when 30 then
	yy_position := yy_position + 5
--|#line 125 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 125")
end
last_token := SYM_FALSE
when 31 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 128 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 128")
end

	last_token := V_URI
	last_string_value := text

when 32 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 134 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 134")
end

					last_token := V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
when 33 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 139 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 139")
end

					last_token := V_TERMINOLOGY_ID
					last_string_value := text_substring (2, text_count - 1)
			
when 34 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 144 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 144")
end

					last_token := ERR_V_QUALIFIED_TERM_CODE_REF
					last_string_value := text_substring (2, text_count - 1)
			
when 35 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 151 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 151")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
when 36 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 152 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 152")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
when 37 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 153 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 153")
end

				last_token := V_ISO8601_EXTENDED_DATE_TIME
				last_string_value := text
		
when 38 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 160 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 160")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
when 39 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 161 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 161")
end

				last_token := V_ISO8601_EXTENDED_TIME
				last_string_value := text
		
when 40 then
	yy_position := yy_position + 10
--|#line 168 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 168")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
when 41 then
	yy_position := yy_position + 7
--|#line 169 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 169")
end

				last_token := V_ISO8601_EXTENDED_DATE
				last_string_value := text
		
when 42 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 179 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 179")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
when 43 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 180 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 180")
end

				last_token := V_ISO8601_DURATION
				last_string_value := text
			
when 44 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 186 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 186")
end

					last_token := V_TYPE_IDENTIFIER
					last_string_value := text
			
when 45 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 191 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 191")
end

					last_token := V_GENERIC_TYPE_IDENTIFIER
					last_string_value := text
			
when 46 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 196 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 196")
end

					last_token := V_ATTRIBUTE_IDENTIFIER
					last_string_value := text
			
when 47 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 203 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 203")
end
				-- beginning of CADL block
				if block_depth = 1 then
					in_buffer.append_string (text)
					set_start_condition (IN_CADL_BLOCK)
					cadl_depth := 1
				else
					last_token := ERR_CADL_MISPLACED
				end
			
when 48 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 214 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 214")
end
		-- got an open brace
				in_buffer.append_string (text)
				cadl_depth := cadl_depth + 1
			
when 49 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 218 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 218")
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
			
when 50 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 235 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 235")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
when 51 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 236 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 236")
end

					last_token := V_INTEGER
					last_integer_value := text.to_integer
			
when 52 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 243 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 243")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
when 53 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 244 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 244")
end

						last_token := V_REAL
						last_real_value := text.to_real
					
when 54 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 251 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 251")
end

				last_token := V_STRING
				last_string_value := text_substring (2, text_count - 1)
			
when 55 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 256 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 256")
end
				-- beginning of a string
				if text_count > 1 then
					in_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
when 56 then
	yy_position := yy_position + 2
--|#line 264 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 264")
end
in_buffer.append_character ('\')
when 57 then
	yy_position := yy_position + 2
--|#line 266 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 266")
end
in_buffer.append_character ('"')
when 58 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 268 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 268")
end

				in_buffer.append_string (text)
	
when 59 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 272 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 272")
end
in_buffer.append_string (text)
when 60 then
	yy_position := yy_position + 1
--|#line 274 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 274")
end

				in_lineno := in_lineno + 1	-- match LF in line
				in_buffer.append_character ('%N')
			
when 61 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 279 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 279")
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
			
when 62 then
	yy_position := yy_position + 1
--|#line 292 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 292")
end
	-- Catch-all rules (no backing up)
				last_token := ERR_STRING
				set_start_condition (INITIAL)
			
when 63 then
	yy_position := yy_position + 3
--|#line 302 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 302")
end
last_token := V_CHARACTER; last_character_value := text_item (2)
when 64 then
	yy_position := yy_position + 4
--|#line 304 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 304")
end
last_token := V_CHARACTER; last_character_value := '%N'
when 65 then
	yy_position := yy_position + 4
--|#line 305 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 305")
end
last_token := V_CHARACTER; last_character_value := '%R'
when 66 then
	yy_position := yy_position + 4
--|#line 306 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 306")
end
last_token := V_CHARACTER; last_character_value := '%T'
when 67 then
	yy_position := yy_position + 4
--|#line 307 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 307")
end
last_token := V_CHARACTER; last_character_value := '%''
when 68 then
	yy_position := yy_position + 4
--|#line 308 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 308")
end
last_token := V_CHARACTER; last_character_value := '%H'
when 69 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 310 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 310")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
when 70 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 311 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 311")
end
last_token := ERR_CHARACTER	-- Catch-all rules (no backing up)
when 71 then
	yy_position := yy_position + 1
--|#line 315 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 315")
end
;
when 72 then
	yy_position := yy_position + 1
--|#line 0 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 0")
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
when 0, 2 then
--|#line 314 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 314")
end
terminate
when 1 then
--|#line 294 "odin_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'odin_scanner.l' at line 294")
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
			create an_array.make_filled (0, 0, 1101)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			yy_nxt_template_3 (an_array)
			yy_nxt_template_4 (an_array)
			yy_nxt_template_5 (an_array)
			yy_nxt_template_6 (an_array)
			an_array.area.fill_with (223, 1027, 1101)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			    0,    9,   10,    9,    9,   11,   12,   13,   14,   15,
			   16,   17,   18,   19,   20,   21,   22,   23,   23,   24,
			   24,   24,   25,   26,   27,   28,   29,   30,   31,   31,
			   31,   31,   32,   31,   31,   31,   33,   31,   31,   34,
			   31,   31,   31,   31,   35,    8,   36,   37,    8,   38,
			   38,   38,   38,   39,   38,   38,   38,   38,   38,   38,
			   40,   38,   38,   38,   41,   42,    8,    8,    8,    8,
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
			   79,   79,   79,   79,   79,   79,   79,   79,   79,   79, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
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
			   95,  171,  143,  115,  139,  154,  171,   71,  163,  116,
			  117,   71,   86,  131,  131,  131,  155,  151,  156,  114,
			   86,   86,  171,  143,  115,  139,  174,  172,  174,  163,
			  116,  117,  223,  187,  187,  187,  175,   64,  120,  140,
			  140,  140,  140,  140,  111,  111,  111,  111,  111,   76,
			   86,   76,   70,   66,   86,  112,  106,  176,  105,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   77,   77,   77,   77,   66,   70,   98,   58,   86,   56,
			   70,   89,   89,   89,   90,   70,   86,   95,  144,  144,
			  144,  144,  144,  145,  145,  145,  145,  145,  146,  146,
			  146,  146,  146,   86,  133,  134,  134,  134,  134,  134,
			   74,   91,   91,   91,   86,   74,   92,   92,   70,   69,
			   74,   70,  161,  161,  161,  161,  161,   68,   63,   62,
			  147,   58,  147,   56,  118,  118,  118,  118,  118,   93,
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
			  115,  168,  167,  167,  168,  167,  167,  167,  167,  167,
			  167,  167,  167,  167,  169,  169,  167,  169,  169,  169,
			  169,  169,  167,  167,  167,  167,  167,  167,  169,  169, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  169,  169,  169,  169,  169,  169,  169,  169,  169,  169,
			  169,  169,  169,  169,  167,  167,  170,  167,  169,  169,
			  169,  169,  169,  169,  169,  169,  169,  169,  169,  169,
			  169,  169,  169,  169,  167,  167,  167,  167,  167,  167,
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
			  203,  203,  203,  223,  191,  205,  205,  205,  205,  205, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  206,  206,  206,  206,  206,  207,  207,  207,  207,  207,
			  208,  223,  208,  202,  202,  202,  202,  202,  223,  223,
			  209,  211,  211,  211,  211,  211,  212,  212,  212,  212,
			  213,  213,  213,  213,  213,  214,  214,  214,  214,  214,
			  223,  210,  215,  215,  215,  215,  215,  216,  217,  216,
			  217,  210,  210,  210,  210,  210,  219,  219,  219,  219,
			  219,  220,  220,  220,  220,  220,  221,  221,  221,  221,
			  221,  223,  223,  223,  216,  223,  216,  223,  218,  220,
			  220,  220,  220,  220,  222,  222,  222,  222,  222,  218,
			  218,  218,  218,  218,   43,   43,   43,   43,   43,   43,

			   43,   43,   43,   43,   43,  218,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   57,   57,   57,
			   57,   57,   57,  223,   57,   57,   57,   59,   59,   59,
			   59,   59,   59,   59,   59,   59,   59,   84,   84,   84,
			   84,   84,   84,   84,   84,  223,  223,   84,   85,   85,
			   85,   85,   85,   85,  223,   85,   85,   85,   94,   94,
			   94,   94,   94,   94,   94,   94,  223,   94,   94,   96,
			   96,   96,   96,   96,   96,   96,   96,  223,  223,   96,
			   97,   97,   97,   97,   97,   97,   97,   97,   97,   97,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62, yy_Dummy>>,
			1, 200, 800)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   62,   78,  223,  223,   78,   78,   78,  223,  223,  142,
			  223,   78,  142,  142,  142,  167,  167,  167,  167,  167,
			  167,  167,  167,  167,  167,  167,    7, yy_Dummy>>,
			1, 27, 1000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1101)
			an_array.put (0, 0)
			an_array.area.fill_with (1, 1, 75)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			yy_chk_template_3 (an_array)
			an_array.area.fill_with (152, 571, 645)
			yy_chk_template_4 (an_array)
			yy_chk_template_5 (an_array)
			an_array.area.fill_with (223, 1026, 1101)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    3,    5,   14,    5,    3,    4,    6,   32,    6,    4,
			    9,   34,    9,    9,   23,   39,   23,   23,   23,   23,
			   23,   24,  192,   24,   24,   24,   24,   24,   40,   47,
			   23,   32,   55,  181,   55,   55,   39,   24,  167,   14,
			   46,  195,  195,    3,   34,   80,   33,   48,    4,   40,
			  163,   23,   32,   64,   64,   64,   64,   64,   24,   33,
			   33,   33,   33,   33,  162,   34,   80,   50,    3,    3,
			    3,    3,    3,    4,    4,    4,    4,    4,   49,   46,
			  159,   33,   38,   38,   38,   38,   38,   38,   51,  151,
			   47,   47,   47,   38,   38,   38,   38,   38,   38,   38,

			   38,   38,   38,   38,   38,   38,   38,   38,   38,  150,
			   48,   81,  142,   38,   38,   38,   38,   38,   38,   38,
			   38,   38,   38,   38,   38,   38,   38,   38,   38,   50,
			   50,  120,   81,   61,   90,   72,  104,  103,   91,   49,
			   49,   49,   61,   61,   61,   61,   61,   74,   75,   51,
			   51,   51,   65,   89,   65,   65,   65,   65,   65,   65,
			   74,   74,   74,   74,   74,   72,   82,   66,   65,   66,
			   61,   92,   66,   66,   66,   66,   66,   83,  105,  102,
			  105,  105,   61,   61,   75,   61,   72,   82,   67,   65,
			   67,   67,   67,   67,   67,   90,   90,   90,   83,   91, yy_Dummy>>,
			1, 200, 76)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   91,   91,  114,  121,   67,   75,   93,  100,  100,  100,
			  100,  100,  100,  109,  109,  109,  109,   89,   89,   89,
			   89,   89,  113,  119,  121,   67,   73,  110,  110,  110,
			  110,  110,   92,   92,   92,  143,  101,  114,  122,   73,
			   73,   73,   73,   73,  107,  107,  107,  107,  107,  123,
			  119,  124,   73,   99,   94,  153,  113,   73,  107,  122,
			  154,  228,  143,   73,   73,  228,   85,   93,   93,   93,
			  123,  119,  124,   73,  125,  126,  153,  113,   73,  107,
			  161,  154,  161,  143,   73,   73,   77,  184,  184,  184,
			  161,  108,   76,  108,  108,  108,  108,  108,  111,  111,

			  111,  111,  111,  229,  127,  229,   71,  108,  128,   70,
			   63,  161,   62,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,  108,  115,
			   59,   57,  129,   56,  116,  125,  125,  125,  126,  117,
			  130,   52,  115,  115,  115,  115,  115,  116,  116,  116,
			  116,  116,  117,  117,  117,  117,  117,  131,  134,  134,
			  134,  134,  134,  134,  115,  127,  127,  127,   43,  116,
			  128,  128,   31,   29,  117,  118,  141,  141,  141,  141,
			  141,   27,   21,   20,  118,   12,  118,   10,  118,  118,
			  118,  118,  118,  129,  129,  129,  147,  147,  147,  147, yy_Dummy>>,
			1, 200, 276)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  147,  130,  130,  130,  118,  139,  118,  139,    7,  118,
			  139,  139,  139,  139,  139,    0,    0,    0,  131,  131,
			  131,    0,    0,  168,    0,  118,  168,  118,  140,  140,
			  118,  140,  140,  140,  140,  140,  144,  144,  144,  144,
			  144,  175,  175,  175,  175,  140,  145,  145,  145,  145,
			  145,    0,    0,    0,  144,  146,  146,  146,  146,  146,
			    0,  144,  199,  148,  199,    0,  140,    0,  168,    0,
			  145,  149,  199,  146,    0,  144,  148,  148,  148,  148,
			  148,    0,  144,    0,  149,  149,  149,  149,  149,    0,
			    0,  145,    0,  199,  146, yy_Dummy>>,
			1, 95, 476)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  157,  157,  157,  157,  157,  158,  158,  158,  158,  158,
			  160,    0,  160,  160,  160,  160,  160,  164,  164,  164,
			  164,  164,  169,    0,    0,  169,  160,  165,  165,  165,
			  165,  165,  166,  166,  166,  166,  166,    0,  164,  186,
			  186,  186,  186,  165,    0,    0,    0,  160,  166,    0,
			  166,  173,  173,  173,  173,  173,    0,    0,    0,  164,
			  201,  201,  201,  201,  165,    0,    0,  169,    0,  166,
			  186,  166,  174,  174,  174,  174,  174,  182,  182,  182,
			  182,  182,  183,  183,  183,  183,  183,  185,  185,  185,
			  185,  185,  187,  187,  187,  187,  187,  188,  188,  188,

			  188,  188,  189,  189,  189,  189,  189,  190,  190,  190,
			  190,  190,  193,  193,  193,  193,  193,  194,    0,  194,
			    0,    0,  194,  194,  194,  194,  194,  196,  196,  196,
			  196,  196,  197,  197,  197,  197,  197,  198,  198,  198,
			  198,  198,  200,  200,  200,  200,  200,    0,  194,  203,
			  203,  203,  203,  203,  204,  204,  204,  204,  204,  205,
			  205,  205,  205,  205,  206,    0,  206,  207,  207,  207,
			  207,  207,    0,    0,  206,  208,  208,  208,  208,  208,
			  209,  209,  209,  209,  211,  211,  211,  211,  211,  212,
			  212,  212,  212,  212,    0,  206,  213,  213,  213,  213, yy_Dummy>>,
			1, 200, 646)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  213,  214,  214,  214,  214,  215,  215,  215,  215,  215,
			  216,  216,  216,  216,  216,  217,  217,  217,  217,  217,
			  219,  219,  219,  219,  219,    0,    0,    0,  220,    0,
			  220,    0,  214,  220,  220,  220,  220,  220,  221,  221,
			  221,  221,  221,  222,  222,  222,  222,  222,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  220,
			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  226,  226,  226,  226,  226,  226,    0,  226,  226,
			  226,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  230,  230,  230,  230,  230,  230,  230,  230,    0,

			    0,  230,  231,  231,  231,  231,  231,  231,    0,  231,
			  231,  231,  232,  232,  232,  232,  232,  232,  232,  232,
			    0,  232,  232,  233,  233,  233,  233,  233,  233,  233,
			  233,    0,    0,  233,  234,  234,  234,  234,  234,  234,
			  234,  234,  234,  234,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  236,    0,    0,  236,  236,
			  236,    0,    0,  237,    0,  236,  237,  237,  237,  238,
			  238,  238,  238,  238,  238,  238,  238,  238,  238,  238, yy_Dummy>>,
			1, 180, 846)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 238)
			yy_base_template_1 (an_array)
			yy_base_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_base_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,   74,   79,   13,   18,  484, 1026,   85,
			  461, 1026,  455, 1026,   70, 1026, 1026, 1026, 1026, 1026,
			  445,  443, 1026,   75,   82, 1026, 1026,  432, 1026,  424,
			 1026,  444,   79,  118,   83,    0, 1026, 1026,  141,   63,
			   67,    0, 1026,  438, 1026, 1026,  110,   99,  117,  148,
			  137,  158,  351,    0, 1026,  107,  407,  401, 1026,  398,
			    0,  201,  386,  371,  112,  213,  231,  249, 1026, 1026,
			  361,  378,  207,  298,  219,  220,  346,  340,    0,    0,
			   87,  153,  202,  213,    0,  336, 1026, 1026, 1026,  223,
			  204,  208,  241,  276,  264, 1026,    0, 1026, 1026,  321,

			  267,  304,  247,  205,  204,  253, 1026,  303,  352,  272,
			  286,  357,    0,  294,  274,  401,  406,  411,  447,  295,
			  185,  241,  276,  294,  296,  344,  345,  374,  378,  402,
			  410,  427, 1026, 1026,  418, 1026, 1026, 1026, 1026,  469,
			  490,  435,  162,  307,  495,  505,  514,  455,  535,  543,
			  181,  161,  570,  300,  305,    0,    0,  629,  634,  139,
			  641,  344,  114,  122,  646,  656,  661,   68,  498,  667,
			 1026,    0,    0,  680,  701,  500, 1026, 1026, 1026, 1026,
			 1026,   95,  706,  711,  346,  716,  673,  721,  726,  731,
			  736, 1026,   59,  741,  751,  100,  756,  761,  766,  526, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  771,  689, 1026,  778,  783,  788,  798,  796,  804,  809,
			 1026,  813,  818,  825,  835,  834,  839,  844, 1026,  849,
			  862,  867,  872, 1026,  893,  905,  915,  925,  335,  375,
			  936,  946,  957,  968,  978,  989, 1000, 1007, 1014, yy_Dummy>>,
			1, 39, 200)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 238)
			yy_def_template_1 (an_array)
			an_array.area.fill_with (223, 173, 222)
			yy_def_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_def_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
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
			  223,   77,   38, yy_Dummy>>,
			1, 173, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			    0,  223,  223,  223,  223,  223,  223,  223,  223,  223,
			  223,  223,  223,  223,  223,  223, yy_Dummy>>,
			1, 16, 223)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 257)
			yy_ec_template_1 (an_array)
			an_array.area.fill_with (69, 160, 191)
			an_array.area.fill_with (75, 192, 193)
			an_array.area.fill_with (70, 194, 223)
			yy_ec_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_ec_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    0,   75,   75,   75,   75,   75,   75,   75,   75,    1,
			    2,   75,   75,    3,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,    4,    5,    6,   75,    7,   75,   75,    8,
			    9,   10,   11,   12,   13,   14,   15,   16,   17,   17,
			   18,   19,   20,   20,   20,   21,   21,   21,   22,   23,
			   24,   25,   26,   27,   75,   28,   29,   29,   30,   31,
			   32,   29,   33,   29,   29,   29,   34,   35,   29,   29,
			   36,   29,   37,   38,   39,   40,   29,   41,   29,   42,
			   43,   44,   45,   46,   47,   48,   75,   49,   50,   50,

			   51,   52,   53,   50,   54,   50,   50,   50,   55,   56,
			   57,   50,   50,   50,   58,   59,   60,   61,   50,   62,
			   50,   63,   50,   64,   65,   66,   75,   75,   67,   67,
			   67,   67,   67,   67,   67,   67,   67,   67,   67,   67,
			   67,   67,   67,   67,   68,   68,   68,   68,   68,   68,
			   68,   68,   68,   68,   68,   68,   68,   68,   68,   68, yy_Dummy>>,
			1, 160, 0)
		end

	yy_ec_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			   71,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   73,   74,   74,   74,
			   74,   74,   74,   74,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75, yy_Dummy>>,
			1, 34, 224)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,   11,    1,   11,    2,   11,    3,   11,   11,    4,
			    4,   11,   11,    5,    4,    4,   11,    6,    6,    6,
			    6,    6,   11,   11,    7,   11,    7,   11,    6,    6,
			    6,    6,    6,    6,    6,    6,    6,    6,    6,    6,
			    6,    6,    6,    6,   11,    8,   11,    3,    6,    6,
			    6,    6,    6,    6,    6,    6,    6,    6,    6,    6,
			    6,    6,    6,    6,    9,    3,   10,   11,   11,   11,
			   11,   11,   11,   11,   11,   11, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 223)
			yy_accept_template_1 (an_array)
			yy_accept_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_accept_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
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
			    0,   38,   40,    0,   38,    0,    0,    0,    0,   37, yy_Dummy>>,
			1, 200, 0)
		end

	yy_accept_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,   37,    0,    0,    0,   36,    0,    0,    0,
			   36,    0,    0,    0,   35,    0,    0,    0,   35,    0,
			   35,    0,    0,    0, yy_Dummy>>,
			1, 24, 200)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 1026
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 223
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 224
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 75
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
