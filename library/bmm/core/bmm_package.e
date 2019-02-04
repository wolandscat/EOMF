note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Abstraction of a package as a tree structure whose nodes can contain other packages and classes.
				 
				 The `name` field is the name of the package FROM SCHEMA; this name may be qualified if it is a 
				 top-level package within the schema, or unqualified.
				 ]"
	keywords:    "model, UML, BMM"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_PACKAGE

inherit
	BMM_PACKAGE_CONTAINER

	BMM_MODEL_ELEMENT

create
	make

feature -- Initialisation

	make (a_name: STRING; a_doc: detachable STRING)
		do
			name := a_name
			documentation := a_doc
		end

feature -- Access

	bmm_model: detachable BMM_MODEL
			-- reverse reference to parent schema

	classes: ARRAYED_SET [BMM_CLASS]
		attribute
			create Result.make (0)
		end

	globally_qualified_path: STRING
			-- fully qualified package name prepended with schema name, of form: 'schema_name::package.package.CLASS'
			-- to enable identification in situation when a given package has been imported into more than
			-- one schema.
		do
			create Result.make_empty
			if attached bmm_model as bm then
				Result.append (bm.model_id + schema_name_delimiter + path)
			end
		end

	path: STRING
			-- full path of this package from root
		local
			csr: detachable BMM_PACKAGE
		do
			create Result.make(0)
			from csr := Current until csr = Void loop
				Result.prepend (csr.name)
				csr := csr.parent
				if attached csr then
					Result.prepend_character (Package_name_delimiter)
				end
			end
		end

	parent: detachable BMM_PACKAGE
			-- parent package

	root_classes: ARRAYED_SET [BMM_CLASS]
			-- obtain the set of top-level classes in this package, either from this package itself
			-- or by recursing into the structure until classes are obtained from child packages.
			-- Recurse into each child only far enough to find the first level of classes.
		do
			create Result.make(0)
			do_until_surface_recursive_packages (
				agent (bmm_pkg: BMM_PACKAGE): BOOLEAN
					do
						Result := bmm_pkg.has_classes
					end,
				agent (bmm_pkg: BMM_PACKAGE; class_list: ARRAYED_SET [BMM_CLASS])
					do
						class_list.merge (bmm_pkg.classes)
					end (?, Result)
			)
		end

feature -- Status Report

	has_classes: BOOLEAN
			-- True if this package has classes
		do
			Result := not classes.is_empty
		end

feature {BMM_PACKAGE_CONTAINER} -- Modification

	add_class (a_class: BMM_CLASS)
			-- add `a_class' to this package
		require
			New_class: not classes.has (a_class)
		do
			classes.extend (a_class)
			a_class.set_package (Current)
		ensure
			Class_added: classes.has (a_class)
			Parent_set: a_class.package = Current
		end

	set_parent (a_pkg: BMM_PACKAGE)
		do
			parent := a_pkg
		ensure
			parent_set: parent = a_pkg
		end

	set_bmm_schema (a_bmm_schema: BMM_MODEL)
		do
			bmm_model := a_bmm_schema
		end

feature -- Iteration

	do_until_surface_recursive_packages (test: FUNCTION [ANY, TUPLE [BMM_PACKAGE], BOOLEAN]; action: PROCEDURE [ANY, TUPLE [BMM_PACKAGE]])
			-- recursively execute `action' procedure on the current package and children, up to first layer in tree where `test' becomes true, then stop
		do
			if test.item ([Current]) then
				action.call ([Current])
			else
				across packages as packages_csr loop
					packages_csr.item.do_until_surface_recursive_packages (test, action)
				end
			end
		end

end


