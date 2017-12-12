note
	component:   "Eiffel Object Modelling Framework"
	description : "[
				   Message DB compiler. Validates any number of ODIN files having the following form to 
				   code:

				   	templates = <
						["lang1"] = <
							["CodeA"] = <"text $1 text $2">
							["CodeB"] = <"text $1 text">
							["CodeC"] = <"text $1, $2, $3">
						>
						["lang2"] = <
							["CodeA"] = <"text $1 text $2">
							["CodeB"] = <"text $1 text">
							["CodeC"] = <"text $1, $2, $3">
						>
						etc
					>
					
				    These are converted to the in memory form HASH_TABLE [HASH_TABLE [STRING, STRING], STRING] and validated.
				    
				    If valid, generate an Eiffel class containing all messages for chosen language, that can be included in any app,
				    which looks as follows (the 'XXX' is an optional class name leader, available with -c option):
				    
				    class XXX_MESSAGES_DB
						feature -- Access
				    		messages: [HASH_TABLE [STRING, STRING]]
				    			once
				    				create Result.make(0)
				    				Result.put ("text $1 text $2", "CodeA")
				    				Result.put ("text $1 text", "CodeB")
					    			Result.put ("text $1, $2, $3", "CodeC")
					    		end
					    end
				    
				    A second class XXX_MESSAGES_IDS is also generated, containing the keys for the above hash, defined
				    as constants. This means normal code that wants to report an error using the MESSAGE_DB facilities, normally 
				    does something like this:
				    
				   		add_error (ec_msg_files_dirs_empty, <<>>)

				    where the 'ec_msg_files_dirs_empty' is one of the constants from XXX_MESSAGES_IDS. This scheme treats
				    all error and interface text codes as constants, and therefore guarantees that the app won't compile unless
				    the constants in the generated file match the constants used in the main code.

				    The XXX_MESSAGES_IDS class should be inherited along with SHARED_MESSAGE_DB in every class that wants
				    to report errors.

				    For an app consisting of multiple libraries containing their own message code database, this generator utility
				    should be used to generate distinct sets of classes. In each part of the app, the correct XXX_MESSAGES_IDS
				    needs to be used. The various XXX_MESSAGES_DB classes can be added to the message_table in SHARED_MESSAGE_DB
				    by a line of code in an app initialisation phase like:

						message_db.add_table (create {XXX_MESSAGES_DB}.make)

				 ]"

	usage:		 "[
						USAGE:
						   msg_code_gen.exe [-l <lang>] [-s <directory>] [-o <directory>] [-v] [-nologo]

						OPTIONS:
						   Options should be prefixed with: '-' or '/'

						   -c --classname_leader :	class name leader, prepended to generated class_names (Optional)
						   -l --lang      : 		language (Optional)
													<lang>: language code
						   -s --source_dir: 		source directory (Optional)
						                   			<directory>: directory
						   -o --output_dir:			output directory (Optional)
						       						<directory>: directory
						   -? --help      : 		Display usage information. (Optional)
						   -v --version   : 		Displays version information. (Optional)
  				   ]"
	keywords:    "Internationalisation, I18N, Localisation, L10N"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	APPLICATION

inherit
	SHARED_MESSAGE_DB

	MSG_CODE_GEN_MESSAGES_IDS

	ANY_VALIDATOR

	SHARED_APP_RESOURCES

	SHARED_DT_OBJECT_CONVERTER

create
	make

feature -- Definitions

	Error_file_extension: STRING = ".txt"

feature -- Initialization

	make
		do
			-- add in EOMF error message DB to main message DB
			message_db.add_table (create {MSG_CODE_GEN_MESSAGES_DB}.make)

			create message_defs.make (1000)

			reset
			options_processor.execute (agent start)
		end

feature -- Commands

	start
		local
			fd: PLAIN_TEXT_FILE
			file_path: STRING
			msg_file_paths: LIST [STRING]
			class_name_leader: STRING
		do
			msg_file_paths := build_msg_file_list (options_processor.msg_source_dirs)
			if passed then
				std_err.put_string (errors.as_string_filtered (True, True, False))

				populate_msg_table (msg_file_paths, options_processor.locale_lang)
				if passed then
					-- determine class name leader, based on -c option or else on first messages.txt file name found
					if not options_processor.classname_leader.is_empty then
						class_name_leader := options_processor.classname_leader
					else
						class_name_leader := class_name_root
					end

					-- write out XXXX_IDS class
					message_ids_class_generator.generate (message_defs, class_name_leader)
					file_path := file_system.pathname (options_processor.output_file_dir, message_ids_class_generator.class_name.as_lower + ".e")
					create fd.make_create_read_write (file_path)
					fd.put_string (message_ids_class_generator.output)
					std_out.put_string (get_msg (ec_wrote_file_info, <<file_path>>))
					fd.close

					-- write out XXXX_DB class
					message_db_class_generator.generate (message_defs, class_name_leader, message_ids_class_generator.class_name)
					file_path := file_system.pathname (options_processor.output_file_dir, message_db_class_generator.class_name.as_lower + ".e")
					create fd.make_create_read_write (file_path)
					fd.put_string (message_db_class_generator.output)
					std_out.put_string (get_msg (ec_wrote_file_info, <<file_path>>))
					fd.close
				else
					std_err.put_string (errors.as_string)
				end
			else
				std_err.put_string (errors.as_string)
			end
		end

	validate
		do

		end

