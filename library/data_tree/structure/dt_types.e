note
	component:   "Eiffel Object Modelling Framework"
	description: "Type definitions for DT structures and coversion"
	keywords:    "Data Tree"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2005- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class DT_TYPES

inherit
	INTERNAL
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

feature {NONE} -- Definitions

	dt_primitive_atomic_types: ARRAYED_LIST [INTEGER]
			-- all primitive atomic types used in DT structures
		once
			create Result.make (0)

			Result.extend (({NATURAL_8}).type_id)
			Result.extend (({NATURAL_16}).type_id)
			Result.extend (({NATURAL_32}).type_id)
			Result.extend (({NATURAL_64}).type_id)

			Result.extend (({INTEGER_8}).type_id)
			Result.extend (({INTEGER_16}).type_id)
			Result.extend (({INTEGER_32}).type_id)
			Result.extend (({INTEGER_64}).type_id)

			Result.extend (({REAL_32}).type_id)
			Result.extend (({REAL_64}).type_id)

			Result.extend (({BOOLEAN}).type_id)

			Result.extend (({CHARACTER_8}).type_id)
			Result.extend (({CHARACTER_32}).type_id)

			Result.extend (({STRING_8}).type_id)
			Result.extend (({STRING_32}).type_id)

			Result.extend (({DATE}).type_id)
			Result.extend (({DATE_TIME}).type_id)
			Result.extend (({TIME}).type_id)
			Result.extend (({DATE_TIME_DURATION}).type_id)

			Result.extend (({ISO8601_DATE}).type_id)
			Result.extend (({ISO8601_DATE_TIME}).type_id)
			Result.extend (({ISO8601_TIME}).type_id)
			Result.extend (({ISO8601_DURATION}).type_id)

			Result.extend (({TERMINOLOGY_CODE}).type_id)
			Result.extend (({URI}).type_id)
		end

	dt_primitive_sequence_types: ARRAYED_LIST [INTEGER]
			-- the list of dynamic types of abstract types from cvt_table
			-- e.g. types like LIST[INTEGER] are there, but not LINKED_LIST[INTEGER]
		once
			Create Result.make (0)

			Result.extend (({SEQUENCE [NATURAL_8]}).type_id)
			Result.extend (({SEQUENCE [NATURAL_16]}).type_id)
			Result.extend (({SEQUENCE [NATURAL_32]}).type_id)
			Result.extend (({SEQUENCE [NATURAL_64]}).type_id)

			Result.extend (({SEQUENCE [INTEGER_8]}).type_id)
			Result.extend (({SEQUENCE [INTEGER_16]}).type_id)
			Result.extend (({SEQUENCE [INTEGER_32]}).type_id)
			Result.extend (({SEQUENCE [INTEGER_64]}).type_id)

			Result.extend (({SEQUENCE [REAL_32]}).type_id)
			Result.extend (({SEQUENCE [REAL_64]}).type_id)

			Result.extend (({SEQUENCE [BOOLEAN]}).type_id)

			Result.extend (({SEQUENCE [CHARACTER_8]}).type_id)
			Result.extend (({SEQUENCE [CHARACTER_32]}).type_id)

			Result.extend (({SEQUENCE [STRING_8]}).type_id)
			Result.extend (({SEQUENCE [STRING_32]}).type_id)

			Result.extend (({SEQUENCE [DATE]}).type_id)
			Result.extend (({SEQUENCE [DATE_TIME]}).type_id)
			Result.extend (({SEQUENCE [TIME]}).type_id)
			Result.extend (({SEQUENCE [DATE_TIME_DURATION]}).type_id)

			Result.extend (({SEQUENCE [ISO8601_DATE]}).type_id)
			Result.extend (({SEQUENCE [ISO8601_DATE_TIME]}).type_id)
			Result.extend (({SEQUENCE [ISO8601_TIME]}).type_id)
			Result.extend (({SEQUENCE [ISO8601_DURATION]}).type_id)

			Result.extend (({SEQUENCE [TERMINOLOGY_CODE]}).type_id)
			Result.extend (({SEQUENCE [URI]}).type_id)
		end

	dt_primitive_interval_types: ARRAYED_LIST [INTEGER]
			-- the list of dynamic types of intervals of primitives
		once
			Create Result.make (0)

			Result.extend (({INTERVAL [NATURAL_8]}).type_id)
			Result.extend (({INTERVAL [NATURAL_16]}).type_id)
			Result.extend (({INTERVAL [NATURAL_32]}).type_id)
			Result.extend (({INTERVAL [NATURAL_64]}).type_id)

			Result.extend (({INTERVAL [INTEGER_8]}).type_id)
			Result.extend (({INTERVAL [INTEGER_16]}).type_id)
			Result.extend (({INTERVAL [INTEGER_32]}).type_id)
			Result.extend (({INTERVAL [INTEGER_64]}).type_id)

			Result.extend (({INTERVAL [REAL_32]}).type_id)
			Result.extend (({INTERVAL [REAL_64]}).type_id)

			Result.extend (({INTERVAL [DATE]}).type_id)
			Result.extend (({INTERVAL [DATE_TIME]}).type_id)
			Result.extend (({INTERVAL [TIME]}).type_id)
			Result.extend (({INTERVAL [DATE_TIME_DURATION]}).type_id)

			Result.extend (({INTERVAL [ISO8601_DATE]}).type_id)
			Result.extend (({INTERVAL [ISO8601_DATE_TIME]}).type_id)
			Result.extend (({INTERVAL [ISO8601_TIME]}).type_id)
			Result.extend (({INTERVAL [ISO8601_DURATION]}).type_id)
		end

	dt_primitive_sequence_interval_types: ARRAYED_LIST [INTEGER]
			-- the list of dynamic types of lists of intervals of primitives
		once
			Create Result.make (0)

			Result.extend (({SEQUENCE [INTERVAL [NATURAL_8]]}).type_id)
			Result.extend (({SEQUENCE [INTERVAL [NATURAL_16]]}).type_id)
			Result.extend (({SEQUENCE [INTERVAL [NATURAL_32]]}).type_id)
			Result.extend (({SEQUENCE [INTERVAL [NATURAL_64]]}).type_id)

			Result.extend (({SEQUENCE [INTERVAL [INTEGER_8]]}).type_id)
			Result.extend (({SEQUENCE [INTERVAL [INTEGER_16]]}).type_id)
			Result.extend (({SEQUENCE [INTERVAL [INTEGER_32]]}).type_id)
			Result.extend (({SEQUENCE [INTERVAL [INTEGER_64]]}).type_id)

			Result.extend (({SEQUENCE [INTERVAL [REAL_32]]}).type_id)
			Result.extend (({SEQUENCE [INTERVAL [REAL_64]]}).type_id)

			Result.extend (({SEQUENCE [INTERVAL [DATE]]}).type_id)
			Result.extend (({SEQUENCE [INTERVAL [DATE_TIME]]}).type_id)
			Result.extend (({SEQUENCE [INTERVAL [TIME]]}).type_id)
			Result.extend (({SEQUENCE [INTERVAL [DATE_TIME_DURATION]]}).type_id)

			Result.extend (({SEQUENCE [INTERVAL [ISO8601_DATE]]}).type_id)
			Result.extend (({SEQUENCE [INTERVAL [ISO8601_DATE_TIME]]}).type_id)
			Result.extend (({SEQUENCE [INTERVAL [ISO8601_TIME]]}).type_id)
			Result.extend (({SEQUENCE [INTERVAL [ISO8601_DURATION]]}).type_id)
		end

	odin_inferred_primitive_atomic_types: ARRAYED_LIST [INTEGER]
			-- list of all primitive atomic types whose Eiffel type can safely be inferred from ODIN text,
			-- without type information being explicitly supplied. E.g. in ODIN:
			--  "some_int = <123>" ==> infer INTEGER, i.e. INTEGER_32
			--  "some_real = <1.5>" ==> infer REAL, i.e. REAL_32
			--  "some_string = <"absndf">" ==> infer STRING, i.e. STRING_8
			-- etc
		once
			create Result.make (0)
			Result.extend (({INTEGER}).type_id)
			Result.extend (({REAL}).type_id)
			Result.extend (({BOOLEAN}).type_id)
			Result.extend (({CHARACTER}).type_id)
			Result.extend (({STRING}).type_id)
			Result.extend (({ISO8601_DATE}).type_id)
			Result.extend (({ISO8601_DATE_TIME}).type_id)
			Result.extend (({ISO8601_TIME}).type_id)
			Result.extend (({ISO8601_DURATION}).type_id)
		end

	odin_inferred_primitive_sequence_types: ARRAYED_LIST [INTEGER]
			-- list of all primitive sequence types whose Eiffel type can safely be inferred from ODIN text,
			-- without type information being explicitly supplied. E.g. in ODIN:
			--  "some_arr_list_of_int = <1, 2, 3>" ==> infer ARRAYED_LIST[INTEGER]
			--  any SEQUENCE type declared in the object structured can be handled, because 'extend' works for
			-- populating it.
		once
			create Result.make (0)
			Result.extend (({SEQUENCE [INTEGER]}).type_id)
			Result.extend (({SEQUENCE [REAL]}).type_id)
			Result.extend (({SEQUENCE [BOOLEAN]}).type_id)
			Result.extend (({SEQUENCE [CHARACTER]}).type_id)
			Result.extend (({SEQUENCE [STRING]}).type_id)
			Result.extend (({SEQUENCE [ISO8601_DATE]}).type_id)
			Result.extend (({SEQUENCE [ISO8601_DATE_TIME]}).type_id)
			Result.extend (({SEQUENCE [ISO8601_TIME]}).type_id)
			Result.extend (({SEQUENCE [ISO8601_DURATION]}).type_id)
		end

	odin_inferred_primitive_interval_types: ARRAYED_LIST [INTEGER]
			-- list of all primitive interval types whose Eiffel type can safely be inferred from ODIN text,
			-- without type information being explicitly supplied. E.g. in ODIN:
			--  "some_ivl_of_int = <|1..3|>" ==> infer INTERVAL[INTEGER]
			-- etc
		once
			create Result.make (0)
			Result.extend (({INTERVAL [INTEGER]}).type_id)
			Result.extend (({INTERVAL [REAL]}).type_id)
			Result.extend (({INTERVAL [ISO8601_DATE]}).type_id)
			Result.extend (({INTERVAL [ISO8601_DATE_TIME]}).type_id)
			Result.extend (({INTERVAL [ISO8601_TIME]}).type_id)
			Result.extend (({INTERVAL [ISO8601_DURATION]}).type_id)
		end

