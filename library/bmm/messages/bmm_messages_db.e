note
	component:   "Eiffel Object Modelling Framework"
	description: "Generated class from message text files"
	keywords:    "Internationalisation, I18N, Localisation, L10N, command line"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_MESSAGES_DB

inherit
	BMM_MESSAGES_IDS

	MESSAGE_DB
		redefine
			make
		end

create
	make

feature -- Initialisation

	make
		do
			create message_table.make (67)
			message_table.put ("Documentation", ec_bmm_documentation_text)
			message_table.put ("Reference model schema(s) $1 specified in options not valid or not found in schema directories", ec_bmm_schemas_config_not_valid)
			message_table.put ("Reference Model schema file $1 does not exist or not readable", ec_bmm_schema_file_not_valid)
			message_table.put ("Reference Model schema $1 load failure; reason: $2", ec_bmm_schema_load_failure)
			message_table.put ("Reference Model schema contains unknown type $1 (object add failed)", ec_model_access_e3)
			message_table.put ("Reference Model schema $1 load failure due to exception during processing", ec_bmm_schema_load_failure_exception)
			message_table.put ("Reference Model schema directory $1 does not exist or not readable", ec_bmm_schema_dir_not_valid)
			message_table.put ("Reference Model schema directory $1 does not contain any schemas", ec_bmm_schema_dir_contains_no_schemas)
			message_table.put ("Reference Model schema directory $1 does not contain any valid schemas", ec_bmm_schema_dir_contains_no_valid_schemas)
			message_table.put ("No Reference Model schema found for package '$1'", ec_model_access_e7)
			message_table.put ("Reference Model schema $1 failed post-merge validation; errors:%N$2", ec_bmm_schema_post_merge_validate_fail)
			message_table.put ("Reference Model schema $1 failed post-merge creation; errors:%N$2", ec_bmm_schema_post_merge_create_fail)
			message_table.put ("Reference Model included schema $1 not found or failed to load", ec_bmm_schema_included_schema_not_found)
			message_table.put ("Reference Model including schema $1 not valid", ec_bmm_schema_including_schema_not_valid)
			message_table.put ("Reference Model schema $1 includes a schema that failed to load", ec_bmm_schema_include_failed_to_load)
			message_table.put ("Reference Model schema $1 failed basic validation; errors:%N$2", ec_bmm_schema_basic_validation_failed)
			message_table.put ("Unknown exception processing RM schemas", ec_bmm_schema_unknown_exception)
			message_table.put ("Assertion violation processing RM schemas; original recipient: $1", ec_bmm_schema_assertion_violation)
			message_table.put ("Reference Model schema $1 includes validation failed: %N$2", ec_bmm_schema_includes_valiidation_failed)
			message_table.put ("Reference Model BMM schema $1 incompatible with current release $2 of the tool; obtain up to date schemas", ec_bmm_schema_version_incompatible_with_tool)
			message_table.put ("Reference Model schema $1 load data conversion failure; reason: $2", ec_bmm_schema_conv_fail_err)
			message_table.put ("Reference Model schema $1 loaded: $2 primitive types, $3 class definitions", ec_bmm_schema_info_loaded)
			message_table.put ("Merged schema $1 into schema $2", ec_bmm_schema_merged_schema)
			message_table.put ("Reference Model checking is OFF", ec_model_access_w1)
			message_table.put ("Duplicate Reference Model schema found for model '$1' in file $2, ignoring latter", ec_bmm_schema_duplicate_schema_found)
			message_table.put ("Duplicate instance of Reference Model model $1 found; original schema $2; ignoring instance from schema $3", ec_bmm_schema_duplicate_found)
			message_table.put ("Reference Model for $1 meta-data missing/invalid: $2", ec_bmm_schema_rm_missing)
			message_table.put ("Unknown Reference Model '$1' mentioned in 'rm_schemas_load_list' config setting (ignored)", ec_model_access_w5)
			message_table.put ("No 'rm_schemas_load_list' config setting found; attempting to load all schemas (change via Tools>Options)", ec_bmm_schemas_no_load_list_found)
			message_table.put ("'rm_schemas_load_list' config setting mentions non-existent schema $1", ec_bmm_schema_invalid_load_list)
			message_table.put ("Reference Model schema $1 passed basic validation with warnings:%N$2", ec_bmm_schema_passed_with_warnings)
			message_table.put ("Reference Model schema $1 includes schema $2 that does not exist", ec_BMM_INC)
			message_table.put ("Reference Model schema $1 creation failure", ec_BMM_CRF)
			message_table.put ("Schema $1 BMM version $2 incompatible with software version $3", ec_BMM_VER)
			message_table.put ("Schema $1 BMM version $2 (assumed) incompatible with software version $3", ec_BMM_VERASS)
			message_table.put ("Schema $1 class definition $2 property $3 type $4 not defined in schema", ec_BMM_PTV)
			message_table.put ("Schema $1 class definition $2 ancestor $3 does not exist in schema", ec_BMM_ANC)
			message_table.put ("Schema $1 class definition $2 includes empty ancestor class name", ec_BMM_ANCE)
			message_table.put ("Schema $1 class definition $2 generic parameter $3 constraint type $4 does not exist in schema", ec_BMM_GPCT)
			message_table.put ("Schema $1 class definition $2 container property $3 target type not defined", ec_BMM_CPT)
			message_table.put ("Schema $1 class definition $2 container property $3 target type $4 not found in schema", ec_BMM_CPTV)
			message_table.put ("Schema $1 class definition $2 container property $3 cardinality not defined (assuming {0..*})", ec_BMM_CPTNC)
			message_table.put ("Schema $1 class definition $2 container property $3 container type $4 not found in schema", ec_BMM_CPCT)
			message_table.put ("Schema $1 class definition $2 generic property $3 not defined", ec_BMM_GPT)
			message_table.put ("Schema $1 class definition $2 generic property $3 root type $4 not found in schema", ec_BMM_GPRT)
			message_table.put ("Schema $1 class definition $2 generic property $3 root type $4 has no formal generic parameters", ec_BMM_GPRTNG)
			message_table.put ("Schema $1 class definition $2 generic property $3 generic parameter $4 not found in schema or in containing class declarations (if open)", ec_BMM_GPGPT)
			message_table.put ("Schema $1 class definition $2 marked 'is_generic' but has no generic parameter declarations", ec_BMM_GPGPM)
			message_table.put ("Schema $1 class definition $2 generic property $3 type $4 parameter $5 not found in class definitions or $4 formal declaration", ec_BMM_GPGPU)
			message_table.put ("Schema $1 class definition $2 generic property $3 open parameter count does not match owning class", ec_BMM_GPOPC)
			message_table.put ("Schema $1 class definition $2 generic property $3 generic parameter count $4 does not match formal parameter count $5 of root type $6", ec_BMM_GPBPC)
			message_table.put ("Schema $1 class definition $2 single-valued property $3 type $4 not found in schema", ec_BMM_SPT)
			message_table.put ("Schema $1 class definition $2 single-valued property $3 open generic parameter $4 not found in containing class declarations", ec_BMM_SPOT)
			message_table.put ("Schema $1 class $2 mentioned in package $3 but not in schema, or relevant child schema", ec_BMM_PKGCL)
			message_table.put ("Schema $1 class definition $2 not declared in any package", ec_BMM_PKGID)
			message_table.put ("Schema $1 top-level sibling package definitions cannot include a package which is the child of another", ec_BMM_PKGTL)
			message_table.put ("Schema $1 packages with qualified name found in package $2 (qualified names not allowed except at top-level)", ec_BMM_PKGQN)
			message_table.put ("Schema $1 package $2 contains class with empty name", ec_BMM_PKGCE)
			message_table.put ("Schema $1 has duplicate class name $2 in package $3 and also package $4", ec_BMM_CLPKDP)
			message_table.put ("Schema $1 has duplicate class name $2 in class definitions", ec_BMM_CLDUP)
			message_table.put ("Schema $1 archetype_closure_package $2 does not exist", ec_BMM_MDLPK)
			message_table.put ("Schema $1 class $2 duplicate property within class $3", ec_BMM_PRDUP)
			message_table.put ("Schema $1 class $2 property $3 does not conform to same property in ancestor $4 (duplicate?)", ec_BMM_PRNCF)
			message_table.put ("Schema $1 included schema $2 validity failure", ec_BMM_INCERR)
			message_table.put ("Schema $1 included schema $2 validity warning", ec_BMM_INCWARN)
			message_table.put ("Schema $1 archetype parent class $2 not defined in schema", ec_BMM_ARPAR)
			message_table.put ("Schema $1 RM release $2 not valid; should be 3-part numeric version", ec_BMM_RMREL)
end	
end