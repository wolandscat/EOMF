note
	component:   "Eiffel Object Modelling Framework"
	description: "Options  definitions and processor for msg_code_gen command line tool."
	keywords:    "Internationalisation, I18N, Localisation, L10N, command line"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	OPTIONS_PROCESSOR

inherit
	ARGUMENT_OPTION_PARSER
		rename
			make as make_parser
		end

	ARGUMENTS
		export
			{NONE} all
		end

	KL_SHARED_FILE_SYSTEM
		export
			{NONE} all
		end

create
	make

feature {NONE} -- Definitions

	switches: ARRAYED_LIST [ARGUMENT_SWITCH]
			-- Retrieve a list of switch used for a specific application
		once
			create Result.make (3)

			-- switches with arguments
			Result.extend (create {ARGUMENT_VALUE_SWITCH}.make (locale_lang_switch, locale_lang_switch_desc, True, False, locale_lang_switch_arg, locale_lang_switch_arg_desc, False))
			Result.extend (create {ARGUMENT_VALUE_SWITCH}.make (msg_source_dir_switch, msg_source_dir_switch_desc, True, True, msg_source_dir_switch_arg, msg_source_dir_switch_arg, False))
			Result.extend (create {ARGUMENT_VALUE_SWITCH}.make (output_file_dir_switch, output_file_dir_switch_desc, True, False, output_file_dir_switch_arg, output_file_dir_switch_arg, False))
			Result.extend (create {ARGUMENT_VALUE_SWITCH}.make (classname_leader_switch, classname_leader_switch_desc, True, False, classname_leader_switch_arg, classname_leader_switch_arg, False))
		end

	classname_leader_switch: STRING = "c|classname_leader"
	classname_leader_switch_desc: STRING = "class name leader"
	classname_leader_switch_arg: STRING = "string"

	output_file_dir_switch: STRING = "o|output_dir"
	output_file_dir_switch_desc: STRING = "output directory"
	output_file_dir_switch_arg: STRING = "directory"

	msg_source_dir_switch: STRING = "s|source_dir"
	msg_source_dir_switch_desc: STRING = "source directory"
	msg_source_dir_switch_arg: STRING = "directory"

	locale_lang_switch: STRING = "l|lang"
	locale_lang_switch_desc: STRING = "language"
	locale_lang_switch_arg: STRING = "lang"
	locale_lang_switch_arg_desc: STRING = "language code"

feature {NONE} -- Initialization

	make (a_default_locale_lang: STRING)
			-- Initialize argument parser
		do
			default_locale_lang := a_default_locale_lang
			make_parser (False)
		end

feature -- Access

	default_locale_lang: STRING
			-- default locale

	msg_source_dirs: ARRAYED_LIST [STRING]
			-- message source directory; default to ".", i.e. current working directory of app
		require
			is_successful: is_successful
		once
			create Result.make (0)
			if has_option (msg_source_dir_switch) and then attached options_values_of_name (msg_source_dir_switch) as src_dirs then
				across src_dirs as src_dirs_csr loop
					Result.extend (src_dirs_csr.item)
				end
			else
				Result.extend (file_system.current_working_directory)
			end
		end

	output_file_dir: STRING
			-- message compiled class output directory; default to ".", i.e. current working directory of app
		require
			is_successful: is_successful
		once
			if has_option (output_file_dir_switch) and then attached option_of_name (output_file_dir_switch) as opt and then opt.has_value then
				Result := opt.value
			else
				Result := file_system.current_working_directory
			end
		end

	classname_leader: STRING
			-- leader to add to boilerplate generated classnames, will be XXXX_COMPILED_MESSAGE_DB and XXXX_COMPILED_MESSAGE_IDS
		require
			is_successful: is_successful
		once
			if has_option (classname_leader_switch) and then attached option_of_name (classname_leader_switch) as opt and then opt.has_value then
				Result := opt.value
			else
				Result := ""
			end
		end

	locale_lang: STRING
			-- language to use; default to system locale langeuage, short form, i.e. "en", "dk" etc.
		require
			is_successful: is_successful
		once
			if has_option (locale_lang_switch) and then attached option_of_name (locale_lang_switch) as opt and then opt.has_value then
				Result := opt.value
			else
				Result := default_locale_lang
			end
		end

feature {NONE} -- Usage

	copyright: STRING = "Copyright (c) 2012- openEHR Foundation"
			--  <Precursor>

	name: STRING
			--  <Precursor>
		once
			Result := command_name
		end

	version: STRING
			--  <Precursor>
		once
			Result := "0.9.0"
		end

end

