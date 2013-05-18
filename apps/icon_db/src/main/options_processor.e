note
	support:     "http://www.openehr.org/issues/browse/AWB"	description: "Options  definitions and processor for icondbc command line tool."
	keywords:    "Embedded icons, options"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	OPTIONS_PROCESSOR

inherit
	ARGUMENT_OPTION_PARSER
		rename
			make as make_parser
		redefine
			post_process_arguments
		end

	ARGUMENTS
		export
			{NONE} all
		end

	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

	EOMF_COMPILED_MESSAGE_IDS
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
			create Result.make (2)

			-- non-argument swtiches
			Result.extend (create {ARGUMENT_SWITCH}.make (quiet_switch, get_text (ec_quiet_switch_desc), True, False))
			Result.extend (create {ARGUMENT_SWITCH}.make (force_switch, get_text (ec_force_switch_desc), True, False))

			-- switches with arguments
			Result.extend (create {ARGUMENT_VALUE_SWITCH}.make (icon_source_dir_switch, icon_source_dir_switch_desc, True, False, icon_source_dir_switch_arg, icon_source_dir_switch_arg, False))
			Result.extend (create {ARGUMENT_VALUE_SWITCH}.make (output_file_dir_switch, output_file_dir_switch_desc, True, False, output_file_dir_switch_arg, output_file_dir_switch_arg, False))
		end

	force_switch: STRING = "f|force"
	quiet_switch: STRING = "q|quiet"

	output_file_dir_switch: STRING = "o|output_dir"
	output_file_dir_switch_desc: STRING = "output directory"
	output_file_dir_switch_arg: STRING = "directory"

	icon_source_dir_switch: STRING = "s|source_dir"
	icon_source_dir_switch_desc: STRING = "source directory"
	icon_source_dir_switch_arg: STRING = "directory"

feature {NONE} -- Initialization

	make
			-- Initialize argument parser
		do
			make_parser (False)
		end

feature -- Access

	icon_source_dir: STRING
			-- message source directory; default to ".", i.e. current working directory of app
		require
			is_successful: is_successful
		once
			if has_option (icon_source_dir_switch) and then attached option_of_name (icon_source_dir_switch) as opt and then opt.has_value then
				Result := opt.value
			else
				Result := file_system.current_working_directory
			end
		end

	output_file_dir: STRING
			-- message source directory; default to ".", i.e. current working directory of app
		require
			is_successful: is_successful
		once
			if has_option (output_file_dir_switch) and then attached option_of_name (output_file_dir_switch) as opt and then opt.has_value then
				Result := opt.value
			else
				Result := file_system.current_working_directory
			end
		end

	is_verbose: BOOLEAN

	force_generation: BOOLEAN

feature {NONE} -- Implementation

	post_process_arguments
		do
			Precursor
			if is_successful then
				is_verbose := not has_option (quiet_switch)
				force_generation := has_option (force_switch)
			end
		end

feature {NONE} -- Usage

	copyright: STRING = "Copyright (c) 2012- Thomas Beale"
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

