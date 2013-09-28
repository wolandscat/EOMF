note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Abstract model of any complex data item whose contents are made available in a linear 
				 vector that can be used by generic screen populating or reporting methods.
				 ]"
	keywords:    "statistics"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class GENERIC_RENDERABLE

feature -- Access

	as_vector: LIST [ANY]
			-- vector representation for use with generic screen populating methods
		deferred
		end

feature -- Status Report

	is_populated: BOOLEAN
		deferred
		end

end


