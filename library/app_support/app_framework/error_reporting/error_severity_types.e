note
	component:   "Eiffel Object Modelling Framework"
	description: "[
			     Enumeration of message types
				 ]"
	keywords:    "error status reporting"

	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class ERROR_SEVERITY_TYPES

feature -- Definitions

	Error_type_debug: INTEGER = 9000
	Error_type_info: INTEGER = 9001
	Error_type_warning: INTEGER = 9002
	Error_type_error: INTEGER = 9003

	Error_type_debug_name: STRING = "DEBUG"
	Error_type_info_name: STRING = "INFO"
	Error_type_warning_name: STRING = "WARNING"
	Error_type_error_name: STRING = "ERROR"

feature -- Access

	error_type_name_table: HASH_TABLE [STRING, INTEGER]
			-- names of message types keyed by error type code
		once
			create Result.make(0)
			Result.force (Error_type_error_name, Error_type_error)
			Result.force (Error_type_warning_name, Error_type_warning)
			Result.force (Error_type_info_name, Error_type_info)
			Result.force (Error_type_debug_name, Error_type_debug)
		end

	error_type_id_table: HASH_TABLE [INTEGER, STRING]
			-- codes of message types keyed by message type name
		once
			create Result.make(0)
			Result.force (Error_type_error, Error_type_error_name)
			Result.force (Error_type_warning, Error_type_warning_name)
			Result.force (Error_type_info, Error_type_info_name)
			Result.force (Error_type_debug, Error_type_debug_name)
		end

	error_type_names: ARRAYED_LIST [STRING]
			-- names of message types
		once
			create Result.make(0)
			Result.compare_objects
			Result.force (Error_type_error_name)
			Result.force (Error_type_warning_name)
			Result.force (Error_type_info_name)
			Result.force (Error_type_debug_name)
		end

feature -- Status Report

	is_valid_error_type (i: INTEGER): BOOLEAN
		do
			Result := i >= Error_type_debug and i <= Error_type_error
		end

end



