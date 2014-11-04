note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Simple, fast hand-built parser for handling the top few lines of ODIN files. Enables
				 extraction of one or more top-level attribute values.
				 ]"
	keywords:    "parsing, ODIN"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ODIN_MINI_PARSER

inherit
	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

	KL_SHARED_FILE_SYSTEM

feature -- Definitions

	Max_lines: INTEGER = 15
			-- maximum number of non-comment lines to process

	Comment_leader: STRING = "--"
			-- ODIN comment line leader

feature -- Access

	last_parse_content: HASH_TABLE [STRING, STRING]
			-- table of {attr_name, value} pairs
		attribute
			create Result.make (0)
		end

	last_parse_fail_reason: STRING
		attribute
			create Result.make_empty
		end

	last_parse_content_item (a_key: STRING): STRING
			-- more forgiving form of access to items in parse table; if nothing available
			-- return an empty string
		do
			if last_parse_content.has (a_key) and then attached last_parse_content.item (a_key) as val then
				Result := val
			else
				create Result.make_empty
			end
		end

feature -- Status Report

	last_parse_valid: BOOLEAN
			-- True if last parse was ok

feature -- Commands

	extract_attr_values (a_full_path: STRING; attr_names: ARRAY[STRING])
			-- perform quick parse of lines down to line starting with `an_attr_name'; if found, extract its value
			-- and put it in `last_parse_content'. Will stop after Max_lines of non-comment lines.
			-- `last_parse_valid' set if content matching any attr_name found
			-- Only works for ODIN single-line key/val pairs, i.e. not for values extending over one line
		require
			path_valid: file_system.file_exists (a_full_path)
		local
			line, val, key, str: STRING
			lpos, rpos, i: INTEGER
		do
			last_parse_valid := False
			file_context.set_target (a_full_path)
			file_context.read_matching_lines (attr_names, Comment_leader, Max_lines)
			last_parse_content.wipe_out

			if file_context.line_buf_count > 0 then
				across file_context.line_buf as line_buf_csr loop
					line := line_buf_csr.item
					lpos := line.index_of ('<', 1) + 1
					if lpos > 1 then
						rpos := line.index_of ('>', lpos) - 1
						if rpos >= lpos then
							-- check for quoted "" or '' and remove
							if line.item (lpos) = '%"' or line.item (lpos) = '%'' then
								lpos := lpos + 1
							end
							if line.item (rpos) = '%"' or line.item (rpos) = '%'' then
								rpos := rpos - 1
							end

							val := line.substring (lpos, rpos)
							key := line.substring (1, line.index_of (' ', 1)-1)
							last_parse_content.put (val, key)
						else
							last_parse_fail_reason := get_msg (ec_parse_odin_missing_right_delim, <<line>>)
						end
					else
						last_parse_fail_reason := get_msg (ec_parse_odin_missing_left_delim, <<line>>)
					end
				end
			else
				create str.make_empty
				from i := attr_names.lower until i > attr_names.upper loop
					str.append (attr_names[i])
					if i /= attr_names.upper then
						str.append(", ")
					end
					i := i + 1
				end
				last_parse_fail_reason := get_msg (ec_parse_odin_missing_left_delim, <<str>>)
			end
			last_parse_valid := not last_parse_content.is_empty
		ensure
			last_parse_valid implies (attached last_parse_content and not last_parse_content.is_empty)
		end

feature {NONE} -- Implementation

	file_context: FILE_CONTEXT
			-- Access to the file system.
		once
			create Result
		end

end



