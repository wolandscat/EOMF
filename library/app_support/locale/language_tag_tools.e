note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Minimal implementation of basic aspects of the IETF RFC 5646 language tag standard
				 (see http://tools.ietf.org/html/rfc5646). The full ABNF syntax of this standard is 
				 as follows:
				 
					 langtag       = language
									 ["-" script]
									 ["-" region]
									 *("-" variant)
									 *("-" extension)
									 ["-" privateuse]

					 language      = 2*3ALPHA            ; shortest ISO 639 code
									 ["-" extlang]       ; sometimes followed by
														 ; extended language subtags
								   / 4ALPHA              ; or reserved for future use
								   / 5*8ALPHA            ; or registered language subtag

					 extlang       = 3ALPHA              ; selected ISO 639 codes
									 *2("-" 3ALPHA)      ; permanently reserved

					 script        = 4ALPHA              ; ISO 15924 code

					 region        = 2ALPHA              ; ISO 3166-1 code
								   / 3DIGIT              ; UN M.49 code

					 variant       = 5*8alphanum         ; registered variants
								   / (DIGIT 3alphanum)

					 extension     = singleton 1*("-" (2*8alphanum))

														 ; Single alphanumerics
														 ; "x" reserved for private use
					 singleton     = DIGIT               ; 0 - 9
								   / %x41-57             ; A - W
								   / %x59-5A             ; Y - Z
								   / %x61-77             ; a - w
								   / %x79-7A             ; y - z

					 privateuse    = "x" 1*("-" (1*8alphanum))

					 grandfathered = irregular           ; non-redundant tags registered
								   / regular             ; during the RFC 3066 era

					 irregular     = "en-GB-oed"         ; irregular tags do not match
								   / "i-ami"             ; the 'langtag' production and
								   / "i-bnn"             ; would not otherwise be
								   / "i-default"         ; considered 'well-formed'
								   / "i-enochian"        ; These tags are all valid,
								   / "i-hak"             ; but most are deprecated
								   / "i-klingon"         ; in favor of more modern
								   / "i-lux"             ; subtags or subtag
								   / "i-mingo"           ; combination
								   / "i-navajo"
								   / "i-pwn"
								   / "i-tao"
								   / "i-tay"
								   / "i-tsu"
								   / "sgn-BE-FR"
								   / "sgn-BE-NL"
								   / "sgn-CH-DE"

					 regular       = "art-lojban"        ; these tags match the 'langtag'
								   / "cel-gaulish"       ; production, but their subtags
								   / "no-bok"            ; are not extended language
								   / "no-nyn"            ; or variant subtags: their meaning
								   / "zh-guoyu"          ; is defined by their registration
								   / "zh-hakka"          ; and all of these are deprecated
								   / "zh-min"            ; in favor of a more modern
								   / "zh-min-nan"        ; subtag or sequence of subtags
								   / "zh-xiang"

					 alphanum      = (ALPHA / DIGIT)     ; letters and numbers
					 
				 So far we implement only the following likely patterns:
				 	language
				 	language-region
				 	language-script-region

				 ]"
	keywords:    "internationalisation, language"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	licence:     "See notice at end of file"

class LANGUAGE_TAG_TOOLS

feature -- Definitions

	subtag_delimiter: CHARACTER = '-'

	Language_pattern_regex: STRING = "[a-zA-Z]{2,3}"

	Language_region_pattern_regex: STRING = "[a-zA-Z]{2,3}-([a-zA-Z]{2}|[0-9]{3})"

	Language_script_region_pattern_regex: STRING = "[a-zA-Z]{2,3}-[a-zA-Z]{4}-([a-zA-Z]{2}|[0-9]{3})"

feature -- Validation

	valid_language_tag (a_lang_tag: STRING): BOOLEAN
			-- True if `a_lang_tag' conforms to the standard (as partially implemented here)
		do
			Result := Language_pattern_parser.recognizes (a_lang_tag) or else
				Language_pattern_region_parser.recognizes (a_lang_tag) or else
				Language_pattern_script_region_parser.recognizes (a_lang_tag)
		end

	valid_language_pattern_tag (a_lang_tag: STRING): BOOLEAN
			-- True if `a_lang_tag' conforms to the language-only pattern, i.e. 2 or 3 alpha chars (from ISO639-1 or -2)
		do
			Result := Language_pattern_parser.recognizes (a_lang_tag)
		end

	language_tag_has_language (a_lang_tag, a_lang_subtag: STRING): BOOLEAN
			-- True if `a_lang_subtag' is found in the appropriate place in `a_lang_tag'
		require
			Valid_lang_tag: valid_language_tag (a_lang_tag)
			Valid_lang_subtag: valid_language_pattern_tag (a_lang_subtag)
		do
			Result := a_lang_tag.starts_with (a_lang_subtag)
		end

feature {NONE} -- Implementation

	Language_pattern_parser: RX_PCRE_REGULAR_EXPRESSION
		once
			create Result.make
			Result.set_case_insensitive (True)
			Result.compile (Language_pattern_regex)
			check Result.is_compiled end
		end

	Language_pattern_region_parser: RX_PCRE_REGULAR_EXPRESSION
		once
			create Result.make
			Result.set_case_insensitive (True)
			Result.compile (Language_region_pattern_regex)
			check Result.is_compiled end
		end

	Language_pattern_script_region_parser: RX_PCRE_REGULAR_EXPRESSION
		once
			create Result.make
			Result.set_case_insensitive (True)
			Result.compile (Language_script_region_pattern_regex)
			check Result.is_compiled end
		end

end

