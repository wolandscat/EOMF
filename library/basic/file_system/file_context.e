note
	component:   "Eiffel Object Modelling Framework"
	description: "file handling context"
	keywords:    "file"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2002- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	licence:     "The openEHR Open Source Licence"

class
	FILE_CONTEXT

inherit
	UC_IMPORTED_UTF8_ROUTINES

	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

	EOMF_COMPILED_MESSAGE_IDS
		export
			{NONE} all
		end

	BASIC_DEFINITIONS
		export
			{NONE} all
		end

feature -- Definitions

	Default_current_directory: STRING = "."

feature -- Access

	current_full_path: STRING
			-- derive from file name and path
		do
			Result := current_directory + operating_environment.Directory_separator.out + current_file_name
		end

	current_directory: STRING
			-- directory name only
		attribute
			create Result.make_empty
		end

	current_file_name: STRING
			-- name of fle only
		attribute
			create Result.make_empty
		end

	has_byte_order_marker: BOOLEAN
			-- Does the current file have a BOM indicating it is a UTF-8 encoded unicode file?

	last_op_failed: BOOLEAN

	last_op_fail_reason: STRING
		attribute
			create Result.make_empty
		end

	file_content: STRING
			-- Text from current file as a string.
		attribute
			create Result.make_empty
		end

	line_buf: ARRAYED_LIST [STRING]
			-- file split into lines from `read_n_lines', `read_to_line'
		attribute
			create Result.make (5)
		end

	line_buf_wipe_out
			-- clean `line_buf'
		do
			across line_buf as line_csr loop line_csr.item.wipe_out end
			line_buf_count := 0
		end

	line_buf_count: INTEGER
			-- logical count of contents of `line_buf'

	line_buf_extend_empty
			-- logically extend `line_buf' with an empty string
		do
			if line_buf_count = line_buf.count then
				line_buf.extend (create {STRING}.make (512))
			end
			line_buf_count := line_buf_count + 1
		end

	line_buf_extend (a_str: STRING)
			-- logically extend `line_buf' with `a_str'
		do
			line_buf_extend_empty
			line_buf [line_buf_count].copy (a_str)
		end

	line_buf_extend_no_ws (a_str: STRING)
			-- logically extend `line_buf' with `a_str', excluding any leading whitespace from a_str
		local
			i, len: INTEGER
		do
			line_buf_extend_empty
			len := a_str.count
			from i := 1 until i > len or else not a_str.item (i).is_space loop i := i + 1 end
			line_buf [line_buf_count].append_substring (a_str, i, len)
		end

	file_timestamp: INTEGER
			-- Last marked change timestamp of file, for file changes to be compared to.

feature -- Status Report

	file_writable (a_file_name: STRING): BOOLEAN
			-- True if named file is writable, or else doesn't exist
		require
			File_name_valid: not a_file_name.is_empty
		local
			fd: PLAIN_TEXT_FILE
   		do
			create fd.make(a_file_name)
			Result := not fd.exists or else fd.is_writable
		end

