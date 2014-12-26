note
	component:   "Eiffel Object Modelling Framework"
	description: "SOUNDEX algorithm."
	keywords:    "transformation"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SOUNDEX

feature -- Conversion

	translate (str, s1, s2: STRING)
			-- in str, replace every occurrence of each char in s1
			-- by corr char in s2, or delete them, if s2 empty
	    require
	    	Str_valid: not str.is_empty
			S1_valid: not s1.is_empty
			Valid_arg_lengths: s1.count = s2.count or else s2.count = 0
	    local
			i, j: INTEGER
	    do
			from i := 1 until i > s1.count loop
			    if s2.count = 0 then -- removal
					str.prune_all(s1.item(i));
			    else
					from
					    j := 1
					until
					    j = 0
					loop
				    	j := str.index_of(s1.item(i), j)
					    if j > 0 then
							str.put(s2.item(i), j);
					    end
					end
			    end

		    	i := i + 1
			end
	    end

	soundex (a_str: STRING): STRING
			-- generate the soundex equivalent of 'a_str'
		require
			a_str /= Void
	    local
			i: INTEGER;
			old_ptn, new_ptn: STRING
			code: STRING
			remaining: STRING
	    do
	    	create Result.make(0)

	    	create code.make(0)
	    	code.append(a_str)

			translate(code, punctuation, "")
			code.to_upper

			Result := code.substring(1, 1)
			remaining := code.substring(2, code.count)
			translate(remaining, alphabet, soundex_map)

			from
			    i := 1
			until
			    i > 6
			loop
			    create old_ptn.make(0)
			    old_ptn.append_integer(i * 11)
		    	create new_ptn.make(0)
			    new_ptn.append_integer(i)
			    remaining.replace_substring_all(old_ptn, new_ptn)

			    i := i + 1
			end

			translate(remaining, " ", "")
			remaining.append("0000")
			Result.append(remaining.substring(1,3))
	    end

feature {NONE} -- Implementation

	punctuation: STRING = "!%"#$%%&%'()_=-~^@`{[;+:*]},<.>/?\|"

	alphabet: STRING =  "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

	soundex_map: STRING = " 123 12  22455 12623 1 2 2"

end


