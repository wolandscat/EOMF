note
	component:   "Eiffel Object Modelling Framework"
	description: "Data objects for ODIN testing"
	keywords:    "ODIN, test"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	ODIN_TEST_OBJECTS

inherit
	SHARED_APP_ROOT
		export
			{NONE} all
		end

	SHARED_APP_RESOURCES
		undefine
			copy, default_create
		end

feature -- Initialisation

	initialise (a_status_reporting_proc, a_source_text_proc, a_serialised_text_proc: PROCEDURE [ANY, TUPLE [STRING]])
			-- initialise with a status reporting function; if none supplied,
			-- write to std out
		do
			status_reporting_proc := a_status_reporting_proc
			source_text_proc := a_source_text_proc
			serialised_text_proc := a_serialised_text_proc
		end

feature -- Access

	test_table: ARRAYED_LIST [TUPLE [test_set: HASH_TABLE [ANY, STRING]; test_proc: PROCEDURE [ANY, TUPLE[ANY]]; test_name: STRING]]
			-- list of {test data set, test proc, test set name}
		once
			create Result.make(0)
			Result.extend ([round_trip_tests, agent round_trip, "Round trip tests"])
			Result.extend ([from_odin_tests, agent from_odin, "From odin tests"])
		end

	from_odin_tests: HASH_TABLE [STRING, STRING]
			-- table of dadl test texts keyed by their name
		local
			dir: DIRECTORY
			an_odin_file: PLAIN_TEXT_FILE
			file_name, file_path, dir_path: STRING
			file_names: ARRAYED_LIST [STRING]
			m_ivl: MULTIPLICITY_INTERVAL
		once
			create Result.make(0)
			dir_path := file_system.pathname (file_system.pathname (file_system.pathname (
				file_system.dirname (file_system.dirname (file_system.dirname (application_startup_directory))),
				 "resources"), "test_files"), "odin")
			create dir.make (dir_path)
			if dir.exists then
				dir.open_read
				file_names := dir.linear_representation
				from file_names.start until file_names.off loop
					file_name := file_names.item
					if file_name.ends_with (".odin") then
						file_path := file_system.pathname (dir_path, file_name)
						create an_odin_file.make (file_path)
						an_odin_file.open_read
						an_odin_file.read_stream (an_odin_file.count)
						Result.put (an_odin_file.last_string, file_name.substring (1, file_name.count - 5))
					end
					file_names.forth
				end
			end
		end

	round_trip_tests: HASH_TABLE [ANY, STRING]
			-- table of round trip test objects keyed by their type
		once
			create Result.make(0)
			Result.put (odin_primitive_types, "Primitive atoms")
			Result.put (odin_primitive_interval_types, "Primitive intervals")
			Result.put (odin_primitive_sequence_types_1, "ARRAYED_LIST [primitive]")
			Result.put (odin_primitive_sequence_types_2, "ARRAYED_LIST [primitive], single element lists")
			Result.put (odin_primitive_sequence_interval_types, "ARRAYED_LIST [INTERVAL [primitive]]")
		end

	odin_primitive_types: ODIN_PRIMITIVE_TYPES
		do
			create Result
			Result.set_my_character ('T')
			Result.set_my_character_8 ('V')
--			Result.set_my_character_32 ('X')
			Result.set_my_integer (1)
			Result.set_my_integer_8 (100)
			Result.set_my_integer_16 (32000)
			Result.set_my_integer_32 (1000000)
			Result.set_my_integer_64 (500000000)
			Result.set_my_natural (1)
			Result.set_my_natural_8 (200)
			Result.set_my_natural_16 (32000)
			Result.set_my_natural_32 (1000000)
			Result.set_my_natural_64 (500000000)
			Result.set_my_real (3.1415)
			Result.set_my_real_32 (2.1878)
			Result.set_my_real_64 (3.1415926)
			Result.set_my_string ("This is the last dance")
			Result.set_my_string_8 ("Birds and bees")
