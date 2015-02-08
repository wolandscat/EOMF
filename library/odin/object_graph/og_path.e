note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Object representation of an ADL path. This abstraction allows ADL style paths to be created and manipulated. 
				 An ADL path is a simplified form of an Xpath, and contains 'predicate' sections, e.g. /items[at0004] which 
				 in pure Xpath  would be /items[@node_id = 'at0004']. At the moment there is no constraint on what can be in 
				 predicates (e.g. there is no Xpath parsing).
				 
				 'Pure' paths, i.e. with no predicates can also be handled; a path string containing predicates can be parsed
				 as if it contained no predicates, i.e. /items[at0004/events[1] would be read as /items/events.
				 ]"
	keywords:    "test, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class OG_PATH

inherit
	HASHABLE
		redefine
			is_equal, out
		end

	ITERABLE [OG_PATH_ITEM]
		undefine
			is_equal, out
		end

create
	make_absolute, make_relative, make_movable, make_from_string, make_from_other, make_root, make_pure_from_string

feature -- Definitions

	movable_leader: STRING = "//"

	segment_separator: CHARACTER = '/'

	segment_separator_string: STRING = "/"

	feature_call_separator: CHARACTER = '/'

feature -- Initialisation

	make_root
			-- make a root path, i.e. /
		do
			create items.make(0)
			is_absolute := True
		ensure
			is_absolute
			is_root
		end

	make_absolute (a_path_segment: OG_PATH_ITEM)
			-- make a path of the form /attr_name[xxx]/attr_name/attr_name[xxx]...
		do
			create items.make(0)
			items.extend(a_path_segment)
			is_absolute := True
		ensure
			is_absolute
		end

	make_relative (a_path_segment: OG_PATH_ITEM)
			-- make a path of the form attr_name[xxx]/attr_name[xxx]...
		do
			create items.make(0)
			items.extend (a_path_segment)
		ensure
			not is_absolute and not is_movable
		end

	make_movable (a_path_segment: OG_PATH_ITEM)
			-- make a path of the form //attr_name[xxx]/attr_name[xxx]...
			-- point, equivalen to Xpath "//" path
		do
			create items.make(0)
			items.extend (a_path_segment)
			is_movable := True
		ensure
			is_movable
		end

	make_from_string (s: STRING)
			-- make from `s'
		require
			valid_path_string (s)
		do
			parser.execute(s)
			if attached parser.output as att_op then
				is_absolute := att_op.is_absolute
				is_terminal := att_op.is_terminal
				items := att_op.items
			end
		end

	make_pure_from_string (s: STRING)
			-- make a path containing no predicates, only attribute names
			-- stripping predicates from `s' if necessary
		require
			valid_path_string(s)
		local
			s1: STRING
		do
			s1 := strip_predicates(s)
			parser.execute(s1)
			if attached parser.output as att_op then
				is_absolute := att_op.is_absolute
				is_terminal := att_op.is_terminal
				items := att_op.items
			end
		end

	make_from_other (other: OG_PATH)
			-- FIXME: created because clone does not work in dotnet
		do
			is_absolute := other.is_absolute
			is_terminal := other.is_terminal
			is_movable := other.is_movable
			create items.make(0)
			across other.items as other_csr loop
				items.extend (create {OG_PATH_ITEM}.make_from_other (other_csr.item))
			end
		end

feature -- Access

	items: ARRAYED_LIST [OG_PATH_ITEM]
		attribute
			create Result.make (0)
		end

	new_cursor: INDEXABLE_ITERATION_CURSOR [OG_PATH_ITEM]
			-- Fresh cursor associated with current structure
		do
			Result := items.new_cursor
		end

	item: OG_PATH_ITEM
		require
			not is_empty
		do
			Result := items.item
		end

	first: OG_PATH_ITEM
		require
			not is_empty
		do
			Result := items.first
		end

	last: OG_PATH_ITEM
		require
			not is_empty
		do
			Result := items.last
		end

	count: INTEGER
		do
			Result := items.count
		end

	i_th (i: INTEGER): OG_PATH_ITEM
		require
			i > 0 and i <= count
		do
			Result := items.i_th (i)
		end

	hash_code: INTEGER
			-- hashing code based on hash code of string form
		do
			Result := as_string.hash_code
		end

	parent_path: OG_PATH
			-- the parent path of the current path, i.e. same path minus the last segment
		require
			not is_root
		do
			create Result.make_from_other (Current)
			Result.remove_last
		end

	sub_path: OG_PATH
			-- the current path minus the first segment
		require
			not is_final
		do
			from
				start
				forth	-- miss first item
				create Result.make_relative(item.deep_twin)
				if is_terminal then
					Result.set_terminal
				end
				forth
			until
				off
			loop
				Result.items.extend(create {OG_PATH_ITEM}.make_from_other(item.deep_twin))
				forth
			end
		ensure
			Result_relative: not Result.is_absolute
		end

	sub_path_from_item: OG_PATH
			-- the section of the current path from current `item' position to the end
		do
			create Result.make_relative (item.deep_twin)
			if is_terminal then
				Result.set_terminal
			end
			forth

			from
			until
				off
			loop
				Result.items.extend(create {OG_PATH_ITEM}.make_from_other(item.deep_twin))
				forth
			end
		ensure
			Result_relative: not Result.is_absolute
		end

	last_object_node_id: STRING
			-- obtain last object node_id in path if it exists, else return an empty string
		do
			from
				items.finish
			until
				items.off or items.item.is_addressable
			loop
				items.back
			end
			if not items.off then
				Result := items.item.object_id
			else
				create Result.make_empty
			end
		end

feature -- Cursor Movement

	start
		do
			items.start
		end

	finish
		do
			items.finish
		end

	forth
		do
			items.forth
		end

	back
		do
			items.back
		end

	go_i_th (i: INTEGER)
			-- move to ith item from start
		do
			items.go_i_th (i)
		end

feature -- Status Report

	is_equal (other: OG_PATH): BOOLEAN
			-- True if `other' and this path are identical
		do
			debug("ADL_tree")
				io.putstring("%TComparing path " + as_string + " ?= " + other.as_string + "%N")
			end
			Result := as_string.is_equal(other.as_string)
		end

	is_absolute: BOOLEAN
			-- True if this path is relative to the root of hierarchical structure

	is_movable: BOOLEAN
			-- True if this path is a pattern which may apply anywhere from the
			-- reference point down. Corresponds to Xpath '//' paths

	is_terminal: BOOLEAN
			-- True if this path refers to a node which is the last addressable node in a chain
			-- (not necessarily a leaf node in the structure, however, since leaf nodes often
			-- have no addressing)

	is_root: BOOLEAN
			-- True if this path refers to root node, i.e. it is the path '/'
		do
			Result := items.is_empty and is_absolute
		end

	is_empty: BOOLEAN
		do
			Result := items.is_empty
		end

	is_last: BOOLEAN
		do
			Result := items.islast
		end

	is_compressed: BOOLEAN
			-- True if this path has a leading compressed path in its first attribute
		do
			Result := not is_empty and then items.first.is_compressed
		end

	off: BOOLEAN
		do
			Result := items.off
		end

	is_final: BOOLEAN
			-- true if path has only one segment
		do
			Result := items.count = 1
		end

	has_addressable_item: BOOLEAN
			-- True if there is at least one addressable item (i.e. predicate) in this path
		do
			Result := items.there_exists (agent (a_path_item: OG_PATH_ITEM): BOOLEAN do Result := a_path_item.is_addressable end)
		end

