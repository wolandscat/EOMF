note
	component:   "Eiffel Object Modelling Framework"
	description: "Instance value. In an abstract syntax, represented by a literal value."
	keywords:    "model, UML, BMM"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2019 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_VALUE

inherit
	BMM_VALUE_RETURNING

create
	make

feature -- Initialisation

	make (a_value: like value; a_bmm_type: like bmm_type)
		do
			value := a_value
			bmm_type := a_bmm_type
		end

feature -- Access

	value: ANY

end


