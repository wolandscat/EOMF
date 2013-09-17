note component:   "Eiffel Object Modelling Framework"
	description: "Serialisation profile for YAML syntax"
	keywords:    "YAML, serialisation"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class YAML_DT_SERIALISATION_PROFILE

inherit
	YAML_SERIALISATION_PROFILE

	YAML_SYMBOLS
		export
			{NONE} all
		end

create
	make

feature -- Definitions

	Sym_yaml_sequence_entry_string: STRING = "- "

feature {NONE} -- Implementation

	symbols: HASH_TABLE [STRING, INTEGER]
			-- keywords in this format, keyed by logical name
		once
			create Result.make(0)
			Result.put ("[", Sym_yaml_sequence_start)
			Result.put ("]", Sym_yaml_sequence_end)
			Result.put (create {STRING}.make_filled (' ', Yaml_indent - Sym_yaml_sequence_entry_string.count) + Sym_yaml_sequence_entry_string, Sym_yaml_sequence_entry)
			Result.put (",", SYM_YAML_ITEM_DELIMITER)
			Result.put (": ", SYM_YAML_EQ)
		end

	tags: HASH_TABLE [STRING, INTEGER]
			-- keywords in this format, keyed by logical name
		once
			create Result.make (0)
		end

end


