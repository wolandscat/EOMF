note

	description: "Parser token codes"
	generator: "geyacc version 4.1"

deferred class BMM_TYPE_NAME_TOKENS

inherit

	YY_PARSER_TOKENS

feature -- Last values

	last_detachable_any_value: detachable ANY
	last_string_value: STRING

feature -- Access

	token_name (a_token: INTEGER): STRING
			-- Name of token `a_token'
		do
			inspect a_token
			when 0 then
				Result := "EOF token"
			when -1 then
				Result := "Error token"
			when SYM_GEN_OPEN then
				Result := "SYM_GEN_OPEN"
			when SYM_GEN_CLOSE then
				Result := "SYM_GEN_CLOSE"
			when SYM_TYPE_CONSTRAIN_SEP then
				Result := "SYM_TYPE_CONSTRAIN_SEP"
			when SYM_COMMA then
				Result := "SYM_COMMA"
			when V_TYPE_ID then
				Result := "V_TYPE_ID"
			when V_GENERIC_TYPE_PARAM_ID then
				Result := "V_GENERIC_TYPE_PARAM_ID"
			else
				Result := yy_character_token_name (a_token)
			end
		end

feature -- Token codes

	SYM_GEN_OPEN: INTEGER = 258
	SYM_GEN_CLOSE: INTEGER = 259
	SYM_TYPE_CONSTRAIN_SEP: INTEGER = 260
	SYM_COMMA: INTEGER = 261
	V_TYPE_ID: INTEGER = 262
	V_GENERIC_TYPE_PARAM_ID: INTEGER = 263

end
