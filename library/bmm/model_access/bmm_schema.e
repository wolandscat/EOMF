note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Parent of persistable forms of BMM_MODEL. Defines the abstract interface and some common implementation
				 elements for descendants, which provide concrete persistence formats.
				 ]"
	keywords:    "Basic meta-model"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class BMM_SCHEMA

inherit
	ANY_VALIDATOR
		redefine
			ready_to_validate
		end

	BMM_DEFINITIONS
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

	BMM_MODEL_METADATA

feature -- Definitions

	Default_schema_option_class_name: STRING = "Any"
	Default_schema_lifecycle_state: STRING = "Initial"
	Default_schema_name: STRING = "Unknown"
	Default_schema_revision: STRING = "Unknown"
	Default_schema_author: STRING = "Unknown"
	Default_schema_description: STRING = "(none)"

	State_created: INTEGER = 1
	State_validated_created: INTEGER = 2
	State_includes_pending: INTEGER = 3
	State_includes_processed: INTEGER = 4
	Max_add_attempts: INTEGER = 10

feature -- Access (attributes from schema)

	schema_name: STRING
			-- name of model expressed in schema; a 'schema' usually contains all of the packages of one 'model' of a publisher.
			-- A publisher with more than one model can have multiple schemas.
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make_from_string (default_schema_name)
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

	bmm_version: detachable STRING
			-- version of BMM model, enabling schema evolution reasoning
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	model_name: detachable STRING
			-- Name of model - only set on model root point.
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	includes: HASH_TABLE [BMM_INCLUDE_SPEC, STRING]
			-- inclusion list, in the form of a hash of individual include specifications,
			-- each of which at least specifies the id of another schema, and may specify
			-- a namespace via which types from the included schemas are known in this schema
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make (0)
		end

feature -- Access (Attributes from schema load post-processing)

	state: INTEGER
			-- state machine state for this schema
		note
			option: transient
		attribute
		end

	bmm_model: BMM_MODEL
		do
			check attached bmm_model_cache as att_mod then
				Result := att_mod
			end
		end

	bmm_version_from_schema: BOOLEAN
			-- True if the bmm_version attribute was actually set in the schema; False means
			-- the `assumed_bmm_version' value is used instead. This flag enables the situation to
			-- be reported properly during schema validation.
		note
			option: transient
		attribute
		end

	includes_to_process: ARRAYED_LIST [STRING]
			-- list of includes to process during setup
		do
			if attached includes_to_process_cache as ipc then
				Result := ipc
			else
				create Result.make (0)
				Result.compare_objects
				includes_to_process_cache := Result
			end
		end

	primitive_types_count: INTEGER
			-- Report number of primitive types found
		deferred
		end

	class_definitions_count: INTEGER
			-- Report number of primitive types found
		deferred
		end

feature -- Status Report

	has_schema_contributor (a_contributor: STRING): BOOLEAN
		require
			valid_contributor: not a_contributor.is_empty
		do
			Result := schema_contributors.has (a_contributor)
		end

feature {BMM_SCHEMA_DESCRIPTOR, BMM_MODEL_ACCESS} -- Schema Processing

	validate_created
			-- do some basic validation post initial creation
			-- 1. check that package structure is regular:
			--    a) only top-level packages can have qualified names
			--    b) no top-level package name can be a direct parent or child of another
			--		 (child package must be declared under the parent)
			-- 2. check that all classes are mentioned in the package structure
			-- 3. check that all models refer to valid packages
		require
			state = State_created
		deferred
		ensure
			passed implies state = State_validated_created
		end

	load_finalise
			-- Finalisation work:
			-- 1. convert packages to canonical form, i.e. full hierarchy with no packages with names like aa.bb.cc
			-- 2. set up include processing list
		require
			state = State_validated_created
		deferred
		ensure
			state = State_includes_processed or state = State_includes_pending
		end

	merge (included_schema: BMM_SCHEMA)
			-- merge in class and package definitions from `included_schema', except where the current schema already has
			-- a definition for the given type or package
		require
			Loaded: state = State_includes_pending
			Other_valid: includes_to_process.has (included_schema.schema_id)
		deferred
		end

	ready_to_validate: BOOLEAN
		do
			Result := state = State_includes_processed
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

feature -- Factory

	create_bmm_model
			-- generate a BMM_MODEL object
		require
			Processing_state: state = State_includes_processed
			Model_is_top_level: attached model_name
		deferred
		end

feature {BMM_MODEL_ACCESS} -- Implementation

	schema_error_table: HASH_TABLE [ERROR_ACCUMULATOR, STRING]
			-- set of error accumulators for other schemas, keyed by schema id
		do
			if attached schema_error_table_cache as set then
				Result := set
			else
				create Result.make (0)
				schema_error_table_cache := Result
			end
		end

feature {NONE} -- Implementation

	add_validity_error (source_schema_id, a_key: STRING; args: ARRAY [STRING])
			-- append an error with key `a_key' and `args' array to the `errors' string to the
			-- error list for schema with `a_schema_id'
		do
			if source_schema_id.same_string (schema_id) then
				add_error (a_key, args)
			else
				if not schema_error_table.has (source_schema_id) then
					schema_error_table.put (create {ERROR_ACCUMULATOR}.make, source_schema_id)
				end
				check attached schema_error_table.item (source_schema_id) as att_schema_err then
					att_schema_err.add_error (a_key, args, "")
				end
				add_error ({BMM_MESSAGES_IDS}.ec_bmm_INCERR, <<schema_id, source_schema_id>>)
			end
		end

	add_validity_warning (source_schema_id, a_key: STRING; args: ARRAY [STRING])
			-- append a warning with key `a_key' and `args' array to the `errors' string to the
			-- error list for schema with `a_schema_id'
		do
			if source_schema_id.same_string (schema_id) then
				add_warning (a_key, args)
			else
				if not schema_error_table.has (source_schema_id) then
					schema_error_table.put (create {ERROR_ACCUMULATOR}.make, source_schema_id)
				end
				check attached schema_error_table.item (source_schema_id) as att_schema_err then
					att_schema_err.add_warning (a_key, args, "")
				end
			end
		end

	add_validity_info (source_schema_id, a_key: STRING; args: ARRAY [STRING])
			-- append an info message with key `a_key' and `args' array to the `errors' string to the
			-- error list for schema with `a_schema_id'
		do
			if source_schema_id.same_string (schema_id) then
				add_info (a_key, args)
			else
				if not schema_error_table.has (source_schema_id) then
					schema_error_table.put (create {ERROR_ACCUMULATOR}.make, source_schema_id)
				end
				check attached schema_error_table.item (source_schema_id) as att_schema_err then
					att_schema_err.add_info (a_key, args, "")
				end
			end
		end

	schema_error_table_cache: detachable HASH_TABLE [ERROR_ACCUMULATOR, STRING]
			-- set of error accumulators for other schemas, keyed by schema id
		note
			option: transient
		attribute
		end

	includes_to_process_cache: detachable ARRAYED_LIST [STRING]
			-- list of includes to process during setup
		note
			option: transient
		attribute
		end

	bmm_model_cache: detachable BMM_MODEL
		note
			option: transient
		attribute
		end

end


