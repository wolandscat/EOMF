note
	component:   "Eiffel Object Modelling Framework"
	description: "Shared access to error and information messages."
	keywords:    "logging"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2008- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SHARED_MESSAGE_DB

inherit
	EOMF_COMPILED_MESSAGE_IDS
		
feature -- Access

	get_msg_line (an_id: STRING; args: detachable ARRAY[STRING]): STRING
		do
			Result := message_db.create_message_line (an_id, args)
		end

	get_msg (an_id: STRING; args: detachable ARRAY[STRING]): STRING
		do
			Result := message_db.create_message_content (an_id, args)
		end

	get_text (an_id: STRING): STRING
		do
			Result := message_db.create_message_text (an_id)
		end

feature {NONE} -- Access

	message_db: MESSAGE_DB
			-- error database keyed by id
		once
			create Result.make
			Result.add_table (create {EOMF_COMPILED_MESSAGE_DB}.make)
		end

end

