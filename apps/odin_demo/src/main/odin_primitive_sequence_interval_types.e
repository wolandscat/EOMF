note
	component:   "Eiffel Object Modelling Framework"
	description: "Type for testing ODIN serialise/deserialise of sequences of intervals of simple types."
	keywords:    "test, ODIN"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ODIN_PRIMITIVE_SEQUENCE_INTERVAL_TYPES

feature -- Access

	my_arrayed_list_interval_integer: ARRAYED_LIST[INTERVAL[INTEGER]]
		attribute
			create Result.make (0)
		end

	my_arrayed_list_interval_integer_8: ARRAYED_LIST[INTERVAL[INTEGER_8]]
		attribute
			create Result.make (0)
		end

	my_arrayed_list_interval_integer_16: ARRAYED_LIST[INTERVAL[INTEGER_16]]
		attribute
			create Result.make (0)
		end

	my_arrayed_list_interval_integer_32: ARRAYED_LIST[INTERVAL[INTEGER_32]]
		attribute
			create Result.make (0)
		end

	my_arrayed_list_interval_integer_64: ARRAYED_LIST[INTERVAL[INTEGER_64]]
		attribute
			create Result.make (0)
		end

	my_arrayed_list_interval_natural: ARRAYED_LIST[INTERVAL[NATURAL]]
		attribute
			create Result.make (0)
		end

	my_arrayed_list_interval_natural_8: ARRAYED_LIST[INTERVAL[NATURAL_8]]
		attribute
			create Result.make (0)
		end

	my_arrayed_list_interval_natural_16: ARRAYED_LIST[INTERVAL[NATURAL_16]]
		attribute
			create Result.make (0)
		end

	my_arrayed_list_interval_natural_32: ARRAYED_LIST[INTERVAL[NATURAL_32]]
		attribute
			create Result.make (0)
		end

	my_arrayed_list_interval_natural_64: ARRAYED_LIST[INTERVAL[NATURAL_64]]
		attribute
			create Result.make (0)
		end

	my_arrayed_list_interval_real: ARRAYED_LIST[INTERVAL[REAL]]
		attribute
			create Result.make (0)
		end

	my_arrayed_list_interval_real_32: ARRAYED_LIST[INTERVAL[REAL_32]]
		attribute
			create Result.make (0)
		end

	my_arrayed_list_interval_real_64: ARRAYED_LIST[INTERVAL[REAL_64]]
		attribute
			create Result.make (0)
		end

	my_arrayed_list_interval_double: ARRAYED_LIST[INTERVAL[DOUBLE]]
		attribute
			create Result.make (0)
		end

	my_arrayed_list_interval_date: ARRAYED_LIST[INTERVAL[DATE]]
		attribute
			create Result.make (0)
		end

	my_arrayed_list_interval_date_time: ARRAYED_LIST[INTERVAL[DATE_TIME]]
		attribute
			create Result.make (0)
		end

	my_arrayed_list_interval_time: ARRAYED_LIST[INTERVAL[TIME]]
		attribute
			create Result.make (0)
		end

	my_arrayed_list_interval_duration: ARRAYED_LIST[INTERVAL[DATE_TIME_DURATION]]
		attribute
			create Result.make (0)
		end

	my_arrayed_list_interval_iso8601_date: ARRAYED_LIST[INTERVAL[ISO8601_DATE]]
		attribute
			create Result.make (0)
		end

	my_arrayed_list_interval_iso8601_date_time: ARRAYED_LIST[INTERVAL[ISO8601_DATE_TIME]]
		attribute
			create Result.make (0)
		end

	my_arrayed_list_interval_iso8601_time: ARRAYED_LIST[INTERVAL[ISO8601_TIME]]
		attribute
			create Result.make (0)
		end

	my_arrayed_list_interval_iso8601_duration: ARRAYED_LIST[INTERVAL[ISO8601_DURATION]]
		attribute
			create Result.make (0)
		end

