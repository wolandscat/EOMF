note
	component:   "Eiffel Object Modelling Framework"
	description: "Abstract characteristics of a node that contains a reference to another node, implemented by paths. Serialises an object non-containment reference."
	keywords:    "data tree, serialisation, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class DT_REFERENCE

inherit
	ANY
		undefine
			is_equal
		end

feature -- Definitions

	Reference_pseudo_type: STRING = "(reference)"

feature -- Output

	as_string: STRING
		deferred
		end

feature {DT_OBJECT_CONVERTER} -- Conversion

	source_object_ref: detachable ANY
			-- reference to the object whose `source_object_field_index' field should be
			-- connected to the object referred to by the reference in this DT object

	source_object_field_index: INTEGER
			-- index of field in `source_object_ref'; to be used in a call to
			-- INTERNAL.set_reference_field(source_object_field_index, source_object_ref, the_target_object)

	is_source_object_container: BOOLEAN
			-- True if the source object is a container

	hash_key: detachable HASHABLE
			-- key for hash insertion if is_source_object_container set and the container is a hash_table

	set_source_object_details (an_object_ref: ANY; a_field_index: INTEGER)
			-- set the source_object values for a non-container source object into with the reference has to
			-- pasted at the i-th field
		do
			source_object_ref := an_object_ref
			source_object_field_index := a_field_index
		end

	set_hash_table_source_object_details (an_object_ref: ANY; a_hash_key: HASHABLE)
			-- set the source_object values for a container object, for which the reference has
			-- to be added to the container via a call to extend, after a check on whether it is a
			-- SEQUENCE or HASH_TABLE
		do
			source_object_ref := an_object_ref
			is_source_object_container := True
			hash_key := a_hash_key
		end

	set_sequence_source_object_details (an_object_ref: ANY)
			-- set the source_object values for a SEQUENCE object, for which the reference has
			-- to be added to the container via a call to extend, after a check on whether it is a
			-- SEQUENCE or HASH_TABLE
			-- FIXME: it should ideally record position, and do inserts, but this is tricky to compute, and
			-- doesn't work for HASH_TABLE anyway, so we assume extend semantics for now
		do
			source_object_ref := an_object_ref
			is_source_object_container := True
		end

end


