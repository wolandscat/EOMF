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

feature -- External Commands

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
				Result := "where $1"
			else
   				Result := "which $1"
   			end
   		end

	Cygwin_which_command_template: STRING
			-- cygwin version of the which command
		once
			Result := cygwin_command_line ("which $1")
   		end

	Cygwin_bash_exe_path: STRING = "c:\cygwin\bin\bash.exe"
			-- path of bash on a cygwin installation on Windows

	Cygwin_command_template: STRING
			-- template string for creating a command to run in cygwin under Windows
		once
			create Result.make_from_string (Cygwin_bash_exe_path)
			Result.append (" -c -l %"$1%"")
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
		do
			if command_template_cache.has (a_cmd_name) then
				Result := True
			else
				create pf
				proc := pf.process_launcher_with_command_line (Standard_command_line (System_which_command_template, a_cmd_name), Void)
				proc.set_hidden (True)
				proc.redirect_input_to_stream
				proc.redirect_output_to_agent (
					agent (cmd_name, s: STRING)
						do
							if not s.is_empty then
								s.right_adjust
								command_template_cache.put (standard_new_command_template (s), cmd_name)
							end
						end (a_cmd_name, ?)
				)
				proc.redirect_error_to_agent (agent (s: STRING) do end)
				proc.launch
				proc.wait_for_exit
				Result := proc.exit_code = 0
			end
		end

	cygwin_has_command (a_cmd_name: STRING): BOOLEAN
			-- True if the command `a_cmd_name' is available under cygwin on windows
		local
			pf: PROCESS_FACTORY
			proc: PROCESS
		do
			if is_cygwin then
				if cygwin_command_template_cache.has (a_cmd_name) then
					Result := True
				else
					create pf
					proc := pf.process_launcher_with_command_line (standard_command_line (Cygwin_which_command_template, a_cmd_name), Void)
					proc.set_hidden (True)
					proc.redirect_input_to_stream
					proc.redirect_output_to_agent (
						agent (cmd_name, s: STRING)
							do
								if not s.is_empty then
									s.right_adjust
									cygwin_command_template_cache.put (cygwin_new_command_template (cmd_name), cmd_name)
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

	system_run_command (a_cmd_name, a_cmd_switches_args: STRING; in_directory: detachable STRING): PROCESS_RESULT
			-- run a command logically specified by `a_cmd_name' and `a_cmd_switches_args' and return the result;
			-- figure out from platform specifics and stored command templates how to actually run the command
		require
			system_has_command (a_cmd_name)
		local
			cmd_line: STRING
		do
			create Result.make (a_cmd_name + " " + a_cmd_switches_args, in_directory)
			if command_template_cache.has (a_cmd_name) and then attached command_template_cache.item (a_cmd_name) as att_cmd_tpl then
				create cmd_line.make_from_string (att_cmd_tpl)
				cmd_line.replace_substring_all ("$1", a_cmd_switches_args)
				Result := do_system_run_command (cmd_line, in_directory)

			elseif cygwin_command_template_cache.has (a_cmd_name) and then attached cygwin_command_template_cache.item (a_cmd_name) as att_cmd_tpl then
				create cmd_line.make_from_string (att_cmd_tpl)
				cmd_line.replace_substring_all ("$1", a_cmd_switches_args)

				-- if directory is specified, then insert a "cd dir;" before the command
				if attached in_directory as att_dir then
					cmd_line.replace_substring_all (a_cmd_name, "cd `cygpath -u '" + in_directory + "'`; " + a_cmd_name)
				end
				Result := do_system_run_command (cmd_line, Void)
			end
		end

	do_system_run_command (a_cmd_line: STRING; in_directory: detachable STRING): PROCESS_RESULT
			-- run `a_cmd_line' exactly as it is and return result; run process in specified directory if set
		local
			pf: PROCESS_FACTORY
			proc: PROCESS
			stderr_str, stdout_str: STRING
		do
			create Result.make (a_cmd_line, in_directory)
			create pf
			proc := pf.process_launcher_with_command_line (a_cmd_line, in_directory)
			proc.set_hidden (True)
			proc.redirect_input_to_stream
			proc.redirect_error_to_agent (agent (res: PROCESS_RESULT; s: STRING) do res.set_stderr (s) end (Result, ?))
			proc.redirect_output_to_agent (agent (res: PROCESS_RESULT; s: STRING) do res.set_stdout (s) end (Result, ?))
			proc.launch
			proc.wait_for_exit
			Result.set_exit_code (proc.exit_code)
		end

	command_template_cache: HASH_TABLE [STRING, STRING]
			-- table of command line templates indexed by command name, with a replaceable variable $1,
			-- which should be replaced by the actual command switches and arguments
			-- typical entries:
			--		"/usr/bin/ls $1", "ls"
			--		"/usr/local/git/git $1", "git"
		once ("PROCESS")
			create Result.make (0)
		end

	cygwin_command_template_cache: HASH_TABLE [STRING, STRING]
			-- table of cygwin command line templates indexed by command name, with a replaceable variable $1,
			-- which should be replaced by the actual command switches and arguments
			-- typical entries:
			--		"/usr/bin/ls $1", "ls"
			--		"/usr/local/git/git $1", "git"
		once ("PROCESS")
			create Result.make (0)
		end

	standard_command_line (std_cmd_template, cmd_args: STRING): STRING
			-- generate a command line based on `std_cmd_template' (e.g. 'which $1') that will execute in normal shell
			-- The `cmd_args' will be substituted into `std_cmd_template' at $1
			-- Typical result:
			--	"which $1", "git" => "which git"
		require
			std_cmd_template.has_substring ("$1")
		do
			create Result.make_from_string (std_cmd_template)
			Result.replace_substring_all ("$1", cmd_args)
		end

	standard_new_command_template (std_cmd: STRING): STRING
			-- generate a command line based on `std_cmd' (e.g. 'which')
			-- The result will be std_cmd $1
			-- Typical result:
			--	"which" => "which $1"
		do
			Result := std_cmd + " $1"
		end

	cygwin_command_line (a_unix_cmd: STRING): STRING
			-- generate a command line based on `a_unix_cmd' (e.g. 'ls -l') that will execute in a cygwin bash shell on windows
			-- `a_unix_cmd' may include multiple semi-colon separated commands, e.g. "cd /path/to/my/git/repo; git pull"
			-- Typical results:
			--	"c:\cygwin\bin\bash.exe  -c -l %"ls -1%""
			--	"c:\cygwin\bin\bash.exe  -c -l %"git pull%""
		do
			create Result.make_from_string (Cygwin_command_template)
			Result.replace_substring_all ("$1", a_unix_cmd)
		end

	cygwin_new_command_template (a_unix_cmd_name: STRING): STRING
			-- generate a command line based on `a_unix_cmd_name' (e.g. 'ls') that can execute in a cygwin bash shell on windows
			-- the result will include a $1 after the command name
			-- Typical results:
			--	"c:\cygwin\bin\bash.exe  -c -l %"ls $1%""
			--	"c:\cygwin\bin\bash.exe  -c -l %"git $1%""
		do
			create Result.make_from_string (Cygwin_command_template)
			Result.replace_substring_all ("$1", a_unix_cmd_name + " $1")
		end

	system_has_git_command: BOOLEAN
			-- True if the command 'git' is available on the system
		once
			Result := system_has_command ("git")
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

