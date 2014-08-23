note
	component:   "Eiffel Object Modelling Framework"
	description: "Shared access to application-wide configuration settings for any Eiffel app, stored in a config file."
	keywords:    "config, resources"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SHARED_RESOURCES

inherit
	KL_SHARED_FILE_SYSTEM
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

	ERROR_SEVERITY_TYPES
		export
			{NONE} all
		end

feature -- Definitions

	Default_windows_temp_dir: STRING = "C:\Temp"

	Default_unix_temp_dir: STRING = "/tmp"

	User_config_file_extension: STRING = ".cfg"

	Resource_path_separator: STRING = "/"
			-- regardless of OS, this is used in paths to locate resources, including icons and also .cfg file items

feature -- Environment

	std_out: PLAIN_TEXT_FILE
		do
			Result := io.output
		end

	std_err: PLAIN_TEXT_FILE
		do
			Result := io.error
		end

	is_windows: BOOLEAN
			-- Is the operating system Microsoft Windows?
		once
			Result := {PLATFORM}.is_windows
		end

	is_unix: BOOLEAN
			-- Is the operating system some form of Unix?
		once
			Result := {PLATFORM}.is_unix
		end

	is_mac_os_x: BOOLEAN
			-- Is the operating system Mac OS X?
		once
			Result := {PLATFORM}.is_mac
		end

	is_cygwin: BOOLEAN
			-- Is there a cygwin environment installed on windows?
		once
			Result := {PLATFORM}.is_windows and file_system.file_exists (Cygwin_bash_exe_path)
		end

	system_temp_file_directory: STRING
			-- Standard place for temporary files.
			-- By default /tmp on unix-like systems and C:\Temp on windows-like systems.
			-- Windows would normally be "C:\Documents and Settings\(user)\Local Settings\Temp".
		local
			tmp_dir: detachable STRING
		once
			tmp_dir := execution_environment.get ("TMP")

			if not attached tmp_dir or else tmp_dir.is_empty then
				tmp_dir := execution_environment.get ("TEMP")
			end

			if attached tmp_dir as t and then not t.is_empty then
				Result := (create {WINDOWS_SHORT_PATH}.make (t)).as_long_path
			else
				if is_windows then
					Result := default_windows_temp_dir.twin
				else
					Result := default_unix_temp_dir.twin
				end
			end

			Result.prune_all_trailing (os_directory_separator)
			Result.append_character (os_directory_separator)
		ensure
			not_empty: not Result.is_empty
			ends_with_directory_separator: Result @ Result.count = os_directory_separator
		end

feature -- Validation

	file_exists (path: STRING): BOOLEAN
			-- Is `path' a valid, existing file?
		do
			Result := file_system.file_exists (file_system.canonical_pathname (path))
		end

	directory_exists (path: STRING): BOOLEAN
			-- Is `path' a valid, existing directory?
		do
			Result := file_system.directory_exists (file_system.canonical_pathname (path))
		end

