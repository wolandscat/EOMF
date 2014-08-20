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
			test_url: STRING
		do
			-- create accessor
			check attached {GIT_TOOL_INTERFACE} create_tool_interface ("git") as att_tool_if then
				git_if := att_tool_if
			end

			-- try to connect to a local Git repo
			test_url := "C:\project\openehr\adl-resources"
			print ("Initialising from local directory " + test_url + "%N")
			git_if.initialise_from_local (test_url)

			git_if.get_remote_url
			print ("cmd = " + git_if.last_result.command_line + "%N")
			if git_if.last_result.succeeded then
				print ("get_remote_url: " + git_if.remote_repository_url + "%N")
			else
				print ("get_remote_url failed; errors = " + git_if.last_result.stderr + "%N")
			end

		end

end
