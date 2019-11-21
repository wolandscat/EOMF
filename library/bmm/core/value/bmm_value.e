note
	component:   "Eiffel Object Modelling Framework"
	description: "Meta-type for any entity that can be evaluated at runtime to generate a value."
	keywords:    "model, UML, BMM"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2019 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

 class BMM_VALUE

inherit
	BMM_TYPED
		redefine
			bmm_type
		end

feature -- Access

	bmm_type: BMM_ENTITY_TYPE
			-- Declared or inferred static type of the entity.
		attribute
			Result := Any_type
		end

	value_literal: STRING
		attribute
			create Result.make_empty
		end

end


