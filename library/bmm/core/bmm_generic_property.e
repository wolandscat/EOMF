note
	component:   "Eiffel Object Modelling Framework"
	description: "Concept of an attribute that has a generic type."
	keywords:    "model, UML"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2009 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class BMM_GENERIC_PROPERTY

inherit
	BMM_PROPERTY_DEFINITION
		redefine
			type
		end

create
	make

feature -- Access (attributes from schema)

	type: BMM_GENERIC_TYPE_REFERENCE
			-- type of the container of this attribute from its containing class

end


