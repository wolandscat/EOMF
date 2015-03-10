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

	quote_characters: HASH_TABLE [STRING, CHARACTER]
			-- styles in this format, keyed by logical name
		once
			create Result.make(0)
			Result.put("\\",			'\')
			Result.put("\%"",			'"')
			Result.put("\t",			'%T')
			Result.put("\n",			'%N')
		end

feature {ANY_SERIALISER} -- Factory

	apply_style (elem: STRING; a_style: INTEGER): STRING
			-- apply `a_style' to `elem'
		do
			Result := elem
		end

end


