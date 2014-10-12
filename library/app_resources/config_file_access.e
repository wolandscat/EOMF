note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Access to a configuration file in ODIN format. Programmatic access uses paths to refer to 
				 any specific item.
				 ]"
	keywords:    "config, file"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class CONFIG_FILE_ACCESS

inherit
	SHARED_DT_OBJECT_CONVERTER
		export
			{NONE} all;
			{ANY} deep_twin, is_deep_equal, standard_is_equal
		end

	SHARED_RESOURCES
		export
			{NONE} all
		end

	EXCEPTIONS
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make (an_impl: CONFIG_FILE_ACCESS_I)
		do
			impl := an_impl
			create errors.make
			create refresh_listeners.make (0)
		end

	initialise (a_file_path: STRING)
			-- Make with `a_file_path', which doesn't necessarily exist as a file. If it does, it will be read;
			-- if not, nothing will be read, and the first save request will create the file new.
		do
			impl.set_file_path (a_file_path)
			load
		end

	initialise_create (a_file_path: STRING)
			-- Make with `a_file_path', which will be created new.
		do
			impl.set_file_path (a_file_path)
			create_default_dt_tree
			save
		end

feature -- Access

	file_path: STRING
			-- path to resource file
		do
			Result := impl.file_path
		end

	requested_resources: ARRAYED_SET [STRING]
			-- paths that the application has requsted so far
		do
			create Result.make (0)
			Result.compare_objects
			Result.merge (string_value_cache.current_keys)
			Result.merge (string_list_value_cache.current_keys)
			Result.merge (boolean_value_cache.current_keys)
			Result.merge (integer_value_cache.current_keys)
			Result.merge (object_value_cache.current_keys)
		end

	integer_value (a_path: STRING): INTEGER
			-- get the integer value for resource at `a_path'
		do
			if integer_value_cache.has (a_path) then
				Result := integer_value_cache.item (a_path)
			elseif has_resource (a_path) and then attached {INTEGER} dt_tree.value_at_path (a_path) as int then
				Result := int
				integer_value_cache.put (Result, a_path)
			end
		end

	boolean_value (a_path: STRING): BOOLEAN
			-- get the boolean value for resource at `a_path'
		do
			if boolean_value_cache.has (a_path) then
				Result := boolean_value_cache.item (a_path)
			elseif has_resource (a_path) and then attached {BOOLEAN} dt_tree.value_at_path (a_path) as bool then
				Result := bool
				boolean_value_cache.put (Result, a_path)
			end
		end

	string_value (a_path: STRING): STRING
			-- get the string value for resource at `a_path'; return empty string if nothing found
		do
			if string_value_cache.has (a_path) then
				check attached string_value_cache.item (a_path) as val then
					Result := val
				end
			else
				if has_resource (a_path) and then attached {STRING} dt_tree.value_at_path (a_path) as str then
					Result := str
				else
					create Result.make (0)
				end
				string_value_cache.put (Result, a_path)
			end
		end

	string_list_value (a_path: STRING): ARRAYED_LIST [STRING]
			-- List of items specified in file at `a_path'.
		do
			if string_list_value_cache.has (a_path) then
				check attached string_list_value_cache.item (a_path) as val then
					Result := val
				end
			else
				if has_resource (a_path) and then attached {ARRAYED_LIST [STRING]} dt_tree.value_list_at_path (a_path) as lst_str then
					Result := lst_str
				else
					create Result.make (0)
				end
				string_list_value_cache.put (Result, a_path)
			end
		end

	string_value_env_var_sub (a_path: STRING): STRING
			-- get the string value for `a_path', with any env vars of form "$var" substituted
		do
			if string_value_cache.has (a_path) then
				check attached string_value_cache.item (a_path) as val then
					Result := val
				end
			else
				if has_resource (a_path) and then attached {STRING} dt_tree.value_at_path (a_path) as str then
					Result := substitute_env_vars (str)
				else
					create Result.make (0)
				end
				string_value_cache.put (Result, a_path)
			end
		end

	any_value (a_path:  STRING): detachable ANY
			-- get the value for resource_name
		do
			if object_value_cache.has (a_path) then
				check attached object_value_cache.item (a_path) as val then
					Result := val
				end
			elseif has_resource (a_path) then
				Result := dt_tree.value_at_path (a_path)
				object_value_cache.put (Result, a_path)
			end
		end

	object_value (a_path: STRING; a_type_name: STRING): detachable ANY
			-- get complex object at `a_path'
		do
			if object_value_cache.has (a_path) then
				check attached object_value_cache.item (a_path) as val then
					Result := val
				end
			elseif has_resource (a_path) then
				if attached {DT_COMPLEX_OBJECT} dt_tree.node_at_path (a_path) as dt_obj then
					Result := dt_obj.as_object_from_string (a_type_name, Void)
					object_value_cache.put (Result, a_path)
				end
			end
		end

	errors: ERROR_ACCUMULATOR

