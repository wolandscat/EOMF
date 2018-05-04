note
	component:   "Eiffel Object Modelling Framework"
	description: "Persisted form of a model component that contains packages"
	keywords:    "Basic meta-model"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_BMM_PACKAGE_CONTAINER

inherit
	BMM_DEFINITIONS
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

feature -- Access

	packages: HASH_TABLE [P_BMM_PACKAGE, STRING]
			-- child packages
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make (0)
		end

feature -- Status Report

	there_exists_recursive_packages (test: FUNCTION [ANY, TUPLE [P_BMM_PACKAGE], BOOLEAN]): BOOLEAN
			-- recursively execute `test' function, taking package as argument
		do
			from packages.start until packages.off or Result loop
				Result := test.item ([packages.item_for_iteration])
				if not Result then
					Result := packages.item_for_iteration.there_exists_recursive_packages (test)
					packages.forth
				end
			end
		end

	has_package_path (a_path: STRING): BOOLEAN
			-- True if there is a package at the path `a_path' under this package
		local
			pkg_names: LIST [STRING]
			pkg_csr: P_BMM_PACKAGE_CONTAINER
		do
			pkg_names := a_path.as_upper.split (Package_name_delimiter)
			pkg_csr := Current
			from pkg_names.start until pkg_names.off or not pkg_csr.packages.has (pkg_names.item) loop
				check attached pkg_csr.packages.item (pkg_names.item) as att_pkg then
					pkg_csr := att_pkg
				end
				pkg_names.forth
			end
			Result := pkg_names.off
		end

feature -- Modification

	do_recursive_packages (action: PROCEDURE [ANY, TUPLE [P_BMM_PACKAGE]])
			-- recursively execute `action' procedure, taking package as argument
		do
			across packages as pkgs_csr loop
				action.call ([pkgs_csr.item])
				pkgs_csr.item.do_recursive_packages (action)
			end
		end

	add_package (a_pkg: P_BMM_PACKAGE)
		do
			packages.put (a_pkg, a_pkg.name.as_upper)
		end

	correct_packages_keys
			-- convert all keys, to upper case to ensure case-insensitive matching
		local
			keys: ARRAY [STRING]
			i: INTEGER
		do
			keys := packages.current_keys
			from i := 1 until i > keys.count loop
				packages.replace_key (keys.item(i).as_upper, keys.item(i))
				i := i + 1
			end
		end

end


