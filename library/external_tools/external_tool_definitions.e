note
	component:   "Eiffel Object Modelling Framework"
	description: "Definitions for external tools, such as Git"
	keywords:    "command line, external command"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class EXTERNAL_TOOL_DEFINITIONS

inherit
	KL_SHARED_FILE_SYSTEM

feature -- Definitions

	Git_url_extension: STRING = ".git"

	Git_control_directory: STRING = ".git"

	Svn_control_directory: STRING = ".svn"

	Git_tool_name: STRING = "git"

	Svn_tool_name: STRING = "svn"

feature -- Status Report

	is_vcs_checkout_area (a_dir: STRING): BOOLEAN
			-- True if `a_dir' is any kind of version control system checkout / clone of a remote repo
		do
			Result := is_git_clone (a_dir) or is_svn_checkout (a_dir)
		end

	is_git_clone (a_dir: STRING): BOOLEAN
			-- True if `a_dir' has a .git directory
		do
			Result := file_system.directory_exists (file_system.pathname (a_dir, Git_control_directory))
		end

	is_svn_checkout (a_dir: STRING): BOOLEAN
			-- True if the `a_dir' has a .svn directory
		do
			Result := file_system.directory_exists (file_system.pathname (a_dir, Svn_control_directory))
		end

feature -- Access

	vcs_checkout_area_type (a_dir: STRING): STRING
			-- True if `a_dir' is any kind of checkout / clone of a remote repo
		require
			is_vcs_checkout_area (a_dir)
		do
			if is_git_clone (a_dir) then
				Result := Git_tool_name
			else
				Result := Svn_tool_name
			end
		end

	repository_name_from_url (a_url, a_repo_type: STRING): STRING
			-- obtain repository name from repo URL
			-- e.g. get 'adl-archetypes' from 'https://github.com/openEHR/adl-archetypes.git'
		local
			repo_url: UT_URI
		do
			create repo_url.make (a_url)
			Result := repo_url.path_base
			if a_repo_type.is_equal (git_tool_name) and then Result.tail (Git_url_extension.count).is_equal (Git_url_extension) then
				Result.remove_tail (Git_url_extension.count)
			end
		end

end