feature -- Commands

	read_file_timestamp
			-- Set `file_timestamp' from the file modification date of `current_full_path'.
		local
			file: PLAIN_TEXT_FILE
		do
			create file.make (current_full_path)

			if file.exists then
				file_timestamp := file.date
			else
				file_timestamp := 0
			end
		end

	read_n_lines (n: INTEGER)
			-- Read first n non-empty lines from current file as a string, removing leading and trailing whitespace, including %R%N.
			-- Output in `line_buf'
		require
			n > 0
		local
			in_file: PLAIN_TEXT_FILE
			i: INTEGER
			a_line: STRING
   		do
    		last_op_failed := False
			create in_file.make (current_full_path)
			line_buf_wipe_out

			if in_file.exists then
				in_file.open_read
				from i := 1 until i > n or in_file.end_of_file loop
					in_file.read_line
					a_line := in_file.last_string
					if not a_line.is_whitespace then
						line_buf_extend_no_ws (a_line)
						i := i + 1
					end
				end
				in_file.close
				if line_buf_count >= 1 then
					clean_utf (line_buf[1])
				end
			else
				last_op_failed := True
				last_op_fail_reason := get_msg (ec_read_failed_file_does_not_exist, <<current_full_path>>)
			end
		ensure
			line_buf_empty_on_failure: last_op_failed implies line_buf_count = 0
		end

	read_matching_lines (start_patterns: ARRAY[STRING]; ignore_pattern: STRING; max_lines: INTEGER)
			-- Read lines starting with `start_patterns', ignoring lines starting with `ignore_pattern',
			-- or only whitespace, up to a maximum of `max_lines' non-ignored lines. Output lines, if any,
			-- in `line_buf'
		require
			Start_patterns_valid: not start_patterns.is_empty
			Ignore_pattern_valid: attached ignore_pattern implies not ignore_pattern.is_empty
			Valid_max_lines: max_lines > 0
		local
			in_file: PLAIN_TEXT_FILE
			i, j: INTEGER
			items_found: ARRAY [BOOLEAN]
			line: STRING
   		do
   			last_op_failed := False
			create in_file.make (current_full_path)
			line_buf_wipe_out

			if in_file.exists then
				in_file.open_read
				create items_found.make_filled (False, start_patterns.lower, start_patterns.upper)

				from i := 1 until i > max_lines or line_buf_count = start_patterns.count or in_file.end_of_file loop
					in_file.read_line
					line := in_file.last_string
					line.left_adjust

					-- ignore if empty or a comment
					if not line.is_whitespace and then not line.starts_with (ignore_pattern) then
						from j := start_patterns.lower until j > start_patterns.upper or else (line.starts_with (start_patterns[j]) and not items_found[j]) loop
							j := j + 1
						end
						if j <= start_patterns.upper then
							line.prune_all ('%R')
							line_buf_extend (line)
							items_found [j] := True
						end
						i := i + 1
					end
				end

				in_file.close
				if line_buf_count > 0 then
					clean_utf (line_buf [1])
				end
			else
				last_op_failed := True
				last_op_fail_reason := get_msg (ec_read_failed_file_does_not_exist, <<current_full_path>>)
			end
		ensure
			line_buf_empty_on_failure: last_op_failed implies line_buf_count = 0
		end

	read_file
			-- Read text from current file into `file_content'.
		local
			in_file: PLAIN_TEXT_FILE
			str: STRING
   		do
   			last_op_failed := False
			create file_content.make_empty
			create in_file.make(current_full_path)
			has_byte_order_marker := False

			if in_file.exists then
				file_timestamp := in_file.date
				in_file.open_read
				in_file.read_stream (in_file.count)
				 
				str := in_file.last_string
				if utf8.is_endian_detection_character (str.item (1), str.item (2), str.item (3)) then
					file_content := str.substring (UTF8_bom_length + 1, str.count)
					has_byte_order_marker := True
				else
					file_content := str
				end
				in_file.close

--				if not utf8.valid_utf8 (file_content) then
--					if has_byte_order_marker then
--						create file_content.make_empty
--						last_op_failed := True
--						last_op_fail_reason := get_msg (ec_invalid_utf8_file, <<current_full_path>>)
--					else
--						file_content := utf8.to_utf8 (file_content)
--					end
--				end
			else
				last_op_failed := True
				last_op_fail_reason := get_msg (ec_read_failed_file_does_not_exist, <<current_full_path>>)
			end
		ensure
			file_content_empty_on_failure: last_op_failed implies file_content.is_empty
		end

	save_file (a_file_name, content: STRING)
			-- Write `content' out to file `a_file_name' in `current_directory'.
		require
			File_writable: file_writable (a_file_name)
		local
			out_file: PLAIN_TEXT_FILE
   		do
   			last_op_failed := False
			create out_file.make_create_read_write (a_file_name)

			if out_file.exists then
				if has_byte_order_marker then
					-- only safe if the file was last read using this object
					out_file.put_character (UTF8_bom_char_1)
					out_file.put_character (UTF8_bom_char_2)
					out_file.put_character (UTF8_bom_char_3)
				end

				file_content := content.twin
				file_content.replace_substring_all ("%R%N", "%N")
				out_file.put_string (file_content)
				out_file.close
				file_timestamp := out_file.date
			else
				last_op_failed := True
				last_op_fail_reason := get_msg (ec_write_failed_file_does_not_exist, <<a_file_name>>)
			end
		end

	set_target (a_file_path: STRING)
			-- set context to `a_file_path'
		require
			a_file_path_valid: not a_file_path.is_empty
		local
			sep_pos: INTEGER
		do
			sep_pos := a_file_path.last_index_of(operating_environment.Directory_separator, a_file_path.count)

			if sep_pos > 0 then -- there is a directory
				current_directory := a_file_path.substring(1, sep_pos - 1)
				current_file_name := a_file_path.substring(sep_pos + 1, a_file_path.count)
			else
				current_directory := Default_current_directory
				current_file_name := a_file_path
			end
		end

	set_current_file_name (a_file_name: STRING)
		require
			a_file_name_valid: not a_file_name.is_empty
		do
			current_file_name := a_file_name
		end

	set_current_directory (a_dir: STRING)
		require
			a_dir_valid: not a_dir.is_empty
		do
			current_directory := a_dir
		end

feature {NONE} -- Implementation

	clean_utf (s: STRING)
			-- remove UTF BOM
		do
			if s.count >= 3 then
				if utf8.is_endian_detection_character (s.item (1), s.item (2), s.item (3)) then
					s.remove_head (3)
					has_byte_order_marker := True
				end
			end
		end

invariant
	timestamp_natural: file_timestamp >= 0

end



