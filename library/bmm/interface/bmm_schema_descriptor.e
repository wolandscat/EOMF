note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Descriptor for a BMM schema. Contains a meta-data table of attributes obtained from a mini-ODIN parse of the 
				 schema file.
	             ]"
	keywords:    "meta-model, object model"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2009- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class BMM_SCHEMA_DESCRIPTOR

inherit
	ANY_VALIDATOR
		rename
			validate as validate_merged
		end

	BMM_DEFINITIONS
		export
			{NONE} all;
			{ANY} valid_bmm_meta_data
		end

	BMM_MESSAGES_IDS
		export
			{NONE} all
		end

	SHARED_DT_SERIALISERS
		export
			{NONE} all;
			{ANY} has_dt_serialiser_format
		end

feature -- Initialisation

	make (a_meta_data: HASH_TABLE [STRING, STRING])
		require
			Meta_data_valid: valid_bmm_meta_data (a_meta_data)
		local
			bmm_ver: STRING
		do
			reset
			meta_data := a_meta_data

			check attached meta_data.item (metadata_rm_publisher) as md_publisher and
				attached meta_data.item (metadata_schema_name) as md_schema_name and
				attached meta_data.item (metadata_rm_release) as md_release and
				attached meta_data.item (Metadata_schema_path) as md_schema_path
			then
				schema_id := create_schema_id (md_publisher, md_schema_name, md_release)

				-- if there is no bmm_version meta-data item, that means that the initial fast-parse scan (note: doesn't use the main ODIN parser)
				-- did not find one; therefore we use the assumed value
				if meta_data.has (Metadata_bmm_version) and then attached meta_data.item (Metadata_bmm_version) as bv then
					bmm_ver := bv
				else
					bmm_ver := Assumed_bmm_version
				end
				is_bmm_compatible := bmm_version_compatible (bmm_ver)
				if not is_bmm_compatible then
					add_error (ec_BMM_VER, <<schema_id, bmm_ver, Bmm_internal_version>>)
				end
				schema_path := md_schema_path
				create_schema_file_accessor (schema_path)
			end
		end

feature -- Access

	bmm_schema: detachable BMM_SCHEMA
			-- persistent form of model; concrete form set in descendants

	bmm_model: detachable BMM_MODEL
			-- computable form of model

	schema_id: STRING
			-- schema id, formed from:
			-- meta_data(Metadata_model_publisher) '_' meta_data(Metadata_schema_name) '_' meta_data(Metadata_model_release)
			--	 e.g. openehr_rm_1.0.3, openehr_test_1.0.1, iso_13606-1_2008
		attribute
			create Result.make_empty
		end

	schema_path: STRING
		attribute
			create Result.make_empty
		end

	meta_data: HASH_TABLE [STRING, STRING]
			-- table of {key, value} pairs of schema meta-data, keys as defined in BMM_DEFINITIONS.metadata_xxx

	includes: ARRAYED_LIST [STRING]
			-- schema_ids of schemas included by this schema
		attribute
			create Result.make (0)
		end

feature -- Status Report

	is_top_level: BOOLEAN
			-- True if this is a top-level schema, i.e. has an archetype namespace
		do
			if attached bmm_schema then
				Result := attached bmm_schema.model_name
			end
		end

	is_bmm_compatible: BOOLEAN
			-- True if the BMM version found in the schema (or assumed, if none) is compatible with that in this software

feature -- Modification

	signal_load_include_error
			-- set error status due to failure to load an included schema
		do
			add_error (ec_bmm_schema_include_failed_to_load, <<schema_id>>)
		end

feature {BMM_MODEL_ACCESS} -- Commands

	load
			-- load schema into in-memory form
		local
			new_schema: like bmm_schema
			exception_encountered: BOOLEAN
		do
			if not exception_encountered then
				reset
				bmm_model := Void
				schema_file_accessor.load
				if not schema_file_accessor.has_errors then
					passed := True
					check attached schema_file_accessor.object as obj then
						new_schema := obj
					end
					new_schema.validate_created
					merge_errors (new_schema.errors)
					if passed then
						new_schema.load_finalise
					end
					bmm_schema := new_schema
				else
					merge_errors (schema_file_accessor.errors)
				end
			else
				if passed then
					merge_errors (new_schema.errors)
				else
					merge_errors (schema_file_accessor.errors)
				end
				passed := False
			end
		ensure
			Schema_set: attached bmm_schema or else errors.has_errors
			Passed_valid: passed implies attached bmm_schema
		rescue
			exception_encountered := True
			retry
		end

	validate_includes (all_schemas: STRING_TABLE [BMM_SCHEMA_DESCRIPTOR])
			-- validate includes list for this schema, to see if each mentioned schema exists in read schemas
		do
			if attached bmm_schema and then attached bmm_schema.includes as bmm_schema_includes then
				across bmm_schema_includes as supplier_schemas_csr loop
					if not all_schemas.has (supplier_schemas_csr.item.id) then
						add_error (ec_BMM_INC, <<schema_id, supplier_schemas_csr.item.id>>)
					else
						includes.extend (supplier_schemas_csr.item.id)
					end
				end
			end
		end

	validate_merged
		do
			check attached bmm_schema then
				bmm_schema.validate
				merge_errors (bmm_schema.errors)
			end
		end

	create_model
			-- create `model'
		require
			passed
		local
			exception_encountered: BOOLEAN
		do
			check attached bmm_schema then
				if not exception_encountered then
					bmm_schema.create_bmm_model
					bmm_model := bmm_schema.bmm_model
				else
					add_error (ec_BMM_CRF, <<bmm_schema.schema_id>>)
				end
			end
		ensure
			attached bmm_model or else errors.has_errors
		rescue
			exception_encountered := True
			retry
		end

feature -- Commands

	export_schema (a_syntax, a_file_path: STRING)
			-- export whole schema in `a_syntax`
		require
			Format_valid: has_dt_serialiser_format (a_syntax)
			Schema_exists: attached bmm_schema
		do
			check attached bmm_schema as bs then
				schema_file_accessor.save_as (bs, a_syntax, a_file_path, True)
			end
		end

feature {NONE} -- Implementation

	schema_file_accessor: OBJECT_READER [BMM_SCHEMA]

	create_schema_file_accessor (a_schema_path: STRING)
		deferred
		end

end