feature -- Element change

	set_my_arrayed_list_interval_integer (an_al_ivl_int: like my_arrayed_list_interval_integer)
		do
			my_arrayed_list_interval_integer := an_al_ivl_int
		end

	set_my_arrayed_list_interval_integer_8 (an_al_ivl_int: like my_arrayed_list_interval_integer_8)
		do
			my_arrayed_list_interval_integer_8 := an_al_ivl_int
		end

	set_my_arrayed_list_interval_integer_16 (an_al_ivl_int: like my_arrayed_list_interval_integer_16)
		do
			my_arrayed_list_interval_integer_16 := an_al_ivl_int
		end

	set_my_arrayed_list_interval_integer_32 (an_al_ivl_int: like my_arrayed_list_interval_integer_32)
		do
			my_arrayed_list_interval_integer_32 := an_al_ivl_int
		end

	set_my_arrayed_list_interval_integer_64 (an_al_ivl_int: like my_arrayed_list_interval_integer_64)
		do
			my_arrayed_list_interval_integer_64 := an_al_ivl_int
		end

	set_my_arrayed_list_interval_real (an_al_ivl_real: like my_arrayed_list_interval_real)
		do
			 my_arrayed_list_interval_real := an_al_ivl_real
		end

	set_my_arrayed_list_interval_real_32 (an_al_ivl_real: like my_arrayed_list_interval_real_32)
		do
			 my_arrayed_list_interval_real_32 := an_al_ivl_real
		end

	set_my_arrayed_list_interval_real_64 (an_al_ivl_real: like my_arrayed_list_interval_real_64)
		do
			 my_arrayed_list_interval_real_64 := an_al_ivl_real
		end

	set_my_arrayed_list_interval_double (an_al_ivl_real: like my_arrayed_list_interval_double)
		do
			 my_arrayed_list_interval_double := an_al_ivl_real
		end

	set_my_arrayed_list_interval_natural (an_al_ivl_nat: like my_arrayed_list_interval_natural)
		do
			my_arrayed_list_interval_natural := an_al_ivl_nat
		end

	set_my_arrayed_list_interval_natural_8 (an_al_ivl_nat: like my_arrayed_list_interval_natural_8)
		do
			my_arrayed_list_interval_natural_8 := an_al_ivl_nat
		end

	set_my_arrayed_list_interval_natural_16 (an_al_ivl_nat: like my_arrayed_list_interval_natural_16)
		do
			my_arrayed_list_interval_natural_16 := an_al_ivl_nat
		end

	set_my_arrayed_list_interval_natural_32 (an_al_ivl_nat: like my_arrayed_list_interval_natural_32)
		do
			my_arrayed_list_interval_natural_32 := an_al_ivl_nat
		end

	set_my_arrayed_list_interval_natural_64 (an_al_ivl_nat: like my_arrayed_list_interval_natural_64)
		do
			my_arrayed_list_interval_natural_64 := an_al_ivl_nat
		end

	set_my_arrayed_list_interval_date (an_al_ivl_iso: like my_arrayed_list_interval_date)
		do
			my_arrayed_list_interval_date := an_al_ivl_iso
		end

	set_my_arrayed_list_interval_date_time (an_al_ivl_iso: like my_arrayed_list_interval_date_time)
		do
			my_arrayed_list_interval_date_time := an_al_ivl_iso
		end

	set_my_arrayed_list_interval_time (an_al_ivl_iso: like my_arrayed_list_interval_time)
		do
			my_arrayed_list_interval_time := an_al_ivl_iso
		end

	set_my_arrayed_list_interval_duration (an_al_ivl_iso: like my_arrayed_list_interval_duration)
		do
			my_arrayed_list_interval_duration := an_al_ivl_iso
		end

	set_my_arrayed_list_interval_iso8601_date (an_al_ivl_iso: like my_arrayed_list_interval_iso8601_date)
		do
			my_arrayed_list_interval_iso8601_date := an_al_ivl_iso
		end

	set_my_arrayed_list_interval_iso8601_date_time (an_al_ivl_iso: like my_arrayed_list_interval_iso8601_date_time)
		do
			my_arrayed_list_interval_iso8601_date_time := an_al_ivl_iso
		end

	set_my_arrayed_list_interval_iso8601_time (an_al_ivl_iso: like my_arrayed_list_interval_iso8601_time)
		do
			my_arrayed_list_interval_iso8601_time := an_al_ivl_iso
		end

	set_my_arrayed_list_interval_iso8601_duration (an_al_ivl_iso: like my_arrayed_list_interval_iso8601_duration)
		do
			my_arrayed_list_interval_iso8601_duration := an_al_ivl_iso
		end

end


