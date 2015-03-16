note
	component:   "Eiffel Object Modelling Framework"
	description: "Result of a process - exit code, stdout, stderr"
	keywords:    "error, process"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class PROCESS_RESULT

inherit
    ANY
        redefine
            default_create
        end

create
	make, default_create

feature -- Definitions

	Exit_did_not_run: INTEGER = -1
    
    No_command: STRING = "no_command"

feature -- Initialisation

    default_create
        do
            make (No_command, Void)
        end
 
	make (a_cmd_line: STRING; in_directory: detachable STRING)
			-- make with exit_code -1 to indicate that no process has run
		do
			exit_code := Exit_did_not_run

			command_line := a_cmd_line

			if attached in_directory as att_dir then
				directory := att_dir
			end
		ensure
			exit_code = Exit_did_not_run
		end

feature -- Access

	command_line: STRING

	directory: STRING
		attribute
			create Result.make_empty
		end

	exit_code: INTEGER
			-- return code; 0 = success

	stdout: STRING
		attribute
			create Result.make_empty
		end

	stderr: STRING
		attribute
			create Result.make_empty
		end

	error_output: STRING
			-- obtain error output; use `stderr' value if available, but if nothing there
			-- use `stdout' value.
		do
			if not stderr.is_empty then
				Result := stderr
			else
				Result := stdout
			end
		end

feature -- Status Report

	succeeded: BOOLEAN
		do
			Result := exit_code = 0
		end

	failed: BOOLEAN
		do
			Result := exit_code > 0
		end

	did_not_run: BOOLEAN
		do
			Result := exit_code = Exit_did_not_run
		end

feature -- Modification

	set_exit_code (a_code: INTEGER)
		do
			exit_code := a_code
		end

	append_stdout (a_str: STRING)
		do
			stdout.append (a_str)
		end

	append_stderr (a_str: STRING)
		do
			stderr.append (a_str)
		end

end
