note
	component:   "Eiffel Object Modelling Framework"
	description: "Definitions of some basic constant values for the openEHR models"
	keywords:    "definitions"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BASIC_DEFINITIONS

feature -- Definitions

	Any_type: STRING = "Any"

	Regex_any_pattern: STRING = ".*"

	CR: CHARACTER = '%/015/'

	LF: CHARACTER = '%/012/'

	Default_language: STRING = "en"

	Default_encoding: STRING = "UTF-8"

	UTF8_bom_char_1: CHARACTER = '%/239/'
	UTF8_bom_char_2: CHARACTER = '%/187/'
	UTF8_bom_char_3: CHARACTER = '%/191/'
			-- UTF-8 files don't normally have a BOM (byte order marker) at the start as can be
			-- required by UTF-16 files, but if the file has been converted from UTF-16 or UTF-32
			-- then the BOM in a UTF-8 file will be 0xEF 0xBB 0xBF (dec equivalent: 239, 187, 191)

	UTF8_copyright_char: CHARACTER = '%/169/'

	Time_epoch: DATE_TIME
		once
			create Result.make_from_epoch (0)
		end

end


