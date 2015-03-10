note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Any OBJECT node in object parse tree, including real OBJECTs,
				 simple OBJECTs, real OBJECT 'use' references, and OBJECTs
				 which represent constraints on other archetypes.
				 ]"
	keywords:    "object graph, document object model"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2004- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class OG_OBJECT

inherit
	OG_ITEM
		redefine
			parent
		end

feature -- Initialisation

	make_anonymous
			-- make an anonymous node with optional content item
		obsolete
			"deprecated form of node creation; all nodes should have ids"
		do
			make (Anonymous_node_id)
		end

feature -- Access

	parent: detachable OG_ATTRIBUTE_NODE

feature -- Status Report

	is_addressable: BOOLEAN
			-- True if this node has a proper node_id
			-- node_id must not be something like "unknown" or "unknown_1", "unknown_2" etc
		do
			Result := not node_id.starts_with (Anonymous_node_id)
		end

end


