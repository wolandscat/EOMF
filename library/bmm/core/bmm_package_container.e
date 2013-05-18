note
	component:   "Eiffel Object Modelling Framework"
	description: "Abstraction of a model component that contains packages and classes"
	keywords:    "model, UML"

	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_PACKAGE_CONTAINER

inherit
	BMM_DEFINITIONS
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

feature -- Access

	packages: HASH_TABLE [BMM_PACKAGE_DEFINITION, STRING]
			-- child packages; keys all in upper case for guaranteed matching
		attribute
			create Result.make (0)
		end

	package_at_path (a_path: STRING): detachable BMM_PACKAGE_DEFINITION
			-- package at the path `a_path'
		require
			has_package_path (a_path)
		local
			pkg_names: LIST [STRING]
		do
			pkg_names := a_path.as_upper.split (Package_name_delimiter)
			pkg_names.start
			Result := packages.item (pkg_names.item)
			from pkg_names.forth until pkg_names.off loop
				if attached Result.packages.item (pkg_names.item) as pkg then
					Result := pkg
				end
				pkg_names.forth
			end
		end

feature -- Status Report

	has_package_path (a_path: STRING): BOOLEAN
			-- True if there is a package at the path `a_path'
		local
			pkg_names: LIST [STRING]
			pkg_csr: BMM_PACKAGE_CONTAINER
		do
			pkg_names := a_path.as_upper.split (Package_name_delimiter)
			pkg_csr := Current
			from pkg_names.start until pkg_names.off or not pkg_csr.packages.has (pkg_names.item) loop
				if attached pkg_csr.packages.item (pkg_names.item) as pkg then
					pkg_csr := pkg
				end
				pkg_names.forth
			end
			Result := pkg_names.off
		end

	there_exists_recursive_packages (test: FUNCTION [ANY, TUPLE [BMM_PACKAGE_DEFINITION], BOOLEAN]): BOOLEAN
			-- recursively execute `test' function, taking package as argument
		do
			from packages.start until packages.off or Result loop
				Result := test.item ([packages.item_for_iteration])
				if not Result then
					Result := packages.item_for_iteration.there_exists_recursive_packages (test)
				end
				packages.forth
			end
		end

	recursive_has_package (a_pkg: BMM_PACKAGE_DEFINITION): BOOLEAN
		do
			Result := there_exists_recursive_packages (agent (schema_pkg, test_pkg: BMM_PACKAGE_DEFINITION): BOOLEAN do Result := schema_pkg = test_pkg end (?, a_pkg))
		end

feature -- Modification

	add_package (a_pkg: BMM_PACKAGE_DEFINITION)
		require
			Valid_package: not packages.has_item (a_pkg) and not packages.has (a_pkg.name.as_upper)
		do
			packages.put (a_pkg, a_pkg.name.as_upper)
			if attached {BMM_PACKAGE_DEFINITION} Current as parent_pkg then
				a_pkg.set_parent (parent_pkg)
			end
		ensure
			Package_added: packages.item (a_pkg.name.as_upper) = a_pkg
		end

feature -- Iteration

	do_recursive_packages (action: PROCEDURE [ANY, TUPLE [BMM_PACKAGE_DEFINITION]])
			-- recursively execute `action' procedure, taking package as argument
		do
			from packages.start until packages.off loop
				action.call ([packages.item_for_iteration])
				packages.item_for_iteration.do_recursive_packages (action)
				packages.forth
			end
		end

end


