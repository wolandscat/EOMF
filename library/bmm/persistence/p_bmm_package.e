note
	component:   "Eiffel Object Modelling Framework"
	description: "Abstraction of a package as a tree structure whose nodes can contain "
	keywords:    "basic meta-model, BMM, UML"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_BMM_PACKAGE

inherit
	P_BMM_PACKAGE_CONTAINER

	BMM_DEFINITIONS
		export
			{NONE} all
		end

	DT_CONVERTIBLE
		redefine
			finalise_dt
		end

create
	make, make_from_other

feature -- Initialisation

	make (a_name: STRING)
			-- make in a safe way for DT building purposes
		do
			name := a_name
		end

	make_dt (make_args: detachable ARRAY[ANY])
			-- make in a safe way for DT building purposes
		do
			make (unknown_package_name)
		end

	make_from_other (other_pkg: P_BMM_PACKAGE)
			-- make this package with `packages' and `classes' references to those parts of `other_pkg'
			-- but keeping its own name.
		do
			classes := other_pkg.classes
			packages := other_pkg.packages
		end

feature -- Access (attributes from schema)

	name: STRING
			-- name of the package FROM SCHEMA; this name may be qualified if it is a top-level
			-- package within the schema, or unqualified.
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make_from_string (unknown_package_name)
		end

	classes: ARRAYED_SET [STRING]
			-- list of classes in this package
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make (0)
			Result.compare_objects
		end

feature -- Access

	bmm_package_definition: detachable BMM_PACKAGE
		note
			option: transient
		attribute
		end

feature -- Modification

	do_recursive_classes (action: PROCEDURE [ANY, TUPLE [P_BMM_PACKAGE, STRING]])
			-- recursively execute `action' procedure, taking package and class name as arguments
		do
			across classes as classes_csr loop
				action.call ([Current, classes_csr.item])
			end
			across packages as pkgs_csr loop
				pkgs_csr.item.do_recursive_classes (action)
			end
		end

	merge (other: attached like Current)
		do
			-- merge the classes at this level
			classes.merge (other.classes)

			-- merge the packages
			across other.packages as pkgs_csr loop
				if packages.has (pkgs_csr.key) then
					packages.item (pkgs_csr.key).merge (pkgs_csr.item)
				else
					add_package (pkgs_csr.item.deep_twin)
				end
			end
		end

feature -- Factory

	create_bmm_package_definition
			-- generate a BMM_PACKAGE_DEFINITION object
		local
			new_bmm_package_definition: BMM_PACKAGE
		do
			create new_bmm_package_definition.make (name)
			bmm_package_definition := new_bmm_package_definition
			across packages as pkgs_csr loop
				pkgs_csr.item.create_bmm_package_definition
				if attached pkgs_csr.item.bmm_package_definition as pkg_bmm_pkg_def then
					new_bmm_package_definition.add_package (pkg_bmm_pkg_def)
				end
			end
		end

feature {DT_OBJECT_CONVERTER} -- Finalisation

	finalise_dt
			-- finalisation routine to guarantee validity on creation from DT form
			-- rewrite `classes' list so that it has object comparison set
		local
			classes_copy: ARRAYED_SET [STRING]
		do
			if not classes.object_comparison then
				create classes_copy.make (0)
				classes_copy.compare_objects
				across classes as classes_csr loop
					classes_copy.extend (classes_csr.item)
				end
				classes := classes_copy
			end

			correct_packages_keys
		end

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: detachable ARRAYED_LIST [STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		do
		end

end


