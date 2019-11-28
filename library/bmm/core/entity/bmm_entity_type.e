note
	component:   "Eiffel Object Modelling Framework"
	description: "Parent of type meta-types that correspond to entities, i.e. objects."
	keywords:    "model, BMM"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2019- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class BMM_ENTITY_TYPE

inherit
	BMM_DEFINED_TYPE

feature -- Identification

	entity_metatype: STRING
			-- generate a type category of main target type from Type_cat_xx values
		do
			Result := defining_class.entity_metatype
		end

feature -- Access

	base_type_name: STRING
			-- Name of base type
		do
			Result := defining_class.name
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


