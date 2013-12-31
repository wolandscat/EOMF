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

	uri_template: STRING = "http://$terminology_id.info/id/$code_string"

	default_terminology_id: STRING = "local"

	default_code_string: STRING = "000001"

	separator: STRING = "::"

feature -- Initialization

	make_from_string (str: STRING)
			-- make from a string of the form terminology_id::code_string, e.g. ICD10(1998)::M10
			-- the form terminology_id:: is also allowable, in which case the default_code_string will
			-- be used
		require
			Key_valid: not str.is_empty
		local
			sep_pos: INTEGER
		do
			sep_pos := str.substring_index (separator, 1)
			create terminology_id.make_from_string (str.substring (1, sep_pos-1))
			if str.count >= sep_pos + separator.count then
				code_string := str.substring (sep_pos+separator.count, str.count)
			else
				code_string := default_code_string.twin
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

feature -- Access

	terminology_id: STRING
			-- Identifier of the distinct terminology from which the code_string
			-- (or its elements) was extracted
		attribute
			create Result.make_from_string (default_terminology_id)
		end

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

feature -- Conversion

	to_uri: URI
			-- convert to a URI string
		local
			uri_str: STRING
		do
			create uri_str.make_from_string (uri_template)
			uri_str.replace_substring_all ("$terminology_id", terminology_id)
			uri_str.replace_substring_all ("$code_string", code_string)
			create Result.make_from_string (uri_str)
		end

feature -- Output

	as_string: STRING
			-- string form displayable for humans - e.g. ICD9(1989)::M17
		do
			create Result.make(0)
			Result.append (terminology_id)
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