feature -- External Commands

	Command_name_pos_param: STRING = "$cmd"
			-- replaceable string within a command template representing command name

	Arguments_pos_param: STRING = "$args"
			-- replaceable string within a command template representing command arguments and switches

	Default_editor_app_command: STRING
			-- An editor application based on operating system.
		once
   			if is_windows then
   				Result := "cmd /q /d /c start %"%" /b"
			elseif is_mac_os_x then
				Result := "open"
			else
   				Result := "vi"
   			end
   		end

	Default_text_editor_command: STRING
			-- A reasonable name of a text editor based on operating system.
		once
   			if is_windows then
   				Result := "Notepad.exe"
			elseif is_mac_os_x then
				Result := "open -t"
			else
   				Result := "vi"
   			end
   		end

	Default_difftool_command: STRING
			-- A reasonable diff tool based on operating system.
		once
   			if is_windows then
   				-- /e = enable tool to be dismissed with single Esc keystroke, like a dialog
   				-- /u means don't add any paths to Windows recent paths / places
   				Result := "%"C:\Program Files\winmerge\winmergeU.exe%" /e /u /f *.*"
			else
   				Result := "sdiff"
   			end
   		end

	System_which_command_template: STRING
			-- the command to detect if another command exists, i.e. which/type on unices, where on Windows
		once
   			if is_windows then
				Result := "where " + Arguments_pos_param
			else
   				Result := "/bin/sh -l -c %"which " + Arguments_pos_param + "%""
   			end
   		end

	system_has_command (a_cmd_name: STRING): BOOLEAN
			-- True if the command `a_cmd_name' is available on the system in any form, either
			-- natively or in cygwin under Windows
		do
			Result := standard_has_command (a_cmd_name) or else cygwin_has_command (a_cmd_name)
		end

	standard_has_command (a_cmd_name: STRING): BOOLEAN
			-- True if the command `a_cmd_name' is available on the native system, i.e. standard
			-- Linux, MacOS, Windows, ...
		local
			pf: PROCESS_FACTORY
			proc: PROCESS
            cmd_line: STRING
		do
			if command_template_cache.has (a_cmd_name) then
				Result := True
			else
				create pf
                cmd_line := standard_command_line (System_which_command_template, a_cmd_name)
                last_command_result_cache.put (create {PROCESS_RESULT}.make (cmd_line, Void))
				proc := pf.process_launcher_with_command_line (cmd_line, Void)
				proc.set_hidden (True)
				proc.redirect_input_to_stream
				proc.redirect_output_to_agent (
					agent (cmd_name, s: STRING)
						do
							if not s.is_empty then
								s.right_adjust
								command_template_cache.put (standard_new_command_template (s), cmd_name)
                                last_command_result.append_stdout (s)
							end
						end (a_cmd_name, ?)
				)
                proc.redirect_error_to_agent (agent (s: STRING) do last_command_result.append_stderr (s) end)
				proc.launch
				proc.wait_for_exit
                last_command_result.set_exit_code (proc.exit_code)
				Result := proc.exit_code = 0
			end
		end

	standard_command_line (a_cmd_template, an_args: STRING): STRING
			-- generate a command line from a command template containing "$args$
		do
			create Result.make_from_string (a_cmd_template)
			Result.replace_substring_all (Arguments_pos_param, an_args)
		end

	system_run_command (a_cmd_name, a_cmd_switches_args: STRING; in_directory: detachable STRING)
			-- run a command logically specified by `a_cmd_name' and `a_cmd_switches_args' and return the result;
			-- figure out from platform specifics and stored command templates how to actually run the command
		require
			system_has_command (a_cmd_name)
		local
			cmd_line: STRING
		do
			if command_template_cache.has (a_cmd_name) and then attached command_template_cache.item (a_cmd_name) as att_cmd_tpl then
				create cmd_line.make_from_string (att_cmd_tpl)
				cmd_line.replace_substring_all (Arguments_pos_param, a_cmd_switches_args)
				do_system_run_command (cmd_line, in_directory)

			elseif cygwin_command_template_list.has (a_cmd_name) then
				create cmd_line.make_from_string (Cygwin_command_template)

				-- if directory is specified, then insert a "cd dir;" before the command
				if attached in_directory as att_dir then
					cmd_line.replace_substring_all (Command_name_pos_param, "cd `cygpath -u '" + in_directory + "'`; " + a_cmd_name)
				end

				cmd_line.replace_substring_all (Arguments_pos_param, a_cmd_switches_args)

				do_system_run_command (cmd_line, Void)
			end
		end

	do_system_run_command (a_cmd_line: STRING; in_directory: detachable STRING)
			-- run `a_cmd_line' exactly as it is and return result; run process in specified directory if set
		local
			pf: PROCESS_FACTORY
			proc: PROCESS
			stderr_str, stdout_str: STRING
		do
            last_command_result_cache.put (create {PROCESS_RESULT}.make (a_cmd_line, in_directory))
			create pf
			proc := pf.process_launcher_with_command_line (a_cmd_line, in_directory)
			proc.set_hidden (True)
			proc.redirect_input_to_stream
			proc.redirect_error_to_agent (agent (s: STRING) do last_command_result.append_stderr (s) end)
			proc.redirect_output_to_agent (agent (s: STRING) do last_command_result.append_stdout (s) end)
			proc.launch
			proc.wait_for_exit
			last_command_result.set_exit_code (proc.exit_code)
		end

	command_template_cache: HASH_TABLE [STRING, STRING]
			-- table of command line templates indexed by command name, with a replaceable variable $args,
			-- which should be replaced by the actual command switches and arguments
			-- typical entries:
			--		"/usr/bin/ls $args", "ls"
			--		"/usr/local/git/git $args", "git"
		once ("PROCESS")
			create Result.make (0)
		end

	standard_new_command_template (std_cmd: STRING): STRING
			-- generate a command line based on `std_cmd' (e.g. 'which')
			-- The result will be std_cmd $args
			-- Typical result:
			--	"which" => "which $args"
		do
			Result := std_cmd + " $args"
		end

    last_command_result: PROCESS_RESULT
            -- obtain result of last run external command
        do
            Result := last_command_result_cache.item
        end

    last_command_succeeded: BOOLEAN
        do
            Result := last_command_result.succeeded
        end
 
    last_command_result_cache: CELL [PROCESS_RESULT]
        once ("PROCESS")
            create Result.put (create {PROCESS_RESULT})
        end

