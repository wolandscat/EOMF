note
	component:   "Eiffel Object Modelling Framework"
	description: "Interface to Git"
	keywords:    "command line, external command"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class GIT_TOOL_INTERFACE

inherit
	VCS_TOOL_INTERFACE

create
	make

feature -- Queries

	get_remote_url
		do
			system_run_command_query (tool_name, "config --get remote.origin.url", current_directory)
			if last_command_result.succeeded then
				remote_repository_url := last_command_result.stdout
				remote_repository_url.right_adjust
			end
		end

feature -- Commands

	do_checkout (repo_parent_dir: STRING)
		do
			system_run_command_asynchronous (tool_name, "clone -v --recurse-submodules --progress " + remote_repository_url, repo_parent_dir)
		end

	do_checkin
		do
			system_run_command_asynchronous (tool_name, "push --recurse-submodules --progress", current_directory)
		end

	do_update
		do
			system_run_command_asynchronous (tool_name, "pull --recurse-submodules --progress", current_directory)
		end

end
