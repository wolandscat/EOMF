note
	component:   "Eiffel Object Modelling Framework"
	description: "Serialisation profile for native ADL"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class NATIVE_SERIALISATION_PROFILE

inherit
	SERIALISATION_PROFILE

feature {ANY_SERIALISER} -- Access

	format_items: HASH_TABLE[STRING, INTEGER]
			-- formatting items
		once
			create Result.make(0)
			Result.put(" ",			FMT_SPACE)
			Result.put("-- ",			FMT_COMMENT)
			Result.put("%N",			FMT_NEWLINE)
			Result.put("%T",			FMT_INDENT)

			Result.put("",			FMT_DOC_START)
			Result.put("",			FMT_DOC_END)
			Result.put("",			FMT_DOC_STYLES)
			Result.put("",			FMT_START_BODY)
			Result.put("%N",		FMT_END_BODY)
			Result.put("",			FMT_START_SPAN)
			Result.put("",			FMT_END_SPAN)
			Result.put("",			FMT_START_TITLE)
			Result.put("",			FMT_END_TITLE)
			Result.put("",			FMT_META_ITEM)
			Result.put(", ",		FMT_LIST_ITEM_SEPARATOR)
			Result.put("; ",		FMT_ASSUMED_VALUE_SEPARATOR)
		end

	styles: HASH_TABLE[STRING, INTEGER]
			-- styles in this format, keyed by logical name
		once
			create Result.make (0)
			Result.put ("", style_keyword)
			Result.put ("", style_operator)
			Result.put ("", style_identifier)
			Result.put ("", style_inherited_identifier)
			Result.put ("", style_redefined_identifier)
			Result.put ("", style_term_ref)
			Result.put ("", style_value)
			Result.put ("", style_comment)
		end

	tags: HASH_TABLE[STRING, INTEGER]
			-- tag strings, keyed by logical name
		once
			create Result.make(0)
		end

	quote_characters: HASH_TABLE [STRING, CHARACTER]
			-- convert
			--	\ to \\
			-- 	" to \"
		once
			create Result.make(0)
			Result.put("\\",			'\')
			Result.put("\%"",			'"')
		end

feature {ANY_SERIALISER} -- Factory

	apply_style (elem: STRING; a_style: INTEGER): STRING
			-- apply `a_style' to `elem', using attr 'class'
		do
			Result := elem
		end

end


