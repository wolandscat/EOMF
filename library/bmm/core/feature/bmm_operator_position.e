note
	component:   "Eiffel Object Modelling Framework"
	description: "Lexical position of operator with respect to parameters."
	keywords:    "model, BMM"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2019 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_OPERATOR_POSITION

feature -- Definitions

	Position_infix: INTEGER = 0
	Position_prefix: INTEGER = 1

feature -- Access

	value: INTEGER

feature -- Status Report

	valid_valid (a_val: INTEGER): BOOLEAN
		do
			Result := a_val >= Position_infix and a_val <= Position_prefix
		end

invariant
	valid_valid (value)

end


