note
	component:   "Eiffel Object Modelling Framework"
	description: "Type for testing ODIN serialise/deserialise of intervals of simple types."
	keywords:    "test, ODIN"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ODIN_PRIMITIVE_SEQUENCE_TYPES

feature -- Access

	my_character_arrayed_list: ARRAYED_LIST[CHARACTER]
		attribute
			create Result.make (0)
		end

	my_character_8_arrayed_list: ARRAYED_LIST[CHARACTER_8]
		attribute
			create Result.make (0)
		end

--	my_character_3_arrayed_list2: ARRAYED_LIST[CHARACTER_32]

	my_string_arrayed_list: ARRAYED_LIST[STRING]
		attribute
			create Result.make (0)
		end

	my_string_8_arrayed_list: ARRAYED_LIST[STRING_8]
		attribute
			create Result.make (0)
		end

--	my_string_32_arrayed_list: ARRAYED_LIST[STRING_32]

	my_boolean_arrayed_list: ARRAYED_LIST[BOOLEAN]
		attribute
			create Result.make (0)
		end

	my_integer_arrayed_list: ARRAYED_LIST[INTEGER]
		attribute
			create Result.make (0)
		end

	my_integer_8_arrayed_list: ARRAYED_LIST[INTEGER_8]
		attribute
			create Result.make (0)
		end

	my_integer_16_arrayed_list: ARRAYED_LIST[INTEGER_16]
		attribute
			create Result.make (0)
		end

	my_integer_32_arrayed_list: ARRAYED_LIST[INTEGER_32]
		attribute
			create Result.make (0)
		end

	my_integer_64_arrayed_list: ARRAYED_LIST[INTEGER_64]
		attribute
			create Result.make (0)
		end

	my_natural_arrayed_list: ARRAYED_LIST[NATURAL]
		attribute
			create Result.make (0)
		end

	my_natural_8_arrayed_list: ARRAYED_LIST[NATURAL_8]
		attribute
			create Result.make (0)
		end

	my_natural_16_arrayed_list: ARRAYED_LIST[NATURAL_16]
		attribute
			create Result.make (0)
		end

	my_natural_32_arrayed_list: ARRAYED_LIST[NATURAL_32]
		attribute
			create Result.make (0)
		end

	my_natural_64_arrayed_list: ARRAYED_LIST[NATURAL_64]
		attribute
			create Result.make (0)
		end

	my_real_arrayed_list: ARRAYED_LIST[REAL]
		attribute
			create Result.make (0)
		end

	my_real_32_arrayed_list: ARRAYED_LIST[REAL_32]
		attribute
			create Result.make (0)
		end

	my_real_64_arrayed_list: ARRAYED_LIST[REAL_64]
		attribute
			create Result.make (0)
		end

	my_double_arrayed_list: ARRAYED_LIST[DOUBLE]
		attribute
			create Result.make (0)
		end

--	my_date_arrayed_list: ARRAYED_LIST[DATE]
--		attribute
--			create Result.make (0)
--		end

--	my_date_time_arrayed_list: ARRAYED_LIST[DATE_TIME]
--		attribute
--			create Result.make (0)
--		end

--	my_time_arrayed_list: ARRAYED_LIST[TIME]
--		attribute
--			create Result.make (0)
--		end

--	my_duration_arrayed_list: ARRAYED_LIST[DATE_TIME_DURATION]
--		attribute
--			create Result.make (0)
--		end

	my_iso8601_date_arrayed_list: ARRAYED_LIST[ISO8601_DATE]
		attribute
			create Result.make (0)
		end

	my_iso8601_date_time_arrayed_list: ARRAYED_LIST[ISO8601_DATE_TIME]
		attribute
			create Result.make (0)
		end

	my_iso8601_time_arrayed_list: ARRAYED_LIST[ISO8601_TIME]
		attribute
			create Result.make (0)
		end

	my_iso8601_duration_arrayed_list: ARRAYED_LIST[ISO8601_DURATION]
		attribute
			create Result.make (0)
		end

feature -- Element change

	set_my_character_arrayed_list (a_char_arrayed_list: like my_character_arrayed_list)
		do
			my_character_arrayed_list := a_char_arrayed_list
		end

	set_my_character_8_arrayed_list (a_char_arrayed_list: like my_character_8_arrayed_list)
		do
			my_character_8_arrayed_list := a_char_arrayed_list
		end

--	set_my_character_32_arrayed_list (a_char_arrayed_list: like my_character_32_arrayed_list)
--		do
--			my_character_32_arrayed_list := a_char_arrayed_list
--		end

	set_my_string_arrayed_list (a_str_arrayed_list: like my_string_arrayed_list)
		do
			my_string_arrayed_list := a_str_arrayed_list
		end

	set_my_string_8_arrayed_list (a_str_arrayed_list: like my_string_8_arrayed_list)
		do
			my_string_8_arrayed_list := a_str_arrayed_list
		end

