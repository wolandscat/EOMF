note
	component:   "Eiffel Object Modelling Framework"
	description: "Directory with regex filename-matching facility"
	keywords:    "file system"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class FILE_REPOSITORY

inherit
	KL_SHARED_FILE_SYSTEM
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

	EOMF_COMPILED_MESSAGE_IDS
		export
			{NONE} all;
		end

create
	make

feature {NONE} -- Initialisation

	make (a_dir_name, a_match_pattern: STRING)
			-- initialise with `a_dir_name', and a filename match regex `a_match_pattern'
		require
			Dir_name_exists: not a_dir_name.is_empty
			Ext_valid: not a_match_pattern.is_empty
   		do
   			create errors.make
   			create matching_paths.make (0)
			base_name_pattern := a_match_pattern

			create base_name_pattern_regex.make
			base_name_pattern_regex.set_case_insensitive (True)
			base_name_pattern_regex.compile (base_name_pattern)
			if not base_name_pattern_regex.is_compiled then
				errors.add_error (ec_regex_invalid, <<base_name_pattern>>, generator + ".make")
			else
				find_matching_file_paths (a_dir_name)
			end
		end

feature -- Access

	base_name_pattern: STRING
			-- pattern to use for files

	errors: ERROR_ACCUMULATOR
			-- set if make failed

	matching_paths: ARRAYED_LIST [STRING]
			-- file paths matching `base_name_pattern' under current directory

feature {NONE} -- Implementation

	base_name_pattern_regex: RX_PCRE_REGULAR_EXPRESSION

	find_matching_file_paths (a_dir_name: STRING)
			-- add file paths found in `a_dir_name' that match `base_name_pattern'
			-- recursively applied
		require
			Dir_name_valid: not a_dir_name.is_empty
		local
			a_dir: DIRECTORY
			a_file: RAW_FILE
			rel_cur_dir, rel_parent_dir, fpath: STRING
   		do
   			rel_cur_dir := file_system.relative_current_directory
   			rel_parent_dir := file_system.relative_parent_directory
			create a_dir.make (a_dir_name)
			if a_dir.exists and a_dir.is_readable then
				a_dir.open_read
				across a_dir.linear_representation as fnames_csr loop
					if not (fnames_csr.item.is_equal (rel_cur_dir) or fnames_csr.item.is_equal (rel_parent_dir)) then
						fpath := file_system.pathname (a_dir_name, fnames_csr.item)
						create a_file.make (fpath)
						if a_file.is_directory then
							find_matching_file_paths (fpath.twin)
						elseif base_name_pattern_regex.recognizes (fnames_csr.item) then
							matching_paths.extend (fpath)
						end
					end
				end
			end
		end

end


