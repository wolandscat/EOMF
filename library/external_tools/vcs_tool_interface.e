note
	component:   "Eiffel Object Modelling Framework"
	description: "Command set for any Version Control System"
	keywords:    "command line, external command"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class VCS_TOOL_INTERFACE

inherit
	EXTERNAL_TOOL_INTERFACE
		redefine
			make
		end

feature -- Initialisation

	make (a_tool_name: STRING)
		do
			precursor (a_tool_name)
			create local_repository_directory.make_empty
			create remote_repository_url.make_empty
		end

	initialise_remote (a_remote_url: STRING)
			-- record remote location
		do
			remote_repository_url := a_remote_url
		ensure
			has_remote_repository_url
		end

	initialise_clone_remote_and_checkout (a_parent_dir, a_remote_url: STRING)
		require
			Tool_available: system_has_command (tool_name)
		do
			remote_repository_url := a_remote_url
			local_repository_directory := file_system.pathname (a_parent_dir, repository_name_from_url (a_remote_url, tool_name))
			do_clone_checkout (a_parent_dir)
			current_directory := local_repository_directory
		ensure
			current_directory_set
		end

	initialise_from_local (a_local_dir: STRING)
		require
			Tool_available: system_has_command (tool_name)
		do
			local_repository_directory := a_local_dir
			current_directory := local_repository_directory
			get_remote_url
		ensure
			current_directory_set
		end

feature -- Status Report

	has_remote_repository_url: BOOLEAN
			-- True if remote URL known
		do
			Result := not remote_repository_url.is_empty
		end

	has_branch (a_branch_name: STRING): BOOLEAN
			-- True if `a_branch_name' is known among branches locally tracked in this repo
		do
			Result := available_branches.has (a_branch_name)
		end

feature -- Access

	local_repository_directory: STRING
			-- directory of repository

	remote_repository_url: STRING
			-- URL of the remote repo

	checked_out_branch: STRING
			-- determine what branch is currently checked out; if none, Result
			-- is empty string
		require
			Tool_available: system_has_command (tool_name)
			current_directory_set
		deferred
		ensure
			last_command_succeeded implies not Result.is_empty
		end

	available_branches: ARRAYED_LIST [STRING]
			-- find out what branches are available and record in `available_branches';
			-- if none, Result is empty
		require
			Tool_available: system_has_command (tool_name)
			current_directory_set
		deferred
		end

	synchronisation_status: INTEGER
			-- return sync status of this repo w.r.t. upstream origin
		deferred
		ensure
			valid_vcs_status (Result)
		end

	merge_status: INTEGER
			-- return merge status of this repo w.r.t. upstream origin
		deferred
		ensure
			valid_vcs_status (Result)
		end

	uncommitted_files: ARRAYED_LIST [TUPLE [status, filename: STRING]]
			-- obtain formatted list of untracked and/or uncommitted files
		deferred
		end

feature -- Queries

	get_remote_url
			-- determine remote repository URI from local checkout/clone
		require
			Tool_available: system_has_command (tool_name)
			current_directory_set
		deferred
		ensure
			last_command_succeeded implies has_remote_repository_url
		end

feature -- Commands

	do_clone_checkout (repo_parent_dir: STRING)
			-- clone a remote repository to a local file system location and check its trunk / master branch out
		require
			Tool_available: system_has_command (tool_name)
			Clone_area_valid: directory_exists (repo_parent_dir)
			Remote_url_exists: has_remote_repository_url
		deferred
		end

	do_checkout_branch (a_branch_name: STRING)
			-- check out named branch
		require
			Tool_available: system_has_command (tool_name)
			Remote_url_exists: has_remote_repository_url
			Checkout_area_valid: directory_exists (local_repository_directory)
			Branch_valid: has_branch (a_branch_name)
		deferred
		end

	do_stage_all
			-- stage all local changes on current branch to local repository
		require
			Tool_available: system_has_command (tool_name)
			Checkout_area_valid: directory_exists (local_repository_directory)
		deferred
		end

	do_stage (file_list: ARRAYED_LIST [STRING])
			-- stage local changes on current branch to local repository
		require
			Tool_available: system_has_command (tool_name)
			Files_to_commit: not file_list.is_empty
			Checkout_area_valid: directory_exists (local_repository_directory)
		deferred
		end

	do_commit (a_commit_msg: STRING)
			-- commit all staged changes
		require
			Message_valid: not a_commit_msg.is_empty
			Tool_available: system_has_command (tool_name)
			Checkout_area_valid: directory_exists (local_repository_directory)
		deferred
		end

	do_push
			-- checkout a repository to a local file system location
		require
			Tool_available: system_has_command (tool_name)
			Checkout_area_valid: directory_exists (local_repository_directory)
		deferred
		end

	do_fetch
			-- update local repository index with changes from remote
		require
			Tool_available: system_has_command (tool_name)
			current_directory_set
		deferred
		end

	do_pull
			-- update local repository with changes from remote
		require
			Tool_available: system_has_command (tool_name)
			current_directory_set
		deferred
		end

end
