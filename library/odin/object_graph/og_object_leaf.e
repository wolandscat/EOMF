note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Any leaf OBJECT node in object graph
			 ]"
	keywords:    "object graph"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2004- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class OG_OBJECT_LEAF

inherit
	OG_OBJECT

create
	make, make_anonymous

feature -- Status Report

	is_leaf: BOOLEAN = True
			-- True if this object is a leaf object

end


