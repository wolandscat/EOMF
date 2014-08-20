note
	component:   "Eiffel Object Modelling Framework"
	description: "Abstract concept of a command set for a tool, such as Git"
	keywords:    "command line, external command"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class EXTERNAL_TOOL_INTERFACE

inherit
	SHARED_RESOURCES
		export
			{NONE} all;
			{ANY} deep_copy, is_deep_equal, deep_twin, standard_is_equal, directory_exists
		end

feature -- Initialisation

	make (a_tool_name: STRING)
			-- make with `a_tool_name', normally the name of a command line executable
		do
			tool_name := a_tool_name
			tool_available := system_has_command (tool_name)
			create current_directory.make_empty
		end

feature -- Access

	tool_name: STRING
			-- name of the tool, normally the name of the main executable

	current_directory: STRING
			-- dirctory in which commands should be executed, if value is non-empty

	last_result: detachable PROCESS_RESULT
			-- result of last external call

feature -- Status Report

	tool_available: BOOLEAN
		-- True if tool is available in OS environment

	current_directory_set: BOOLEAN
			-- True if current directory set to point to a real directory
		do
			Result := not current_directory.is_empty and then directory_exists (current_directory)
		end

feature -- Modification

	change_directory (a_dir: STRING)
			-- change directory to `a_dir'. This will be recorded locally, and
			-- subsequent commands executed in this directory
		require
			directory_exists (a_dir)
		do
			current_directory := a_dir
		end

end
