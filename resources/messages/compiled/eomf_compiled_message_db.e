note
	component:   "Eiffel Object Modelling Framework"
	description: "Generated class from message text files"
	keywords:    "Internationalisation, I18N, Localisation, L10N, command line"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class EOMF_COMPILED_MESSAGE_DB

inherit
	EOMF_COMPILED_MESSAGE_IDS

	MESSAGE_DB
		redefine
			make
		end

create
	make

feature -- Initialisation

	make
		do
			create message_table.make (170)
			message_table.put ("No error", ec_none)
			message_table.put ("Error code $1 does not exist (calling context = $2.$3)", ec_message_code_error)
			message_table.put ("Software Exception $1 caught; Stack:%N$2", ec_report_exception)
			message_table.put ("Software Exception caught; Context: $1; Type: $2; Stack:%N$3", ec_report_exception_with_context)
			message_table.put ("Exception caught but not handled: $1", ec_unhandled_exception)
			message_table.put ("$1", ec_general_error)
			message_table.put ("$1", ec_general)
			message_table.put ("Wrote config file $1", ec_cfg_file_i1)
			message_table.put ("Config file $1 parse error: $2", ec_cfg_file_parse_error)
			message_table.put ("Directory $1 does not exist.", ec_directory_does_not_exist)
			message_table.put ("Directory <empty> does not exist.", ec_empty_directory_does_not_exist)
			message_table.put ("File $1 does not exist.", ec_file_does_not_exist)
			message_table.put ("Read failed; file $1 does not exist.", ec_read_failed_file_does_not_exist)
			message_table.put ("Read failed; file $1 has UTF-8 marker but is not valid UTF-8.", ec_invalid_utf8_file)
			message_table.put ("File $1 not found", ec_file_not_found)
			message_table.put ("File $1 already exists", ec_file_already_exists)
			message_table.put ("File <empty> does not exist.", ec_empty_file_does_not_exist)
			message_table.put ("File $1 already exists. Replace it?", ec_file_exists_replace_question)
			message_table.put ("Enter search string", ec_enter_search_string)
			message_table.put ("No match found", ec_no_match_found)
			message_table.put ("At least 3 characters required in key", ec_key_too_short)
			message_table.put ("Yes", ec_yes_response)
			message_table.put ("No", ec_no_response)
			message_table.put ("Could not create file or directory $1", ec_could_not_create_file_text)
			message_table.put ("Write failed; file $1 does not exist", ec_write_failed_file_does_not_exist)
			message_table.put ("Saved file $1 in format $2", ec_file_saved_as_in_format)
			message_table.put ("Expected sample XML rules file $1 missing", ec_xml_rules_sample_file_missing)
			message_table.put ("Invalid regular expression $1", ec_regex_invalid)
			message_table.put ("No error available from path parser", ec_path_parser_no_error_available)
			message_table.put ("suppress verbose feedback, including configuration information on startup", ec_quiet_switch_desc)
			message_table.put ("Force generation of classes, overwriting existing files (default: only generate classes if not already there)", ec_force_switch_desc)
			message_table.put ("skipping class $1 (file already exists)%N", ec_skip_class_text)
			message_table.put ("generated class $1%N", ec_generate_class_text)
			message_table.put ("output directory: $1%N", ec_output_directory_info)
			message_table.put ("no icons found in source directory $1%N", ec_no_icons_found)
			message_table.put ("Message database file: $1 does not exist or not readable", ec_msg_file_not_found)
			message_table.put ("No message files found in source directories", ec_msg_files_dirs_empty)
			message_table.put ("Message database directory: $1 does not exist or not readable", ec_msg_files_dir_not_found)
			message_table.put ("Duplicate (?) message files found: $1, $2", ec_msg_files_dup_found)
			message_table.put ("Language $1 not found in file $2", ec_lang_not_found)
			message_table.put ("ODIN parsing failure in message file $1: $2", ec_odin_parse_failure)
			message_table.put ("Key $1 in file $2 already found in file $3", ec_dup_key_in_other_file)
			message_table.put ("Wrote class text to $1%N", ec_wrote_file_info)
			message_table.put ("Reference model schema(s) $1 specified in options not valid or not found in directory $2", ec_bmm_schemas_config_not_valid)
			message_table.put ("Reference Model schema file $1 does not exist or not readable", ec_bmm_schema_file_not_valid)
			message_table.put ("Reference Model schema $1 load failure; reason: $2", ec_bmm_schema_load_failure)
			message_table.put ("Reference Model schema contains unknown type $1 (object add failed)", ec_model_access_e3)
			message_table.put ("Reference Model schema $1 load failure due to exception during processing", ec_bmm_schema_load_failure_exception)
			message_table.put ("Reference Model schema directory $1 does not exist or not readable", ec_bmm_schema_dir_not_valid)
			message_table.put ("Reference Model schema directory $1 does not contain any schemas", ec_bmm_schema_dir_contains_no_schemas)
			message_table.put ("Reference Model schema directory $1 does not contain any valid schemas", ec_bmm_schema_dir_contains_no_valid_schemas)
			message_table.put ("No Reference Model schema found for package '$1'", ec_model_access_e7)
			message_table.put ("Reference Model schema $1 failed post-merge validation; errors:%N$2", ec_bmm_schema_post_merge_validate_fail)
			message_table.put ("Reference Model included schema $1 not found or failed to load", ec_bmm_schema_included_schema_not_found)
			message_table.put ("Reference Model schema $1 includes a schema that failed to load", ec_bmm_schema_include_failed_to_load)
			message_table.put ("Reference Model schema $1 failed basic validation; errors:%N$2", ec_bmm_schema_basic_validation_failed)
			message_table.put ("Unknown exception processing RM schemas", ec_bmm_schema_unknown_exception)
			message_table.put ("Assertion violation processing RM schemas; original recipient: $1", ec_bmm_schema_assertion_violation)
			message_table.put ("Reference Model schema $1 includes validation failed: %N$2", ec_bmm_schema_includes_valiidation_failed)
			message_table.put ("Reference Model schemas at $1 incompatible with current release of the tool; obtain up to date schemas", ec_bmm_schema_version_incompatible_with_tool)
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
			message_table.put ("Schema $1 class definition $2 generic property $3 generic parameter $4 not found in schema or in containing class declarations (if open)", ec_BMM_GPGPT)
			message_table.put ("Schema $1 class definition $2 marked 'is_generic' but has no generic parameter declarations", ec_BMM_GPGPM)
			message_table.put ("Schema $1 class definition $2 generic property $3 type $4 parameter $5 not found in class definitions or $4 formal declaration", ec_BMM_GPGPU)
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
			message_table.put ("No pixmap found for $1", ec_get_icon_pixmap)
			message_table.put ("No pixmap found for $1", ec_no_pixmap_found)
			message_table.put ("(unknown)", ec_unknown_value)
			message_table.put ("Browse...", ec_browse_button_text)
			message_table.put ("OK", ec_ok_button_text)
			message_table.put ("Cancel", ec_cancel_button_text)
			message_table.put (">>", ec_collapse_button_text)
			message_table.put ("<<", ec_expand_button_text)
			message_table.put ("Tree Zoom", ec_view_label_text)
			message_table.put ("Expand All", ec_expand_complete_button_text)
			message_table.put ("Collapse All", ec_collapse_complete_button_text)
			message_table.put ("Expand One", ec_expand_one_level_button_text)
			message_table.put ("Collapse One", ec_collapse_one_level_button_text)
			message_table.put ("Add new row", ec_add_mi)
			message_table.put ("Remove row", ec_remove_mi)
			message_table.put ("Completely expand the tree", ec_expand_complete_tooltip)
			message_table.put ("Completely collapse the tree", ec_collapse_complete_tooltip)
			message_table.put ("Expand one level of the tree", ec_expand_one_level_tooltip)
			message_table.put ("Collapse one level of the tree", ec_collapse_one_level_tooltip)
			message_table.put ("View", ec_view_controls_text)
			message_table.put ("Save", ec_save_button_text)
			message_table.put ("Save editor contents to file", ec_save_button_tooltip)
			message_table.put ("+ Line Numbers", ec_add_line_numbers_text)
			message_table.put ("Add line numbers to text", ec_add_line_numbers_tooltip)
			message_table.put ("Row Filter", ec_row_filter_frame_text)
			message_table.put ("Filter which rows are shown in the Path Analysis", ec_row_filter_combo_tooltip)
			message_table.put ("Column View", ec_column_frame_text)
			message_table.put ("$1 file $2 does not exist or not readable", ec_object_file_not_valid)
			message_table.put ("$1 file $2 load failure; reason: $3", ec_object_load_failure)
			message_table.put ("$1 file $2 load failure due to exception during processing", ec_object_load_failure_exception)
			message_table.put ("$1 file $2 load data conversion failure; reason: $3", ec_object_conv_fail_err)
			message_table.put ("$1 configuration settings (ODIN format)", ec_config_settings_line1)
			message_table.put ("Automatically written by application", ec_config_settings_line2)
			message_table.put ("put_object call to object_converter.object_to_dt with object of type $1 failed", ec_put_object_conversion_failure)
			message_table.put ("No left delimiter ('<') found in line $1", ec_parse_odin_missing_left_delim)
			message_table.put ("Missing right delimiter ('>') in line $1", ec_parse_odin_missing_right_delim)
			message_table.put ("No attributes found, was expecting $1", ec_parse_odin_no_attribs_found)
			message_table.put ("[Exception caught]: Exception type $1 - trace:%N $2", ec_dt_unknown_error)
			message_table.put ("Mismatch in data and model for field $1 in type $2. Parsed data implies container type but is not in model", ec_container_type_mismatch)
			message_table.put ("Mismatch in data and model for generic parameter $1 in type $2. Expected $3 but got $4", ec_dt_container_gen_param_type_mismatch)
			message_table.put ("Mismatch in data and model for field $1 in type $2. Parsed data implies Interval<T> type but is not in model", ec_interval_type_mismatch)
			message_table.put ("Mismatch in data and model for field $1 in type $2. Parsed data implies List<Interval<T>> type but is not in model", ec_interval_list_type_mismatch)
			message_table.put ("Mismatch in data and model for field $1 in type $2. Parsed data implies atomic type but no conversion available", ec_atomic_type_mismatch)
			message_table.put ("Mismatch in data and model for field $1 in type $2. Parsed data implies primitive, sequence<primitive> or interval<primitive> type but model does not", ec_primitive_type_mismatch)
			message_table.put ("[Exception caught]: Mismatch between data and model for $1.$2. Expecting $3, read a $4", ec_dt_proc_arg_type_mismatch)
			message_table.put ("[Exception caught]: $1.$2 - writing primitive object of type $3 into argument of type $4", ec_populate_dt_proc_arg_type_mismatch)
			message_table.put ("non-existent path $1 in data tree structure", ec_non_existent_path)
			message_table.put ("non-existent path (in list) $1 in data tree structure", ec_non_existent_path_in_list)
			message_table.put ("[Exception caught]: Mismatch error - original recipient = $1", ec_dt_to_object_type_mismatch)
			message_table.put ("[Software exception]: Nested structure mismatch for type $1, attribute $2: DT structure is nested, object type is not", ec_dt_nested_type_mismatch)
			message_table.put ("Data source mentions unknown type $1 (object add failed)", ec_dt_unknown_type_in_source)
			message_table.put ("Syntax error: invalid term code reference: '$1'; code string can only contain digits, letters and '.', '_' and '-' and must commence with a letter or digit", ec_STCV)
			message_table.put ("Syntax error: invalid term code reference has no code: '$1'", ec_STNC)
			message_table.put ("Syntax error (SGEE) generic object at $1 not enclosed by normal object not allowed", ec_SGEE)
			message_table.put ("Syntax error (SDAT) invalid attribute value", ec_SDAT)
			message_table.put ("Syntax error (SOBK) empty object key at path $1", ec_SOBK)
			message_table.put ("assumed value $1 not within constraint value space", ec_VOBAV)
			message_table.put ("invalid term code constraint: $1", ec_VCPCV)
			message_table.put ("invalid ordinal constraint: duplicated value $1", ec_VCOV)
			message_table.put ("invalid ordinal constraint: duplicated code $1", ec_VCOC)
			message_table.put ("invalid interval: $1 must be <= $2", ec_VIVLO)
			message_table.put ("invalid ISO8601 date: $1", ec_VIDV)
			message_table.put ("invalid ISO8601 time: $1", ec_VITV)
			message_table.put ("invalid ISO8601 date/time: $1", ec_VIDTV)
			message_table.put ("invalid ISO8601 duration: $1", ec_VIDUV)
			message_table.put ("ODIN object duplicate attribute: $1", ec_VDATU)
			message_table.put ("ODIN object key must be unique; key [$1] already exists under attribute '$2'", ec_VOKU)
end	
end