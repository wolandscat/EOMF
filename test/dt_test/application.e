note
	component:   "Eiffel Object Modelling Framework"
	description: "Test class for DT library"
	keywords:    "Data Tree"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2015 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class APPLICATION

inherit
	SHARED_MESSAGE_DB

	SHARED_APP_RESOURCES

	ODIN_DEFINITIONS
		export
			{NONE} all
		end

	SHARED_DT_SERIALISERS
		export
			{NONE} all
			{ANY} has_dt_serialiser_format
		end

create
	make

feature -- Initialisation

	make
		do
			dt_serialisers.put (create {DT_ODIN_SERIALISER}.make (create {NATIVE_ODIN_SERIALISATION_PROFILE}.make (Syntax_type_odin)), Syntax_type_odin)
			dt_serialisers.put (create {DT_XML_SERIALISER}.make (create {XML_DT_SERIALISATION_PROFILE}.make (Syntax_type_xml)), Syntax_type_xml)
			dt_serialisers.put (create {DT_JSON_SERIALISER}.make (create {JSON_DT_SERIALISATION_PROFILE}.make (Syntax_type_json)), Syntax_type_json)
			dt_serialisers.put (create {DT_YAML_SERIALISER}.make (create {YAML_DT_SERIALISATION_PROFILE}.make (Syntax_type_yaml)), Syntax_type_yaml)

			-- add in message DBs
			message_db.add_table (create {DT_MESSAGES_DB}.make)
			message_db.add_table (create {ODIN_MESSAGES_DB}.make)
			message_db.add_table (create {GENERAL_MESSAGES_DB}.make)
		end

feature -- Status Report

end
