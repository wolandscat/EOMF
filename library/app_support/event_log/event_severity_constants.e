note
	component:   "Eiffel Object Modelling Framework"
	description: "Event logging severity constants"
	keywords:    "logging"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class EVENT_SEVERITY_CONSTANTS

feature -- Access

	Default_event_level, Information: INTEGER = 0

	Warning: INTEGER = 101

	Error: INTEGER = 102

	No_events: INTEGER = 110
			-- pseudo level (not a severity) for masking all events	

	Severities: HASH_TABLE[STRING, INTEGER]
		once
			create Result.make(0)
			Result.put("Information", Information)
			Result.put("Warning", Warning)
			Result.put("Error", Error)
		end

	Event_levels:HASH_TABLE[INTEGER, STRING]
		once
			create Result.make(0)
			Result.put(Information,	"all")
			Result.put(Information,	"information")
			Result.put(Warning, 	"warning")
			Result.put(Error,		"error")
			Result.put(No_events,	"none")
		end

	event_severity_threshold(a_threshold:STRING):INTEGER
			-- send events of this severity and higher to log device; default to all
		do
			if a_threshold = Void then
				Result := Information
			else
				a_threshold.to_lower
				if Event_levels.has(a_threshold) then
					Result := Event_levels.item(a_threshold)
				else
					Result := Default_event_level
				end
			end
		ensure
			Validity: is_valid_severity(Result) or else Result = No_events
		end

feature -- Status

	is_valid_severity(n:INTEGER):BOOLEAN
		do
			Result := n = Information or else (n >= Warning and n <= Error)
		end

end

