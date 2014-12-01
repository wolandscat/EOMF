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
			system_run_command_query (tool_name, "branch -a", current_directory)
			if last_command_result.succeeded then
				str := last_command_result.stdout
				str.replace_substring_all ("* ", "")
				str.prune_all ('%R')
				str.prune_all (' ')
				Result.append (str.split ('%N'))
				if Result.last.is_empty then
					Result.finish
					Result.remove
				end
			end
		end

	synchronisation_status: INTEGER
			-- return status of this repo w.r.t. upstream origin
			-- does not require a fetch to be done first
		local
			local_commit, remote_commit: STRING
		do
			-- see if there are any local files not staged
			system_run_command_query (tool_name, "status --porcelain", current_directory)

			-- logically we should just check if it is empty, but we can't trust git commands
			-- not to put in \r\n junk. If there are real files, then the length is > 2
			if last_command_result.stdout.count > 2 then
				Result := Vcs_status_files_not_committed
			else
				-- Run git commands:
				-- 	obtain local commit id on this branch
				-- 	obtain remote commit id on this branch
				system_run_command_query (tool_name, "rev-parse HEAD", current_directory)
				local_commit := last_command_result.stdout
				local_commit.right_adjust

				system_run_command_query (tool_name, "ls-remote origin HEAD", current_directory)
				remote_commit := last_command_result.stdout.substring (1, last_command_result.stdout.index_of ('%T', 1) - 1)
		
				if local_commit.is_equal (remote_commit) then
					Result := Vcs_status_up_to_date
				else
					Result := Vcs_status_sync_required
				end
			end
		end

	merge_status: INTEGER
			-- return status of this repo w.r.t. upstream origin
			-- algorithm based on stackoverflow: http://stackoverflow.com/questions/3258243/git-check-if-pull-needed
			-- call after fetch
		local
			local_commit, remote_commit, merge_commit: STRING
			sts_res: STRING
		do
			-- see if there are any local files not staged
			system_run_command_query (tool_name, "status --porcelain", current_directory)

			-- logically we should just check if it is empty, but we can't trust git commands
			-- not to put in \r\n junk. If there are real files, then the length is > 2
			if last_command_result.stdout.count > 2 then
				Result := Vcs_status_files_not_committed
			else
				-- Run 3 git commands:
				-- 	obtain local commit id on this branch
				-- 	obtain remote commit id on this branch
				-- 	obtain the commit at which the current branch and its remote diverge
				system_run_command_query (tool_name, "rev-parse HEAD", current_directory)
				local_commit := last_command_result.stdout
				local_commit.right_adjust

				system_run_command_query (tool_name, "rev-parse @{u}", current_directory)
				remote_commit := last_command_result.stdout
				remote_commit.right_adjust

				if local_commit.is_equal (remote_commit) then
					Result := Vcs_status_up_to_date
				else
					system_run_command_query (tool_name, "merge-base HEAD @{u}", current_directory)
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

	uncommitted_files: ARRAYED_LIST [TUPLE [status, filename: STRING]]
			-- obtain formatted list of untracked and/or uncommitted files
		local
			file_record: TUPLE [status, filename: STRING]
			string_recs: ARRAYED_LIST [STRING]
		do
			create Result.make (0)
			create string_recs.make (0)
			system_run_command_query (tool_name, "status --porcelain", current_directory)
			if last_command_result.succeeded then
				string_recs.append (last_command_result.stdout.split ('%N'))

				across string_recs as string_rec_csr loop
					if not string_rec_csr.item.is_empty then
						create file_record
						-- supposedly reliable: first field of string rec (see https://git-htmldocs.googlecode.com/git/git-status.html)
						file_record.status := string_rec_csr.item.substring (1, 2)
						file_record.filename := string_rec_csr.item.substring (4, string_rec_csr.item.count)
						Result.extend (file_record)
					end
				end
			end
		end

feature -- Commands

	do_clone_checkout (repo_parent_dir: STRING)
		do
			system_run_command_asynchronous (tool_name, "clone -v --progress " + remote_repository_url, repo_parent_dir)
		end

	do_checkout_branch (a_branch_name: STRING)
			-- check out named branch
		do
			system_run_command_synchronous (tool_name, "checkout " + a_branch_name, current_directory)
		end

	do_revert_files (a_file_list: ARRAYED_LIST [STRING])
			-- revert local changes to existing file
		local
			file_spec: STRING
		do
			create file_spec.make_empty
			across a_file_list as file_name_csr loop
				file_spec.append (file_name_csr.item)
				file_spec.append_character (' ')
			end
			system_run_command_synchronous (tool_name, "checkout " + file_spec, current_directory)
		end

	do_clean_files (a_file_list: ARRAYED_LIST [STRING])
			-- remove local untracked tile
		local
			file_spec: STRING
		do
			create file_spec.make_empty
			across a_file_list as file_name_csr loop
				file_spec.append (file_name_csr.item)
				file_spec.append_character (' ')
			end
			system_run_command_synchronous (tool_name, "clean -f " + file_spec, current_directory)
		end

	do_stage_files (a_file_list: ARRAYED_LIST [STRING])
		local
			file_spec: STRING
		do
			create file_spec.make_empty
			across a_file_list as file_name_csr loop
				file_spec.append (file_name_csr.item)
				file_spec.append_character (' ')
			end
			system_run_command_synchronous (tool_name, "add " + file_spec, current_directory)
		end

	do_stage_all
		do
			system_run_command_synchronous (tool_name, "add -A", current_directory)
		end

	do_commit (a_commit_msg: STRING)
		local
			msg: STRING
		do
			create msg.make_from_string (a_commit_msg)
			-- replace any double quote characters with single quote characters
			msg.replace_substring_all ("%"", "'")
			system_run_command_synchronous (tool_name, "commit -m \%"" + msg + "\%"", current_directory)
		end

	do_push
		do
			system_run_command_asynchronous (tool_name, "push --progress", current_directory)
		end

	do_pull
		do
			system_run_command_asynchronous (tool_name, "pull --progress", current_directory)
		end

	do_fetch
		do
			system_run_command_asynchronous (tool_name, "fetch --progress origin", current_directory)
		end

end
