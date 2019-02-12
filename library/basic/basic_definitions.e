note
	component:   "Eiffel Object Modelling Framework"
	description: "Definitions of some basic constant values for the openEHR models"
	keywords:    "definitions"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2006- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BASIC_DEFINITIONS

feature -- Definitions

	Any_type_name: STRING = "Any"

	bare_type_name (type_str: STRING): STRING
			-- remove any leading ! from broken TYPE.name
		do
			if type_str.item (1) = '!' then
				Result := type_str.substring (2, type_str.count)
			else
				Result := type_str
			end
		end

	format_real (a_real: REAL): STRING
			-- add the missing ".0" to integral REAL, otherwise don't change
		do
			Result := a_real.out
			if Result.index_of ('.', 1) = 0 then
				Result.append (".0")
			end
		end

	Terminology_separator: STRING = "::"

	Regex_any_pattern: STRING = ".*"

	CR: CHARACTER = '%/015/'

	LF: CHARACTER = '%/012/'

	Default_language: STRING = "en"

	Default_encoding: STRING = "UTF-8"

	UTF8_bom_char_1: CHARACTER = '%/239/'
	UTF8_bom_char_2: CHARACTER = '%/187/'
	UTF8_bom_char_3: CHARACTER = '%/191/'
			-- UTF-8 files don't normally have a BOM (byte order marker) at the start as can be
			-- required by UTF-16 files, but if the file has been converted from UTF-16 or UTF-32
			-- then the BOM in a UTF-8 file will be 0xEF 0xBB 0xBF (dec equivalent: 239, 187, 191)

	UTF8_bom_length: INTEGER = 3

	UTF8_copyright_char: CHARACTER = '%/169/'

	Time_epoch: DATE_TIME
		once
			create Result.make_from_epoch (0)
		end

	Standard_version_regex: STRING = "[0-9]+(\.[0-9]+){0,2}"
			-- Regex for 1, 2, or 3-part version string string of form N.M.P

	Full_version_regex: STRING = "[0-9]+\.[0-9]+\.[0-9]+"
			-- Regex for 3-part version string string of form N.M.P

	Standard_version_regex_matcher: RX_PCRE_REGULAR_EXPRESSION
		once ("PROCESS")
			create Result.make
			Result.compile (Standard_version_regex)
		end

	Full_version_regex_matcher: RX_PCRE_REGULAR_EXPRESSION
		once ("PROCESS")
			create Result.make
			Result.compile (Full_version_regex)
		end

	version_less_than (lver, rver: STRING): BOOLEAN
			-- is `lver'' logically earlier than `rver' in a standard scheme of dot-separated version numbers?
		require
			lver_valid: valid_standard_version (lver)
			rver_valid: valid_standard_version (rver)
		local
			lver_strs, rver_strs: LIST [STRING]
			lver_num, rver_num: INTEGER
			continue: BOOLEAN
			i: INTEGER
		do
			lver_strs := lver.split ('.')
			from i := lver_strs.count until i >= 3 loop
				lver_strs.extend ("0")
				i := i + 1
			end
			rver_strs := rver.split ('.')
			from i := rver_strs.count until i >= 3 loop
				rver_strs.extend ("0")
				i := i + 1
			end

			from
				lver_strs.start
				rver_strs.start
				continue := True
			until
				not continue or lver_strs.off or rver_strs.off
			loop
				lver_num := lver_strs.item.to_integer
				rver_num := rver_strs.item.to_integer
				if lver_num < rver_num then
					Result := True
				elseif lver_num = rver_num then
					continue := True
				else
					continue := False
				end
				lver_strs.forth
				rver_strs.forth
			end
		end

	valid_standard_version (a_ver: STRING): BOOLEAN
			-- True if `a_ver' fits the pattern of a 1, 2 or 3 part numeric version string
			-- with '.' separators
		do
			Result := Standard_version_regex_matcher.matches (a_ver)
		end

	valid_full_version (a_ver: STRING): BOOLEAN
			-- True if `a_ver' fits the pattern of a 3 part numeric version string
			-- with '.' separators
		do
			Result := Full_version_regex_matcher.matches (a_ver)
		end

end


