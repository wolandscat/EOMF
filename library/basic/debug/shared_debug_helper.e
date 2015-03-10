note
	component:   "Eiffel Object Modelling Framework"
	description: "simple debug indent routines"
	keywords:    "debug"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SHARED_DEBUG_HELPER

feature -- Debug

	dbh: DEBUG_HELPER
		once
			create Result
		end

	indent_str: STRING
		do
			Result := dbh.indent_str_src.substring (1, dbh.indent_count)
		end

	inc_indent
		do
			dbh.inc_indent
		end

	dec_indent
		do
			dbh.dec_indent
		end

end


