note
	component:   "Eiffel Object Modelling Framework"
	description: "Abstract model of any visitable object"
	keywords:    "archetype, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2004- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class VISITABLE

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


