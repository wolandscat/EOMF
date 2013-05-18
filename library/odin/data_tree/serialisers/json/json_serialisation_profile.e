note
	component:   "Eiffel Object Modelling Framework"
	description: "Common routines for JSON DT serialisation"
	keywords:    "JSON, serialisation"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class JSON_SERIALISATION_PROFILE

inherit
	SERIALISATION_PROFILE
		redefine
			clean
		end

feature {ANY_SERIALISER} -- Access

	format_items: HASH_TABLE [STRING, INTEGER]
			-- formatting items
		once
			create Result.make(0)
			Result.put(" ",			FMT_SPACE)
			Result.put("%N",		FMT_NEWLINE)
			Result.put("%T",		FMT_INDENT)
			Result.put(", ",		FMT_LIST_ITEM_SEPARATOR)
		end

	styles: HASH_TABLE [STRING, INTEGER]
			-- styles in this format, keyed by logical name
		once
			create Result.make(0)
		end

	quote_patterns: HASH_TABLE [STRING, STRING]
			-- styles in this format, keyed by logical name
		once
			create Result.make(0)
		end

feature {ANY_SERIALISER} -- Factory

	apply_style (elem: STRING; a_style: INTEGER): STRING
			-- apply `a_style' to `elem'
		do
			Result := elem
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
				Result := json_clean (str)
			else
				Result := str
			end
		end

feature {NONE} -- Implementation

	json_clean (str: STRING): STRING
			-- generate clean copy of `str' and convert
			--	\ to \\
			-- 	" to \"
			-- otherwise just return original string
		local
			i: INTEGER
		do
			create Result.make (str.count)
			from i := 1 until i > str.count loop
				if str.item (i) = '%N'  then
					Result.append ("\n")
				elseif str.item (i) = '%T'  then
					Result.append ("\t")
				else
					if str.item (i) = '\' or str.item (i) = '"' then
						Result.append_character ('\')
					end
					Result.append_character (str.item (i))
				end
				i := i + 1
			end
		end

end


