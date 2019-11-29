note
	component:   "Eiffel Object Modelling Framework"
	description: "A type that is defined by a class (or classes) in the model."
	keywords:    "model, BMM"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2019- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class BMM_MODEL_TYPE

inherit
	BMM_EFFECTIVE_TYPE
		export
			{ANY} terminology_separator
		end

feature -- Initialisation

	make (a_class: like defining_class)
		do
			defining_class := a_class
		end

feature -- Identification

	entity_metatype: STRING
			-- generate a type category of main target type from Type_cat_xx values
		do
			Result := defining_class.entity_metatype
		end

feature -- Access

	defining_class: BMM_CLASS
			-- the target type; this converts to the first parameter in generic_parameters in BMM_GENERIC_TYPE

	type_base_name: STRING
			-- Name of base type
		do
			Result := defining_class.name
		end

	value_constraint: detachable BMM_VALUE_SET_SPEC
			-- optional value-set constraint

    properties: STRING_TABLE [BMM_PROPERTY]
			-- list of all properties defined by this entity, keyed by property name
		do
			Result := defining_class.properties
		end

    flat_properties: STRING_TABLE [BMM_PROPERTY]
			-- list of all properties of an instance of this entity, keyed by property name
		do
			Result := defining_class.flat_properties
		end

feature -- Status Report

	is_primitive: BOOLEAN
			-- True if this entity corresponds to a primitive type
		do
			Result := defining_class.is_primitive
		end

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


