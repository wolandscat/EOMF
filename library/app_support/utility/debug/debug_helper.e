note
	component:   "Eiffel Object Modelling Framework"
	description: "simple debug indent routines"
	keywords:    "debug"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class DEBUG_HELPER

feature -- Access

	indent_str_src: STRING
		attribute
			create Result.make_filled (' ', 50)
		end

	inc_indent
		do
			indent_count := indent_count + 2
		end

	dec_indent
		do
			indent_count := indent_count - 2
		end

	indent_count: INTEGER

end


