note
	component:   "Eiffel Object Modelling Framework"
	description: "Scanner for type-names"
	keywords:    "BMM, types"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2017- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_TYPE_NAME_SCANNER

inherit
	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton,
			output as print_out
		end

	BMM_TYPE_NAME_TOKENS
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
			Result := (sc = INITIAL)
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
--|#line 43 "bmm_type_name_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bmm_type_name_scanner.l' at line 43")
end
-- Ignore separators
when 2 then
	yy_position := yy_position + 1
--|#line 47 "bmm_type_name_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bmm_type_name_scanner.l' at line 47")
end
last_token := SYM_TYPE_CONSTRAIN_SEP
when 3 then
	yy_position := yy_position + 1
--|#line 49 "bmm_type_name_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bmm_type_name_scanner.l' at line 49")
end
last_token := SYM_GEN_OPEN
when 4 then
	yy_position := yy_position + 1
--|#line 51 "bmm_type_name_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bmm_type_name_scanner.l' at line 51")
end
last_token := SYM_GEN_CLOSE
when 5 then
	yy_position := yy_position + 1
--|#line 53 "bmm_type_name_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bmm_type_name_scanner.l' at line 53")
end
last_token := SYM_COMMA
when 6 then
	yy_position := yy_position + yy_end - yy_start - yy_more_len
--|#line 56 "bmm_type_name_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bmm_type_name_scanner.l' at line 56")
end

				last_token := V_TYPE_ID
				last_string_value := text
		
when 7 then
	yy_position := yy_position + 1
--|#line 61 "bmm_type_name_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bmm_type_name_scanner.l' at line 61")
end

				last_token := V_GENERIC_TYPE_PARAM_ID
				last_string_value := text
		
when 8 then
	yy_position := yy_position + 1
--|#line 67 "bmm_type_name_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bmm_type_name_scanner.l' at line 67")
end
;
when 9 then
	yy_position := yy_position + 1
--|#line 0 "bmm_type_name_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bmm_type_name_scanner.l' at line 0")
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
--|#line 66 "bmm_type_name_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'bmm_type_name_scanner.l' at line 66")
end
terminate
			else
				terminate
			end
		end

feature {NONE} -- Table templates

	yy_nxt_template: SPECIAL [INTEGER]
			-- Template for `yy_nxt'
		once
			Result := yy_fixed_array (<<
			    0,    4,    5,    6,    7,    4,    8,    9,   10,   11,
			   13,   12,   12,   14,    3,   14,   14,   14,   14,   14,
			   14,   14,   14,   14, yy_Dummy>>)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			   15,   12,    5,    3,   14,   14,   14,   14,   14,   14,
			   14,   14,   14,   14, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   13,   14,   10,   14,   14,   14,   14,
			   14,    0,    9,    0,   14,    8, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,   14,    1,   14,   14,   14,   14,   14,   14,   14,
			   14,   15,   14,   15,    0,   14, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 256)
			yy_ec_template_1 (an_array)
			yy_ec_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_ec_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    2,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    4,    1,    1,    1,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    6,    1,
			    7,    1,    8,    1,    1,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    1,    1,    1,    1,    5,    1,    5,    5,    5,

			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>,
			1, 200, 0)
		end

	yy_ec_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>,
			1, 57, 200)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    2,    1,    1,    1,    2, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   10,    8,    1,    9,    5,    2,    3,
			    4,    7,    1,    6,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 14
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 14
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 15
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

	yyNb_rules: INTEGER = 9
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 10
			-- End of buffer rule code

	yyLine_used: BOOLEAN = false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN = true
			-- Is `position' used?

	INITIAL: INTEGER = 0
			-- Start condition codes

feature -- User-defined features



feature {NONE} -- Local variables

	i_, nb_: INTEGER
	char_: CHARACTER
	str_: STRING
	code_: INTEGER

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

feature {NONE} -- Constants

	Init_buffer_size: INTEGER = 256
				-- Initial size for `in_buffer'

end
