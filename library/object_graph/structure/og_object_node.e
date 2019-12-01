note
	component:   "Eiffel Object Modelling Framework"
	description: "Non-terminal OBJECT node in Object Graph"
	keywords:    "object graph, document object model"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2004- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class OG_OBJECT_NODE

inherit
	OG_OBJECT
		undefine
			default_create
		redefine
			parent
		end

	OG_NODE
		redefine
			parent
		end

create
	make, make_anonymous

feature -- Access

	parent: detachable OG_ATTRIBUTE_NODE

	path_map: HASH_TABLE [OG_ITEM, OG_PATH]
			-- obtain all paths below this point
			-- compute in an efficient fashion
		local
			child_attr: like child_type
			a_path: OG_PATH
			sub_child_obj: OG_OBJECT
		do
			create Result.make(0)

			-- get the attributes of this object
			across children as child_attrs_csr loop
				child_attr := child_attrs_csr.item

				-- add an attribute path
				create a_path.make_relative (create {OG_PATH_ITEM}.make (child_attr.node_id))
				if is_root then
					a_path.set_absolute
				end
				Result.put (child_attr, a_path)

				-- get the objects of this attribute
				across child_attr.children as sub_child_objs_csr loop
					sub_child_obj := sub_child_objs_csr.item

					-- obtain paths from the object level below and prepend them with a
					-- path item representing the current node
					if attached {OG_OBJECT_NODE} sub_child_obj as sub_child_obj_node then
						across sub_child_obj_node.path_map as sub_child_all_paths_csr loop
							a_path := sub_child_all_paths_csr.key.twin

							if sub_child_obj_node.is_addressable then
								if attached {OG_OBJECT_PROXY} sub_child_obj_node as og_proxy and then not og_proxy.has_sibling_target and then attached og_proxy.target_object as att_targ_obj then
									a_path.prepend_segment (create {OG_PATH_ITEM}.make_with_object_id (child_attr.node_id, att_targ_obj.node_id))
								else
									a_path.prepend_segment (create {OG_PATH_ITEM}.make_with_object_id (child_attr.node_id, sub_child_obj_node.node_id))
								end
							else
								a_path.prepend_segment (create {OG_PATH_ITEM}.make (child_attr.node_id))
							end
							if attached child_attr.differential_path as att_diff_path then
								a_path.prepend_path (att_diff_path.deep_twin)
							end
							if is_root then
								a_path.set_absolute
							end
							Result.put (sub_child_all_paths_csr.item, a_path)
						end
					end

					-- add path for the current child object
					create a_path.make_relative (create {OG_PATH_ITEM}.make_with_object_id (child_attr.node_id, sub_child_obj.node_id))
					if attached child_attr.differential_path as att_diff_path then
						a_path.prepend_path (att_diff_path.deep_twin)
					end
					if is_root then
						a_path.set_absolute
					end
					Result.put (sub_child_obj, a_path)
				end
			end

			-- root path is a special case that doesn't literally correspond to a real node
			if is_root then
				Result.put (Current, path)
			end
		end

	object_nodes_at_path (a_path: STRING): ARRAYED_LIST [OG_OBJECT]
			-- find the object node at the relative path `a_path'
		local
			og_path: OG_PATH
		do
			create Result.make (0)
			create og_path.make_from_string (a_path)
			if og_path.is_root then
				Result.extend (Current)
			else
				-- check for compressed paths & convert path if necessary
				Result := object_nodes_at_cpath (compress_path (og_path))
			end
		end

	attribute_nodes_at_path (a_path: STRING): ARRAYED_LIST [OG_ATTRIBUTE_NODE]
			-- find the attribute node corresponding the the terminal segment of `a_path'
		do
			-- check for compressed paths & convert path if necessary
			Result := attribute_nodes_at_cpath (compress_path (create {OG_PATH}.make_from_string (a_path)))
		end

