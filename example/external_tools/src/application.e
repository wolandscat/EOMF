note
	component:   "Eiffel Object Modelling Framework"
	description: "Test application for external tool interface library"
	keywords:    "test, external command"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	APPLICATION

inherit
	SHARED_RESOURCES

	SHARED_EXTERNAL_TOOL_INTERFACES

create
	make

feature {NONE} -- Initialization

	make
		local
			git_if: GIT_TOOL_INTERFACE
			local_dir: STRING
			clone_dir: STRING
			cmd: STRING
			has_cmd: BOOLEAN
		do
			cmd := "git"
			set_global_error_reporting_level (error_type_debug)

			-- create accessor
			check attached {GIT_TOOL_INTERFACE} create_tool_interface ("git") as att_tool_if then
				git_if := att_tool_if
			end

			-- try to connect to a local Git repo
			if is_windows then
				local_dir := "C:\dev\openehr\adl-resources"
				clone_dir := "C:\temp"
			else
				local_dir := "/home/thomas/project/openEHR/adl-resources"
				clone_dir := "/tmp"
			end

			if not system_has_command (cmd) then
				print ("cmd = " + last_command_result.command_line + "%N")
				print ("system_has_command(%"" + cmd + "%") failed; errors = " + last_command_result.stderr + "%N")
				print ("try manual add%N")
				standard_put_system_command ("C:\cygwin\bin\git", cmd)
				if not system_has_command (cmd) then
					print ("system_has_command(%"" + cmd + "%") failed; errors = " + last_command_result.stderr + "%N")
				else
					has_cmd := True
				end
			else
				has_cmd := True
			end


			if has_cmd then
				-- run simple git command on existing clone
				print ("Initialising from local directory " + local_dir + "%N")
				git_if.initialise_from_local (local_dir)
				print ("cmd = " + last_command_result.command_line + "%N")
				if last_command_result.succeeded then
					print ("get_remote_url: " + git_if.remote_repository_url + "%N")

					-- run git clone into temp area
					print ("Cloning " + git_if.remote_repository_url + " to " + clone_dir + "%N")
					git_if.initialise_clone_remote_and_checkout (clone_dir, git_if.remote_repository_url)
					print ("cmd = " + last_command_result.command_line + "%N")

					if not last_command_result.succeeded then
						print (last_command_result.command_line + " failed; errors = " + last_command_result.stderr + "%N")
					end
				else
					print (last_command_result.command_line + " failed; errors = " + last_command_result.stderr + "%N")
				end

			end

		end

end
