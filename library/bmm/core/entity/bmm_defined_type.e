note
	component:   "Eiffel Object Modelling Framework"
	description: "Parent of type meta-types that correspond to defined types, rather than formal type parameters."
	keywords:    "model, BMM"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class BMM_DEFINED_TYPE

inherit
	BMM_UNITARY_TYPE

feature -- Access

	effective_type: BMM_DEFINED_TYPE
			-- Effective conformance type, taking into account formal parameter types
		do
			Result := Current
		end

	type_base_name: STRING
			-- Name of base generator type, i.e. excluding any generic parts if present
		deferred
		end

end


