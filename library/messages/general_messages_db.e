note
	component:   "Eiffel Object Modelling Framework"
	description: "Generated class from message text files"
	keywords:    "Internationalisation, I18N, Localisation, L10N, command line"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class GENERAL_MESSAGES_DB

inherit
	GENERAL_MESSAGES_IDS

	MESSAGE_DB
		redefine
			make
		end

create
	make

feature -- Initialisation

	make
		do
			create message_table.make (29)
			message_table.put ("No error", ec_none)
			message_table.put ("Error code $1 does not exist (calling context = $2.$3)", ec_message_code_error)
			message_table.put ("Software Exception $1 caught; Stack:%N$2", ec_report_exception)
			message_table.put ("Software Exception caught; Context: $1; Type: $2; Stack:%N$3", ec_report_exception_with_context)
			message_table.put ("Exception caught but not handled: $1", ec_unhandled_exception)
			message_table.put ("$1", ec_general_error)
			message_table.put ("$1", ec_general)
			message_table.put ("Wrote config file $1", ec_cfg_file_i1)
			message_table.put ("Config file $1 parse error: $2", ec_cfg_file_parse_error)
			message_table.put ("Directory $1 does not exist.", ec_directory_does_not_exist)
			message_table.put ("Directory <empty> does not exist.", ec_empty_directory_does_not_exist)
			message_table.put ("File $1 does not exist.", ec_file_does_not_exist)
			message_table.put ("Read failed; file $1 does not exist.", ec_read_failed_file_does_not_exist)
			message_table.put ("Read failed; file $1 has UTF-8 marker but is not valid UTF-8.", ec_invalid_utf8_file)
			message_table.put ("File $1 not found", ec_file_not_found)
			message_table.put ("File $1 already exists", ec_file_already_exists)
			message_table.put ("File <empty> does not exist.", ec_empty_file_does_not_exist)
			message_table.put ("File $1 already exists. Replace it?", ec_file_exists_replace_question)
			message_table.put ("Enter search string", ec_enter_search_string)
			message_table.put ("No match found", ec_no_match_found)
			message_table.put ("At least 3 characters required in key", ec_key_too_short)
			message_table.put ("Yes", ec_yes_response)
			message_table.put ("No", ec_no_response)
			message_table.put ("Could not create file or directory $1", ec_could_not_create_file_text)
			message_table.put ("Write failed; file $1 does not exist", ec_write_failed_file_does_not_exist)
			message_table.put ("Saved file $1 in format $2", ec_file_saved_as_in_format)
			message_table.put ("Expected sample XML rules file $1 missing", ec_xml_rules_sample_file_missing)
			message_table.put ("Invalid regular expression $1", ec_regex_invalid)
			message_table.put ("No error available from path parser", ec_path_parser_no_error_available)
end	
end