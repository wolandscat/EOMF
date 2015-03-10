note
	component:   "Eiffel Object Modelling Framework"
	description: "Abstract model of any visitable object in an object graph"
	keywords:    "visitor, object graph"
	author:      "Thomas Beale <wolandscat@gmail.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2004- Thomas Beale <http://wolandscat.net>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class OG_VISITABLE

feature -- Visitor

	enter_subtree (visitor: ANY; depth: INTEGER)
			-- perform action at start of block for this node
		require
			Depth_valid: depth >= 0
		deferred
		end

	exit_subtree (visitor: ANY; depth: INTEGER)
			-- perform action at end of block for this node
		require
			Depth_valid: depth >= 0
		deferred
		end

end


