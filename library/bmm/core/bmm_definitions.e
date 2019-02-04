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

	Bmm_internal_version: STRING = "2.3"
			-- current notional version of the BMM_SCHEMA class model used in this software; used for
			-- comparison with the BMM version recorded in schema files. If no bmm_version attribute is
			-- found, the `Assumed_bmm_version' is used.

feature -- Definitions

	Schema_id_delimiter: CHARACTER = '_'
			-- delimiter between parts of `schema_id`

	Schema_name_delimiter: STRING = "::"

	Package_name_delimiter: CHARACTER = '.'

	Generic_left_delim: CHARACTER = '<'

	Generic_right_delim: CHARACTER = '>'

	Generic_separator: CHARACTER = ','

	Generic_constraint_delimiter: CHARACTER = ':'
			-- appears between 'T' and constraining type if there is one

	Type_delimiter: CHARACTER = ':'
			-- appears between a name and a type in a declaration or type signature

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

	bmm2_schema_file_match_regex: STRING
		once
			Result :=  ".*\" + bmm2_schema_file_extension + "$"
		end

	bmm2_schema_file_extension: STRING = ".bmm"

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

	valid_bmm_meta_data (a_meta_data: HASH_TABLE [STRING, STRING]): BOOLEAN
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
		do
			create Result.make(0)
			Result.append (if not a_model_publisher.is_empty then a_model_publisher else "unknown" end)
			Result.append_character (Schema_id_delimiter)
			Result.append (if not a_schema_name.is_empty then a_schema_name else "unknown" end)
			Result.append_character (Schema_id_delimiter)
			Result.append (if not a_model_release.is_empty then a_model_release else "0.0.0" end)
			Result.to_lower
		ensure
			Result_valid: valid_full_version (schema_id_version (Result))
			Result_lower_case: Result.as_lower.is_equal (Result)
		end

	schema_id_version (a_schema_id: STRING): STRING
			-- Extract version string from 3-part schema_id as created by `schema_id`,
			-- otherwise an empty string
		do
			-- if there is any version part at all, then we extract it
			if a_schema_id.tail (1).is_integer then
				Result := a_schema_id.substring (a_schema_id.last_index_of (Schema_id_delimiter, a_schema_id.count) + 1, a_schema_id.count)
			else
				create Result.make_empty
			end
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


