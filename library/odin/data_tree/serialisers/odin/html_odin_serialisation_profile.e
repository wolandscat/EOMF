note
	component:   "Eiffel Object Modelling Framework"
	description: "Common routines for HTML ADL serialisation"
	keywords:    "test, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class HTML_ODIN_SERIALISATION_PROFILE

inherit
	HTML_SERIALISATION_PROFILE
		redefine
			make
		end

	ODIN_TOKENS
		export
			{NONE} all
		end

create
	make
	
feature -- Initialisation

	make (an_output_format: STRING)
			-- make with the output format name this serialiser is to be associated with
		do
			precursor (an_output_format)
			create last_string_value.make_empty
		end

feature {NONE} -- Implementation

	symbols: HASH_TABLE[STRING, INTEGER]
			-- keywords in this format, keyed by logical name
		once
			create Result.make(0)
			Result.put("=",				SYM_EQ)
			Result.put("&lt;",			SYM_START_DBLOCK)
			Result.put("&gt;",			SYM_END_DBLOCK)
		end	
	
end


