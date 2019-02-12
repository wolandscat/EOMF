note
	component:   "Eiffel Object Modelling Framework"
	description: "Any entity that represents or returns an instance value of a type."
	keywords:    "model, UML, BMM"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2019 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class BMM_VALUE_RETURNING

inherit
	BMM_BUILTINS
		export
			{NONE} all;
			{ANY} deep_twin, is_deep_equal, standard_is_equal
		end

feature -- Access

	bmm_type: BMM_TYPE
			-- Declared or inferred static type of the entity.
		attribute
			Result := Any_type
		end

feature -- Modification

	set_bmm_type (a_bmm_type: like bmm_type)
			-- set `bmm_type`
		do
			bmm_type := a_bmm_type
		end

end

