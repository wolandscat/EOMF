note
	component:   "Eiffel Object Modelling Framework"
	description: "Common routines for XML ADL serialisation"
	keywords:    "test, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class XML_SERIALISATION_PROFILE

inherit
	SERIALISATION_PROFILE

feature {ANY_SERIALISER} -- Access

	format_items: HASH_TABLE[STRING, INTEGER]
			-- formatting items
		once
			create Result.make(0)
			Result.put("%N",				FMT_NEWLINE)
			Result.put("%T",				FMT_INDENT)
			Result.put("<?xml version=%"1.0%" encoding=%"ISO-8859-1%"?>%N",	FMT_DOC_START)
		end

	styles: HASH_TABLE[STRING, INTEGER]
			-- styles in this format, keyed by logical name
		once
			create Result.make(0)
		end

	quote_characters: HASH_TABLE [STRING, CHARACTER]
		once
			create Result.make(0)
			Result.put("&lt;",			'<')
			Result.put("&gt;",			'>')
			Result.put("&amp;",			'&')
		end

feature {ANY_SERIALISER} -- Factory

	apply_style (elem: STRING; a_style: INTEGER): STRING
			-- apply `a_style' to `elem', using attr 'class'
		do
			Result := elem
		end

end


