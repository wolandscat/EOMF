note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Access to a configuration file in ODIN format. Programmatic access uses paths to refer to 
				 any specific item.
				 ]"
	keywords:    "config, file"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ODIN_CONFIG_FILE_ACCESS

inherit
	CONFIG_FILE_ACCESS_I

create
	make

feature -- Definitions

	file_header_text: STRING
		once
			create Result.make(0)
			Result.append("--%N")
			Result.append("-- " + get_msg_line ("config_settings_line1", <<application_name>>))
			Result.append("-- " + get_msg_line ("config_settings_line2", Void))
			Result.append("--%N")
			Result.append("%N")
		end

feature -- Commands

	load
			-- read content from file and parse to Data Tree form.
			-- if file not readable, or not there, or in wrong syntax, do nothing.
		local
			res_file: PLAIN_TEXT_FILE
			parser: ODIN_VALIDATOR
		do
			if file_system.file_exists (file_path) then
				create res_file.make (file_path)
				if res_file.exists and res_file.is_readable then
					res_file.open_read
					res_file.read_stream (res_file.count)
					create parser.make
					parser.execute (res_file.last_string, 1)
					if not parser.syntax_error then
						dt_tree := parser.output
					else
						errors.add_error (ec_cfg_file_parse_error, <<file_path, parser.errors.as_string>>, generator)
					end
					res_file.close
				end

				if not attached dt_tree then
					create dt_tree.make_anonymous
				end
			end
		end

	save (a_dt_tree: DT_COMPLEX_OBJECT_NODE)
		local
			a_dt_iterator: DT_VISITOR_ITERATOR
			res_file: PLAIN_TEXT_FILE
		do
			-- serialise to a String
			dt_serialiser.reset
			create a_dt_iterator.make (a_dt_tree, dt_serialiser)
			a_dt_iterator.do_all

			-- write to the config file
			create res_file.make (file_path)
			if not file_system.file_exists (file_path) then
				check attached file_system.dirname (file_path) as dir then
					if not file_system.directory_exists (dir) then
						file_system.recursive_create_directory (dir)
					end
				end
				res_file.create_read_write
			else
				res_file.open_write
			end
			res_file.put_string (file_header_text)
			res_file.put_string (dt_serialiser.last_result)
			res_file.close
		end

feature {NONE} -- Implementation

	dt_serialiser: DT_ODIN_SERIALISER
		once
			create Result.make(create {NATIVE_ODIN_SERIALISATION_PROFILE}.make ("odin"))
		end

end

