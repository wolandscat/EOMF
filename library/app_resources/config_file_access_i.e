note
	component:   "Eiffel Object Modelling Framework"
	description: "Interface to config file reader/writer class"
	keywords:    "config, file"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class CONFIG_FILE_ACCESS_I

inherit
	SHARED_APP_RESOURCES
		export
			{NONE} all
		end

	SHARED_MESSAGE_DB
		export
			{NONE} all;
			{ANY} deep_twin, deep_copy, is_deep_equal, standard_is_equal
		end

feature -- Definitions

	file_header_text: STRING
		deferred
		end

feature -- Initialisation

	make
		do
			create errors.make
			create file_path.make_empty
		end

feature -- Access

	file_path: STRING
			-- path to resource file

	dt_tree: detachable DT_COMPLEX_OBJECT
			-- result of parsing

	errors: ERROR_ACCUMULATOR

feature -- Modification

	set_file_path (a_file_path: STRING)
			-- Make with `a_file_path', which doesn't necessarily exist as a file. If it does, it will be read;
			-- if not, nothing will be read, and the first save request will create the file new.
		do
			file_path := a_file_path
		end

feature -- Commands

	load
			-- read content from file and parse to Data Tree form.
			-- if file not readable, or not there, or in wrong syntax, do nothing.
		deferred
		end

	save (a_dt_tree: DT_COMPLEX_OBJECT)
		deferred
		end

end

