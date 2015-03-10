note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Special OBJECT node that can reference another object in an object graph, forming 
				 an 'internal reference'. The internal reference is represented as an absolute path from the top
				 of the current structure to some other object that is  that is  that is to be treated as
				 if it also existed under the present object.
				 ]"
	keywords:    "object graph"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class OG_OBJECT_PROXY

inherit
	OG_OBJECT_NODE
		rename
			make as make_object
		redefine
			path_map, has_cpath, object_nodes_at_cpath, attribute_nodes_at_cpath
		end

create
	make

feature -- Initialisation

	make (a_node_id, a_ref_path: STRING)
			-- make with a node id and a path
		require
			is_valid_path (a_ref_path)
		do
			create target_path.make_from_string (a_ref_path)
			make_object (a_node_id)
		end

feature -- Access

	target_path: OG_PATH
		attribute
			create Result.make_root
		end

	target_object: detachable OG_OBJECT_NODE
			-- object at `target_path', not attached if the path is not valid in the
			-- current structure
		local
			csr: OG_ITEM
			targ_objs: ARRAYED_LIST [OG_OBJECT]
		do
			-- find structure root point
			from csr := Current until csr.parent = Void loop
				check attached csr.parent as p then
					csr := p
				end
			end

			-- get target object
			if attached {OG_OBJECT_NODE} csr as og_root_obj then
				targ_objs := og_root_obj.object_nodes_at_path (target_path.as_string)
				if not targ_objs.is_empty and then attached {OG_OBJECT_NODE} targ_objs.first as att_obj_node then
					Result := att_obj_node
				end
			end
		end

	path_map: HASH_TABLE [OG_ITEM, OG_PATH]
			-- obtain all paths below this point, including this node
			-- compute in an efficient fashion. 
		do
			if attached target_object as att_targ_obj then
				Result := att_targ_obj.path_map
			else
				create Result.make (0)
			end
		end

feature -- Status Report

	has_sibling_target: BOOLEAN
			-- True if target path is a sibling of path of this proxy object
			-- If so, paths through this object should use this objects node-id, and
			-- append the paths of the children of the target;
			-- otherwise, they should bypass this node, and use the target node and
			-- its children
		do
			Result := path.parent_path.as_string.same_string (target_path.parent_path.as_string)
		end

feature -- Validation

	is_valid_path (a_path: STRING): BOOLEAN
			-- path is valid syntactically and is not in path of current object
		do
			Result := (create {OG_PATH}.make_root).valid_path_string (a_path)

			-- can't include following since it causes path routines that 
			-- reference Current to be invoked during creation of this object
			--	and not path.as_string.starts_with (a_path)
		end

feature {OG_OBJECT_NODE} -- Implementation

	has_cpath (a_cpath: OG_PATH): BOOLEAN
			-- True if there is any node at the possibly compressed path `a_cpath'
		do
			if attached target_object as att_targ_obj then
				Result := att_targ_obj.has_cpath (a_cpath)
			end
		end

	object_nodes_at_cpath (a_cpath: OG_PATH): ARRAYED_LIST [OG_OBJECT]
			-- find the child objects matching possibly compressed path `a_cpath'
		do
			if attached target_object as att_targ_obj then
				Result := att_targ_obj.object_nodes_at_cpath (a_cpath)
			else
				create Result.make (0)
			end
		end

	attribute_nodes_at_cpath (a_cpath: OG_PATH): ARRAYED_LIST [OG_ATTRIBUTE_NODE]
			-- find the child attributes matching possibly compressed path `a_cpath'
		do
			if attached target_object as att_targ_obj then
				Result := att_targ_obj.attribute_nodes_at_cpath (a_cpath)
			else
				create Result.make (0)
			end
		end

end

