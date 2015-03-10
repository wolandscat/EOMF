note
	component:   "Eiffel Object Modelling Framework"
	description: "ADL archetype path"
	keywords:    "test, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2004- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class OG_PATH_TOOLS

feature -- Access

	path_parse_error: STRING
			-- result of last failed parse
		once ("PROCESS")
			create Result.make_empty
		end

feature -- Validation

	valid_path_string (a_path: STRING): BOOLEAN
			-- True if a_path parses properly
		require
			not a_path.is_empty
		local
			path_parser: OG_PATH_VALIDATOR
		do
			path_parse_error.wipe_out
			create path_parser.make
			path_parser.execute (a_path)
			if path_parser.syntax_error then
				path_parse_error.append (path_parser.errors.as_string)
			else
				Result := True
			end
		ensure
			Error_supplied: not Result implies not path_parse_error.is_empty
		end

end


