note
	component:   "Eiffel Object Modelling Framework"
	description: "Type for testing dADL serialise/deserialise of simple types."
	keywords:    "test, ODIN"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ODIN_PRIMITIVE_TYPES


feature -- Access

	my_character: CHARACTER assign set_my_character

	my_character_8: CHARACTER_8 assign set_my_character_8

--	my_character_32: CHARACTER_32 assign set_my_character_32

	my_string: STRING assign set_my_string

	my_string_8: STRING_8 assign set_my_string_8

--	my_string_32: STRING_32 assign set_my_string_32

	my_boolean: BOOLEAN assign set_my_boolean

	my_integer: INTEGER assign set_my_integer

	my_integer_8: INTEGER_8 assign set_my_integer_8

	my_integer_16: INTEGER_16 assign set_my_integer_16

	my_integer_32: INTEGER_32 assign set_my_integer_32

	my_integer_64: INTEGER_64 assign set_my_integer_64

	my_natural: NATURAL assign set_my_natural

	my_natural_8: NATURAL_8 assign set_my_natural_8

	my_natural_16: NATURAL_16 assign set_my_natural_16

	my_natural_32: NATURAL_32 assign set_my_natural_32

	my_natural_64: NATURAL_64 assign set_my_natural_64

	my_real: REAL assign set_my_real

	my_real_32: REAL_32 assign set_my_real_32

	my_real_64: REAL_64 assign set_my_real_64

	my_double: DOUBLE assign set_my_double

	my_date: DATE assign set_my_date

	my_date_time: DATE_TIME assign set_my_date_time

	my_time: TIME assign set_my_time

	my_duration: DATE_TIME_DURATION assign set_my_duration

	my_iso8601_date: ISO8601_DATE assign set_my_iso8601_date

	my_iso8601_date_time: ISO8601_DATE_TIME assign set_my_iso8601_date_time

	my_iso8601_time: ISO8601_TIME assign set_my_iso8601_time

	my_iso8601_duration: ISO8601_DURATION assign set_my_iso8601_duration

feature -- Element change

	set_my_character (a_char: like my_character)
		do
			my_character := a_char
		end

	set_my_character_8 (a_char: like my_character_8)
		do
			my_character_8 := a_char
		end

--	set_my_character_32 (a_char: like my_character_32)
--		do
--			my_character_32 := a_char
--		end

	set_my_string (a_str: like my_string)
		do
			my_string := a_str
		end

	set_my_string_8 (a_str: like my_string_8)
		do
			my_string_8 := a_str
		end

--	set_my_string_32 (a_str: like my_string_32)
--		do
--			my_string_32 := a_str
--		end

	set_my_boolean (a_bool: like my_boolean)
		do
			my_boolean := a_bool
		end

	set_my_integer (an_int: like my_integer)
		do
			my_integer := an_int
		end

	set_my_integer_8 (an_int: like my_integer_8)
		do
			my_integer_8 := an_int
		end

	set_my_integer_16 (an_int: like my_integer_16)
		do
			my_integer_16 := an_int
		end

	set_my_integer_32 (an_int: like my_integer_32)
		do
			my_integer_32 := an_int
		end

	set_my_integer_64 (an_int: like my_integer_64)
		do
			my_integer_64 := an_int
		end

	set_my_real (a_real: like my_real)
		do
			 my_real := a_real
		end

	set_my_real_32 (a_real: like my_real_32)
		do
			 my_real_32 := a_real
		end

	set_my_real_64 (a_real: like my_real_64)
		do
			 my_real_64 := a_real
		end

	set_my_double (a_double: like my_double)
		do
			 my_double := a_double
		end

	set_my_natural (a_nat: like my_natural)
		do
			my_natural := a_nat
		end

	set_my_natural_8 (a_nat: like my_natural_8)
		do
			my_natural_8 := a_nat
		end

	set_my_natural_16 (a_nat: like my_natural_16)
		do
			my_natural := a_nat
		end

	set_my_natural_32 (a_nat: like my_natural_32)
		do
			my_natural_32 := a_nat
		end

	set_my_natural_64 (a_nat: like my_natural_64)
		do
			my_natural_64 := a_nat
		end

	set_my_date (a_date: like my_date)
		do
			my_date := a_date
		end

	set_my_date_time (a_date_time: like my_date_time)
		do
			my_date_time := a_date_time
		end

	set_my_time (a_time: like my_time)
		do
			my_time := a_time
		end

	set_my_duration (a_duration: like my_duration)
		do
			my_duration := a_duration
		end

	set_my_iso8601_date (a_iso8601_date: like my_iso8601_date)
		do
			my_iso8601_date := a_iso8601_date
		end

	set_my_iso8601_date_time (a_iso8601_date_time: like my_iso8601_date_time)
		do
			my_iso8601_date_time := a_iso8601_date_time
		end

	set_my_iso8601_time (a_iso8601_time: like my_iso8601_time)
		do
			my_iso8601_time := a_iso8601_time
		end

	set_my_iso8601_duration (a_iso8601_duration: like my_iso8601_duration)
		do
			my_iso8601_duration := a_iso8601_duration
		end

end


