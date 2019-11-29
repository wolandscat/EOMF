note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 A concrete, unitary meta-type that can be used as an actual parameter
				 type in a generic type declaration.
				 ]"
	keywords:    "model, BMM"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class BMM_EFFECTIVE_TYPE

inherit
	BMM_UNITARY_TYPE

feature -- Access

	effective_type: BMM_EFFECTIVE_TYPE
			-- Effective conformance type, taking into account formal parameter types
		do
			Result := Current
		end

	type_base_name: STRING
			-- Name of base generator type, i.e. excluding any generic parts if present
		deferred
		end

end


