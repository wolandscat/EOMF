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
		export
			{ANY} terminology_separator
		end

feature -- Initialisation

	make (a_class: like defining_class)
		do
			defining_class := a_class
		end

feature -- Access

	defining_class: BMM_CLASS
			-- the target type; this converts to the first parameter in generic_parameters in BMM_GENERIC_TYPE

	effective_base_class: BMM_CLASS
			-- model-semantic class for this type, from which properties etc can be extracted;
			-- abstracts away container types.
		do
			Result := defining_class
		end

	value_constraint: detachable BMM_VALUE_SET_SPEC
			-- optional value-set constraint

feature -- Modification

	set_value_constraint (a_value_constraint: like value_constraint)
		do
			value_constraint := a_value_constraint
		end

	set_value_constraint_from_string (a_constraint_str: STRING)
			-- set from a String of the form "resource_id::value_set_id". The first part may be empty.
		require
			Valid_string: a_constraint_str.has_substring (Terminology_separator)
		do
			create value_constraint.make_from_string (a_constraint_str)
		end

end


