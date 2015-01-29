note
	component:   "Eiffel Object Modelling Framework"
	description: "Abstract model of serialisation profile"
	keywords:    "serialisation"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class SERIALISATION_PROFILE

inherit
	SERIALISER_DEFINITIONS
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

feature -- Initialisation

	make (an_output_format: STRING)
			-- make with the output format name this serialiser is to be associated with
		require
			an_output_format_valid: not an_output_format.is_empty
		do
			output_format := an_output_format
		end

feature {ANY_SERIALISER} -- Access

	output_format: STRING
			-- the output format name this profile is
			-- associated with, usually "adl", "xml", "html" etc; needed to allow
			-- embedded ODIN in cADL and vice-versa to be serialised

	symbols: HASH_TABLE[STRING, INTEGER]
			-- keywords in this format, keyed by logical name
		deferred
		end

	tags: HASH_TABLE[STRING, INTEGER]
			-- keywords in this format, keyed by logical name
		deferred
		end

	format_items: HASH_TABLE[STRING, INTEGER]
			-- formatting items
		deferred
		end

	styles: HASH_TABLE[STRING, INTEGER]
			-- styles in this format, keyed by logical name
		deferred
		end

feature  {ANY_SERIALISER} -- Factory

	apply_style (elem: STRING; a_style: INTEGER): STRING
			-- apply `a_style' to `elem'
		require
			A_style_valid: styles.has(a_style)
		deferred
		end

	create_indent (indent_level: INTEGER): STRING
		require
			indent_level >= 0
		local
			i: INTEGER
		do
			create Result.make(0)
			if attached format_items.item (FMT_INDENT) as ind then
				from i := 1 until i > indent_level loop
					Result.append (ind)
					i := i + 1
				end
			end
		end

	clean (str: STRING): STRING
			-- generate clean copy of `str' for particular format; behaviour determined by contents of 
			-- `quote_characters' in descendants
		do
			if not str.is_empty then
				Result := quote_clean (str)
			else
				Result := str
			end
		end

	quote_clean (str: STRING): STRING
			-- if quoting needed `str', generate clean copy of `str' containing quoting determined by `quote_characters'
			-- otherwise just return original string
		local
			i: INTEGER
		do
			if across quote_characters as chars_csr some str.has (chars_csr.key) end then
				create Result.make (str.count)
				from i := 1 until i > str.count loop
					if attached quote_characters.item (str.item (i)) as repl then
						Result.append (repl)
					else
						Result.append_character (str.item (i))
					end
					i := i + 1
				end
			else
				Result := str
			end
		end

	quote_characters: HASH_TABLE [STRING, CHARACTER]
			-- single characters that need quoting
		deferred
		end

end

