note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Object Graph path segment, consisting of an attribute name and an object id, which is 
				 either empty, as in the case of single attributes, or some identifier, needed to discriminate
				 among objects in a container referenced by the attribute.
				 ]"
	keywords:    "object graph, document object model"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class OG_PATH_ITEM

inherit
	ANY
		redefine
			is_equal
		end

create
	make, make_with_object_id, make_feature_call, make_from_other

feature -- Definitions

	feature_call_arg_delimiters: STRING = "()"

	predicate_left_delim: CHARACTER = '['

	predicate_right_delim: CHARACTER = ']'

feature -- Initialisation

	make (an_attr_name: STRING)
			-- make a path segment with an attribute and an empty object id -
			-- corresponds to single cardinality attribute or it could be
			-- a path segment for a multiple cardinality attribute but defaulting
			-- to the first object in the collection
		require
			an_attr_name_valid: not an_attr_name.is_empty
		do
			create attr_name.make_empty
			attr_name.append (an_attr_name)
			create object_id.make_empty
		ensure
			Attr_name_set: attr_name.is_equal(an_attr_name)
			Object_id_empty: object_id.is_empty
		end

	make_with_object_id (an_attr_name, an_object_id: STRING)
			-- make a path segment with an attribute name and an object id -
			-- corresponds to multiple child attribute
		require
			an_attr_name_valid: not an_attr_name.is_empty
		do
			attr_name := an_attr_name
			object_id := an_object_id
		ensure
			Attr_name_set: attr_name = an_attr_name
			Object_id_set: object_id = an_object_id
		end

	make_feature_call (a_feat_name: STRING)
		require
			a_feat_name_valid: not a_feat_name.is_empty
		do
			attr_name := a_feat_name
			is_feature_call := True
			create object_id.make_empty
		ensure
			Attr_name_set: attr_name = a_feat_name
			Object_id_empty: object_id.is_empty
			Is_feature_call: is_feature_call
		end

	make_from_other (other: OG_PATH_ITEM)
			-- FIXME: created because clone does not work in dotnet
		do
			is_feature_call := other.is_feature_call
			attr_name := other.attr_name.twin
			object_id := other.object_id.twin
		ensure
			Attr_name_set: attr_name.is_equal (other.attr_name)
			Object_id_set: object_id.is_equal (other.object_id)
		end

feature -- Access

	attr_name: STRING
			-- name of attribute of this path segment

	object_id: STRING
			-- id of object of this path segment, for attributes with cardinality > 1

feature -- Status Report

	is_feature_call: BOOLEAN

	is_addressable: BOOLEAN
			-- True if the object in this segment is identified
		do
			Result := not object_id.is_empty
		end

	is_equal (other: OG_PATH_ITEM): BOOLEAN
			-- True if `other' and this path item are identical
		do
			Result := attr_name.is_equal(other.attr_name) and object_id.is_equal(other.object_id) and
					is_feature_call = other.is_feature_call
		end

	is_compressed: BOOLEAN
			-- True if this path segment is compressed, i.e. has an attr_name containing a
			-- path separator
		do
			Result := attr_name.index_of ({OG_PATH}.segment_separator, 1) > 0
		end

feature -- Modification

	set_object_id (an_object_id: STRING)
			-- make a path segment with an attribute name and an object id -
			-- corresponds to multiple caridnality attribute case
		require
			an_object_id_valid: an_object_id /= Void
		do
			object_id := an_object_id
		ensure
			Object_id_set: object_id.is_equal(an_object_id) or else object_id.is_empty
		end

feature {OG_PATH} -- Modification

	set_compressed_attr (a_path: STRING)
			-- set attr_name to a path ending in an attribute rather than the usual single attribute name
		require
			Path_valid: not a_path.is_empty
		do
			attr_name := a_path
		ensure
			Attr_name_set: attr_name = a_path
			Is_compressed: is_compressed
		end

feature -- Output

	as_string: STRING
			-- output in string form
		do
			create Result.make(0)
			Result.append(attr_name)
			if is_addressable then
				Result.append (predicate_left_delim.out + object_id + predicate_right_delim.out)
			elseif is_feature_call then
				Result.append (feature_call_arg_delimiters)
			end
		end

invariant
	Validity: not (is_addressable and is_feature_call)
	Attr_name_valid: not attr_name.is_empty

end