feature {NONE} -- Implementation

	options_processor: OPTIONS_PROCESSOR
		once
			create Result.make (locale_language_short)
			Result.set_is_usage_displayed_on_error (True)
		end

	class_name_root: STRING
			-- name of first message file found, used as class name root for output files. For example if the file
			-- 'dt_messages.txt' is found, this value is 'DT_MESSAGES'
		attribute
			create Result.make_empty
		end

	build_msg_file_list (a_msg_db_dirs: LIST [STRING]): ARRAYED_LIST[STRING]
			-- build a list of full path names of message text files found in `a_msg_db_dirs'
			-- generate warnings for:
			-- 	files that are not readable
			--  files whose basename is a duplicate of one already found
			--	directories containing no message files
			-- Generate errors for:
			--  invalid message directories
		local
			msg_file: PLAIN_TEXT_FILE
			dir_path: PATH
			dir: DIRECTORY
			fp: STRING
			file_names: HASH_TABLE [STRING, STRING]
		do
			create file_names.make (0)
			create Result.make (0)
			Result.compare_objects
			across a_msg_db_dirs as a_msg_db_dirs_csr loop
				create dir_path.make_from_string (a_msg_db_dirs_csr.item)
				create dir.make_with_path (dir_path.absolute_path)
				if dir.exists then
					dir.open_read
					across dir.linear_representation as file_names_csr loop
						if file_names_csr.item.ends_with (Error_file_extension) then
							fp := file_system.pathname (a_msg_db_dirs_csr.item, file_names_csr.item)
							if not file_names.has (file_names_csr.item) then
								create msg_file.make (fp)
								if not msg_file.exists or else not msg_file.is_readable then
									add_warning (ec_msg_file_not_found, <<fp>>)
								else
									Result.extend (fp)
									file_names.put (fp, file_names_csr.item)

									-- use the first valid filename found as the class_name root
									if class_name_root.is_empty then
										class_name_root := extension_removed (file_names_csr.item).as_upper
									end
								end
							else
								check attached file_names.item (file_names_csr.item) as prev_fp then
									add_warning (ec_msg_files_dup_found, <<prev_fp, fp>>)
								end
							end
						end
					end
				else
					add_warning (ec_msg_files_dir_not_found, <<dir.path.out>>)
				end
			end
			if Result.is_empty then
				add_error (ec_msg_files_dirs_empty, <<>>)
			end
		end

	populate_msg_table (msg_file_paths: LIST [STRING]; a_locale_lang: STRING)
			-- populate message table for one language `a_locale_lang' from message files found in `a_msg_db_dir'
		local
			msg_file: PLAIN_TEXT_FILE
		do
			across msg_file_paths as file_paths_csr loop
				create msg_file.make (file_paths_csr.item)
				msg_file.open_read
				msg_file.read_stream (msg_file.count)
				populate_from_text (msg_file.last_string, a_locale_lang, file_paths_csr.item)
				msg_file.close
			end
		end

	populate_from_text (a_dadl_str, a_locale_lang, a_file_path: STRING)
			-- populate message database using messages in `a_dadl_str' in language `a_locale_lang'.
			-- The latter should be a 2-digit ISO 639 language code, e.g. "en", "de" etc
			-- The format of `a_dadl_str' (dADL):
			--	templates = <
			--		["en"] = <
			--			["key1"] = <"Message string with $1 argument $2 argument etc">
			--			["key2"] = <"Message string with $1 argument $2 argument etc">
			--		>
			--	>
			-- caller should check database_loaded after call.
		require
			Valid_message_string: not a_dadl_str.is_empty
			Valid_local_lang: not a_locale_lang.is_empty
			Valid_file_path: not a_file_path.is_empty
		do
			odin_parser.reset
			odin_parser.execute (a_dadl_str, 1)
			if not odin_parser.syntax_error then
				if attached {IN_MEMORY_MESSAGE_DB_INITIALISER} odin_parser.output.as_object_from_string (({IN_MEMORY_MESSAGE_DB_INITIALISER}).name, Void) as init_helper and then attached init_helper.templates as tpls then
					if tpls.has (a_locale_lang) then
						across tpls.item (a_locale_lang) as msg_def_csr loop
							if not message_defs.has (msg_def_csr.key) then
								message_defs.put (msg_def_csr.item, msg_def_csr.key)
								key_file_xref.put (a_file_path, msg_def_csr.key)
							else
								check attached key_file_xref.item (msg_def_csr.key) as kfx then
									add_warning (ec_dup_key_in_other_file, <<msg_def_csr.key, a_file_path, kfx>>)
								end
							end
						end
					else
						add_error (ec_lang_not_found, <<a_locale_lang, a_file_path>>)
					end
				else
					add_error (ec_odin_parse_failure, <<a_file_path, dt_object_converter.errors.as_string>>)
				end
			else
				add_error (ec_odin_parse_failure, <<a_file_path, odin_parser.errors.as_string>>)
			end
		end

	odin_parser: ODIN_PARSER
		once
			create Result.make
		end

	key_file_xref: HASH_TABLE [STRING, STRING]
			-- table of message file name keyed by message key, used for generating useful errors about duplicates tec
		once
			create Result.make (0)
		end

	message_defs: HASH_TABLE [STRING, STRING]
			-- message definitions in the form of a table of templates keyed by id

	message_db_class_generator: MESSAGE_DB_CLASS_GENERATOR
		once
			create Result.make
		end

	message_ids_class_generator: MESSAGE_IDS_CLASS_GENERATOR
		once
			create Result.make
		end

end


