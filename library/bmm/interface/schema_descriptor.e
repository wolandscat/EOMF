note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Descriptor for a BMM schema. Contains a meta-data table of attributes obtained from a mini-ODIN parse of the 
				 schema file.
	             ]"
	keywords:    "meta-model, object model"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2009- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SCHEMA_DESCRIPTOR

inherit
	ANY_VALIDATOR

	BMM_DEFINITIONS
		export
			{NONE} all;
			{ANY} valid_meta_data
		end

	BMM_MESSAGES_IDS
		export
			{NONE} all
		end

	SHARED_DT_OBJECT_CONVERTER
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make (a_meta_data: HASH_TABLE [STRING, STRING])
		require
			Meta_data_valid: valid_meta_data (a_meta_data)
		local
			bmm_ver: STRING
		do
			reset
			meta_data := a_meta_data

			check attached meta_data.item (metadata_rm_publisher) as md_publisher and attached meta_data.item (metadata_schema_name) as md_schema_name and
				attached meta_data.item (metadata_rm_release) as md_release and attached meta_data.item (Metadata_schema_path) as md_schema_path
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
				create schema_file_accessor.make (schema_path)
			end
		end

feature -- Access

	p_schema: detachable P_BMM_SCHEMA
			-- persistent form of model

	model: detachable BMM_MODEL
			-- computable form of model

	schema_id: STRING
			-- schema id, formed from:
			-- meta_data(Metadata_model_publisher) '-' meta_data(metadata_schema_name) '-' meta_data(Metadata_model_release)
			--	 e.g. openehr_rm_1.0.3, openehr_test_1.0.1, iso_13606-1_2008
		attribute
			create Result.make_empty
		end

	schema_path: STRING
		attribute
			create Result.make_empty
		end

	meta_data: HASH_TABLE [STRING, STRING]
			-- table of {key, value} pairs of schema meta-data, keys as follows:
			-- "bmm_version",
			-- "model_publisher",
			-- "schema_name",
			-- "model_release",
			-- "schema_revision",
			-- "schema_lifecycle_state",
			-- "schema_description",
			-- "schema_path"

	includes: ARRAYED_LIST [STRING]
			-- schema_ids of schemas included by this schema
		attribute
			create Result.make (0)
		end

feature -- Status Report

	is_top_level: BOOLEAN
			-- True if this is a top-level schema, i.e. not included by some other schema

	is_bmm_compatible: BOOLEAN
			-- True if the BMM version found in the schema (or assumed, if none) is compatible with that in this software

feature -- Modification

	set_top_level
		do
			is_top_level := True
		end

	signal_load_include_error
			-- set error status due to failure to load an included schema
		do
			add_error (ec_bmm_schema_include_failed_to_load, <<schema_id>>)
		end

feature {REFERENCE_MODEL_ACCESS} -- Commands

	load
			-- load schema into in-memory form
		local
			new_schema: P_BMM_SCHEMA
			exception_encountered: BOOLEAN
		do
			if not exception_encountered then
				reset
				model := Void
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
					p_schema := new_schema
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
			P_schema_set: attached p_schema or else errors.has_errors
			Passed_valid: passed implies attached p_schema
		rescue
			exception_encountered := True
			retry
		end

	validate_includes (all_schemas_list: ARRAY [STRING])
			-- validate includes list for this schema, to see if each mentioned schema exists in read schemas
		local
			all_schemas: ARRAYED_LIST [STRING]
		do
			create all_schemas.make (0)
			all_schemas.compare_objects
			all_schemas.make_from_array (all_schemas_list)
			if attached p_schema as att_schema and then attached att_schema.includes as att_includes then
				across att_includes as supplier_schemas_csr loop
					if not all_schemas.has (supplier_schemas_csr.item.id) then
						add_error (ec_BMM_INC, <<schema_id, supplier_schemas_csr.item.id>>)
					else
						includes.extend (supplier_schemas_csr.item.id)
					end
				end
			end
		end

	validate
		do
			check attached p_schema as att_schema then
				att_schema.validate
				merge_errors (att_schema.errors)
			end
		end

	create_schema
			-- create `model'
		require
			passed
		local
			exception_encountered: BOOLEAN
		do
			check attached p_schema as att_p_schema then
				if not exception_encountered then
					att_p_schema.create_bmm_model
					model := att_p_schema.bmm_model
				else
					add_error (ec_BMM_CRF, <<att_p_schema.schema_id>>)
				end
			end
		ensure
			attached model or else errors.has_errors
		rescue
			exception_encountered := True
			retry
		end

feature {NONE} -- Implementation

	schema_file_accessor: ODIN_OBJECT_READER [P_BMM_SCHEMA]

end
