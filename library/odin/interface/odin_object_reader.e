note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Control object for reading a file and converting it to an Eiffel object of
				 a type corresponding to the generic parameter.
				 ]"
	keywords:    "odin, object, materialisation, deserialisation"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ODIN_OBJECT_READER [G -> DT_CONVERTIBLE]

inherit
	ANY_VALIDATOR

	KL_SHARED_FILE_SYSTEM
		export
			{NONE} all
		end

	SHARED_DT_OBJECT_CONVERTER
		export
			{NONE} all
		end

	EOMF_COMPILED_MESSAGE_IDS
		export
			{NONE} all
		end

create
	make, make_load

feature -- Initialisation

	make (a_file_path: STRING)
		do
			file_path := a_file_path
		end

	make_load (a_file_path: STRING)
		do
			file_path := a_file_path
			load
		end

feature -- Access

	file_path: STRING
			-- path to file

	object: detachable G

feature -- Commands

	load
		local
			obj_file: PLAIN_TEXT_FILE
			default_object: detachable G
		do
			reset
			object := default_object
			create obj_file.make (file_path)
			if not obj_file.exists or else not obj_file.is_readable then
				add_error (ec_object_file_not_valid, <<({G}).name, file_path>>)
			else
				obj_file.open_read
				obj_file.read_stream (obj_file.count)
				parser.execute (obj_file.last_string, 1)
				if not parser.syntax_error and then attached parser.output as dt_tree then
					if not attached {G} dt_tree.as_object_from_string (({G}).name, Void) as att_obj then
						add_error (ec_object_load_failure_exception, <<({G}).name, file_path>>)
					elseif dt_object_converter.errors.has_errors then
						add_error (ec_object_conv_fail_err, <<({G}).name, file_path, dt_object_converter.errors.as_string>>)
					else
						object := att_obj
						passed := True
					end
				else
					add_error (ec_object_load_failure, <<({G}).name, file_path, parser.errors.as_string>>)
				end
				obj_file.close
			end
		ensure
			attached object or else has_errors
		end

	validate
		do
		end

	save (obj: G)
		local
			a_dt_iterator: DT_VISITOR_ITERATOR
			obj_file: PLAIN_TEXT_FILE
		do
			-- serialise to a String
			serialiser.reset
			create a_dt_iterator.make (obj.dt_representation, serialiser)
			a_dt_iterator.do_all

			-- write to file
			create obj_file.make (file_path)
			if not obj_file.exists then
				check attached file_system.dirname (file_path) as dir then
					if not file_system.directory_exists (dir) then
						file_system.recursive_create_directory (dir)
					end
				end
				obj_file.create_read_write
			else
				obj_file.open_write
			end
			obj_file.put_string (serialiser.last_result)
			obj_file.close

			object := obj
		end

feature {NONE} -- Implementation

	parser: ODIN_PARSER
		once
			create Result.make
		end

	serialiser: DT_ODIN_SERIALISER
		once
			create Result.make(create {NATIVE_ODIN_SERIALISATION_PROFILE}.make ("odin"))
		end

end

