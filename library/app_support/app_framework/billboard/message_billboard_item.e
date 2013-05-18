note
	component:   "Eiffel Object Modelling Framework"
	description: "[
			     Error status billboard item: contains id of message template
				 and a set of args to be substituted. This approach allows
				 messages to be reported in multiple languages, since they are
				 built from the template & args on the fly when requested,
				 not when created.
				 ]"
	keywords:    "error status reporting"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2005- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class MESSAGE_BILLBOARD_ITEM

inherit
	ERROR_SEVERITY_TYPES

create
	make

feature -- Initialisation

	make (a_type_name, a_routine_name, a_message_id: STRING; an_args: detachable ARRAY[STRING]; an_error_type: INTEGER)
		require
			Type_name_valid: not a_type_name.is_empty
			Routine_name_valid: not a_routine_name.is_empty
			Error_id_valid: not a_message_id.is_empty
			Error_type_valid: is_valid_error_type (an_error_type)
		do
			type_name := a_type_name
			routine_name := a_routine_name
			message_id := a_message_id
			args := an_args
			error_type := an_error_type
		end

feature -- Access

	type_name: STRING
			-- type name of the object posting the message

	routine_name: STRING
			-- name of routine posting the message

	message_id: STRING
			-- id of message message template

	args: detachable ARRAY[STRING]
			-- string arguments to be substituted into message message

	error_type: INTEGER

invariant
	is_valid_error_type (error_type)

end



