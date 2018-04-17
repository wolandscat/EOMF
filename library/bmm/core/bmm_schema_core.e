note
	component:   "Eiffel Object Modelling Framework"
	description: "Core properties of BMM_SCHEMA"
	keywords:    "Basic meta-model"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_SCHEMA_CORE

inherit
	BMM_DEFINITIONS
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

feature -- Definitions

	Default_schema_option_class_name: STRING = "Any"
	Default_schema_lifecycle_state: STRING = "Initial"
	Default_rm_pubisher: STRING = "Unknown"
	Default_schema_name: STRING = "Unknown"
	Default_schema_release: STRING = "Unknown"
	Default_schema_revision: STRING = "Unknown"
	Default_schema_author: STRING = "Unknown"
	Default_schema_description: STRING = "(none)"

feature -- Initialisation


feature -- Identification

	rm_publisher: STRING
			-- publisher of model expressed in the schema
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make_from_string (Default_schema_revision)
		end

	schema_name: STRING
			-- name of model expressed in schema; a 'schema' usually contains all of the packages of one 'model' of a publisher.
			-- A publisher with more than one model can have multiple schemas.
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make_from_string (default_schema_name)
		end

	rm_release: STRING
			-- release of model expressed in the schema
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make_from_string (Default_schema_release)
		end

	schema_id: STRING
			-- derived name of schema, based on model publisher, model name, model release
		do
			Result := create_schema_id (rm_publisher, schema_name, rm_release)
		end

	schema_revision: STRING
			-- revision of schema
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make_from_string (Default_schema_revision)
		end

	schema_lifecycle_state: STRING
			-- lifecycle state of schema
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make_from_string (Default_schema_lifecycle_state)
		end

	schema_author: STRING
			-- primary author of schema
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make_from_string (Default_schema_author)
		end

	schema_contributors: ARRAYED_LIST [STRING]
			-- contributing authors of schema
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
        attribute
            create Result.make (0)
        end

	schema_description: STRING
			-- description of schema
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make_from_string (Default_schema_description)
		end

feature -- Status Report

	has_schema_contributor (a_contributor: STRING): BOOLEAN
		require
			valid_contributor: not a_contributor.is_empty
		do
			Result := schema_contributors.has (a_contributor)
		end

feature -- Modification

	set_schema_revision (a_revision: STRING)
		require
			valid_revision: not a_revision.is_empty
		do
			schema_revision := a_revision
		end

	set_schema_lifecycle_state (a_lifecycle_state: STRING)
		require
			valid_lifecycle_state: not a_lifecycle_state.is_empty
		do
			schema_lifecycle_state := a_lifecycle_state
		end

	set_schema_author (an_author: STRING)
		require
			valid_author: not an_author.is_empty
		do
			schema_author := an_author
		end

	add_schema_contributor (a_contributor: STRING)
		require
			valid_contributor: not a_contributor.is_empty and not has_schema_contributor (a_contributor)
		do
			schema_contributors.extend (a_contributor)
		end

	set_schema_contributors (a_contributors: ARRAYED_LIST [STRING])
		require
			valid_contributor: not a_contributors.is_empty
		do
			schema_contributors := a_contributors
		end

	set_schema_description (a_description: STRING)
		require
			valid_description: not a_description.is_empty
		do
			schema_description := a_description
		end

end


