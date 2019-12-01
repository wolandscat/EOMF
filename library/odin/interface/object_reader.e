note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Abstract interface of an object reader-writer that can do bidirectional 
				 read/write between a file and in-memory objects.
				 ]"
	keywords:    "materialisation, deserialisation"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2018- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class OBJECT_READER [G]

inherit
	ANY_VALIDATOR
		redefine
			reset
		end

	GENERAL_MESSAGES_IDS
		export
			{NONE} all
		end

	KL_SHARED_FILE_SYSTEM
		export
			{NONE} all
		end

	SHARED_DT_SERIALISERS
		export
			{NONE} all;
			{ANY} has_dt_serialiser_format
		end

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

	serialised: STRING
			-- The last result of calling `save`.
		attribute
			create Result.make_empty
		end

feature -- Commands

	reset
			-- initialise reporting variables
		local
			default_obj: G
		do
			precursor
			object := default_obj
			serialised.wipe_out
		end

	load
			-- write `object` from a file in the syntax determined by the descendant implementation
		local
			obj_file: PLAIN_TEXT_FILE
		do
			reset
			create obj_file.make (file_path)
			if not obj_file.exists or else not obj_file.is_readable then
				add_error (ec_object_file_not_valid, <<({G}).name, file_path>>)
			else
				obj_file.open_read
				obj_file.read_stream (obj_file.count)

				-- parse step
				do_parse (obj_file.last_string)

				obj_file.close
			end
		ensure
			attached object or else has_errors
		end

	validate
		do
		end

	save (obj: G; false_booleans_off: BOOLEAN)
			-- write `obj` out to original file in the syntax determined by the descendant implementation
		local
			obj_file: PLAIN_TEXT_FILE
		do
			reset

			-- serialise step	
			do_serialise (obj, false_booleans_off)

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
			obj_file.put_string (serialised)
			obj_file.close
		end

	save_as (obj: G; a_syntax, a_file_path: STRING; false_booleans_off: BOOLEAN)
			-- write `obj` out to a specified file in the specified syntax
		require
			Format_valid: has_dt_serialiser_format (a_syntax)
		local
			obj_file: PLAIN_TEXT_FILE
		do
			reset
			create obj_file.make (a_file_path)
			if not obj_file.exists then
				check attached file_system.dirname (a_file_path) as dir then
					if not file_system.directory_exists (dir) then
						file_system.recursive_create_directory (dir)
					end
				end
				obj_file.create_read_write
			else
				obj_file.open_write
			end
			obj_file.put_string (do_serialise_as (obj, a_syntax, false_booleans_off))
			obj_file.close
		end

feature {NONE} -- Implementation

	do_parse (obj_str: STRING)
			-- do parsing; set `object` if successful
		deferred
		end

	do_serialise (obj: G; false_booleans_off: BOOLEAN)
			-- do serialising; set `serialised` if successful
		deferred
		end

	do_serialise_as (obj: G; a_syntax: STRING; false_booleans_off: BOOLEAN): STRING
			-- serialise in a syntax
		deferred
		end

end

