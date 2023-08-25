note
	component:   "Eiffel Object Modelling Framework"
	description: "Symbol definitions for JSON syntax"
	keywords:    "JSON, serialisation"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class JSON_SYMBOLS

feature -- Token codes

	Sym_json_start_object: INTEGER = 5001
	Sym_json_end_object: INTEGER = 5002
	Sym_json_start_array: INTEGER = 5003
	Sym_json_end_array: INTEGER = 5004
	Sym_json_item_delimiter: INTEGER = 5005
	Sym_json_eq: INTEGER = 5006
	Sym_json_attribute_name_delimiter: INTEGER = 5007
	Sym_json_type_attribute_name: INTEGER = 5008

end