feature -- Conversion

	dt_primitive_sequence_conforming_type (a_type_id: INTEGER): INTEGER
			-- Type which is the primitive_sequence type to which a_type_id (a concrete type, e.g. some kind of
			-- sorted list or whatever) conforms. Returns 0 if not found
		require
			Type_valid: a_type_id >= 0
		local
			att_type_id: INTEGER
		do
			att_type_id := attached_type (a_type_id)

			-- check in type cache first
			if dt_primitive_sequence_conforming_types.has (att_type_id) then
				Result := dt_primitive_sequence_conforming_types.item (att_type_id)
			else
				if dt_primitive_sequence_types.has (att_type_id) then
					Result := att_type_id
				else
					from dt_primitive_sequence_types.start until dt_primitive_sequence_types.off or Result /= 0 loop
debug ("DT-types")
	io.put_string (generator + ".primitive_sequence_conforming_type: call to field_conforms_to (" +
		type_name_of_type (a_type_id) + " (attached form " + type_name_of_type (att_type_id) + "), " + type_name_of_type (dt_primitive_sequence_types.item) + "):")
end
						if field_conforms_to (att_type_id, dt_primitive_sequence_types.item) then
							Result := dt_primitive_sequence_types.item
debug ("DT-types")
	io.put_string(" True%N")
