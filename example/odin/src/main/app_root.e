note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Root application class for any application; performs all application-wide initialisation.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class APP_ROOT

inherit
	SHARED_MESSAGE_DB

	SHARED_APP_RESOURCES

	SHARED_DT_SERIALISERS
		export
			{NONE} all
			{ANY} has_dt_serialiser_format
		end

	ODIN_DEFINITIONS
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make
		once
			dt_serialisers.put (create {DT_ODIN_SERIALISER}.make (create {NATIVE_ODIN_SERIALISATION_PROFILE}.make (Syntax_type_odin)), Syntax_type_odin)
			dt_serialisers.put (create {DT_XML_SERIALISER}.make (create {XML_DT_SERIALISATION_PROFILE}.make (Syntax_type_xml)), Syntax_type_xml)
			dt_serialisers.put (create {DT_JSON_SERIALISER}.make (create {JSON_DT_SERIALISATION_PROFILE}.make (Syntax_type_json)), Syntax_type_json)
			dt_serialisers.put (create {DT_YAML_SERIALISER}.make (create {YAML_DT_SERIALISATION_PROFILE}.make (Syntax_type_yaml)), Syntax_type_yaml)

			-- add in message DBs
			message_db.add_table (create {EVX_MESSAGES_DB}.make)
			message_db.add_table (create {DT_MESSAGES_DB}.make)
			message_db.add_table (create {ODIN_MESSAGES_DB}.make)
			message_db.add_table (create {GENERAL_MESSAGES_DB}.make)

			initialised := True
		end

feature -- Status Report

	initialised: BOOLEAN
			-- True after successful initialisation

end



