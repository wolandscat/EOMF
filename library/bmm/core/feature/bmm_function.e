note
	component:   "Eiffel Object Modelling Framework"
	description: "Meta-type representing a function definition."
	keywords:    "model, UML"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2019- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_FUNCTION

inherit
	BMM_ROUTINE

feature -- Access

	operator_definition: BMM_OPERATOR
			-- Equivalent operator for this function, if any

end


