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
		export
			{ANY} terminology_separator
		end

feature -- Initialisation

	make (a_class: like defining_class)
		do
			defining_class := a_class
		end

feature -- Access

	effective_base_class: BMM_CLASS
			-- model-semantic class for this type, from which properties etc can be extracted;
			-- abstracts away container types.
		do
			Result := defining_class
		end

	defining_class: BMM_CLASS
			-- the target type; this converts to the first parameter in generic_parameters in BMM_GENERIC_TYPE

feature -- Status Report

	is_primitive: BOOLEAN
			-- True if this entity corresponds to a primitive type
		do
			Result := defining_class.is_primitive
		end

end


