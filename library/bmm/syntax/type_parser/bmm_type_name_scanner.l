%{
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
%}

--------------- Definitions --------------
IDCHAR [a-zA-Z0-9_]

---------------- Options -----------------
%option position outfile="bmm_type_name_scanner.e"

%%

----------/** Separators **/----------------------------------------------------

[ \t\r]+		-- Ignore separators


----------/* symbols */ -------------------------------------------------
":"		last_token := SYM_TYPE_CONSTRAIN_SEP

"<"		last_token := SYM_GEN_OPEN

">"		last_token := SYM_GEN_CLOSE

","		last_token := SYM_COMMA

----------/* V_TYPE_ID */ --------------------------------------
[A-Z]{IDCHAR}+	{
				last_token := V_TYPE_ID
				last_string_value := text
		}
----------/* V_GENERIC_TYPE_PARAM_ID */ --------------------------------------
[A-Z]		{
				last_token := V_GENERIC_TYPE_PARAM_ID
				last_string_value := text
		}

<<EOF>>			terminate
.				;


%%

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
