note
	component:   "Eiffel Object Modelling Framework"
	description: "Event logging facility Interface"
	keywords:    "logging"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class EVENT_LOG_FACILITY

inherit
	EVENT_SEVERITY_CONSTANTS

create
	make

feature -- Initialisation

	make(an_app_name, a_name, a_type, a_threshold:STRING)
		require
			App_name_exists: an_app_name /= Void and then not an_app_name.is_empty
			Name_exists: a_name /= Void
			Type_exists: a_type /= Void
		do
			app_name := an_app_name
			name := a_name
			type := a_type
			type.to_lower

			severity_threshold := event_severity_threshold(a_threshold)

			-- decide what type of implementation to used based on resource setting
			if type.is_equal("windows_event_log") then
			    implementation := create {WINDOWS_EVENT_LOG_I}.make(Current)

			elseif type.is_equal("file_event_log") then
			    implementation := create {FILE_EVENT_LOG_I}.make(Current)

			elseif type.is_equal("console_event_log") then
			    implementation := create {CONSOLE_EVENT_LOG_I}.make(Current)

			else
			    implementation := create {CONSOLE_EVENT_LOG_I}.make(Current)
			    append_event(generator, "make", "NO EVENT LOG FACILITY; using CONSOLE as log", Information)
			end

			if implementation.exists then
				log_start_event
				exists := True
			end
		end

feature -- Access

	app_name:STRING

	name:STRING

	type:STRING

	severity_threshold:INTEGER

feature -- Status Report

	exists: BOOLEAN
			-- True if event log was created correctly

feature -- Modify

	append_event(class_name, op_name, msg:STRING; severity:INTEGER)
		require
			Valid_source: class_name /= Void and op_name /= Void
		local
			source_in_app:STRING
		do
			if severity >= severity_threshold then
				create source_in_app.make(0)
				source_in_app.append(class_name)
				source_in_app.to_upper
				source_in_app.append(".")
				source_in_app.append(op_name)
				source_in_app.append(": ")

				implementation.append_event(severity, source_in_app, msg)
			end
		end

feature {NONE} -- Implementation

	log_start_event
			-- log initial message
	    do
			append_event(generator, "make",
					"Started logging on facility " + name + " at " + (create {DATE_TIME}.make_now).out,
					Information)
	    end

	implementation:EVENT_LOG_FACILITY_I

invariant
	Implementation_exists: implementation /= Void
	Valid_severity: is_valid_severity(severity_threshold)

end

