note
	component:   "Eiffel Object Modelling Framework"
	description: "Date/time constants"
	keywords:    "date time"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2000- Ocean Informatics <http://www.oceaninformatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class DATE_TIME_CONSTANTS

inherit
	KL_GREGORIAN_CALENDAR

feature -- Definitions

	Default_time_format: STRING = "[0]hh:[0]mi:[0]ss"
			-- Example: "22:03:10"

	Default_date_format: STRING = "yyyy-[0]mm-[0]dd"
			-- Example: "1998-08-25"

	Middle_second_in_minute: INTEGER = 30

	Middle_minute_in_hour: INTEGER = 30

	Middle_day_of_month: INTEGER = 15

	Middle_month_of_year: INTEGER = 6

	Last_day_of_middle_month: INTEGER = 30

	Max_timezone_hour: INTEGER = 12

	Origin_year: INTEGER = 1600

end


