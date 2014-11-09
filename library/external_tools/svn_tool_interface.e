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
			system_run_command_query (tool_name, "info | grep 'Repository Root' | awk '{print $NF}'", current_directory)
		end

	checked_out_branch: STRING
			-- FIXME: not implemented
		do
			create Result.make_empty
		end

	available_branches: ARRAYED_LIST [STRING]
			-- FIXME: not implemented
		do
			create Result.make (0)
		end

	synchronisation_status: INTEGER
			-- FIXME: not implemented
			-- return status of this repo w.r.t. upstream origin
		do
		end

	uncommitted_files: ARRAYED_LIST [TUPLE [status, filename: STRING]]
			-- FIXME: not implemented
			-- obtain formatted list of untracked and/or uncommitted files
		do
			create Result.make (0)
		end

feature -- Commands

	do_clone_checkout (repo_parent_dir: STRING)
		do
			system_run_command_asynchronous (tool_name, "checkout " + remote_repository_url, repo_parent_dir)
		end

	do_checkout_branch (a_branch_name: STRING)
			-- check out named branch
		do
			system_run_command_asynchronous (tool_name, "checkout " + a_branch_name, current_directory)
		end

	do_stage_all
		do
			-- nothing to do 
		end

	do_stage (file_list: ARRAYED_LIST [STRING])
		do
			-- nothing to do
		end

	do_commit (a_commit_msg: STRING)
			-- FIXME: to be implemented
		do
		end

	do_push
		do
			system_run_command_asynchronous (tool_name, "checkin", current_directory)
		end

	do_pull
		do
			system_run_command_asynchronous (tool_name, "update", current_directory)
		end

end
