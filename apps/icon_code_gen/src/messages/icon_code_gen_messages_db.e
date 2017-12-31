note
	component:   "Eiffel Object Modelling Framework"
	description: "Generated class from message text files"
	keywords:    "Internationalisation, I18N, Localisation, L10N, command line"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_CODE_GEN_MESSAGES_DB

inherit
	ICON_CODE_GEN_MESSAGES_IDS

	MESSAGE_DB
		redefine
			make
		end

create
	make

feature -- Initialisation

	make
		do
			create message_table.make (6)
			message_table.put ("suppress verbose feedback, including configuration information on startup", ec_quiet_switch_desc)
			message_table.put ("Force generation of classes, overwriting existing files (default: only generate classes if not already there)", ec_force_switch_desc)
			message_table.put ("skipping class $1 (file already exists)%N", ec_skip_class_text)
			message_table.put ("generated class $1%N", ec_generate_class_text)
			message_table.put ("output directory: $1%N", ec_output_directory_info)
			message_table.put ("no new icons found in source directory $1%N", ec_no_icons_found)
end	
end