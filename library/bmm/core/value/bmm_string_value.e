note
	component:   "Eiffel Object Modelling Framework"
	description: "Meta-type for a String value, for which type is fixed to the BMM_TYPE representing String."
	keywords:    "model, UML, BMM"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2019 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_STRING_VALUE

inherit
	BMM_PRIMITIVE_VALUE
		redefine
			value
		end

create
	make, make_value

feature -- Access

	value: STRING
		attribute
			create {STRING} Result.make_from_string ("default")
		end

end

