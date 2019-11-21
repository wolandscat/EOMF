note
	component:   "Eiffel Object Modelling Framework"
	description: "A mutable value-returning entity, i.e. one whose value may change during computation."
	keywords:    "model, UML, BMM"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2019 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class BMM_TYPED_FEATURE

inherit
	BMM_TYPED

feature -- Access

	is_nullable: BOOLEAN
			-- True if this element can be null at execution time. May be interpreted as optionality in subtypes.

end


