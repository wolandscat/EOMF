note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Terminology code, possibly coordinated by terminology service; consisting of
				 a key, which is parsable into a terminology id and a code string,
				 representing the key within the terminology service for the intended
				 concept, from the given terminology.
				 The format of the key is:
					terminology_id SEP code_string
				 ]"
	keywords:    "text, data"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class TERMINOLOGY_CODE

inherit
	COMPARABLE
		undefine
			out
		end

create
	default_create, make, make_from_string

feature -- Definitions

	default_terminology_id: STRING = "local"

	default_code_string: STRING = "000001"

	version_left_delimiter: CHARACTER ='(' 

	version_right_delimiter: CHARACTER =')' 

	separator: STRING = "::"

feature -- Initialization

	make_from_string (str: STRING)
			-- make from a string of three possible forms:
			--     terminology_id::							e.g. ICD10AM
			--     terminology_id::code_string, 			e.g. ICD10AM::M10
			--     terminology_id(version)::code_string, 	e.g. SNOMED_CT(2011_06_01)::200003495
		require
			Key_valid: not str.is_empty
		local
			lpos, rpos, sep_pos: INTEGER
		do
			sep_pos := str.substring_index (separator, 1)

			-- extract a version if there is one
			lpos := str.index_of (version_left_delimiter, 1)
			if lpos > 0 then
				rpos := str.index_of (version_right_delimiter, lpos)
				if rpos > lpos then
					terminology_version := str.substring (lpos + 1, rpos - 1)
				end
				terminology_id := str.substring (1, lpos-1)
			else
				terminology_id := str.substring (1, sep_pos-1)
			end

			if str.count >= sep_pos + separator.count then
				code_string := str.substring (sep_pos + separator.count, str.count)
			end
		end

	make (a_terminology_id, a_code_string: STRING)
			-- make from two strings
		require
			Terminology_id_valid: not a_terminology_id.is_empty
			Code_string_valid: not a_code_string.is_empty
		do
			terminology_id := a_terminology_id
			code_string := a_code_string
		ensure
			Terminology_id_set: terminology_id.is_equal(a_terminology_id)
			Code_string_set: code_string = a_code_string
		end

	make_with_version (a_terminology_id, a_terminology_version, a_code_string: STRING)
			-- make from three strings
		require
			Terminology_id_valid: not a_terminology_id.is_empty
			Terminology_version_valid: not a_terminology_version.is_empty
			Code_string_valid: not a_code_string.is_empty
		do
			terminology_id := a_terminology_id
			terminology_version := a_terminology_version
			code_string := a_code_string
		ensure
			Terminology_id_set: terminology_id.is_equal(a_terminology_id)
			Code_string_set: code_string = a_code_string
		end

feature -- Access

	terminology_id: STRING
			-- Identifier of the distinct terminology from which the code_string
			-- (or its elements) was extracted
		attribute
			create Result.make_from_string (default_terminology_id)
		end

	terminology_version: detachable STRING
			-- optional terminology version

	code_string: STRING
			-- The key used by the terminology service to identify a concept or
			-- coordination of concepts. This string is most likely parsable inside
			-- the terminology service, but nothing can be assumed about its syntax
			-- outside that context.
		attribute
			create Result.make_from_string (default_code_string)
		end

feature -- Comparison

	is_less alias "<" (other: like Current): BOOLEAN
			-- Compare two terms
		local
			s, s_other: STRING
		do
			create s.make(0)
			s.append (terminology_id)
			s.append (code_string)

			create s_other.make(0)
			s_other.append (other.terminology_id)
			s_other.append (other.code_string)

			Result := s < s_other
		end

feature -- Modification

	set_code_string (a_code_string: STRING)
		require
			Code_string_valid: not a_code_string.is_empty
		do
			code_string := a_code_string
		ensure
			Code_string_set: code_string = a_code_string
		end

feature -- Output

	as_string: STRING
			-- string form displayable for humans - e.g. ICD9(1989)::M17
		do
			create Result.make(0)
			Result.append (terminology_id)
			if attached terminology_version as ver then
				Result.append_character (version_left_delimiter)
				Result.append (ver)
				Result.append_character (version_right_delimiter)
			end
			Result.append (separator)
			Result.append (code_string)
		end

	out: STRING
			-- '['  + `as_string' + ']'
		do
			Result := as_string
		end

invariant
	code_string_valid: not code_string.is_empty

end


