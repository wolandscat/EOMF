note
	component:   "Eiffel Object Modelling Framework"
	description: "Parameter referenceable within the scope of a routine."
	keywords:    "model, UML, BMM"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2019 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_PARAMETER

inherit
	BMM_VARIABLE

feature -- Access

	direction: BMM_PARAMETER_DIRECTION

end


