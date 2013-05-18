note
	component:   "Eiffel Object Modelling Framework"
	description: "Error descriptor abstraction"
	keywords:    "error status reporting"

	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ERROR_DESCRIPTOR

inherit
	ERROR_SEVERITY_TYPES

create
	make, make_error, make_warning, make_info, make_debug

feature -- Initialisation

	make_error (a_code, a_message: STRING; a_loc: detachable STRING)
		do
			make (a_code, error_type_error, a_message, a_loc)
		end

	make_warning (a_code, a_message: STRING; a_loc: detachable STRING)
		do
			make (a_code, error_type_warning, a_message, a_loc)
		end

	make_info (a_code, a_message: STRING; a_loc: detachable STRING)
		do
			make (a_code, error_type_info, a_message, a_loc)
		end

	make_debug (a_message: STRING; a_loc: detachable STRING)
		do
			make ("", error_type_debug, a_message, a_loc)
		end

	make (a_code: STRING; a_severity: INTEGER; a_message: STRING; a_loc: detachable STRING)
		require
			Severity_valid: is_valid_error_type (a_severity)
		do
			code := a_code
			severity := a_severity
			message := a_message
			location := a_loc
		end

feature -- Access

	code: STRING

	severity: INTEGER

	message: STRING

	location: detachable STRING

feature -- Output

	as_string: STRING
		do
			create Result.make_empty
			Result.append (error_type_name_table.item (severity) + " ")
			if attached location and not location.is_empty then
				Result.append (location + ": ")
			end
			Result.append ("(" + code + ") " + message)
		end

invariant
	is_valid_error_type (severity)

end



