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

	GLOBAL_ERROR_REPORTING_LEVEL
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
		once ("PROCESS")
			Result := {PLATFORM}.is_windows
		end

	is_unix: BOOLEAN
			-- Is the operating system some form of Unix?
		once ("PROCESS")
			Result := {PLATFORM}.is_unix
		end

	is_mac_os_x: BOOLEAN
			-- Is the operating system Mac OS X?
		once ("PROCESS")
			Result := {PLATFORM}.is_mac
		end

	is_cygwin: BOOLEAN
			-- Is there a cygwin environment installed on windows?
		once ("PROCESS")
			Result := not Cygwin_bash_exe_path.is_empty
		end

	system_temp_file_directory: STRING
			-- Standard place for temporary files.
			-- By default /tmp on unix-like systems and C:\Temp on windows-like systems.
			-- Windows would normally be "C:\Documents and Settings\(user)\Local Settings\Temp".
		local
			tmp_dir: detachable STRING
		once ("PROCESS")
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
			Result := file_system.file_exists (path)
		end

	directory_exists (path: STRING): BOOLEAN
			-- Is `path' a valid, existing directory?
		do
			Result := file_system.directory_exists (path)
		end

feature -- Definitions: version control

	Vcs_status_unknown: INTEGER = 0
	Vcs_status_files_not_committed: INTEGER = 1
	Vcs_status_up_to_date: INTEGER = 2
	Vcs_status_pull_required: INTEGER = 3
	Vcs_status_push_required: INTEGER = 4
	Vcs_status_diverged: INTEGER = 5

	Valid_vcs_status (a_val: INTEGER): BOOLEAN
		do
			Result := a_val >= Vcs_status_unknown and a_val <= Vcs_status_diverged
		end

feature -- External Commands

	External_process_poll_period: INTEGER = 50
			-- period in ms for polling an external process that is running by launching process

	Command_name_pos_param: STRING = "$cmd"
			-- replaceable string within a command template representing command name

	Arguments_pos_param: STRING = "$args"
			-- replaceable string within a command template representing command arguments and switches

	Default_editor_app_command: STRING
			-- An editor application based on operating system.
		once ("PROCESS")
   			if is_windows then
   				Result := "cmd /q /d /c start %"%" /b"
			elseif is_mac_os_x then
				Result := "open"
			else
   				Result := standard_command ("xterm") 
				if not Result.is_empty then
                    Result.replace_substring_all (Arguments_pos_param, "-e vi")
                else
                    Result := "/usr/bin/xterm -e vi"
                end
   			end
   		end

	Default_text_editor_command: STRING
			-- A reasonable name of a text editor based on operating system.
		once ("PROCESS")
   			if is_windows then
   				Result := standard_command ("Notepad") 
			elseif is_mac_os_x then
				Result := "open -t"
			else
   				Result := standard_command ("xterm") 
				if not Result.is_empty then
                    Result.replace_substring_all (Arguments_pos_param, "-e vi")
                else
                    Result := "/usr/bin/xterm -e vi"
                end
   			end
   		end

	Default_difftool_command: STRING
			-- A reasonable diff tool based on operating system.
		once ("PROCESS")
   			if is_windows then
   				-- /e = enable tool to be dismissed with single Esc keystroke, like a dialog
   				-- /u means don't add any paths to Windows recent paths / places
   				Result := "%"C:\Program Files\winmerge\winmergeU.exe%" /e /u /f *.*"
			else
                if standard_has_command ("xterm") and then command_template_cache.has ("xterm") and then attached command_template_cache.item ("xterm") as att_cmd_tpl then
                    create Result.make_from_string (att_cmd_tpl)
                    Result.replace_substring_all (Arguments_pos_param, "-e sdiff")
                else
                    Result := "/usr/bin/xterm -e sdiff"
                end
   			end
   		end

	show_in_system_browser (url: STRING)
			-- Launch the operating system's default browser to display the contents of `url'.
		require
			url_not_empty: not url.is_empty
		local
			command: STRING
			process: PROCESS
		do
   			if {PLATFORM}.is_windows then
   				command := "cmd /q /d /c start %"%" /b"
			elseif {PLATFORM}.is_mac then
				command := "open"
			elseif {PLATFORM}.is_unix then
   				command := "xdg-open"
			else
   				command := "firefox"
   			end

			command := command + " %"" + url + "%""

   			if {PLATFORM}.is_windows and {PLATFORM}.is_thread_capable then
	   			process := (create {PROCESS_FACTORY}).process_launcher (command, Void, Void)
	   			process.set_hidden (True)
	   			process.set_separate_console (False)
	   			process.launch
   			else
				(create {EXECUTION_ENVIRONMENT}).launch (command)
   			end
		end

	System_which_command_template: STRING
			-- the command to detect if another command exists, i.e. which/type on unices, where on Windows
		once ("PROCESS")
   			if is_windows then
				Result := "where " + Arguments_pos_param
			else
   				Result := "/bin/sh -l -c %"which " + Arguments_pos_param + "%""
   			end
   		end

	is_command_template (a_str: STRING): BOOLEAN
			-- True if `a_str' contains a path rather than just a command name
		do
			Result := a_str.has (os_directory_separator)
		end

	convert_to_command_template (a_str: STRING): STRING
			-- Convert the name of a command or command line to the full path version;
			-- retain any traling command line
		local
			spc_pos: INTEGER
			std_cmd, cmd, cmd_trailing: STRING
		do
			spc_pos := a_str.index_of (' ', 1)
			if spc_pos > 0 then
				cmd := a_str.substring (1, spc_pos - 1)
				cmd_trailing := a_str.substring (spc_pos, a_str.count)
			else
				cmd := a_str
				create cmd_trailing.make_empty
			end
			std_cmd := standard_command (cmd)
			if not std_cmd.is_empty then
				Result := std_cmd + cmd_trailing
			else
				Result := a_str
			end
		end

	standard_command (a_cmd_name: STRING): STRING
			-- try to obtain the system's full path for the standard (i.e. not cygwin) command `a_cmd_name'
		do
            if standard_has_command (a_cmd_name) and then command_template_cache.has (a_cmd_name) and then attached command_template_cache.item (a_cmd_name) as att_cmd_tpl then
				create Result.make_from_string (att_cmd_tpl)
				Result.replace_substring_all (Arguments_pos_param, "")
			else
				create Result.make_empty
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
                cmd_line := standard_command_line (System_which_command_template, a_cmd_name)
                last_command_result_cache.put (create {PROCESS_RESULT}.make (cmd_line, Void))
				create pf
				proc := pf.process_launcher_with_command_line (cmd_line, Void)
				proc.set_hidden (True)
				proc.redirect_input_to_stream
				proc.redirect_output_to_agent (
					agent (cmd_name, s: STRING)
						local
							lf_loc: INTEGER
						do
							if not s.is_empty then
								-- remove any trailing whitespace first
								s.right_adjust

								-- in the case of Windows 'where', it can return more than one result, so we just take the
								-- first one and use it.
								lf_loc := s.index_of ('%N', 1)
								if lf_loc > 0 then
									s.remove_tail (s.count - lf_loc + 1)
									-- remove any lurking CR or other whitespace
									s.right_adjust
								end
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

	system_run_command_query (a_cmd_name, a_cmd_switches_args: STRING; in_directory: detachable STRING)
			-- run a command logically specified by `a_cmd_name' and `a_cmd_switches_args' and return the result
			-- in `last_result'.
		require
			system_has_command (a_cmd_name)
		local
			cmd_line: STRING
		do
			if command_template_cache.has (a_cmd_name) and then attached command_template_cache.item (a_cmd_name) as att_cmd_tpl then
				create cmd_line.make_from_string (att_cmd_tpl)
				cmd_line.replace_substring_all (Arguments_pos_param, a_cmd_switches_args)
				do_system_run_command_query (cmd_line, in_directory)

			elseif cygwin_command_template_list.has (a_cmd_name) then
				create cmd_line.make_from_string (Cygwin_command_template)

				-- if directory is specified, then insert a "cd dir;" before the command
				if attached in_directory as att_dir then
					cmd_line.replace_substring_all (Command_name_pos_param, "cd `cygpath -u '" + in_directory + "'`; " + a_cmd_name)
				end
				cmd_line.replace_substring_all (Arguments_pos_param, a_cmd_switches_args)
				do_system_run_command_query (cmd_line, Void)
			end
		end

	do_system_run_command_query (a_cmd_line: STRING; in_directory: detachable STRING)
			-- run `a_cmd_line' and return result; run process in specified directory if set
		local
			pf: PROCESS_FACTORY
			proc: PROCESS
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

	system_run_command_synchronous (a_cmd_name, a_cmd_switches_args: STRING; in_directory: detachable STRING)
		do
			do_system_run_command (a_cmd_name, a_cmd_switches_args, in_directory, True)
		end

	system_run_command_asynchronous (a_cmd_name, a_cmd_switches_args: STRING; in_directory: detachable STRING)
			-- typical args:
			-- "git", "clone -v --recurse-submodules --progress http://github.com/openehr/archetypes.git", "/project/openEHR"
		do
			do_system_run_command (a_cmd_name, a_cmd_switches_args, in_directory, False)
		end

	do_system_run_command (a_cmd_name, a_cmd_switches_args: STRING; in_directory: detachable STRING; synchronous: BOOLEAN)
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
				if synchronous then
					do_system_run_command_synchronous (cmd_line, in_directory)
				else
					do_system_run_command_asynchronous (cmd_line, in_directory)
				end

			elseif cygwin_command_template_list.has (a_cmd_name) then
				create cmd_line.make_from_string (Cygwin_command_template)

				-- if directory is specified, then insert a "cd dir;" before the command
				if attached in_directory as att_dir then
					cmd_line.replace_substring_all (Command_name_pos_param, "cd `cygpath -u '" + in_directory + "'`; " + a_cmd_name)
				end

				cmd_line.replace_substring_all (Arguments_pos_param, a_cmd_switches_args)

				if synchronous then
					do_system_run_command_synchronous (cmd_line, Void)
				else
					do_system_run_command_asynchronous (cmd_line, Void)
				end
			end
		end

	do_system_run_command_synchronous (a_cmd_line: STRING; in_directory: detachable STRING)
			-- run `a_cmd_line' exactly as it is and return result; run process in specified directory if set
		local
			pf: PROCESS_FACTORY
			proc: PROCESS
		do
            last_command_result_cache.put (create {PROCESS_RESULT}.make (a_cmd_line, in_directory))
			create pf
			proc := pf.process_launcher_with_command_line (a_cmd_line, in_directory)
			proc.set_hidden (True)
			proc.redirect_input_to_stream

			-- let the output go to console if there is no agent taking it
			if attached stdout_agent as att_agt then
				proc.redirect_output_to_agent (att_agt)
			end

			-- let the error go to console if there is no agent taking it
			if attached stderr_agent as att_agt then
				proc.redirect_error_to_agent (att_agt)
			end

			proc.launch
			proc.wait_for_exit
			last_command_result.set_exit_code (proc.exit_code)
		end

	do_system_run_command_asynchronous (a_cmd_line: STRING; in_directory: detachable STRING)
			-- run `a_cmd_line' exactly as it is and return result; run process in specified directory if set
		local
			pf: PROCESS_FACTORY
			proc: PROCESS
		do
if global_error_reporting_level = Error_type_debug then
	io.put_string ("----> do_system_run_command_asynchronous (" + a_cmd_line + ", " + if attached in_directory as att_dir then att_dir else "" end + ")%N")
end
            last_command_result_cache.put (create {PROCESS_RESULT}.make (a_cmd_line, in_directory))
			create pf
			proc := pf.process_launcher_with_command_line (a_cmd_line, in_directory)
			proc.set_hidden (True)
			proc.redirect_input_to_stream

			-- let the output go to console if there is no agent taking it
			if attached stdout_agent as att_agt then
				proc.redirect_output_to_agent (att_agt)
			end

			-- let the error go to console if there is no agent taking it
			if attached stderr_agent as att_agt then
				proc.redirect_error_to_agent (att_agt)
			end

			-- record PROCESS object
			live_processes.put (proc, a_cmd_line)

			-- set a process terminate event
			proc.set_on_exit_handler (agent asynchronous_process_cleanup (a_cmd_line))

if global_error_reporting_level = Error_type_debug then
	io.put_string ("     PROCESS.launch%N")
end
			proc.launch
if global_error_reporting_level = Error_type_debug then
	io.put_string ("     PROCESS id = " + proc.id.out + "%N")
	io.put_string ("<--- do_system_run_command_asynchronous%N")
end
		end

	asynchronous_process_cleanup (a_cmd_line: STRING)
			-- remove a process descriptor object for `a_cmd_line'
		do
if global_error_reporting_level = Error_type_debug then
	io.put_string ("---> asynchronous_process_cleanup (" + a_cmd_line + ")%N")
end
			if live_processes.has (a_cmd_line) and then attached live_processes.item (a_cmd_line) as att_proc then
				last_command_result.set_exit_code (att_proc.exit_code)
				live_processes.remove (a_cmd_line)
			end
if global_error_reporting_level = Error_type_debug then
	io.put_string ("<--- asynchronous_process_cleanup%N")
end
		end

	live_processes: HASH_TABLE [PROCESS, STRING]
			-- current set of external processes executing asycnhronously
		once ("PROCESS")
			create Result.make (0)
		end

	stdout_agent: detachable PROCEDURE [ANY, TUPLE [STRING]]
		do
			Result := stdout_agent_cache.item
		end

	set_stdout_agent (agt: PROCEDURE [ANY, TUPLE [STRING]])
			-- set `stdout_agt' to be `agt'
		do
			stdout_agent_cache.put (agt)
		end

	stderr_agent: detachable PROCEDURE [ANY, TUPLE [STRING]]
		do
			Result := stderr_agent_cache.item
		end

	set_stderr_agent (agt: PROCEDURE [ANY, TUPLE [STRING]])
			-- set `stderr_agt' to be `agt'
		do
			stderr_agent_cache.put (agt)
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

	standard_put_system_command (a_command_line, a_command_name: STRING)
			-- for ay platform except cygwin:
			-- manually add a command with its command line to the command table, usually to compensate for the command
			-- not being in the system / user path
			-- If `a_command_name' already exists, it is replaced
		do
			command_template_cache.force (standard_new_command_template (a_command_line), a_command_name)
		end

	standard_new_command_template (std_cmd: STRING): STRING
			-- generate a command line based on `std_cmd' (e.g. 'which')
			-- The result will be std_cmd $args
			-- Typical result:
			--	"which" => "which $args"
			--	"c:\program files\git\git" => "c:\program files\git\git $args"
		local
			cmd_str: STRING
		do
			if std_cmd.has (' ') then
				cmd_str := "%"" + std_cmd + "%""
			else
				cmd_str := std_cmd
			end
			Result := std_cmd + " " + Arguments_pos_param
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

	Cygwin_bash_exe_path: STRING
			-- path of bash on a cygwin installation on Windows
		require
		    {PLATFORM}.is_windows
		local
			i: INTEGER
			cyg32path, cyg64path: STRING
		once ("PROCESS")
			create Result.make_empty
		    if {PLATFORM}.is_windows then
				create cyg32path.make_from_string (Cygwin32_bash_exe_path)
				create cyg64path.make_from_string (Cygwin64_bash_exe_path)
				from i := 1 until i > Windows_drives.count or not Result.is_empty loop
					cyg32path.put (Windows_drives.item (i), 1)
					cyg64path.put (Windows_drives.item (i), 1)
					if file_system.file_exists (cyg32path) then
						Result := cyg32path
					elseif file_system.file_exists (cyg64path) then
						Result := cyg64path
					end
					i := i + 1
				end
		    end
		end

	Cygwin32_bash_exe_path: STRING = "c:\cygwin\bin\bash.exe"
			-- path of bash on a cygwin 32 installation on Windows

	Cygwin64_bash_exe_path: STRING = "c:\cygwin64\bin\bash.exe"
			-- path of bash on a cygwin 64 installation on Windows

	Windows_drives: STRING = "cdefgh"
			-- a reasonable set of drive letters to look for things

	Cygwin_command_template: STRING
			-- template string for creating a command to run in cygwin under Windows
		once ("PROCESS")
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

feature  {NONE} -- Implementation

	stdout_agent_cache: CELL [detachable PROCEDURE [ANY, TUPLE [STRING]]]
		once ("PROCESS")
			create Result.put (Void)
		end

	stderr_agent_cache: CELL [detachable PROCEDURE [ANY, TUPLE [STRING]]]
		once ("PROCESS")
			create Result.put (Void)
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
	    once ("PROCESS")
	        create Result
	    end

	current_working_directory: STRING
		do
			Result := execution_environment.current_working_directory
		end

	os_directory_separator: CHARACTER
	    once ("PROCESS")
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

