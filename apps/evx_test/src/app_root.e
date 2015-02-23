note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Root application class for any application; performs all application-wide initialisation.
				 ]"
	keywords:    "test EVX"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class APP_ROOT

inherit
	SHARED_MESSAGE_DB

create
	make

feature -- Initialisation

	make
		do
			-- add in EOMF error message DB to main message DB
			message_db.add_table (create {EOMF_COMPILED_MESSAGE_DB}.make)
			initialised := True
		end

feature -- Status Report

	initialised: BOOLEAN
			-- True after successful initialisation

end



