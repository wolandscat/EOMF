note
	component:   "Eiffel Object Modelling Framework"
	description: "Console implementation of Event logging facility"
	keywords:    "logging"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class CONSOLE_EVENT_LOG_I

inherit
	EVENT_LOG_FACILITY_I

create
	make

feature -- Modify

	append_event(severity:INTEGER; source, msg:STRING)
		do
			io.put_string(Severities.item(severity) + "    " + facility_interface.app_name + "    " + source + "    " + msg + "%N")
		end

end