end
else
debug ("DT-types")
	io.put_string(" False%N")
end
						end
						dt_primitive_sequence_types.forth
					end
				end
				if Result /= 0 then
					dt_primitive_sequence_conforming_types.put (Result, att_type_id)
				end
			end
		end

	dt_primitive_sequence_interval_conforming_type (a_type_id: INTEGER): INTEGER
			-- Type which is the primitive_sequence of interval type to which a_type_id (a concrete type, e.g. some kind of
			-- sorted list or whatever) conforms. Returns 0 if not found
		require
			Type_valid: a_type_id >= 0
		local
			att_type_id: INTEGER
		do
			att_type_id := attached_type (a_type_id)

			-- check in type cache first
			if dt_primitive_sequence_interval_conforming_types.has (att_type_id) then
				Result := dt_primitive_sequence_interval_conforming_types.item (att_type_id)
			else
				if dt_primitive_sequence_interval_types.has (att_type_id) then
					Result := att_type_id
				else
					from dt_primitive_sequence_interval_types.start until dt_primitive_sequence_interval_types.off or Result /= 0 loop
debug ("DT-types")
	io.put_string (generator + ".primitive_sequence_interval_conforming_type: call to field_conforms_to (" +
		type_name_of_type (a_type_id) + " (attached form " + type_name_of_type (att_type_id) + "), " + type_name_of_type (dt_primitive_sequence_interval_types.item) + "):")
