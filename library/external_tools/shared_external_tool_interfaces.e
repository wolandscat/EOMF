note
	component:   "Eiffel Object Modelling Framework"
	description: "Abstract concept of a command set for a tool, such as Git"
	keywords:    "command line, external command"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SHARED_EXTERNAL_TOOL_INTERFACES

inherit
	EXTERNAL_TOOL_DEFINITIONS

	SHARED_RESOURCES

feature -- Status Report

	has_tool_interface (a_tool_name: STRING): BOOLEAN
			-- True if there is an interface available for `a_tool_name'
		do
			Result := tool_interfaces.has (a_tool_name)
		end

	tool_available (a_tool_name: STRING): BOOLEAN
			-- True if `a_tool_name' exists on the system
		do
			Result := system_has_command (a_tool_name)
		end

	tool_supported (a_tool_name: STRING): BOOLEAN
			-- True if `a_tool_name' exists on the system and has support in this interface
		do
			Result := system_has_command (a_tool_name) and has_tool_interface (a_tool_name)
		end

feature -- Factory

	create_tool_interface (a_tool_name: STRING): EXTERNAL_TOOL_INTERFACE
		require
			has_tool_interface (a_tool_name)
		do
			check attached tool_interfaces.item (a_tool_name) as att_func then
				Result := att_func.item ([])
			end
		end

	create_vcs_tool_interface_from_checkout (a_local_dir: STRING): detachable VCS_TOOL_INTERFACE
		do
			if is_git_clone (a_local_dir) then
				check attached {VCS_TOOL_INTERFACE} create_tool_interface (Git_tool_name) as att_tool_if then
					Result := att_tool_if
				end
				if tool_available (Git_tool_name) then
					Result.initialise_from_local (a_local_dir)
				end

			elseif is_svn_checkout (a_local_dir) then
				check attached {VCS_TOOL_INTERFACE} create_tool_interface (Svn_tool_name) as att_tool_if then
					Result := att_tool_if
				end
				if tool_available (Svn_tool_name) then
					Result.initialise_from_local (a_local_dir)
				end
			end
		end

feature {NONE} -- Implementation

	tool_interfaces: HASH_TABLE [FUNCTION [ANY, TUPLE, EXTERNAL_TOOL_INTERFACE], STRING]
			-- table of tool
		once
			create Result.make (0)
			Result.put (agent :GIT_TOOL_INTERFACE do create Result.make (Git_tool_name) end, Git_tool_name)
			Result.put (agent :SVN_TOOL_INTERFACE do create Result.make (Svn_tool_name) end, Svn_tool_name)
		end

end
