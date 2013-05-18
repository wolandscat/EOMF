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

	STRING_UTILITIES
		export
			{NONE} all
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
			-- generate clean copy of `str' by inserting \ quoting for chars in `quoted_chars' not already quoted in `str':
			-- find all instances of '\' and '"' that are not already being used in the quote patterns, e.g. like:
			--	\n, \r, \t, \\, \", \'
			-- and convert
			--	\ to \\
			-- 	" to \"
		do
			if not str.is_empty then
				Result := quote_clean (str)
			else
				Result := str
			end
		end

end


