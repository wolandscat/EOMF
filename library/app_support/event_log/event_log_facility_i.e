note
	component:   "Eiffel Object Modelling Framework"
	description: "Event logging facility Implementation"
	keywords:    "logging"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class EVENT_LOG_FACILITY_I

inherit
   	EVENT_SEVERITY_CONSTANTS

feature -- Initialisation

	make(a_facility_interface:like facility_interface)
		require
			Args_valid: a_facility_interface /= Void
		do
			facility_interface := a_facility_interface
			exists := True
		ensure
			Facility_interface_exists: facility_interface /= Void
		end

feature -- Access

	facility_interface: EVENT_LOG_FACILITY
	
feature -- Status Report

	exists: BOOLEAN
			-- True if event log was successfully created

feature {EVENT_LOG_FACILITY} -- Modify

	append_event(severity:INTEGER; source,msg:STRING)
		require
			is_valid_severity(severity)
		deferred
		end

invariant
	Interface_exists: facility_interface /= Void

end

