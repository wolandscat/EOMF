note
	component:   "Eiffel Object Modelling Framework"
	description: "Terminology text"
	keywords:    "text, data"
	author:      "Thomas Beale <thomas.beale@graphitehealth.io>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2023- Graphite Health <http://graphitehealth.io>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class TERMINOLOGY_TERM

inherit
	COMPARABLE
		undefine
			out
		end

create
	default_create, make, make_from_string

feature -- Definitions

	default_text: STRING = "(unknown)"

	text_delim: CHARACTER = '|'

feature -- Initialization

	make (a_text: STRING; a_concept: TERMINOLOGY_CODE)
		do
			concept := a_concept
			text := a_text
		end

	make_from_string (str: STRING)
			-- make from a string of three possible forms:
			--     terminology_id::code_string, 			e.g. ICD10AM::M10|text|
			--     terminology_id(version)::code_string, 	e.g. SNOMED_CT(2011_06_01)::200003495|text|
		require
			Key_valid: not str.is_empty
		local
			lpos, rpos, sep_pos: INTEGER
		do
			sep_pos := str.index_of (text_delim, 1)
			create concept.make_from_string (str.substring(1, sep_pos-1))
			text := str.substring(sep_pos +1, str.count - 1)
		end

feature -- Access

	concept: TERMINOLOGY_CODE
		attribute
			create Result.default_create
		end

	text: STRING
			-- Text of term
		attribute
			create Result.make_from_string (default_text)
		end

feature -- Comparison

	is_less alias "<" (other: like Current): BOOLEAN
			-- Compare two terms
		do
			Result := concept < other.concept
		end

feature -- Output

	as_string: STRING
			-- string form displayable for humans - e.g. ICD9(1989)::M17
		do
			create Result.make(0)
			Result.append (concept.as_string)
			Result.append_character (text_delim)
			Result.append (text)
			Result.append_character (text_delim)
		end

	out: STRING
		do
			Result := as_string
		end

invariant
	Text_valid: not text.is_empty

end