feature -- Cygwin

	Cygwin_bash_exe_path: STRING = "c:\cygwin\bin\bash.exe"
			-- path of bash on a cygwin installation on Windows

	Cygwin_command_template: STRING
			-- template string for creating a command to run in cygwin under Windows
		once
			create Result.make_from_string (Cygwin_bash_exe_path)
			Result.append (" -c -l %"" + Command_name_pos_param + " "  + Arguments_pos_param + "%"")
		end

	cygwin_command_line (a_cmd_name, an_args: STRING): STRING
			-- generate a command line from a command template containing "$cmd" and "$args"
		do
			create Result.make_from_string (Cygwin_command_template)
			Result.replace_substring_all (Command_name_pos_param, a_cmd_name)
			Result.replace_substring_all (Arguments_pos_param, an_args)
		end

	cygwin_has_command (a_cmd_name: STRING): BOOLEAN
			-- True if the command `a_cmd_name' is available under cygwin on windows
		local
			pf: PROCESS_FACTORY
			proc: PROCESS
		do
			if is_cygwin then
				if cygwin_command_template_list.has (a_cmd_name) then
					Result := True
				else
					create pf
					proc := pf.process_launcher_with_command_line (cygwin_command_line ("which ", a_cmd_name), Void)
					proc.set_hidden (True)
					proc.redirect_input_to_stream
					proc.redirect_output_to_agent (
						agent (cmd_name, s: STRING)
							do
								if not s.is_empty then
									s.right_adjust
									cygwin_command_template_list.put (cmd_name)
								end
							end (a_cmd_name, ?)
					)
					proc.redirect_error_to_agent (agent (s: STRING) do end)
					proc.launch
					proc.wait_for_exit
					Result := proc.exit_code = 0
				end
			end
		end

	cygwin_command_template_list: ARRAYED_SET [STRING]
			-- list of command names known in cygwin. We record just names, because all cygwin 
			-- commands have to be executed from within a cygwin bash shell, which will work out
			-- paths of commands from the environment.
		once ("PROCESS")
			create Result.make (0)
			Result.compare_objects
		end

feature  {NONE} -- Conversion

	substitute_env_vars (s: STRING): STRING
			-- expand the environment variables, delimited by a '$' and any
			-- non alphanumeric character except underscore, or end of string,
			-- in the string s
		local
			i, p,q: INTEGER
			var_name: STRING
			c: CHARACTER
		do
			Result := s.twin
			from
				p := s.index_of('$', 1)
				q := p+1
			until
				p = 0
			loop
				from i := q until i = 0 loop
					c := s.item(i)
					if (c >= 'a' and c <= 'z') or else
						(c >= 'A' and c <= 'Z') or else
						(c >= '0' and c <= '9') or else
						c = '_' then
						q := q + 1
						i := i + 1
						if i > s.count then
							i := 0
							q := s.count
						end
					else
						i := 0
					end
				end

				var_name := s.substring(p+1, q)
				if attached execution_environment.get(var_name) as var_val then
					Result.replace_substring_all("$" + var_name, var_val)
				end
				p := s.index_of('$', q)
			end
		end

feature {NONE} -- Access

	execution_environment: EXECUTION_ENVIRONMENT
			-- Shared instance of the execution environment.
	    once
	        create Result
	    end

	current_working_directory: STRING
		do
			Result := execution_environment.current_working_directory
		end

	os_directory_separator: CHARACTER
	    once
			Result := operating_environment.directory_separator
	    end

feature {NONE} -- Implementation

	extension_replaced (path, new_extension: STRING): STRING
			-- Copy of `path', with its extension replaced by `new_extension'.
		require
			new_extension_starts_with_dot: not new_extension.is_empty implies new_extension.item (1) = '.'
		local
			n: INTEGER
		do
			n := path.count
			Result := path.twin
			Result.replace_substring (new_extension, n - file_system.extension (path).count + 1, n)
		ensure
			cloned: Result /= path
			ends_with_new_extension: Result.ends_with (new_extension)
		end

	extension_removed (path: STRING): STRING
			-- Copy of `path', with its extension (final segment preceded by '.'), if any, removed
		do
			Result := path.substring (1, path.count - file_system.extension (path).count)
		ensure
			cloned: Result /= path
			extension_removed: path.has ('.') implies path.count > Result.count
		end

end

