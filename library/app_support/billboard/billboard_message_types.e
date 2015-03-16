note
	component:   "Eiffel Object Modelling Framework"
	description: "[
			     Enumeration of message types
				 ]"
	keywords:    "error status reporting"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2005- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class BILLBOARD_MESSAGE_TYPES

feature -- Definitions

	Message_type_debug: INTEGER = 9000
	Message_type_info: INTEGER = 9001
	Message_type_warning: INTEGER = 9002
	Message_type_error: INTEGER = 9003

feature -- Access

	message_type_names: HASH_TABLE [STRING, INTEGER]
			-- names of message types
		once
			create Result.make(0)
			Result.force("ERROR", Message_type_error)
			Result.force("WARNING", Message_type_warning)
			Result.force("INFO", Message_type_info)
			Result.force("DEBUG", Message_type_debug)
		end

	message_type_ids: HASH_TABLE [INTEGER, STRING]
			-- ids of message types
		once
			create Result.make(0)
			Result.force(Message_type_error, "ERROR")
			Result.force(Message_type_warning, "WARNING")
			Result.force(Message_type_info, "INFO")
			Result.force(Message_type_debug, "DEBUG")
		end

feature -- Status Report

	is_valid_message_type(i: INTEGER): BOOLEAN
		do
			Result := i >= Message_type_debug and i <= Message_type_error
		end

end



