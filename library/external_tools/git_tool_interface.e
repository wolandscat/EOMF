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

feature -- Access

	repository_name_from_url (a_url: STRING): STRING
			-- obtain repository name from repo URL
			-- e.g. get 'adl-archetypes' from 'https://github.com/openEHR/adl-archetypes.git'
		local
			a_uri: UT_URI
		do
			create a_uri.make (a_url)
			Result := a_uri.path_base
			Result := Result.substring (1, Result.substring_index (".git", 1)-1)
		end

feature -- Queries

	get_remote_url
		do
			last_result := system_run_command (tool_name, "config --get remote.origin.url", current_directory)
			if last_result.succeeded then
				remote_repository_url := last_result.stdout
				remote_repository_url.right_adjust
			end
		end

feature -- Commands

	do_checkout (repo_parent_dir: STRING)
		do
			last_result := system_run_command (tool_name, "clone " + remote_repository_url, repo_parent_dir)
		end

	do_checkin
		do
			last_result := system_run_command (tool_name, "push", current_directory)
		end

	do_update
		do
			last_result := system_run_command (tool_name, "pull", current_directory)
		end

end
