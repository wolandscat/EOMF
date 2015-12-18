note
	component:   "Eiffel Object Modelling Framework"
	description: "Test application for SHARED_RESOURCES features relating to external commands"
	keywords:    "test, external command, process"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	APPLICATION

inherit
	SHARED_RESOURCES

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		do
			-- find out what kind of system
			print ("============= check OS & command environment ===================%N")
			if is_windows then
				if is_cygwin then
					print ("On Windows + cygwin; commands could be in either place%N")
				else
					print ("On standard Windows (no cygwin found)%N")
				end
			elseif is_mac_os_x then
				print ("On MacOSX%N")
			else
				print ("Probably Linux or other Unix%N")
			end

			-- test a command that should exist on Windows
			print ("============= Windows test: run 'where where' ===================%N")
			if system_has_command ("where") then
				test_command ("where", "where")
			else
				print ("system which/where command not found%N")
			end

			-- test a command that should exist on Windows cygwin or most linux, Macos, unix
			print ("============= *nix test: run 'ls -l' ===================%N")
			if system_has_command ("ls") then
				test_command ("ls", "-l")
			else
				print ("ls command not found%N")
			end

			-- test a command that should exist on Windows cygwin or most linux, Macos, unix
			print ("============= *nix test: run 'git --help' ===================%N")
			if system_has_command ("git") then
				test_command ("git", "--help")
			else
				print ("git command not found%N")
			end
		end

feature -- Commands

	test_command (a_cmd_name, a_cmd_args: STRING)
			-- run tests for `a_cmd_name'
		do
			system_run_command_query (a_cmd_name, a_cmd_args, Void)
			print ("------------- Run: " + a_cmd_name + " " + a_cmd_args + "---------------%N")
			print ("Cmd exit_code: " + last_command_result.exit_code.out + "%N")
			if attached last_command_result.stdout as att_std_out then
				print ("Cmd stdout: " + att_std_out + "%N")
			end
			if attached last_command_result.stderr as att_stderr then
				print ("Cmd stderr: " + att_stderr + "%N")
			end
		end

end
