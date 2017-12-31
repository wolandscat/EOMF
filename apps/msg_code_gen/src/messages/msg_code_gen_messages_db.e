note
	component:   "Eiffel Object Modelling Framework"
	description: "Generated class from message text files"
	keywords:    "Internationalisation, I18N, Localisation, L10N, command line"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class MSG_CODE_GEN_MESSAGES_DB

inherit
	MSG_CODE_GEN_MESSAGES_IDS

	MESSAGE_DB
		redefine
			make
		end

create
	make

feature -- Initialisation

	make
		do
			create message_table.make (8)
			message_table.put ("Message database file: $1 does not exist or not readable", ec_msg_file_not_found)
			message_table.put ("No message files found in source directories", ec_msg_files_dirs_empty)
			message_table.put ("Message database directory: $1 does not exist or not readable", ec_msg_files_dir_not_found)
			message_table.put ("Duplicate (?) message files found: $1, $2", ec_msg_files_dup_found)
			message_table.put ("Language $1 not found in file $2", ec_lang_not_found)
			message_table.put ("ODIN parsing failure in message file $1: $2", ec_odin_parse_failure)
			message_table.put ("Key $1 in file $2 already found in file $3", ec_dup_key_in_other_file)
			message_table.put ("Wrote class text to $1%N", ec_wrote_file_info)
end	
end