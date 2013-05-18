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
	SHARED_APP_RESOURCES

	SHARED_DT_SERIALISERS
		export
			{NONE} all
			{ANY} has_dt_serialiser_format
		end

create
	make

feature -- Initialisation

	make
		once
			dt_serialisers.put (create {DT_ODIN_SERIALISER}.make (create {NATIVE_ODIN_SERIALISATION_PROFILE}.make("odin")), "odin")
			initialised := True
		end

feature -- Status Report

	initialised: BOOLEAN
			-- True after successful initialisation

end



