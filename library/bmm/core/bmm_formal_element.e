note
	component:   "Eiffel Object Modelling Framework"
	description: "A formal element of an enclosing entity, that has at least a name, and a signature."
	keywords:    "model, UML, BMM"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2019 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class BMM_FORMAL_ELEMENT

inherit
	BMM_MODEL_ELEMENT

feature -- Access

	scope: BMM_MODEL_ELEMENT
			-- Model element within which this formal element is known.
		deferred
		end

	signature: STRING
			-- Formal signature of this element, in the form 'name <arg1_name: T_arg1, ...'
		deferred
		end

end


