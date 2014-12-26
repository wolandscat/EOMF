note
	component:   "Eiffel Object Modelling Framework"
	description: "Miscellaneous String utilities."
	keywords:    "formatting"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class STRING_UTILITIES

feature -- Definitions

	Default_quote_characters: STRING = "nrt\%"'"
			-- characters that mean something special when following a backslash

	Date_time_format_string: STRING = "yyyy-[0]mm-[0]dd [0]hh:[0]mi:[0]ss"
			-- ISO 8601 standard

feature -- Conversion

	serialise_primitive_value (a_prim_val: ANY): STRING
			-- generate a correctly serialised string for any primitive value, making corrections for
			-- broken serialisations of DATE_TIME, DATE_TIME_DURATION and REAL
		do
			-- FIXME: duration.out does not exist in Eiffel, and in any case would not be ISO8601-compliant
			if attached {DATE_TIME_DURATION} a_prim_val as a_dur then
				Result := (create {ISO8601_DURATION}.make_date_time_duration(a_dur)).as_string
			elseif attached {DATE_TIME} a_prim_val as dt then
				Result := dt.formatted_out (Date_time_format_string)
			else
				Result := a_prim_val.out
				-- FIXME: REAL.out is broken (still the case in Eiffel 6.6)
				if (attached {REAL_32} a_prim_val or attached {REAL_64} a_prim_val) and then Result.index_of ('.', 1) = 0 then
					Result.append(".0")
				end
			end
		end

feature -- Formatting

	indented (s, indent: STRING): STRING
			-- indent every line in 's' by 'indent' and return result
		local
			indent_str: STRING
			tail_return_count: INTEGER
		do
			if not indent.is_empty then
				create Result.make (s.count)

				-- indent first line
				Result.append (indent)

				-- add the contents
				Result.append (s)

				-- temporarily remove any final %N chars
				from until Result.item (Result.count) /= '%N' or else Result.is_empty loop
					Result.remove_tail (1)
					tail_return_count := tail_return_count + 1
				end

				-- create the indent string
				create indent_str.make (1 + indent.count)
				indent_str.append_character ('%N')
				indent_str.append (indent)

				-- now indent all intervening lines
				Result.replace_substring_all ("%N", indent_str)

				if tail_return_count > 0 then
					Result.append (create {STRING}.make_filled ('%N', tail_return_count))
				end
			else
				Result := s
			end
		end

	add_line_numbers (text: STRING; leader_width: INTEGER; spacer: detachable STRING): STRING
			-- add line numbers to each line of `text' within a width of `leader_width', and with an optional
			-- spacer 'spacer'
			-- If leader_width = 4, and spacer = '  ', then the first line looks like
			-- "   1  ", i.e. "SSS1SS", where 'S' stands for a space
		local
			text_len, left_pos, right_pos, line_no: INTEGER
			line_no_str, leader: STRING
		do
			create leader.make_filled (' ', leader_width - 1)
			text_len := text.count
			create Result.make (text_len)
			from
				left_pos := 1
				line_no := 1
			until
				left_pos > text_len
			loop
				line_no_str := line_no.out

				-- recreate the leader string when we hit a new power of 10
				if line_no \\ 10 = 0 and then line_no_str.count <= leader_width then
					create leader.make_filled (' ', leader_width - line_no_str.count)
				end
				Result.append (leader)
				Result.append (line_no_str)

				if attached spacer then
					Result.append (spacer)
				end

				right_pos := text.index_of ('%N', left_pos)

				if right_pos = 0 then
					right_pos := text_len
				end

				Result.append (text.substring (left_pos, right_pos))
				left_pos := right_pos + 1
				line_no := line_no + 1
			end
		end

feature -- Matching

-- 	valid_regex (a_regex: STRING): BOOLEAN
-- 			-- True if `a_regex' is valid according to standard PERL-based regex rules
-- 		require
-- 			Regex_valid: not a_regex.is_empty
-- 		local
-- 			regex_matcher: RX_PCRE_REGULAR_EXPRESSION
-- 		do
-- 			create regex_matcher.make
-- 			regex_matcher.set_case_insensitive (True)
-- 			regex_matcher.compile (a_regex)
-- 			Result := regex_matcher.is_compiled
-- 		end

end


