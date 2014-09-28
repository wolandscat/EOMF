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

	checked_out_branch: STRING
		do
			system_run_command_query (tool_name, "rev-parse --abbrev-ref HEAD", current_directory)
			if last_command_result.succeeded then
				Result := last_command_result.stdout
				Result.right_adjust
			else
				create Result.make_empty
			end
		end

	available_branches: ARRAYED_LIST [STRING]
		local
			str: STRING
		do
			create Result.make (0)
			Result.compare_objects
			system_run_command_query (tool_name, "branch", current_directory)
			if last_command_result.succeeded then
				str := last_command_result.stdout
				str.replace_substring_all ("* ", "")
				str.prune_all ('%R')
				str.prune_all (' ')
				Result.append (str.split ('%N'))
			end
		end

	synchronisation_status: INTEGER
			-- return status of this repo w.r.t. upstream origin
		local
			local_commit, remote_commit, merge_commit: STRING
		do
			system_run_command_query (tool_name, "diff-files --quiet", current_directory)
			if last_command_result.succeeded then
				if last_command_result.exit_code = 1 then
					Result := Vcs_status_files_not_checked_in
				else
					system_run_command_query (tool_name, "rev-parse HEAD", current_directory)
					if last_command_result.succeeded then
						local_commit := last_command_result.stdout
						local_commit.right_adjust

						system_run_command_query (tool_name, "rev-parse @{u}", current_directory)
						if last_command_result.succeeded then
							remote_commit := last_command_result.stdout
							remote_commit.right_adjust

							if local_commit.is_equal (remote_commit) then
								Result := Vcs_status_up_to_date
							else
								system_run_command_query (tool_name, "merge-base HEAD @{u}", current_directory)
								if last_command_result.succeeded then
									merge_commit := last_command_result.stdout
									merge_commit.right_adjust

									if local_commit.is_equal (merge_commit) then
										Result := Vcs_status_pull_required
									elseif remote_commit.is_equal (merge_commit) then
										Result := Vcs_status_push_required
									else
										Result := Vcs_status_diverged
									end
								end
							end
						end
					end
				end
			end
		end

feature -- Commands

	do_clone_checkout (repo_parent_dir: STRING)
		do
			system_run_command_asynchronous (tool_name, "clone -v --recurse-submodules --progress " + remote_repository_url, repo_parent_dir)
		end

	do_checkout_branch (a_branch_name: STRING)
			-- check out named branch
		do
			system_run_command_asynchronous (tool_name, "checkout " + a_branch_name, current_directory)
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