end
						if field_conforms_to (att_type_id, dt_primitive_sequence_interval_types.item) then
							Result := dt_primitive_sequence_interval_types.item
debug ("DT-types")
	io.put_string(" True%N")
end
else
debug ("DT-types")
	io.put_string(" False%N")
end
						end
						dt_primitive_sequence_interval_types.forth
					end
				end
				if Result /= 0 then
					dt_primitive_sequence_interval_conforming_types.put (Result, att_type_id)
				end
			end
		end

	dt_primitive_interval_conforming_type (a_type_id: INTEGER): INTEGER
			-- Type which is the primitive_sequence of interval type to which a_type_id (a concrete type, e.g. some kind of
			-- sorted list or whatever) conforms. Returns 0 if not found
		require
			Type_valid: a_type_id >= 0
		local
			att_type_id: INTEGER
		do
			att_type_id := attached_type (a_type_id)

			-- check in type cache first
			if dt_primitive_interval_conforming_types.has (att_type_id) then
				Result := dt_primitive_interval_conforming_types.item (att_type_id)
			else
				if dt_primitive_interval_types.has (att_type_id) then
					Result := att_type_id
				else
					from dt_primitive_interval_types.start until dt_primitive_interval_types.off or Result /= 0 loop
debug ("DT-types")
	io.put_string (generator + ".primitive_interval_conforming_type: call to field_conforms_to (" +
		type_name_of_type (a_type_id) + " (attached form " + type_name_of_type (att_type_id) + "), " + type_name_of_type (dt_primitive_interval_types.item) + "):")
end
						if field_conforms_to (att_type_id, dt_primitive_interval_types.item) then
							Result := dt_primitive_interval_types.item
debug ("DT-types")
	io.put_string(" True%N")
end
else
debug ("DT-types")
	io.put_string(" False%N")
