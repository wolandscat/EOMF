note
	component:   "Eiffel Object Modelling Framework"
	description: "Structured error list with some useful facilities"
	keywords:    "ADL, archetype"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ERROR_ACCUMULATOR

inherit
	ERROR_SEVERITY_TYPES

	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

	GLOBAL_ERROR_REPORTING_LEVEL
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make
		do
			create list.make(0)
		end

feature -- Access

	last_added: ERROR_DESCRIPTOR
		do
			Result := list.last
		end

	error_codes: ARRAYED_SET [STRING]
			-- list of all codes from errors currently in list
		do
			create Result.make(0)
			Result.compare_objects
			from list.start until list.off loop
				if list.item.severity = error_type_error then
					Result.extend (list.item.code)
				end
				list.forth
			end
		end

	warning_codes: ARRAYED_SET [STRING]
			-- list of all codes from warnings currently in list
		do
			create Result.make(0)
			Result.compare_objects
			from list.start until list.off loop
				if list.item.severity = error_type_warning then
					Result.extend (list.item.code)
				end
				list.forth
			end
		end

feature -- Status Report

	is_empty: BOOLEAN
		do
			Result := list.is_empty
		end

	has_errors: BOOLEAN

	has_warnings: BOOLEAN

	has_errors_or_warnings: BOOLEAN
		do
			Result := has_errors or has_warnings
		end

	has_info: BOOLEAN

	has_error (a_code: STRING): BOOLEAN
			-- True if there has been an error recorded with code `a_code'
		do
			Result := error_codes.has (a_code)
		end

	has_matching_error (a_code: STRING): BOOLEAN
			-- True if there has been an error whose code starts with code `a_code'
		do
			Result := list.there_exists (
				agent (an_err: ERROR_DESCRIPTOR; a_match_code: STRING): BOOLEAN
					do
						Result := an_err.severity = error_type_error and an_err.code.starts_with (a_match_code)
					end (?, a_code)
			)
		end

	has_matching_warning (a_code: STRING): BOOLEAN
			-- True if there has been a warning whose code starts with code `a_code'
		do
			Result := list.there_exists (
				agent (an_err: ERROR_DESCRIPTOR; a_match_code: STRING): BOOLEAN
					do
						Result := an_err.severity = error_type_warning and an_err.code.starts_with (a_match_code)
					end (?, a_code)
			)
		end

feature -- Modification

	add_error (a_code: STRING; args: detachable ARRAY[STRING]; a_loc: detachable STRING)
		do
			extend (create {ERROR_DESCRIPTOR}.make (a_code, error_type_error, get_msg (a_code, args), a_loc))
		end

	add_warning (a_code: STRING; args: detachable ARRAY[STRING]; a_loc: detachable STRING)
		do
			extend (create {ERROR_DESCRIPTOR}.make (a_code, error_type_warning, get_msg (a_code, args), a_loc))
		end

	add_info (a_code: STRING; args: detachable ARRAY[STRING]; a_loc: detachable STRING)
		do
			extend (create {ERROR_DESCRIPTOR}.make (a_code, error_type_info, get_msg (a_code, args), a_loc))
		end

	add_debug (a_message: STRING; a_loc: detachable STRING)
		do
			extend (create {ERROR_DESCRIPTOR}.make ("", error_type_debug, a_message, a_loc))
		end

	extend (err_desc: ERROR_DESCRIPTOR)
		do
			list.extend(err_desc)
			has_errors := has_errors or err_desc.severity = Error_type_error
			has_warnings := has_warnings or err_desc.severity = Error_type_warning
			has_info := has_info or err_desc.severity = Error_type_info
		end

	append (other: ERROR_ACCUMULATOR)
		do
			list.append (other.list)
			has_errors := has_errors or other.has_errors
			has_warnings := has_warnings or other.has_warnings
			has_info := has_info or other.has_info
		end

	wipe_out
		do
			list.wipe_out
			has_errors := False
			has_warnings := False
			has_info := False
		end

feature -- Output

	as_string: STRING
			-- generate stringified version of contents, with newlines inserted after each entry
		do
			create Result.make_empty
			across list as list_csr loop
				if list_csr.item.severity >= global_error_reporting_level then
					Result.append (list_csr.item.as_string)
					Result.append_character ('%N')
				end
			end
		end

	as_string_filtered (include_errors, include_warnings, include_info: BOOLEAN): STRING
			-- generate filtered stringified version of contents, with newlines inserted after each entry
		do
			create Result.make_empty
			across list as list_csr loop
				inspect list_csr.item.severity
				when error_type_error then
					if include_errors then
						Result.append (list_csr.item.as_string + "%N")
					end
				when error_type_warning then
					if include_warnings then
						Result.append (list_csr.item.as_string + "%N")
					end
				else
					if include_info then
						Result.append (list_csr.item.as_string + "%N")
					end
				end
			end
		end

feature {ERROR_ACCUMULATOR} -- Implementation

	list: ARRAYED_LIST [ERROR_DESCRIPTOR]
			-- error output of validator - things that must be corrected

invariant
	Has_errors_consistency: has_errors implies list.there_exists (agent (e: ERROR_DESCRIPTOR): BOOLEAN do Result := e.severity = error_type_error end)
	Has_warnings_consistency: has_warnings implies list.there_exists (agent (e: ERROR_DESCRIPTOR): BOOLEAN do Result := e.severity = error_type_warning end)

end


