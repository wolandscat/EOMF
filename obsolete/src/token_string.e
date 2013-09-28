note
	component:   "Eiffel Object Modelling Framework"
    description: "Token-handling string. NOTE: cannot have empty fields."
	keywords:    "token, string"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class TOKEN_STRING

inherit
	ANY
		redefine
			out
		end

create
	make

feature -- Initialisation

	make (a_str: STRING)
		require
			a_str_valid: a_str /= Void
		do
			str := a_str
			delimiter := Default_delimiter
		end

	set_delimiter(a_delimiter: CHARACTER)
		do
			delimiter := a_delimiter
		end

feature -- Access

	Default_delimiter: CHARACTER = ','


	is_empty: BOOLEAN
		do
			Result := str.is_empty
		end

	token_count: INTEGER
	        -- return the number of tokens found
		do
			Result := str.occurrences(delimiter) + 1
		end

	remainder: STRING
			-- output the rest of the string starting with the current token
		do
			create Result.make(0)
			if token_start_pos < str.count then
				Result.append(str.substring(token_start_pos, str.count))
			end
		end

feature -- Iteration

	token_start
	    require
			Not_empty: not is_empty
	    do
			token_start_pos := 1
			token_end_pos :=  str.index_of(delimiter, token_start_pos) - 1
			if token_end_pos < 0 then
				token_end_pos := str.count
			end
		end

	token_forth
		require
			Not_off: not token_off
		do
			token_start_pos := token_end_pos + 2
			if not token_off then
				token_end_pos := str.index_of(delimiter, token_start_pos) - 1
     				if token_end_pos < 0  then
					token_end_pos := str.count
				end
			end
		end

	token_off : BOOLEAN
		do
			Result := token_start_pos > str.count
		end

	token_item : STRING
		require
			Not_off: not token_off
		do
			create Result.make(0)
			if token_end_pos >= token_start_pos then
				Result.append(str.substring(token_start_pos, token_end_pos))
			end
		ensure
			Result /= Void
		end

feature -- Status setting

	use_whitespace_parsing
	        -- set up string so that any whitespace (TABs, SPCs) will be treated
	        -- as a single delimiter between tokens not containing whitespace chars
	    require
	        Not_empty: not is_empty
	    local
	        change_pos: INTEGER
	        one_tab, two_tabs, one_space: STRING
	    do
	        create one_tab.make_filled ('%T', 1)
	        create two_tabs.make_filled ('%T', 2)
	        create one_space.make_filled (' ', 1)

	        -- remove leading and trailing white space
  	        str.left_adjust
  	        str.right_adjust

	        -- convert SPACEs to TABs
	        str.replace_substring_all(one_space, one_tab)

	        -- convert all occurrences of multiple TAB to one TAB only
			from
			    change_pos := str.substring_index (two_tabs, 1)
			until
			    change_pos = 0
			loop
			    str.replace_substring (one_tab, change_pos, change_pos + 1)
			    if change_pos < str.count then
					change_pos := str.substring_index (two_tabs, change_pos)
			    else
					change_pos := 0
			    end
			end

			delimiter := '%T'
		ensure
			delimiter = '%T'
	    end

feature -- Modification

	append_token(s: STRING)
			-- append s adding a delimiter before if there is already content
		require
			s /= Void
		do
			if not str.is_empty then
				str.append_character (delimiter)
			end
			str.append(s)
		end

	append(s: STRING)
			-- append s
		require
			s /= Void
		do
			str.append(s)
		end

feature -- Output

	out: STRING
			--
		do
			Result := str.twin
		end

	as_list: ARRAYED_LIST [STRING]
			-- generate a list containing all the tokens in the original string
		do
			create Result.make(0)
			from
				token_start
			until
				token_off
			loop
				Result.extend(token_item)
				token_forth
			end
		end

feature {NONE} -- Implementation

	str: STRING
			-- the data

	delimiter: CHARACTER

	token_start_pos, token_end_pos : INTEGER

end

