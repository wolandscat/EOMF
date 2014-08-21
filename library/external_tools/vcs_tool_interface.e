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
		do
			remote_repository_url := a_remote_url
		ensure
			has_remote_repository_url
		end

	initialise_checkout_from_remote (a_parent_dir, a_remote_url: STRING)
		require
			Tool_available: tool_available
		do
			remote_repository_url := a_remote_url
			local_repository_directory := file_system.pathname (a_parent_dir, repository_name_from_url (a_remote_url, tool_name))
			do_checkout (a_parent_dir)
		end

	initialise_from_local (a_local_dir: STRING)
		require
			Tool_available: tool_available
		do
			local_repository_directory := a_local_dir
			current_directory := local_repository_directory
			get_remote_url
		end

feature -- Status Report

	has_remote_repository_url: BOOLEAN
			-- True if remote URL known
		do
			Result := not remote_repository_url.is_empty
		end

feature -- Access

	local_repository_directory: STRING
			-- directory of repository

	remote_repository_url: STRING
			-- URL of the remote repo

feature -- Queries

	get_remote_url
			-- determine remote repository URI from local checkout/clone
		require
			Tool_available: tool_available
			current_directory_set
		deferred
		ensure
			last_result.succeeded implies has_remote_repository_url
		end

feature -- Commands

	do_checkout (repo_parent_dir: STRING)
			-- checkout a repository to a local file system location
		require
			Tool_available: tool_available
			Checkout_area_valid: directory_exists (repo_parent_dir)
			Remote_url_exists: has_remote_repository_url
		deferred
		end

	do_checkin
			-- checkout a repository to a local file system location
		require
			Tool_available: tool_available
			current_directory_set
		deferred
		end

	do_update
			-- update a repository to a local file system location
		require
			Tool_available: tool_available
			current_directory_set
		deferred
		end

end