end
						end
						dt_primitive_interval_types.forth
					end
				end
				if Result /= 0 then
					dt_primitive_interval_conforming_types.put (Result, att_type_id)
				end
			end
		end

	dt_dynamic_type_from_string (a_type_str: STRING): INTEGER
			-- generates an attached type_id unless `a_type_str' is of form
			-- "attached T"
		do
			if not dt_dynamic_types.has (a_type_str) then
				dt_dynamic_types.put (dynamic_type_from_string (a_type_str), a_type_str)
			end
			Result := dt_dynamic_types.item (a_type_str)
		end

feature -- Status Report

	is_dt_primitive_atomic_type (a_type_id: INTEGER): BOOLEAN
			-- True if one of the types STRING, INTEGER, REAL, BOOLEAN, CHARACTER,
			-- DATE, TIME, DATE_TIME, DATE_TIME_DURATION
		require
			Type_valid: a_type_id >= 0
		do
			Result := dt_primitive_atomic_types.has (attached_type (a_type_id))
		end

	is_dt_primitive_sequence_type (a_type_id: INTEGER): BOOLEAN
			-- True if a_type_id conforms to SEQUENCE of STRING, INTEGER, REAL, BOOLEAN, CHARACTER,
			-- DATE, TIME, DATE_TIME, DATE_TIME_DURATION, TERMINOLOGY_CODE, URI
		require
			Type_valid: a_type_id >= 0
		do
			Result := dt_primitive_sequence_types.has (attached_type (a_type_id))
		end

	is_dt_primitive_interval_type (a_type_id: INTEGER): BOOLEAN
			-- True if a_type_id is one of the types INTERVAL of INTEGER, REAL,
			-- DATE, TIME, DATE_TIME, DATE_TIME_DURATION
		require
			Type_valid: a_type_id >= 0
		do
			Result := dt_primitive_interval_types.has (attached_type (a_type_id))
		end

	is_dt_primitive_interval_conforming_type (a_type_id: INTEGER): BOOLEAN
			-- True if a_type_id conforms to INTERVAL[PART_COMPARABLE]
		require
			Type_valid: a_type_id >= 0
		do
			Result := dt_primitive_interval_conforming_type (attached_type (a_type_id)) /= 0
		end

	is_dt_primitive_sequence_interval_conforming_type (a_type_id: INTEGER): BOOLEAN
			-- True if a_type_id conforms to SEQUENCE [INTERVAL[PART_COMPARABLE]]
		require
			Type_valid: a_type_id >= 0
		do
			Result := dt_primitive_sequence_interval_conforming_type (attached_type (a_type_id)) /= 0
		end

	is_dt_primitive_sequence_conforming_type (a_type_id: INTEGER): BOOLEAN
			-- True if a_type_id is either any of the primitive_sequence types, or else
			-- a type which conforms to one of those types
		require
			Type_valid: a_type_id >= 0
		do
			Result := dt_primitive_sequence_conforming_type (attached_type (a_type_id)) /= 0
		end

	is_dt_primitive_type (a_type_id: INTEGER): BOOLEAN
		do
			Result := is_dt_primitive_atomic_type (a_type_id) or is_dt_primitive_sequence_type (a_type_id) or is_dt_primitive_interval_type (a_type_id)
		end

	has_dt_primitive_atomic_type (an_obj: ANY): BOOLEAN
			-- True if one of the types STRING, INTEGER, REAL, BOOLEAN, CHARACTER,
			-- DATE, TIME, DATE_TIME, DATE_TIME_DURATION
		do
			Result := is_dt_primitive_atomic_type (attached_type (dynamic_type (an_obj)))
		end

	has_dt_primitive_sequence_type(an_obj: ANY): BOOLEAN
			-- True if an_obj conforms to SEQUENCE of STRING, INTEGER, REAL, BOOLEAN, CHARACTER,
			-- DATE, TIME, DATE_TIME, DATE_TIME_DURATION, TERMINOLOGY_CODE, URI
		do
			Result := is_dt_primitive_sequence_type (attached_type (dynamic_type(an_obj)))
		end

	has_dt_primitive_interval_type(an_obj: ANY): BOOLEAN
			-- True if an_obj conforms to INTERVAL of STRING, INTEGER, REAL, BOOLEAN, CHARACTER,
			-- DATE, TIME, DATE_TIME, DATE_TIME_DURATION, TERMINOLOGY_CODE, URI
		do
			Result := is_dt_primitive_interval_type (attached_type (dynamic_type(an_obj)))
		end

	is_eiffel_container_type (a_type_id: INTEGER): BOOLEAN
			-- True if a_type_id is of a type which is a SEQUENCE or HASH_TABLE, which are the only
			-- Eiffel CONTAINERs mapped by DT structures
		local
			att_type_id: INTEGER
		do
			att_type_id := attached_type (a_type_id)
debug ("DT-types")
	io.put_string (generator +
	".is_container_type: call to field_conforms_to (" + type_name_of_type (a_type_id) + ", " +
	type_name_of_type (sequence_any_type_id) + "), field_conforms_to (" + type_name_of_type (a_type_id) + ", " +
	type_name_of_type (hash_table_any_hashable_type_id) + ")%N")
end
			Result := field_conforms_to (att_type_id, sequence_any_type_id) or
				field_conforms_to (att_type_id, hash_table_any_hashable_type_id)
debug ("DT-types")
	io.put_string("%T(Result = " + Result.out + ")%N")
end
		end

	is_eiffel_interval_type (a_type_id: INTEGER): BOOLEAN
			-- True if a_type_id is of a type which conforms to INTERVAL[ANY]
		local
			att_type_id: INTEGER
		do
			att_type_id := attached_type (a_type_id)
debug ("DT-types")
	io.put_string(generator +
	".is_container_type: call to field_conforms_to (" + type_name_of_type (a_type_id) + ", " +
	type_name_of_type (interval_any_type_id) + ")%N")
end
			Result := field_conforms_to (att_type_id, interval_any_type_id)
debug ("DT-types")
	io.put_string("%T(Result = " + Result.out + ")%N")
end
		end

	is_eiffel_interval_list_type (a_type_id: INTEGER): BOOLEAN
			-- True if a_type_id is of a type which conforms to INTERVAL[ANY]
		local
			att_type_id: INTEGER
		do
			att_type_id := attached_type (a_type_id)
debug ("DT-types")
	io.put_string(generator +
	".is_container_type: call to field_conforms_to (" + type_name_of_type (a_type_id) + ", " +
	type_name_of_type (arrayed_list_interval_type_id) + ")%N")
end
			Result := field_conforms_to (att_type_id, arrayed_list_interval_type_id)
debug ("DT-types")
	io.put_string("%T(Result = " + Result.out + ")%N")
end
		end

	is_odin_inferred_primitive_sequence_type (a_type_id: INTEGER): BOOLEAN
		local
			att_type_id: INTEGER
		do
			att_type_id := attached_type (a_type_id)
			Result := odin_inferred_primitive_sequence_types.has (att_type_id) or odin_inferred_primitive_sequence_conforming_types.has (att_type_id)
			if not Result then
				Result := across odin_inferred_primitive_sequence_types as seq_types_csr some field_conforms_to (att_type_id, seq_types_csr.item) end
				if Result then
					odin_inferred_primitive_sequence_conforming_types.put (odin_inferred_primitive_sequence_types.item, att_type_id)
				end
			end
		end

feature -- Modification

	add_custom_dt_dynamic_type_from_string (a_type_str: STRING; a_type_id: INTEGER)
			-- add any custom correspondences that will fail due to INTERNAL.dynamic_type_from_string being
			-- used on raw type strings read from the environment, e.g. files
		do
			dt_dynamic_types.force (attached_type (a_type_id), a_type_str)
		end

feature {NONE} -- Implementation

	sequence_any_type_id: INTEGER
			-- dynamic type of SEQUENCE[ANY] in this system
		once
			Result := ({SEQUENCE [ANY]}).type_id
		end

	interval_any_type_id: INTEGER
			-- dynamic type of INTERVAL [PART_COMPARABLE] in this system
		once
			Result := ({INTERVAL [PART_COMPARABLE]}).type_id
		end

	arrayed_list_any_type_id: INTEGER
			-- dynamic type of ARRAYED_LIST[ANY] in this system
		once
			Result := ({ARRAYED_LIST[ANY]}).type_id
		end

	arrayed_list_interval_type_id: INTEGER
			-- dynamic type of ARRAYED_LIST[INTERVAL[PART_COMPARABLE]] in this system
		once
			Result := ({ARRAYED_LIST[INTERVAL[PART_COMPARABLE]]}).type_id
		end

	hash_table_any_hashable_type_id: INTEGER
			-- dynamic type of HASH_TABLE[ANY, HASHABLE] in this system
		once
			Result := ({HASH_TABLE [ANY, HASHABLE]}).type_id
		end

	proper_interval_type_ids: HASH_TABLE [INTEGER, INTEGER]
			-- convert a dynamic type of INTERVAL[PART_COMPARABLE] to equivalent type id for
			-- PROPER_INTERVAL subtype
		once
			create Result.make(0)
			Result.put (({PROPER_INTERVAL[INTEGER_8]}).type_id, ({INTERVAL[INTEGER_8]}).type_id)
			Result.put (({PROPER_INTERVAL[INTEGER_16]}).type_id, ({INTERVAL[INTEGER_16]}).type_id)
			Result.put (({PROPER_INTERVAL[INTEGER_32]}).type_id, ({INTERVAL[INTEGER_32]}).type_id)
			Result.put (({PROPER_INTERVAL[INTEGER_64]}).type_id, ({INTERVAL[INTEGER_64]}).type_id)

			Result.put (({PROPER_INTERVAL[NATURAL_8]}).type_id, ({INTERVAL[NATURAL_8]}).type_id)
			Result.put (({PROPER_INTERVAL[NATURAL_16]}).type_id, ({INTERVAL[NATURAL_16]}).type_id)
			Result.put (({PROPER_INTERVAL[NATURAL_32]}).type_id, ({INTERVAL[NATURAL_32]}).type_id)
			Result.put (({PROPER_INTERVAL[NATURAL_64]}).type_id, ({INTERVAL[NATURAL_64]}).type_id)

			Result.put (({PROPER_INTERVAL[REAL_32]}).type_id, ({INTERVAL[REAL_32]}).type_id)
			Result.put (({PROPER_INTERVAL[REAL_64]}).type_id, ({INTERVAL[REAL_64]}).type_id)

			Result.put (({PROPER_INTERVAL[DATE]}).type_id, ({INTERVAL[DATE]}).type_id)
			Result.put (({PROPER_INTERVAL[TIME]}).type_id, ({INTERVAL[TIME]}).type_id)
			Result.put (({PROPER_INTERVAL[DATE_TIME]}).type_id, ({INTERVAL[DATE_TIME]}).type_id)
			Result.put (({PROPER_INTERVAL[DATE_TIME_DURATION]}).type_id, ({INTERVAL[DATE_TIME_DURATION]}).type_id)
		end

	point_interval_type_ids: HASH_TABLE [INTEGER, INTEGER]
			-- convert a dynamic type of INTERVAL[PART_COMPARABLE] to equivalent type id for
			-- POINT_INTERVAL subtype
		once
			create Result.make(0)
			Result.put (({POINT_INTERVAL[INTEGER_8]}).type_id, ({INTERVAL[INTEGER_8]}).type_id)
			Result.put (({POINT_INTERVAL[INTEGER_16]}).type_id, ({INTERVAL[INTEGER_16]}).type_id)
			Result.put (({POINT_INTERVAL[INTEGER_32]}).type_id, ({INTERVAL[INTEGER_32]}).type_id)
			Result.put (({POINT_INTERVAL[INTEGER_64]}).type_id, ({INTERVAL[INTEGER_64]}).type_id)

			Result.put (({POINT_INTERVAL[NATURAL_8]}).type_id, ({INTERVAL[NATURAL_8]}).type_id)
			Result.put (({POINT_INTERVAL[NATURAL_16]}).type_id, ({INTERVAL[NATURAL_16]}).type_id)
			Result.put (({POINT_INTERVAL[NATURAL_32]}).type_id, ({INTERVAL[NATURAL_32]}).type_id)
			Result.put (({POINT_INTERVAL[NATURAL_64]}).type_id, ({INTERVAL[NATURAL_64]}).type_id)

			Result.put (({POINT_INTERVAL[REAL_32]}).type_id, ({INTERVAL[REAL_32]}).type_id)
			Result.put (({POINT_INTERVAL[REAL_64]}).type_id, ({INTERVAL[REAL_64]}).type_id)

			Result.put (({POINT_INTERVAL[DATE]}).type_id, ({INTERVAL[DATE]}).type_id)
			Result.put (({POINT_INTERVAL[TIME]}).type_id, ({INTERVAL[TIME]}).type_id)
			Result.put (({POINT_INTERVAL[DATE_TIME]}).type_id, ({INTERVAL[DATE_TIME]}).type_id)
			Result.put (({POINT_INTERVAL[DATE_TIME_DURATION]}).type_id, ({INTERVAL[DURATION]}).type_id)
		end

	dt_primitive_sequence_conforming_types: HASH_TABLE [INTEGER, INTEGER]
			-- this table contains abstract DT primitive sequence types found in `dt_primitive_sequence_types'
			-- keyed by concrete types which conform to them, e.g. LINKED_LIST [INTEGER] etc. It is populated
			-- due to repeated calling, thus only contains type ids of types that actually get converted
			-- into DT form.
		once
			create Result.make(0)
		end

	dt_primitive_sequence_interval_conforming_types: HASH_TABLE [INTEGER, INTEGER]
			-- this table contains abstract DT primitive sequence of interval types found in `dt_primitive_sequence_interval_types'
			-- keyed by concrete types which conform to them, e.g. LINKED_LIST [INTEGER] etc. It is populated
			-- due to repeated calling, thus only contains type ids of types that actually get converted
			-- into DT form.
		once
			create Result.make(0)
		end

	dt_primitive_interval_conforming_types: HASH_TABLE [INTEGER, INTEGER]
			-- this table contains abstract DT primitive interval types found in `dt_primitive_interval_types'
			-- keyed by concrete types which conform to them, e.g. LINKED_LIST [INTEGER] etc. It is populated
			-- due to repeated calling, thus only contains type ids of types that actually get converted
			-- into DT form.
		once
			create Result.make(0)
		end

	odin_inferred_primitive_sequence_conforming_types: HASH_TABLE [INTEGER, INTEGER]
			-- this table contains abstract DT primitive sequence types found in `odin_inferred_primitive_sequence_types'
			-- keyed by concrete types which conform to them, e.g. LINKED_LIST [INTEGER] etc. It is populated
			-- due to repeated calling, thus only contains type ids of types that actually get converted
			-- into DT form.
		once
			create Result.make(0)
		end

	dt_dynamic_types: HASH_TABLE [INTEGER, STRING]
		once
			create Result.make(0)
		end

end


