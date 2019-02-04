note
	component:   "Eiffel Object Modelling Framework"
	description: "Parent of type meta-types that correspond directly to class definitions."
	keywords:    "model, BMM"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class BMM_DEFINED_TYPE

inherit
	BMM_UNITARY_TYPE

feature -- Initialisation

	make (a_class: like effective_base_class)
		do
			effective_base_class := a_class
		end

feature -- Access

	effective_base_class: BMM_CLASS
			-- the target type; this converts to the first parameter in generic_parameters in BMM_GENERIC_TYPE

end


