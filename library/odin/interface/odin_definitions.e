note
	component:   "Eiffel Object Modelling Framework"
	description: "ODIN definitions"
	keywords:    "ODIN"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ODIN_DEFINITIONS

feature -- Definitions

	Syntax_type_odin: STRING = "odin"
			-- Name of native ODIN syntax type.

	Syntax_type_xml: STRING = "xml"
			-- Name of XML syntax type.

	Syntax_type_json: STRING = "json"
			-- Name of JSON syntax type.

	Syntax_type_yaml: STRING = "yaml"
			-- Name of YAML syntax type.

	File_ext_odin: STRING = ".odin"
			-- Default extension for ODIN format files that don't have some other extension

	File_ext_xml_default: STRING = ".xml"
			-- Default extension for XML format archetype files that don't have some other extension

	File_ext_json_default: STRING = ".json"
			-- Default extension for JSON format archetype files that don't have some other extension

	File_ext_yaml_default: STRING = ".yaml"
			-- Default extension for YAML format archetype files that don't have some other extension

	Odin_left_delim: CHARACTER = '<'

	Odin_right_delim: CHARACTER = '>'

	Odin_key_left_delim: CHARACTER = '['

	Odin_key_right_delim: CHARACTER = ']'

feature -- Access

	odin_serialiser_file_extensions: HASH_TABLE [STRING, STRING]
			-- File extensions for logical serialisation formats.
		once ("PROCESS")
			create Result.make (0)
			Result.put (File_ext_odin, Syntax_type_odin)
			Result.put (File_ext_xml_default, Syntax_type_xml)
			Result.put (File_ext_json_default, Syntax_type_json)
			Result.put (File_ext_yaml_default, Syntax_type_yaml)
		ensure
			not_empty: not Result.is_empty
		end

end


