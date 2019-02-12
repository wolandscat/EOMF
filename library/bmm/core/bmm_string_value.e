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
	BMM_VALUE
		redefine
			bmm_type, value
		end

create
	make_value

feature -- Access

	bmm_type: BMM_SIMPLE_TYPE
		attribute
			Result := String_type
		end

	value: STRING
		attribute
			create {STRING} Result.make_from_string ("default")
		end

end