feature -- Validation

	valid_path_string (a_path: STRING): BOOLEAN
			-- True if a_path parses properly;
			-- if False, error in invalid_path_string_reason
		require
			not a_path.is_empty
		do
			parser.execute (a_path)
			if parser.syntax_error then
				invalid_path_string_reason.append (parser.errors.as_string)
			else
				Result := True
			end
		end

	invalid_path_string_reason: STRING
		attribute
			create Result.make_empty
		end

feature -- Modification

	remove_first
			-- remove the first path item
		do
			items.start
			items.remove
		end

	remove_last
			-- remove the first path item
		do
			items.finish
			items.remove
		end

	append_segment (an_item: OG_PATH_ITEM)
			-- add segment to the end
		require
			Segment_not_compressed: not an_item.is_compressed
		do
			items.extend(an_item)
		end

	prepend_segment (an_item: OG_PATH_ITEM)
			-- add segment to the front
		require
			Not_compressed: not is_compressed
		do
			items.put_front(an_item)
		end

	append_path (a_path: OG_PATH)
			-- add a_path to the end
		require
			Path_not_compressed: not a_path.is_compressed
		do
			items.append (a_path.items)
		end

	prepend_path (a_path: OG_PATH)
			-- add a_path to the beginning, and copy `is_absolute' and `is_movable' if necessary
		require
			Not_compressed: not is_compressed
		local
			p: ARRAYED_LIST[OG_PATH_ITEM]
		do
			p := items
			items := a_path.items
			items.append (p)
			is_absolute := a_path.is_absolute
			is_movable := a_path.is_movable
		end

	compress_path (a_path: STRING)
			-- set attr_name of first item to a path ending in an attribute rather than the usual single attribute name;
			-- used for differential path processing
		require
			Path_valid: not a_path.is_empty
		do
			items.first.set_compressed_attr (a_path)
		ensure
			Attr_name_set: first.attr_name.is_equal (a_path)
			Is_compressed: is_compressed
		end

feature -- Status Setting

	set_absolute
		do
			is_absolute := True
		end

	set_terminal
		do
			is_terminal := True
		end

	set_movable
			-- set is_movable true
		do
			is_movable := True
		end

feature -- Comparison

	matches (a_path: STRING): BOOLEAN
			-- is `a_path' the same is the current path?
		require
			valid_path_string (a_path)
		do
			if a_path.count <= count then
				parser.execute (a_path)

				if attached parser.output as att_op then
					from
						att_op.start
						start
						Result := True
					until
						not Result and att_op.off
					loop
						Result := Result and item.is_equal(att_op.item)
						att_op.forth
					end
				end
			end
		end

feature -- Output

	out: STRING
			-- use as_string
		do
			Result := as_string
		end

	as_string: STRING
			--
		local
			csr: ARRAYED_LIST_CURSOR
		do
			csr := items.cursor

			create Result.make(0)
			start
			if is_absolute then
				Result.append_character(segment_separator)
			elseif is_movable then
				Result.append(movable_leader)
			end

			from
			until
				off or item.is_feature_call
			loop
				Result.append(item.as_string)
				if not items.islast then
					Result.append_character(segment_separator)
				end
				forth
			end
			items.go_to(csr)
		end

feature {NONE} -- Implementation

	parser: OG_PATH_VALIDATOR
		once
			create Result.make
		end

	strip_predicates (a_path: STRING): STRING
			-- remove all [] enclosed sections of `a_path'
		local
			i: INTEGER
		do
			create Result.make_empty
			from i := 1 until i > a_path.count loop
				if a_path.item(i) = '[' then
					from until a_path.item(i) = ']' or i = a_path.count loop
						i := i + 1
					end
				else
					Result.append_character (a_path.item (i))
				end
				i := i + 1
			end
		end

invariant
	Movable_validity: not (is_movable and is_absolute)

end


