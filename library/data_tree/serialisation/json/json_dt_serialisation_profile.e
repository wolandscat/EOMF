note
	component:   "Eiffel Object Modelling Framework"
	description: "Serialisation profile for JSON syntax"
	keywords:    "JSON, serialisation"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class JSON_DT_SERIALISATION_PROFILE

inherit
	JSON_SERIALISATION_PROFILE

	JSON_SYMBOLS
		export
			{NONE} all
		end

create
	make

feature {NONE} -- Implementation

	symbols: HASH_TABLE [STRING, INTEGER]
			-- keywords in this format, keyed by logical name
		once
			create Result.make(0)
			Result.put ("{", SYM_JSON_START_OBJECT)
			Result.put ("}", SYM_JSON_END_OBJECT)
			Result.put ("[", SYM_JSON_START_ARRAY)
			Result.put ("]", SYM_JSON_END_ARRAY)
			Result.put (",", SYM_JSON_ITEM_DELIMITER)
			Result.put (": ", SYM_JSON_EQ)
			Result.put ("%"", Sym_json_attribute_name_delimiter)
		end

	tags: HASH_TABLE[STRING, INTEGER]
			-- keywords in this format, keyed by logical name
		once
			create Result.make(0)
		end

end


