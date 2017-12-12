note
	component:   "Eiffel Object Modelling Framework"
	description: "Definition concepts for the basic meta-model"
	keywords:    "basic meta-model"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2009- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_DEFINITIONS

inherit
	BASIC_DEFINITIONS

feature -- Software-dependent definitions

	Bmm_internal_version: STRING = "2.1"
			-- current notional version of the BMM_SCHEMA class model used in this software; used for
			-- comparison with the BMM version recorded in schema files. If no bmm_version attribute is
			-- found, the `Assumed_bmm_version' is used.

feature -- Definitions

	Qualified_name_delimiter: CHARACTER = '-'
			-- delimiter between class_name and qualifiying closure name, e.g. EHR-ENTRY

	Schema_name_delimiter: STRING = "::"

	Package_name_delimiter: CHARACTER = '.'

	Generic_left_delim: CHARACTER = '<'

	Generic_right_delim: CHARACTER = '>'

	Generic_separator: CHARACTER = ','

	Generic_constraint_delimiter: CHARACTER = ':'
			-- appears between 'T' and constraining type if there is one

	Unknown_package_name: STRING = "(uninitialised)"

	Unknown_schema_id: STRING = "(uninitialised)"

	Unknown_schema_name: STRING = "(uninitialised)"

	Unknown_type_name: STRING = "UNKNOWN"

--	Bmm_container_types: ARRAYED_LIST [STRING]
--			-- built-in container types used to represent class-class 1:N relations
--		once
--			create Result.make (0)
--			Result.compare_objects
--			Result.extend ("List")
--			Result.extend ("Set")
--			Result.extend ("Array")
--		end

	Type_cat_primitive_class: STRING = "class_primitive"
	Type_cat_enumeration: STRING = "class_enumeration"
	Type_cat_concrete_class: STRING = "class_concrete"
	Type_cat_concrete_class_supertype: STRING = "class_concrete_supertype"
	Type_cat_abstract_class: STRING = "class_abstract"
	Type_cat_generic_parameter: STRING = "generic_parameter"
	Type_cat_constrained_generic_parameter: STRING = "constrained_generic_parameter"

	Type_categories: ARRAYED_LIST [STRING]
		once
			create Result.make (0)
			Result.compare_objects
			Result.extend (Type_cat_primitive_class)
			Result.extend (Type_cat_enumeration)
			Result.extend (Type_cat_concrete_class)
			Result.extend (Type_cat_concrete_class_supertype)
			Result.extend (Type_cat_abstract_class)
			Result.extend (Type_cat_generic_parameter)
			Result.extend (Type_cat_constrained_generic_parameter)
		end

	Bmm_schema_file_match_regex: STRING
		once
			Result :=  ".*\" + Bmm_schema_file_extension + "$"
		end

	Bmm_schema_file_extension: STRING = ".bmm"

	Metadata_bmm_version: STRING = "bmm_version"
			-- ODIN attribute name of logical attribute 'bmm_version' in schema file;
			-- MUST correspond to attribute of same name in P_BMM_SCHEMA class

	metadata_rm_publisher: STRING = "rm_publisher"
			-- ODIN attribute name of logical attribute 'model_publisher' in schema file;
			-- MUST correspond to attribute of same name in P_BMM_SCHEMA class

	metadata_schema_name: STRING = "schema_name"
			-- ODIN attribute name of logical attribute 'schema_name' in schema file;
			-- MUST correspond to attribute of same name in P_BMM_SCHEMA class

	metadata_rm_release: STRING = "rm_release"
			-- ODIN attribute name of logical attribute 'model_release' in schema file;
			-- MUST correspond to attribute of same name in P_BMM_SCHEMA class

	Metadata_schema_revision: STRING = "schema_revision"
			-- ODIN attribute name of logical attribute 'schema_revision' in schema file;
			-- MUST correspond to attribute of same name in P_BMM_SCHEMA class

	Metadata_schema_lifecycle_state: STRING = "schema_lifecycle_state"
			-- ODIN attribute name of logical attribute 'schema_lifecycle_state' in schema file;
			-- MUST correspond to attribute of same name in P_BMM_SCHEMA class

	Metadata_schema_description: STRING = "schema_description"
			-- ODIN attribute name of logical attribute 'schema_description' in schema file;
			-- MUST correspond to attribute of same name in P_BMM_SCHEMA class

	Metadata_schema_path: STRING = "schema_path"
			-- path of schema file

	Schema_fast_parse_attrs: ARRAY [STRING]
			-- attributes to retrieve for initial fast parse on schemas
		once
			Result := <<Metadata_bmm_version, Metadata_schema_revision, Metadata_schema_lifecycle_state, metadata_rm_publisher, metadata_schema_name, metadata_rm_release>>
		end

	Assumed_bmm_version: STRING = "1.0"
			-- version of BMM to assume for a schema that doesn't have the bmm_version attribute

feature -- Validation

	valid_meta_data (a_meta_data: HASH_TABLE [STRING, STRING]): BOOLEAN
			-- True if `a_meta_data' is valid for creation of a SCHEMA_DESCRIPTOR
		do
			Result := attached a_meta_data.item (metadata_rm_publisher) and
				attached a_meta_data.item (metadata_schema_name) and
				attached a_meta_data.item (metadata_rm_release) and
				attached a_meta_data.item (Metadata_schema_path)
		end

	formal_generic_parameter_name (a_type_string: STRING): BOOLEAN
			-- True if the type string is a single letter
		require
			Valid_a_type_string: not a_type_string.is_empty
		do
			Result := a_type_string.count = 1
		end

	valid_type_name (a_type_string: STRING): BOOLEAN
			-- True if the type name has a valid form, either a single name or a well-formed generic
		require
			Valid_a_type_string: not a_type_string.is_empty
		do
			Result := attached create_type_name_from_string (a_type_string) as att_tn and then
				att_tn.is_valid
		end

	valid_generic_type_name (a_type_string: STRING): BOOLEAN
			-- True if the type name includes a generic parameters part
		do
			Result := attached create_type_name_from_string (a_type_string) as att_tn and then
				att_tn.is_generic
		end

	bmm_version_compatible (schema_bmm_ver: STRING): BOOLEAN
			-- is the software version of the BMM (defined by the constant `Bmm_version', above)
			-- compatible with that found in the schema?
			-- Returns True if the two versions have the same major version number
		require
			Well_formed_version: schema_bmm_ver.occurrences ('.') >= 1
		do
			Result := schema_bmm_ver.substring (1, schema_bmm_ver.index_of ('.', 1)-1).is_equal (Bmm_internal_version.substring (1, Bmm_internal_version.index_of ('.', 1)-1))
		end

feature -- Conversion

	create_schema_id (a_model_publisher, a_schema_name, a_model_release: STRING): STRING
			-- Derived name of schema in 3 part form model_publisher '_' a_schema_name '_' model_release.
			-- Any or all arguments can be Void or empty; for each missing element,
			-- result contains "unknown", e.g. "unknown_test_1.0"
			-- Result is lower case
		local
			mp, mn, mr: STRING
		do
			create Result.make(0)
			if a_model_publisher = Void or a_model_publisher.is_empty then
				mp := "unknown"
			else
				mp := a_model_publisher
			end
			if a_schema_name = Void or a_schema_name.is_empty then
				mn := "unknown"
			else
				mn := a_schema_name
			end
			if a_model_release = Void or a_model_release.is_empty then
				mr := "unknown"
			else
				mr := a_model_release
			end
			Result.append (mp + "_" + mn + "_" + mr)
			Result.to_lower
		ensure
			Result_not_empty: not Result.is_empty
		end

	package_base_name (a_package_name: STRING): STRING
			-- package name might be of form xxx.yyy.zzz ; we only want 'zzz'
		do
			if a_package_name.has (package_name_delimiter) then
				Result := a_package_name.split (Package_name_delimiter).last
			else
				Result := a_package_name
			end
		end

	publisher_qualified_rm_closure_key (a_rm_publisher, a_rm_closure_name: STRING): STRING
			-- lower-case form of `publisher_qualified_rm_closure_name'
		require
			Model_publisher_valid: not a_rm_publisher.is_empty
			Closure_name_valid: not a_rm_closure_name.is_empty
		do
			Result := publisher_qualified_rm_closure_name (a_rm_publisher, a_rm_closure_name).as_lower
		ensure
			Is_lower: Result.same_string (Result.as_lower)
		end

	publisher_qualified_rm_closure_name (a_rm_publisher, a_rm_closure_name: STRING): STRING
			-- mixed-case standard model-package name string, e.g. "openEHR-EHR" for UI display
			-- uses `package_base_name' to obtain terminal form of package name
		require
			Model_publisher_valid: not a_rm_publisher.is_empty
			Closure_name_valid: not a_rm_closure_name.is_empty
		do
			Result := a_rm_publisher + Qualified_name_delimiter.out + package_base_name (a_rm_closure_name).as_upper
		end

	rm_closure_qualified_class_name (a_rm_closure_name, a_class_name: STRING): STRING
			-- generate a standard model-class name string, e.g. "ehr-observation" for use in finding RM schemas
		require
			Rm_closure_name_valid: not a_rm_closure_name.is_empty
			Class_name_valid: not a_class_name.is_empty
		do
			Result := a_rm_closure_name + Qualified_name_delimiter.out + a_class_name
		end

	type_name_as_flat_list (a_type_string: STRING): ARRAYED_LIST [STRING]
			-- convert a type name to a flat list of strings
		require
			Valid_type_name: valid_type_name (a_type_string)
		do
			if attached create_type_name_from_string (a_type_string) as att_tn then
				Result := att_tn.as_string_list
			else
				create Result.make(0)
				Result.compare_objects
			end
		ensure
			Result.object_comparison
		end

feature -- Factory

	create_type_name_from_string (a_type_string: STRING): detachable BMM_TYPE_NAME
			-- create from a string of unknown meta-type, i.e. simple, formal param, generic
		require
			a_type_string.count >= 1
		do
			type_name_parser.execute (a_type_string)
			if attached type_name_parser.output as a_type_name then
				Result := a_type_name
			end
		end

feature {NONE} -- Implementation

	type_name_parser: BMM_TYPE_NAME_PARSER
		once ("PROCESS")
			create Result.make
		end

end