feature -- Status Report

	has_path (a_path: STRING): BOOLEAN
			-- `a_path' exists in object structure
		local
			og_path: OG_PATH
		do
			create og_path.make_from_string (a_path)
			if og_path.is_root then
				Result := is_root
			else
				-- check for compressed paths & convert path if necessary
				Result := has_cpath (compress_path (og_path))
			end
		end

	has_object_path (a_path: STRING): BOOLEAN
			-- `a_path' refers to an object node in structure
		local
			og_path: OG_PATH
		do
			create og_path.make_from_string (a_path)
			if og_path.is_root then
				Result := is_root
			else
				-- check for compressed paths & convert path if necessary
				Result := not object_nodes_at_cpath (compress_path (og_path)).is_empty
			end
		end

	has_attribute_path (a_path: STRING): BOOLEAN
			-- `a_path' refers to an attribute node in structure
		local
			og_path: OG_PATH
		do
			create og_path.make_from_string (a_path)
			if og_path.is_root then
				Result := False
			else
				-- check for compressed paths & convert path if necessary
				Result := not attribute_nodes_at_cpath (compress_path (og_path)).is_empty
			end
		end

feature -- Modification

	replace_attribute_name (old_name, new_name: STRING)
			-- change the name of an attribute
		require
			Old_name_valid: has_child_with_id (old_name)
			New_name_valid: not new_name.is_empty
		do
			child_with_id (old_name).set_node_id (new_name)
			children.replace_key (new_name, old_name)
		end

feature {OG_OBJECT_NODE} -- Implementation

	child_type: OG_ATTRIBUTE_NODE
			-- relationship target type
		once
			create Result.make_single (Anonymous_node_id)
		end

	has_cpath (a_cpath: OG_PATH): BOOLEAN
			-- True if there is any node at the possibly compressed path `a_cpath'
		local
			child_objs: ARRAYED_LIST [OG_OBJECT]
			child_path: OG_PATH
		do
			if a_cpath.is_final then
				if a_cpath.first.is_addressable then
					Result := not objects_at_path_segment (a_cpath.first).is_empty
				else
					Result := attached attribute_at_path_segment (a_cpath.first)
				end
			else
				child_path := a_cpath.sub_path
				child_objs := objects_at_path_segment (a_cpath.first)
				Result := across child_objs as child_objs_csr some
					attached {OG_OBJECT_NODE} child_objs_csr.item as att_obj_node and then
					att_obj_node.has_cpath (child_path)
				end
			end
		end

	object_nodes_at_cpath (a_cpath: OG_PATH): ARRAYED_LIST [OG_OBJECT]
			-- find the child objects matching possibly compressed path `a_cpath'
		local
			child_objs: ARRAYED_LIST [OG_OBJECT]
			child_path: OG_PATH
		do
			create Result.make (0)
			child_objs := objects_at_path_segment (a_cpath.first)
			if a_cpath.is_final then
				Result := child_objs
			else
				child_path := a_cpath.sub_path
				across child_objs as child_objs_csr loop
					if attached {OG_OBJECT_NODE} child_objs_csr.item as att_obj_node then
						Result.append (att_obj_node.object_nodes_at_cpath (child_path))
					end
				end
			end
		end

	attribute_nodes_at_cpath (a_cpath: OG_PATH): ARRAYED_LIST [OG_ATTRIBUTE_NODE]
			-- find the child attributes matching possibly compressed path `a_cpath'
		local
			child_path: OG_PATH
		do
			create Result.make (0)
			if a_cpath.is_final then
				if attached attribute_at_path_segment (a_cpath.first) as att_og_attr then
					Result.extend (att_og_attr)
				end
			else
				child_path := a_cpath.sub_path
				across objects_at_path_segment (a_cpath.first) as child_objs_csr loop
					if attached {OG_OBJECT_NODE} child_objs_csr.item as att_obj_node then
						Result.append (att_obj_node.attribute_nodes_at_cpath (child_path))
					end
				end
			end
		end

	attribute_at_path_segment (a_path_segment: OG_PATH_ITEM): detachable OG_ATTRIBUTE_NODE
			-- attribute node(s) at `a_path_segment'
		do
			if children.has (a_path_segment.attr_name) and then attached children.item (a_path_segment.attr_name) as an_attr_node then
				Result := an_attr_node
			end
		end

	objects_at_path_segment (a_path_segment: OG_PATH_ITEM): ARRAYED_LIST [OG_OBJECT]
			-- object node(s) at `a_path_segment'
		do
			create Result.make (0)
			if attached attribute_at_path_segment (a_path_segment) as an_attr_node then
				if a_path_segment.is_addressable then
					if an_attr_node.has_child_with_id (a_path_segment.object_id) then
						Result.extend (an_attr_node.child_with_id (a_path_segment.object_id))
					elseif an_attr_node.has_proxy_child_with_target_id (a_path_segment.object_id) then
						Result.extend (an_attr_node.proxy_child_with_target_id (a_path_segment.object_id))
					end
				else
					Result.append (an_attr_node.all_children)
				end
			end
		end

	compress_path (a_path: OG_PATH): OG_PATH
			-- if there is an attribute under this object node with a differential path matching `a_path',
			-- generate a new path whose first attribute contains the differential section in it;
			-- else return the original `a_path'
		require
			Path_valid: not a_path.is_compressed
		local
			cand_path, a_path_str: STRING
		do
			if is_root then
				a_path_str := a_path.as_string
				create cand_path.make (0)
				across children as child_csr loop
					-- if there is a differential path and it fits inside the search path, the search path could be off that attribute
					if child_csr.item.has_differential_path and then a_path_str.starts_with (child_csr.key) and child_csr.key.count > cand_path.count then
						cand_path := child_csr.key
					end
				end
				if not cand_path.is_empty and attached children.item (cand_path) as att_item and then attached att_item.differential_path as att_diff_path then
					a_path.go_i_th (att_diff_path.count + 1)
					Result := a_path.sub_path_from_item
					Result.compress_path (cand_path)
					if a_path.is_absolute then
						Result.set_absolute
					end
				else
					Result := a_path
				end
			else
				Result := a_path
			end
		end

end


