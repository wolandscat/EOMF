note
	component:   "Eiffel Object Modelling Framework"
	description: "Type for testing ODIN serialise/deserialise of intervals of simple types."
	keywords:    "ODIN, interval"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ODIN_PRIMITIVE_INTERVAL_TYPES

feature -- Access

	my_integer_interval: INTERVAL[INTEGER]

	my_integer_8_interval: INTERVAL[INTEGER_8]

	my_integer_16_interval: INTERVAL[INTEGER_16]

	my_integer_32_interval: INTERVAL[INTEGER_32]

	my_integer_64_interval: INTERVAL[INTEGER_64]

	my_natural_interval: INTERVAL[NATURAL]

	my_natural_8_interval: INTERVAL[NATURAL_8]

	my_natural_16_interval: INTERVAL[NATURAL_16]

	my_natural_32_interval: INTERVAL[NATURAL_32]

	my_natural_64_interval: INTERVAL[NATURAL_64]

	my_real_interval: INTERVAL[REAL]

	my_real_32_interval: INTERVAL[REAL_32]

	my_real_64_interval: INTERVAL[REAL_64]

	my_double_interval: INTERVAL[DOUBLE]

	my_date_interval: INTERVAL[DATE]

	my_date_time_interval: INTERVAL[DATE_TIME]

	my_time_interval: INTERVAL[TIME]

	my_duration_interval: INTERVAL[DATE_TIME_DURATION]

	my_iso8601_date_interval: INTERVAL[ISO8601_DATE]

	my_iso8601_date_time_interval: INTERVAL[ISO8601_DATE_TIME]

	my_iso8601_time_interval: INTERVAL[ISO8601_TIME]

	my_iso8601_duration_interval: INTERVAL[ISO8601_DURATION]

feature -- Element change

	set_my_integer_interval (an_int: like my_integer_interval)
		do
			my_integer_interval := an_int
		end

	set_my_integer_8_interval (an_int: like my_integer_8_interval)
		do
			my_integer_8_interval := an_int
		end

	set_my_integer_16_interval (an_int: like my_integer_16_interval)
		do
			my_integer_16_interval := an_int
		end

	set_my_integer_32_interval (an_int: like my_integer_32_interval)
		do
			my_integer_32_interval := an_int
		end

	set_my_integer_64_interval (an_int: like my_integer_64_interval)
		do
			my_integer_64_interval := an_int
		end

	set_my_real_interval (a_real_interval: like my_real_interval)
		do
			 my_real_interval := a_real_interval
		end

	set_my_real_32_interval (a_real_32_interval: like my_real_32_interval)
		do
			 my_real_32_interval := a_real_32_interval
		end

	set_my_real_64_interval (a_real_64_interval: like my_real_64_interval)
		do
			 my_real_64_interval := a_real_64_interval
		end

	set_my_double_interval (a_double_interval: like my_double_interval)
		do
			 my_double_interval := a_double_interval
		end

	set_my_natural_interval (a_nat: like my_natural_interval)
		do
			my_natural_interval := a_nat
		end

	set_my_natural_8_interval (a_nat: like my_natural_8_interval)
		do
			my_natural_8_interval := a_nat
		end

	set_my_natural_16_interval (a_nat: like my_natural_16_interval)
		do
			my_natural_16_interval := a_nat
		end

	set_my_natural_32_interval (a_nat: like my_natural_32_interval)
		do
			my_natural_32_interval := a_nat
		end

	set_my_natural_64_interval (a_nat: like my_natural_64_interval)
		do
			my_natural_64_interval := a_nat
		end

	set_my_date_interval (a_date_interval: like my_date_interval)
		do
			my_date_interval := a_date_interval
		end

	set_my_date_time_interval (a_date_time_interval: like my_date_time_interval)
		do
			my_date_time_interval := a_date_time_interval
		end

	set_my_time_interval (a_time_interval: like my_time_interval)
		do
			my_time_interval := a_time_interval
		end

	set_my_duration_interval (a_duration_interval: like my_duration_interval)
		do
			my_duration_interval := a_duration_interval
		end

	set_my_iso8601_date_interval (a_iso8601_date_interval: like my_iso8601_date_interval)
		do
			my_iso8601_date_interval := a_iso8601_date_interval
		end

	set_my_iso8601_date_time_interval (a_iso8601_date_time_interval: like my_iso8601_date_time_interval)
		do
			my_iso8601_date_time_interval := a_iso8601_date_time_interval
		end

	set_my_iso8601_time_interval (a_iso8601_time_interval: like my_iso8601_time_interval)
		do
			my_iso8601_time_interval := a_iso8601_time_interval
		end

	set_my_iso8601_duration_interval (a_iso8601_duration_interval: like my_iso8601_duration_interval)
		do
			my_iso8601_duration_interval := a_iso8601_duration_interval
		end

end


