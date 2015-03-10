note
	component:   "Eiffel Object Modelling Framework"
	description: "Generated class from message text files"
	keywords:    "Internationalisation, I18N, Localisation, L10N, command line"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ODIN_MESSAGES_DB

inherit
	ODIN_MESSAGES_IDS

	MESSAGE_DB
		redefine
			make
		end

create
	make

feature -- Initialisation

	make
		do
			create message_table.make (26)
			message_table.put ("$1 file $2 does not exist or not readable", ec_object_file_not_valid)
			message_table.put ("$1 file $2 load failure; reason: $3", ec_object_load_failure)
			message_table.put ("$1 file $2 load failure due to exception during processing", ec_object_load_failure_exception)
			message_table.put ("$1 file $2 load data conversion failure; reason: $3", ec_object_conv_fail_err)
			message_table.put ("$1 configuration settings (ODIN format)", ec_config_settings_line1)
			message_table.put ("Automatically written by application", ec_config_settings_line2)
			message_table.put ("put_object call to object_converter.object_to_dt with object of type $1 failed", ec_put_object_conversion_failure)
			message_table.put ("No left delimiter ('<') found in line $1", ec_parse_odin_missing_left_delim)
			message_table.put ("Missing right delimiter ('>') in line $1", ec_parse_odin_missing_right_delim)
			message_table.put ("No attributes found, was expecting $1", ec_parse_odin_no_attribs_found)
			message_table.put ("Syntax error: invalid term code reference: '$1'; code string can only contain digits, letters and '.', '_' and '-' and must commence with a letter or digit", ec_STCV)
			message_table.put ("Syntax error: invalid term code reference has no code: '$1'", ec_STNC)
			message_table.put ("Syntax error (SGEE) generic object at $1 not enclosed by normal object not allowed", ec_SGEE)
			message_table.put ("Syntax error (SDAT) invalid attribute value", ec_SDAT)
			message_table.put ("Syntax error (SOBK) empty object key at path $1", ec_SOBK)
			message_table.put ("assumed value $1 not within constraint value space", ec_VOBAV)
			message_table.put ("invalid term code constraint: $1", ec_VCPCV)
			message_table.put ("invalid ordinal constraint: duplicated value $1", ec_VCOV)
			message_table.put ("invalid ordinal constraint: duplicated code $1", ec_VCOC)
			message_table.put ("invalid interval: $1 must be <= $2", ec_VIVLO)
			message_table.put ("invalid ISO8601 date: $1", ec_VIDV)
			message_table.put ("invalid ISO8601 time: $1", ec_VITV)
			message_table.put ("invalid ISO8601 date/time: $1", ec_VIDTV)
			message_table.put ("invalid ISO8601 duration: $1", ec_VIDUV)
			message_table.put ("ODIN object duplicate attribute: $1", ec_VDATU)
			message_table.put ("ODIN object key must be unique; key [$1] already exists under attribute '$2'", ec_VOKU)
end	
end
