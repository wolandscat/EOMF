note
	component:   "Eiffel Object Modelling Framework"
	description: "Windows Event implementation of logging facility"
	keywords:    "logging"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class WINDOWS_EVENT_LOG_I

inherit
	EVENT_LOG_FACILITY_I
		rename
                make as facility_make
	    end

create
	make

feature -- Initialisation

	make(a_facility_interface:like facility_interface)
		do
			facility_make(a_facility_interface)

			-- FIXME: to be implemented
            -- real implementation to be determined - Windows event log
            -- create event_log.make

			-- if event_log /= Void then
			--     log_start_event
			-- else
			    -- do something basic
			-- end
		end

feature {NONE} -- Implementation

	append_event(severity: INTEGER; source ,msg: STRING)
		do
			-- FIXME: to be implemented
		end

	event_log: ANY
		once
			-- FIXME: to be implemented with Windows event log
		end

end

