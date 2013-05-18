note
	component:   "Eiffel Object Modelling Framework"
	description: "Basic Meta-model abstraction of a single-valued property"
	keywords:    "model, UML"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2009-2010 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class BMM_SINGLE_PROPERTY_OPEN

inherit
	BMM_PROPERTY_DEFINITION
		redefine
			type
		end

create
	make

feature -- Access

	type: BMM_GENERIC_PARAMETER_DEFINITION

end