--	set_my_string_32_arrayed_list (a_str_arrayed_list: like my_string_32_arrayed_list)
--		do
--			my_string_32_arrayed_list := a_str_arrayed_list
--		end

	set_my_boolean_arrayed_list (a_bool_arrayed_list: like my_boolean_arrayed_list)
		do
			my_boolean_arrayed_list := a_bool_arrayed_list
		end

	set_my_integer_arrayed_list (an_int_arrayed_list: like my_integer_arrayed_list)
		do
			my_integer_arrayed_list := an_int_arrayed_list
		end

	set_my_integer_8_arrayed_list (an_int_arrayed_list: like my_integer_8_arrayed_list)
		do
			my_integer_8_arrayed_list := an_int_arrayed_list
		end

	set_my_integer_16_arrayed_list (an_int_arrayed_list: like my_integer_16_arrayed_list)
		do
			my_integer_16_arrayed_list := an_int_arrayed_list
		end

	set_my_integer_32_arrayed_list (an_int_arrayed_list: like my_integer_32_arrayed_list)
		do
			my_integer_32_arrayed_list := an_int_arrayed_list
		end

	set_my_integer_64_arrayed_list (an_int_arrayed_list: like my_integer_64_arrayed_list)
		do
			my_integer_64_arrayed_list := an_int_arrayed_list
		end

	set_my_real_arrayed_list (a_real_arrayed_list: like my_real_arrayed_list)
		do
			 my_real_arrayed_list := a_real_arrayed_list
		end

	set_my_real_32_arrayed_list (a_real_arrayed_list: like my_real_32_arrayed_list)
		do
			 my_real_32_arrayed_list := a_real_arrayed_list
		end

	set_my_real_64_arrayed_list (a_real_arrayed_list: like my_real_64_arrayed_list)
		do
			 my_real_64_arrayed_list := a_real_arrayed_list
		end

	set_my_double_arrayed_list (a_double_arrayed_list: like my_double_arrayed_list)
		do
			 my_double_arrayed_list := a_double_arrayed_list
		end

	set_my_natural_arrayed_list (a_nat_arrayed_list: like my_natural_arrayed_list)
		do
			my_natural_arrayed_list := a_nat_arrayed_list
		end

	set_my_natural_8_arrayed_list (a_nat_arrayed_list: like my_natural_8_arrayed_list)
		do
			my_natural_8_arrayed_list := a_nat_arrayed_list
		end

	set_my_natural_16_arrayed_list (a_nat_arrayed_list: like my_natural_16_arrayed_list)
		do
			my_natural_16_arrayed_list := a_nat_arrayed_list
		end

	set_my_natural_32_arrayed_list (a_nat_arrayed_list: like my_natural_32_arrayed_list)
		do
			my_natural_32_arrayed_list := a_nat_arrayed_list
		end

	set_my_natural_64_arrayed_list (a_nat_arrayed_list: like my_natural_64_arrayed_list)
		do
			my_natural_64_arrayed_list := a_nat_arrayed_list
		end

--	set_my_date_arrayed_list (a_date_arrayed_list: like my_date_arrayed_list)
--		do
--			my_date_arrayed_list := a_date_arrayed_list
--		end

--	set_my_date_time_arrayed_list (a_date_time_arrayed_list: like my_date_time_arrayed_list)
--		do
--			my_date_time_arrayed_list := a_date_time_arrayed_list
--		end

--	set_my_time_arrayed_list (a_time_arrayed_list: like my_time_arrayed_list)
--		do
--			my_time_arrayed_list := a_time_arrayed_list
--		end

--	set_my_duration_arrayed_list (a_duration_arrayed_list: like my_duration_arrayed_list)
--		do
--			my_duration_arrayed_list := a_duration_arrayed_list
--		end

	set_my_iso8601_date_arrayed_list (a_iso8601_date_arrayed_list: like my_iso8601_date_arrayed_list)
		do
			my_iso8601_date_arrayed_list := a_iso8601_date_arrayed_list
		end

	set_my_iso8601_date_time_arrayed_list (a_iso8601_date_time_arrayed_list: like my_iso8601_date_time_arrayed_list)
		do
			my_iso8601_date_time_arrayed_list := a_iso8601_date_time_arrayed_list
		end

	set_my_iso8601_time_arrayed_list (a_iso8601_time_arrayed_list: like my_iso8601_time_arrayed_list)
		do
			my_iso8601_time_arrayed_list := a_iso8601_time_arrayed_list
		end

	set_my_iso8601_duration_arrayed_list (a_iso8601_duration_arrayed_list: like my_iso8601_duration_arrayed_list)
		do
			my_iso8601_duration_arrayed_list := a_iso8601_duration_arrayed_list
		end

end


