note
	component:   "Eiffel Object Modelling Framework"
	description: "File-based Event logging facility implementation"
	keywords:    "logging"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class FILE_EVENT_LOG_I

inherit
    EVENT_LOG_FACILITY_I
        rename
            make as facility_make
	    end

	OPERATING_ENVIRONMENT
		export
			{NONE} all
		end

create
    make

feature -- Definitions

	Date_variable:STRING = "$DATE"
			-- string to replace with canonical date in filename. Useful for making daily logfiles.

    File_date_format:STRING = "yyyy-[0]mm-[0]dd"
            -- format of date segment of file name for date-stamped file names

feature -- Initialisation

	make(a_facility_interface:like facility_interface)
		local
			event_dir:DIRECTORY
			dir_name, file_name:STRING
			today:DATE
			date_pos:INTEGER
		do
			facility_make(a_facility_interface)

			dir_name := facility_interface.name.mirrored
			dir_name.replace_substring("", 1, dir_name.index_of(Directory_separator,1))
			dir_name.mirror
			create event_dir.make(dir_name)
			if event_dir.exists then
				create file_name.make(0)
				file_name.append(facility_interface.name)

				-- now look for the string $DATE; if found, write the canonical date in
				create today.make_now
				date_pos := file_name.substring_index(Date_variable, 1)
				if date_pos > 0 then
					file_name.replace_substring(today.formatted_out(File_date_format), 
						date_pos, date_pos + Date_variable.count - 1)
				end

				create event_log.make_open_read_append(file_name)
				if not event_log.exists then
					io.put_string("Could not create file " + facility_interface.name + "%N")
					exists := False
				end
			else
				io.put_string("Directory " + dir_name + " does not exist%N")
				exists := False
			end
		end

feature -- Modify

	append_event(severity:INTEGER; source, msg:STRING)
		do
			event_log.put_string(
           		Severities.item(severity) + "    " + facility_interface.app_name + "    " +
				source + "    " + msg + "%R%N")
            end

	event_log: RAW_FILE

end

