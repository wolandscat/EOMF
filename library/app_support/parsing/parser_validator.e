note
	component:   "Eiffel Object Modelling Framework"
	description: "Interface for gobo parser with added error collection"
	keywords:    "ADL, archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2007- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class PARSER_VALIDATOR

inherit
	ANY_VALIDATOR

	YY_PARSER_SKELETON
		redefine
			report_error
		end

feature -- Access

	source_start_line: INTEGER
		deferred
		end

	output: detachable ANY

feature -- Commands

	validate
		do
		end

feature {YY_PARSER_ACTION} -- Basic Operations

	report_error (a_message: STRING)
			-- Print error message.
		do
			add_error_with_location ("general_error", <<a_message>>, error_loc)
		end

	abort_with_error (err_code: STRING; args: ARRAY [STRING])
		do
			add_error_with_location (err_code, args, error_loc)
			abort
		end

	error_loc: STRING
		deferred
		end

end


