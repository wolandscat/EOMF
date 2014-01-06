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
			make as make_object, make_anonymous as make_anonymous_object
		redefine
			all_paths
		end

create
	make, make_anonymous

feature -- Initialisation

	make (a_node_id, a_ref_path: STRING)
			-- make with a node id and a path
		require
			is_valid_path (a_ref_path)
		do
			create target_path.make_from_string (a_ref_path)
			make_object (a_node_id)
		end

	make_anonymous (a_ref_path: STRING)
			-- make with a path
		require
			is_valid_path (a_ref_path)
		do
			create target_path.make_from_string (a_ref_path)
			make_anonymous_object
		end

feature -- Access

	target_path: OG_PATH

	all_paths: HASH_TABLE [OG_ITEM, OG_PATH]
			-- obtain all paths below this point, including this node
			-- compute in an efficient fashion. Don't do anything if path doesn't point to
			-- an object in the structure or if it points to an object that is a parent
			-- of the current object
		local
			csr: OG_ITEM
			targ_objs: ARRAYED_LIST [OG_OBJECT]
		do
			create Result.make(0)

			-- find structure root point
			from csr := Current until csr.parent = Void loop
				check attached csr.parent as p then
					csr := p
				end
			end

			-- get target object
			if attached {OG_OBJECT_NODE} csr as og_root_obj then
				targ_objs := og_root_obj.object_nodes_at_path (target_path.as_string)
				if not targ_objs.is_empty and then attached {OG_OBJECT_NODE} targ_objs.first as targ_obj and then
					not path.as_string.starts_with (targ_obj.path.as_string)
				then
					Result := targ_obj.all_paths
				end
			end
		end

feature -- Validation

	is_valid_path (a_path: STRING): BOOLEAN
			-- path is valid syntactically
		do
			Result := (create {OG_PATH}.make_root).valid_path_string (a_path)
		end

end

