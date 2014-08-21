note
	component:   "Eiffel Object Modelling Framework"
	description: "Interface to Subversion"
	keywords:    "command line, external command"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SVN_TOOL_INTERFACE

inherit
	VCS_TOOL_INTERFACE

create
	make

feature -- Queries

	get_remote_url
		do
			last_result := system_run_command (tool_name, "info | grep 'Repository Root' | awk '{print $NF}'", current_directory)
		end

feature -- Commands

	do_checkout (repo_parent_dir: STRING)
		do
			last_result := system_run_command (tool_name, "checkout " + remote_repository_url, repo_parent_dir)
		end

	do_checkin
		do
			last_result := system_run_command (tool_name, "checkin", current_directory)
		end

	do_update
		do
			last_result := system_run_command (tool_name, "update", current_directory)
		end

end