feature -- Status Report

	is_dirty: BOOLEAN
			-- flag to indicate if any content-modifying call has been made since last call to `load' or `save'

	has_resource (a_path:  STRING): BOOLEAN
			-- True if there is a resource at `a_path'
		do
			Result := attached dt_tree and then dt_tree.has_path (a_path)
		end

feature -- Modification

	put_integer_value (a_path: STRING; a_value: INTEGER)
			-- put an instance of any ODIN leaf value type
		do
			put_dt_value (a_path, a_value)
			integer_value_cache.force (a_value, a_path)
		end

	put_boolean_value (a_path: STRING; a_value: BOOLEAN)
			-- put an instance of any ODIN leaf value type
		do
			put_dt_value (a_path, a_value)
			boolean_value_cache.force (a_value, a_path)
		end

	put_string_value (a_path: STRING; a_value: STRING)
			-- put an instance of any ODIN leaf value type
		do
			put_dt_value (a_path, a_value)
			string_value_cache.force (a_value, a_path)
		end

	put_string_list_value (a_path: STRING; a_value: ARRAYED_LIST [STRING])
			-- put an instance of any ODIN leaf value type
		do
			put_dt_value (a_path, a_value)
			string_list_value_cache.force (a_value, a_path)
		end

	put_object (a_path: STRING; a_value: ANY)
			-- convert a complex object to Data Tree form and put at `a_path' in current tree
			-- FIXME: currently only works for single child paths, i.e. not where the paths ends with xxx[zzz]
		local
			obj_dt_tree: DT_COMPLEX_OBJECT
		do
			if not attached dt_tree then
				create_default_dt_tree
			end
			obj_dt_tree := dt_object_converter.object_to_dt (a_value)
			if not dt_object_converter.errors.has_errors then
				if has_resource (a_path) and then attached dt_tree.attribute_node_at_path (a_path) as dt_attr then
					dt_attr.remove_all_children
					dt_attr.put_child (obj_dt_tree)
				else
					dt_tree.put_object_at_path (obj_dt_tree, a_path)
				end
			else
				raise ("put_object_conversion_failure for type " + a_value.generating_type + " to Data Tree form")
			end
			is_dirty := True
			object_value_cache.force (a_value, a_path)
		end

	add_refresh_listener (an_agent: PROCEDURE [ANY, TUPLE])
			-- add a listener to be executed on file reload
		do

		end

feature -- Element Removal

	remove_resource (a_path: STRING)
			-- remove the resource resource_name
		require
            Valid_path: has_resource (a_path)
		do
			check attached dt_tree.attribute_node_at_path (a_path) as dt_attr then
				dt_attr.parent.remove_attribute (dt_attr.im_attr_name)
			end
			is_dirty := True

			if string_value_cache.has (a_path) then
				string_value_cache.remove (a_path)
			elseif string_list_value_cache.has (a_path) then
				string_list_value_cache.remove (a_path)
			elseif boolean_value_cache.has (a_path) then
				boolean_value_cache.remove (a_path)
			elseif integer_value_cache.has (a_path) then
				integer_value_cache.remove (a_path)
			elseif object_value_cache.has (a_path) then
				object_value_cache.remove (a_path)
			end
		ensure
			Path_removed: not has_resource (a_path)
		end

feature -- Commands

	load
		do
			impl.load
			if not impl.errors.has_errors then
				dt_tree := impl.dt_tree

				-- update any refresh listeners
				across refresh_listeners as listeners_csr loop
					 listeners_csr.item.call ([])
				end
				is_dirty := False
			end
		end

	save
			-- serialise to file
		do
			check attached dt_tree as dtt then
				impl.save (dtt)
			end
			is_dirty := False
		end

feature {NONE} -- Implementation

	impl: CONFIG_FILE_ACCESS_I

	env_var_pattern_matcher: RX_PCRE_REGULAR_EXPRESSION
			-- pattern for detecting $NAME in config values
		once
			create Result.make
			Result.compile (env_var_pattern)
		end

	env_var_pattern: STRING = "\$[a-zA-Z0-9_]+"

	dt_tree: detachable DT_COMPLEX_OBJECT

	create_default_dt_tree
		do
			create dt_tree.make_anonymous
		end

	refresh_listeners: ARRAYED_LIST [PROCEDURE [ANY, TUPLE]]
			-- listeners to execute on file refresh

	string_value_cache: HASH_TABLE [STRING, STRING]
			-- String values already found this session
		once
			create Result.make (0)
		end

	string_list_value_cache: HASH_TABLE [ARRAYED_LIST [STRING], STRING]
			-- String list values already found this session
		once
			create Result.make (0)
		end

	boolean_value_cache: HASH_TABLE [BOOLEAN, STRING]
			-- Boolean values already found this session
		once
			create Result.make (0)
		end

	integer_value_cache: HASH_TABLE [INTEGER, STRING]
			-- Integer values already found this session
		once
			create Result.make (0)
		end

	object_value_cache: HASH_TABLE [detachable ANY, STRING]
			-- Reference object values already found this session
		once
			create Result.make (0)
		end

	put_dt_value (a_path: STRING; a_value: ANY)
			-- put an instance of any ODIN leaf value type
		do
			if not attached dt_tree then
				create_default_dt_tree
			end
			if has_resource (a_path) then
				dt_tree.set_value_at_path (a_value, a_path)
			else
				dt_tree.put_value_at_path (a_value, a_path)
			end
			is_dirty := True
		end

end

