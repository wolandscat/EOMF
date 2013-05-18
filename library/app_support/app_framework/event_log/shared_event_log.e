note
	component:   "Eiffel Object Modelling Framework"
	description: "Shared access to event log."
	keywords:    "logging"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class SHARED_EVENT_LOG

inherit

	EVENT_SEVERITY_CONSTANTS

feature -- Initialisation

	set_log_facility(a_lf: EVENT_LOG_FACILITY)
		require
			Facility_exists: a_lf /= Void
		do
			log_facility.put(a_lf)
		end

feature -- Event Logging

	log_event(class_name, op_name, msg:STRING; severity:INTEGER)
		do
			log_facility.item.append_event(class_name, op_name, msg, severity)
		end

	log_event2(class_name, op_name:STRING; msg_items:ARRAY[ANY]; severity:INTEGER)
		local
			msg:STRING
			i:INTEGER
		do
			create msg.make(0)
			from i := msg_items.lower until i > msg_items.upper loop
				msg.append(msg_items.item(i).out)
				i := i + 1
			end
			log_facility.item.append_event(class_name, op_name, msg, severity)
		end

feature {NONE} -- Implementation

	log_facility: CELL[EVENT_LOG_FACILITY]
	    once
	        create Result.put(Void)
	    end

end

