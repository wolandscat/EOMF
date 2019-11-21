note
	component:   "Eiffel Object Modelling Framework"
	description: "Direction of a parameter of a routine; default value of 0 corresponds to 'in'."
	keywords:    "model, UML, BMM"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2019 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_PARAMETER_DIRECTION

feature -- Definitions

	Param_dir_in: INTEGER = 0
	Param_dir_out: INTEGER = 1
	Param_dir_inout: INTEGER = 2

feature -- Access

	value: INTEGER

feature -- Status Report

	valid_valid (a_val: INTEGER): BOOLEAN
		do
			Result := a_val >= Param_dir_in and a_val <= Param_dir_inout
		end

invariant
	valid_valid (value)

end