--			Result.set_my_string_32 ("And honey trees")
			Result.set_my_date (create {DATE}.make_now)
			Result.set_my_date_time (create {DATE_TIME}.make_now)
			Result.set_my_time (create {TIME}.make_now)
			Result.set_my_duration (create {DATE_TIME_DURATION}.make_definite (1, 0, 0, 0))
			Result.set_my_iso8601_date (create {ISO8601_DATE}.make_from_string("2001-08-12"))
			Result.set_my_iso8601_date_time (create {ISO8601_DATE_TIME}.make_from_string("2001-08-12T03:46:00"))
			Result.set_my_iso8601_time (create {ISO8601_TIME}.make_from_string("03:46:00"))
			Result.set_my_iso8601_duration (create {ISO8601_DURATION}.make_from_string("P1Y2D"))
		end

	odin_primitive_interval_types: ODIN_PRIMITIVE_INTERVAL_TYPES
		once
			create Result
			Result.set_my_integer_interval (create {PROPER_INTERVAL[INTEGER]}.make_bounded_included(40, 3000))
			Result.set_my_integer_8_interval (create {PROPER_INTERVAL[INTEGER_8]}.make_bounded_included(10, 20))
			Result.set_my_integer_16_interval (create {PROPER_INTERVAL[INTEGER_16]}.make_bounded (-10, 20, True, False))
			Result.set_my_integer_32_interval (create {PROPER_INTERVAL[INTEGER_32]}.make_bounded_included(-300, 50000))
			Result.set_my_integer_64_interval (create {PROPER_INTERVAL[INTEGER_64]}.make_upper_unbounded (1000, True))

			Result.set_my_natural_interval (create {PROPER_INTERVAL[NATURAL]}.make_bounded_included(40, 3000))
			Result.set_my_natural_8_interval (create {PROPER_INTERVAL[NATURAL_8]}.make_bounded_included(10, 20))
			Result.set_my_natural_16_interval (create {PROPER_INTERVAL[NATURAL_16]}.make_bounded_included(10, 20))
			Result.set_my_natural_32_interval (create {PROPER_INTERVAL[NATURAL_32]}.make_bounded_included(300, 50000))
			Result.set_my_natural_64_interval (create {PROPER_INTERVAL[NATURAL_64]}.make_bounded_included(1000, 20000000))

			Result.set_my_real_interval (create {PROPER_INTERVAL[REAL]}.make_bounded_included(40.0, 3000.0))
			Result.set_my_real_32_interval (create {PROPER_INTERVAL[REAL_32]}.make_lower_unbounded (10.1, False))
			Result.set_my_real_64_interval (create {PROPER_INTERVAL[REAL_64]}.make_bounded_included(10.0, 20.0))
			Result.set_my_double_interval (create {PROPER_INTERVAL[DOUBLE]}.make_bounded_included(300.0, 50000.0))

			Result.set_my_date_interval (create {PROPER_INTERVAL[DATE]}.make_bounded_included(create {DATE}.make(2000, 1, 3), create {DATE}.make(2005, 12, 19)))
			Result.set_my_date_time_interval (create {PROPER_INTERVAL[DATE_TIME]}.make_bounded_included(create {DATE_TIME}.make(2000, 1, 3, 11, 30, 0), create {DATE_TIME}.make(2005, 12, 19, 11, 30, 0)))
			Result.set_my_time_interval (create {POINT_INTERVAL[TIME]}.make(create {TIME}.make(11, 30, 0)))
			Result.set_my_duration_interval (create {PROPER_INTERVAL[DATE_TIME_DURATION]}.make_bounded_included(create {DATE_TIME_DURATION}.make_definite (1, 0, 0, 0), create {DATE_TIME_DURATION}.make_definite (5, 0, 0, 0)))

			Result.set_my_iso8601_date_interval (create {PROPER_INTERVAL[ISO8601_DATE]}.make_bounded_included(create {ISO8601_DATE}.make_from_string("2001-08-12"), create {ISO8601_DATE}.make_from_string("2004-12-25")))
			Result.set_my_iso8601_date_time_interval (create {PROPER_INTERVAL[ISO8601_DATE_TIME]}.make_bounded_included(create {ISO8601_DATE_TIME}.make_from_string("2001-08-12T03:46:00"), create {ISO8601_DATE_TIME}.make_from_string("2003-01-12T03:46:00")))
			Result.set_my_iso8601_time_interval (create {PROPER_INTERVAL[ISO8601_TIME]}.make_bounded_included(create {ISO8601_TIME}.make_from_string("03:46:00"), create {ISO8601_TIME}.make_from_string("22:12:00")))
			Result.set_my_iso8601_duration_interval (create {PROPER_INTERVAL[ISO8601_DURATION]}.make_bounded_included(create {ISO8601_DURATION}.make_from_string("P1Y2D"), create {ISO8601_DURATION}.make_from_string("P2Y66D")))
		end

	odin_primitive_sequence_types_1: ODIN_PRIMITIVE_SEQUENCE_TYPES
		once
			create Result
			Result.set_my_integer_arrayed_list (create {ARRAYED_LIST[INTEGER]}.make_from_array(<<1, 2, 3, 4>>))
			Result.set_my_integer_8_arrayed_list (create {ARRAYED_LIST[INTEGER_8]}.make_from_array(<<1, 2, 3, 4>>))
			Result.set_my_integer_16_arrayed_list (create {ARRAYED_LIST[INTEGER_16]}.make_from_array(<<1, 2, 3, 4>>))
			Result.set_my_integer_32_arrayed_list (create {ARRAYED_LIST[INTEGER_32]}.make_from_array(<<1, 2, 3, 4>>))
			Result.set_my_integer_64_arrayed_list (create {ARRAYED_LIST[INTEGER_64]}.make_from_array(<<1, 2, 3, 4>>))

			Result.set_my_natural_arrayed_list (create {ARRAYED_LIST[NATURAL]}.make_from_array(<<1, 2, 3, 4>>))
			Result.set_my_natural_8_arrayed_list (create {ARRAYED_LIST[NATURAL_8]}.make_from_array(<<1, 2, 3, 4>>))
			Result.set_my_natural_16_arrayed_list (create {ARRAYED_LIST[NATURAL_16]}.make_from_array(<<1, 2, 3, 4>>))
			Result.set_my_natural_32_arrayed_list (create {ARRAYED_LIST[NATURAL_32]}.make_from_array(<<1, 2, 3, 4>>))
			Result.set_my_natural_64_arrayed_list (create {ARRAYED_LIST[NATURAL_64]}.make_from_array(<<1, 2, 3, 4>>))

			Result.set_my_real_arrayed_list (create {ARRAYED_LIST[REAL]}.make_from_array(<<1, 2, 3, 4>>))
			Result.set_my_real_32_arrayed_list (create {ARRAYED_LIST[REAL_32]}.make_from_array(<<1, 2, 3, 4>>))
			Result.set_my_real_64_arrayed_list (create {ARRAYED_LIST[REAL_64]}.make_from_array(<<1, 2, 3, 4>>))
			Result.set_my_double_arrayed_list (create {ARRAYED_LIST[DOUBLE]}.make_from_array(<<1, 2, 3, 4>>))

			Result.set_my_boolean_arrayed_list (create {ARRAYED_LIST[BOOLEAN]}.make_from_array(<<True, False, True>>))

			Result.set_my_character_arrayed_list (create {ARRAYED_LIST[CHARACTER]}.make_from_array(<<'a', 'b', 'c', 'd'>>))
			Result.set_my_character_8_arrayed_list (create {ARRAYED_LIST[CHARACTER_8]}.make_from_array(<<'e', 'f', 'g', 'h'>>))
	--		Result.set_my_character_32_arrayed_list (create {ARRAYED_LIST[CHARACTER_32]}.make_from_array(<<#, #, #, #>>))

			Result.set_my_string_arrayed_list (create {ARRAYED_LIST[STRING]}.make_from_array(<<"this", "is", "a", "string", "list">>))
	--		Result.set_my_string_32_arrayed_list (create {ARRAYED_LIST[STRING_32]}.make_from_array(<<#, #, #, #>>))

			Result.set_my_date_arrayed_list (create {ARRAYED_LIST[DATE]}.make_from_array(<<create {DATE}.make_now, create {DATE}.make_day_month_year(12, 8, 1965)>>))
			Result.set_my_date_time_arrayed_list (create {ARRAYED_LIST[DATE_TIME]}.make_from_array(<<create {DATE_TIME}.make_now, create {DATE_TIME}.make(1965, 8, 12, 14, 8, 0)>>))
			Result.set_my_time_arrayed_list (create {ARRAYED_LIST[TIME]}.make_from_array(<<create {TIME}.make_now, create {TIME}.make(2, 30, 0)>>))
			Result.set_my_duration_arrayed_list (create {ARRAYED_LIST[DATE_TIME_DURATION]}.make_from_array(<<create {DATE_TIME_DURATION}.make(32, 0, 0, 5, 0, 0)>>))

			Result.set_my_iso8601_date_arrayed_list (create {ARRAYED_LIST[ISO8601_DATE]}.make_from_array(<<create {ISO8601_DATE}.make_from_string("2001-01-02"), create {ISO8601_DATE}.make_from_string("2007-07-22")>>))
			Result.set_my_iso8601_date_time_arrayed_list (create {ARRAYED_LIST[ISO8601_DATE_TIME]}.make_from_array(<<create {ISO8601_DATE_TIME}.make_from_string("2001-01-02T00:47:00"), create {ISO8601_DATE_TIME}.make_from_string("2001-01-02T03:45:00")>>))
			Result.set_my_iso8601_time_arrayed_list (create {ARRAYED_LIST[ISO8601_TIME]}.make_from_array(<<create {ISO8601_TIME}.make_from_string("11:15:02"), create {ISO8601_TIME}.make_from_string("01:47:30")>>))
			Result.set_my_iso8601_duration_arrayed_list (create {ARRAYED_LIST[ISO8601_DURATION]}.make_from_array(<<create {ISO8601_DURATION}.make_from_string("P1Y2D")>>))
		end

	odin_primitive_sequence_types_2: ODIN_PRIMITIVE_SEQUENCE_TYPES
		once
			create Result
			Result.set_my_integer_arrayed_list (create {ARRAYED_LIST[INTEGER]}.make_from_array(<<1>>))
			Result.set_my_integer_8_arrayed_list (create {ARRAYED_LIST[INTEGER_8]}.make_from_array(<<2>>))
			Result.set_my_integer_16_arrayed_list (create {ARRAYED_LIST[INTEGER_16]}.make_from_array(<<3>>))
			Result.set_my_integer_32_arrayed_list (create {ARRAYED_LIST[INTEGER_32]}.make_from_array(<<4>>))
			Result.set_my_integer_64_arrayed_list (create {ARRAYED_LIST[INTEGER_64]}.make_from_array(<<5>>))

			Result.set_my_natural_arrayed_list (create {ARRAYED_LIST[NATURAL]}.make_from_array(<<10>>))
			Result.set_my_natural_8_arrayed_list (create {ARRAYED_LIST[NATURAL_8]}.make_from_array(<<20>>))
			Result.set_my_natural_16_arrayed_list (create {ARRAYED_LIST[NATURAL_16]}.make_from_array(<<30>>))
			Result.set_my_natural_32_arrayed_list (create {ARRAYED_LIST[NATURAL_32]}.make_from_array(<<40>>))
			Result.set_my_natural_64_arrayed_list (create {ARRAYED_LIST[NATURAL_64]}.make_from_array(<<50>>))

			Result.set_my_real_arrayed_list (create {ARRAYED_LIST[REAL]}.make_from_array(<<1000>>))
			Result.set_my_real_32_arrayed_list (create {ARRAYED_LIST[REAL_32]}.make_from_array(<<2000>>))
			Result.set_my_real_64_arrayed_list (create {ARRAYED_LIST[REAL_64]}.make_from_array(<<3000>>))
			Result.set_my_double_arrayed_list (create {ARRAYED_LIST[DOUBLE]}.make_from_array(<<4000>>))

			Result.set_my_boolean_arrayed_list (create {ARRAYED_LIST[BOOLEAN]}.make_from_array(<<True>>))

			Result.set_my_character_arrayed_list (create {ARRAYED_LIST[CHARACTER]}.make_from_array(<<'a'>>))
			Result.set_my_character_8_arrayed_list (create {ARRAYED_LIST[CHARACTER_8]}.make_from_array(<<'e'>>))
	--		Result.set_my_character_32_arrayed_list (create {ARRAYED_LIST[CHARACTER_32]}.make_from_array(<<#>>))

			Result.set_my_string_arrayed_list (create {ARRAYED_LIST[STRING]}.make_from_array(<<"this">>))
	--		Result.set_my_string_32_arrayed_list (create {ARRAYED_LIST[STRING_32]}.make_from_array(<<#>>))

			Result.set_my_date_arrayed_list (create {ARRAYED_LIST[DATE]}.make_from_array(<<create {DATE}.make_now>>))
			Result.set_my_date_time_arrayed_list (create {ARRAYED_LIST[DATE_TIME]}.make_from_array(<<create {DATE_TIME}.make_now>>))
			Result.set_my_time_arrayed_list (create {ARRAYED_LIST[TIME]}.make_from_array(<<create {TIME}.make_now>>))
			Result.set_my_duration_arrayed_list (create {ARRAYED_LIST[DATE_TIME_DURATION]}.make_from_array(<<create {DATE_TIME_DURATION}.make(32, 0, 0, 5, 0, 0)>>))

			Result.set_my_iso8601_date_arrayed_list (create {ARRAYED_LIST[ISO8601_DATE]}.make_from_array(<<create {ISO8601_DATE}.make_from_string("2001-01-02")>>))
			Result.set_my_iso8601_date_time_arrayed_list (create {ARRAYED_LIST[ISO8601_DATE_TIME]}.make_from_array(<<create {ISO8601_DATE_TIME}.make_from_string("2001-01-02T00:47:00")>>))
			Result.set_my_iso8601_time_arrayed_list (create {ARRAYED_LIST[ISO8601_TIME]}.make_from_array(<<create {ISO8601_TIME}.make_from_string("11:15:02")>>))
			Result.set_my_iso8601_duration_arrayed_list (create {ARRAYED_LIST[ISO8601_DURATION]}.make_from_array(<<create {ISO8601_DURATION}.make_from_string("P1Y2D")>>))
		end

	odin_primitive_sequence_interval_types: ODIN_PRIMITIVE_SEQUENCE_INTERVAL_TYPES
		once
			create Result
			Result.set_my_arrayed_list_interval_integer (create {ARRAYED_LIST[INTERVAL[INTEGER]]}.make_from_array (<<
				create {PROPER_INTERVAL[INTEGER]}.make_bounded_included(40, 3000), create {PROPER_INTERVAL[INTEGER]}.make_upper_unbounded(2, True)
			>>))
			Result.set_my_arrayed_list_interval_integer_8 (create {ARRAYED_LIST[INTERVAL[INTEGER_8]]}.make_from_array (<<
				create {PROPER_INTERVAL[INTEGER_8]}.make_bounded_included(40, 127), create {PROPER_INTERVAL[INTEGER_8]}.make_upper_unbounded(2, True)
			>>))
			Result.set_my_arrayed_list_interval_integer_16 (create {ARRAYED_LIST[INTERVAL[INTEGER_16]]}.make_from_array (<<
				create {PROPER_INTERVAL[INTEGER_16]}.make_bounded_included(-20, 15000), create {PROPER_INTERVAL[INTEGER_16]}.make_upper_unbounded(-14789, True)
			>>))
			Result.set_my_arrayed_list_interval_integer_32 (create {ARRAYED_LIST[INTERVAL[INTEGER_32]]}.make_from_array (<<
				create {PROPER_INTERVAL[INTEGER_32]}.make_bounded_included(-20, 24000111), create {PROPER_INTERVAL[INTEGER_32]}.make_lower_unbounded(24, True)
			>>))
			Result.set_my_arrayed_list_interval_integer_64 (create {ARRAYED_LIST[INTERVAL[INTEGER_64]]}.make_from_array (<<
				create {PROPER_INTERVAL[INTEGER_64]}.make_bounded_included(-201, 24000111), create {PROPER_INTERVAL[INTEGER_64]}.make_lower_unbounded(24, True)
			>>))

			Result.set_my_arrayed_list_interval_natural (create {ARRAYED_LIST[INTERVAL[NATURAL]]}.make_from_array (<<
				create {PROPER_INTERVAL[NATURAL]}.make_bounded_included(40, 3000), create {PROPER_INTERVAL[NATURAL]}.make_upper_unbounded(2, True)
			>>))
			Result.set_my_arrayed_list_interval_natural_8 (create {ARRAYED_LIST[INTERVAL[NATURAL_8]]}.make_from_array (<<
				create {PROPER_INTERVAL[NATURAL_8]}.make_bounded_included(40, 255), create {PROPER_INTERVAL[NATURAL_8]}.make_upper_unbounded(2, True)
			>>))
			Result.set_my_arrayed_list_interval_natural_16 (create {ARRAYED_LIST[INTERVAL[NATURAL_16]]}.make_from_array (<<
				create {PROPER_INTERVAL[NATURAL_16]}.make_bounded_included(20, 456), create {PROPER_INTERVAL[NATURAL_16]}.make_upper_unbounded(2000, True)
			>>))
			Result.set_my_arrayed_list_interval_natural_32 (create {ARRAYED_LIST[INTERVAL[NATURAL_32]]}.make_from_array (<<
				create {PROPER_INTERVAL[NATURAL_32]}.make_bounded_included(20, 24000111), create {PROPER_INTERVAL[NATURAL_32]}.make_lower_unbounded(24, True)
			>>))
			Result.set_my_arrayed_list_interval_natural_64 (create {ARRAYED_LIST[INTERVAL[NATURAL_64]]}.make_from_array (<<
				create {PROPER_INTERVAL[NATURAL_64]}.make_bounded_included(24000111, 20111222333444), create {PROPER_INTERVAL[NATURAL_64]}.make_lower_unbounded(24, True)
			>>))

			Result.set_my_arrayed_list_interval_real (create {ARRAYED_LIST[INTERVAL[REAL]]}.make_from_array (<<
				create {PROPER_INTERVAL[REAL]}.make_bounded_included(40.0345, 3000.23), create {PROPER_INTERVAL[REAL]}.make_upper_unbounded(29.09894, True)
			>>))
			Result.set_my_arrayed_list_interval_real_32 (create {ARRAYED_LIST[INTERVAL[REAL_32]]}.make_from_array (<<
				create {PROPER_INTERVAL[REAL_32]}.make_bounded_included(40.0345, 3000.23), create {PROPER_INTERVAL[REAL_32]}.make_upper_unbounded(29.09894, True)
			>>))
			Result.set_my_arrayed_list_interval_real_64 (create {ARRAYED_LIST[INTERVAL[REAL_64]]}.make_from_array (<<
				create {PROPER_INTERVAL[REAL_64]}.make_bounded_included(-102943440.0345, 3000.23), create {PROPER_INTERVAL[REAL_64]}.make_upper_unbounded(29.09894, True)
			>>))
			Result.set_my_arrayed_list_interval_double (create {ARRAYED_LIST[INTERVAL[DOUBLE]]}.make_from_array (<<
				create {PROPER_INTERVAL[DOUBLE]}.make_bounded_included(40.0345, 3000.23), create {PROPER_INTERVAL[DOUBLE]}.make_upper_unbounded(29.09894, True)
			>>))

			Result.set_my_arrayed_list_interval_date (create {ARRAYED_LIST[INTERVAL[DATE]]}.make_from_array (<<
				create {PROPER_INTERVAL[DATE]}.make_bounded_included (create {DATE}.make_day_month_year(12, 8, 1965), create {DATE}.make_now),
				create {PROPER_INTERVAL[DATE]}.make_upper_unbounded (create {DATE}.make_day_month_year(02, 12, 2009), True)
			>>))
			Result.set_my_arrayed_list_interval_date_time (create {ARRAYED_LIST[INTERVAL[DATE_TIME]]}.make_from_array (<<
				create {PROPER_INTERVAL[DATE_TIME]}.make_bounded_included (create {DATE_TIME}.make(1965, 8, 12, 14, 8, 0), create {DATE_TIME}.make_now),
				create {PROPER_INTERVAL[DATE_TIME]}.make_upper_unbounded (create {DATE_TIME}.make(2013, 4, 22, 10, 30, 0), True)
			>>))
			Result.set_my_arrayed_list_interval_time (create {ARRAYED_LIST[INTERVAL[TIME]]}.make_from_array (<<
				create {PROPER_INTERVAL[TIME]}.make_bounded_included (create {TIME}.make(2, 30, 0), create {TIME}.make_now),
				create {PROPER_INTERVAL[TIME]}.make_upper_unbounded (create {TIME}.make(2, 30, 0), True)
			>>))
			Result.set_my_arrayed_list_interval_duration (create {ARRAYED_LIST[INTERVAL[DATE_TIME_DURATION]]}.make_from_array(<<
				create {PROPER_INTERVAL[DATE_TIME_DURATION]}.make_bounded_included (create {DATE_TIME_DURATION}.make_definite (0, 4, 0, 0), create {DATE_TIME_DURATION}.make_definite (1, 4, 0, 0)),
				create {PROPER_INTERVAL[DATE_TIME_DURATION]}.make_upper_unbounded (create {DATE_TIME_DURATION}.make(32, 0, 0, 5, 0, 0), True)
			>>))

			Result.set_my_arrayed_list_interval_iso8601_date (create {ARRAYED_LIST[INTERVAL[ISO8601_DATE]]}.make_from_array (<<
				create {PROPER_INTERVAL[ISO8601_DATE]}.make_bounded_included (create {ISO8601_DATE}.make_from_string("2001-01-02"), create {ISO8601_DATE}.make_from_string("2007-07-22")),
				create {PROPER_INTERVAL[ISO8601_DATE]}.make_upper_unbounded (create {ISO8601_DATE}.make_from_string("2001-01-02"), True)
			>>))
			Result.set_my_arrayed_list_interval_iso8601_date_time (create {ARRAYED_LIST[INTERVAL[ISO8601_DATE_TIME]]}.make_from_array (<<
				create {PROPER_INTERVAL[ISO8601_DATE_TIME]}.make_bounded_included (create {ISO8601_DATE_TIME}.make_from_string("2001-01-02T00:47:00"), create {ISO8601_DATE_TIME}.make_from_string("2001-01-02T03:45:00")),
				create {PROPER_INTERVAL[ISO8601_DATE_TIME]}.make_upper_unbounded (create {ISO8601_DATE_TIME}.make_from_string("2001-01-02T00:47:00"), True)

			>>))
			Result.set_my_arrayed_list_interval_iso8601_time (create {ARRAYED_LIST[INTERVAL[ISO8601_TIME]]}.make_from_array (<<
				create {PROPER_INTERVAL[ISO8601_TIME]}.make_bounded_included (create {ISO8601_TIME}.make_from_string("11:15:02"), create {ISO8601_TIME}.make_from_string("13:47:30")),
				create {PROPER_INTERVAL[ISO8601_TIME]}.make_upper_unbounded (create {ISO8601_TIME}.make_from_string("11:15:02"), True)
			>>))
			Result.set_my_arrayed_list_interval_iso8601_duration (create {ARRAYED_LIST[INTERVAL[ISO8601_DURATION]]}.make_from_array (<<
				create {PROPER_INTERVAL[ISO8601_DURATION]}.make_bounded_included (create {ISO8601_DURATION}.make_from_string("P1Y2D"), create {ISO8601_DURATION}.make_from_string("P2Y2D")),
				create {PROPER_INTERVAL[ISO8601_DURATION]}.make_upper_unbounded (create {ISO8601_DURATION}.make_from_string("P1Y2D"), True)
			>>))
		end

feature -- Test procedures

	round_trip (an_obj: ANY; a_serialise_format: STRING)
		local
			dt: DT_COMPLEX_OBJECT_NODE
		do
			append_status ("%NCreate Data Tree from " + an_obj.generator + " object%N")
			create dt.make_from_object (an_obj)

			append_status ("Save Data Tree to ODIN%N")
			odin_engine.set_tree (dt)
			odin_engine.serialise ("odin", False, True)
			set_source_text (odin_engine.serialised)

			append_status("Parse ODIN%N")
			odin_engine.set_source (odin_engine.serialised, 0)
			odin_engine.parse
			if odin_engine.parse_succeeded then
				-- display tree in node explorer
				if attached odin_engine.tree.as_object_from_string (an_obj.generator, Void) as new_obj then
					append_status("%TSuccessfully created " + new_obj.generator + " object from ODIN%N")
				else
					append_status("%TFailed to create " + an_obj.generator + " object from ODIN Error%N")
				end
			else
				append_status (odin_engine.errors.as_string)
			end

			append_status ("Serialise Data Tree to " + a_serialise_format + "%N")
			odin_engine.set_tree (dt)
			odin_engine.serialise (a_serialise_format, False, True)
			set_serialised_text (odin_engine.serialised)
		end

	from_odin (an_odin_text: STRING)
		do
			set_source_text (an_odin_text)
			odin_engine.set_source (an_odin_text, 0)
			odin_engine.parse
			if odin_engine.parse_succeeded then
				append_status ("%TParse succeeded%N")
			else
				append_status ("%TParse failed " + odin_engine.errors.as_string + "%N")
			end
		end

feature {NONE} -- Implementation

	odin_engine: ODIN_ENGINE
		once
			create Result.make
		end

	status_reporting_proc: detachable PROCEDURE [ANY, TUPLE [STRING]]

	append_status (a_text: STRING)
			-- write a_text to reporting location, or else stdout if none
		do
			if attached status_reporting_proc as proc then
				proc.call([a_text])
			else
				io.put_string (a_text)
			end
		end

	source_text_proc: detachable PROCEDURE [ANY, TUPLE [STRING]]

	serialised_text_proc: detachable PROCEDURE [ANY, TUPLE [STRING]]

	set_source_text (a_text: STRING)
			-- write a_text to source text location, or else stdout if none
		do
			if attached source_text_proc as proc then
				proc.call([a_text])
			else
				io.put_string (a_text)
			end
		end

	set_serialised_text (a_text: STRING)
			-- write a_text to serialised text location, or else stdout if none
		do
			if attached serialised_text_proc as proc then
				proc.call([a_text])
			else
				io.put_string (a_text)
			end
		end

end
