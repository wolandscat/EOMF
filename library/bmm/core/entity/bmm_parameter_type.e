note
	component:   "Eiffel Object Modelling Framework"
	description: "Definition of a generic parameter in a class definition of a generic type."
	keywords:    "model, object"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2009- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_PARAMETER_TYPE

inherit
	BMM_UNITARY_TYPE
		redefine
			type_signature
		end

create
	make, make_constrained

feature -- Initialisation

	make (a_name: STRING; an_any_type: BMM_EFFECTIVE_TYPE)
			-- any_type is a reference to the Any definition from this schema
		do
			name := a_name
			any_type_definition := an_any_type
		end

	make_constrained (a_name: STRING; a_type_constraint, an_any_type: BMM_EFFECTIVE_TYPE)
			-- any_type is a reference to the Any definition from this schema
		do
			name := a_name
			type_constraint := a_type_constraint
			any_type_definition := an_any_type
		end

feature -- Identification

	name: STRING
			-- name of the parameter, e.g. 'T' etc

	type_name: STRING
			-- name of the type; if constrained, in the form "T"
		do
			create Result.make_from_string (name)
		end

	type_signature: STRING
			-- Signature form of the type, which for generics includes generic parameter constrainer types
			-- E.g. "T:Ordered"
		do
			create Result.make_from_string (name)
			if attached flattened_conforms_to_type as fctt then
				Result.append_character (Generic_constraint_delimiter)
				Result.append (fctt.type_name)
			end
		end

	entity_metatype: STRING
			-- generate a type category of main target type from Type_cat_xx values
		do
			Result := Entity_metatype_generic_parameter
		end

feature -- Access

	inheritance_precursor: detachable BMM_PARAMETER_TYPE
			-- if set, is the corresponding generic parameter definition in an ancestor class

	type_constraint: detachable BMM_EFFECTIVE_TYPE
			-- optional conformance constraint that must be another valid class name.

	flattened_conforms_to_type: detachable BMM_EFFECTIVE_TYPE
			-- ultimate type conformance constraint on this generic parameter due to inheritance;
			-- Void if no constraint type.
		do
			if attached type_constraint as tc then
				Result := tc
			elseif attached inheritance_precursor as ip then
				Result := ip.flattened_conforms_to_type
			end
		end

	effective_type: BMM_EFFECTIVE_TYPE
			-- Effective conformance type: either defined in model, or 'Any' if none from the model.
		do
			if attached flattened_conforms_to_type as fct then
				Result := fct
			else
				Result := any_type_definition
			end
		end

	flattened_type_list: ARRAYED_LIST [STRING]
			-- completely flattened list of type names, flattening out all generic parameters
			-- note that for this type, we output "Any" if there is no constraint
		do
			create Result.make(0)
			Result.compare_objects
			if attached flattened_conforms_to_type as fct then
				Result.append (fct.flattened_type_list)
			else
				Result.extend (Any_type_name)
			end
		end

    properties: STRING_TABLE [BMM_PROPERTY]
			-- list of all properties defined by this entity, keyed by property name
		do
			Result := effective_type.properties
		end

    flat_properties: STRING_TABLE [BMM_PROPERTY]
			-- list of all properties of an instance of this entity, keyed by property name
		do
			Result := effective_type.flat_properties
		end

feature -- Status Report

	has_subtypes: BOOLEAN
		do
			Result := not is_constrained or else effective_type.has_subtypes
		end

	is_constrained: BOOLEAN
			-- True if this generic parameter has a type constraint
		do
			Result := attached flattened_conforms_to_type
		end

	is_abstract: BOOLEAN
			-- generic parameters are not consider abstract
		do
			Result := False
		end

	is_primitive: BOOLEAN
			-- generic parameters are not consider abstract
		do
			Result := False
		end

feature -- Factory

	create_duplicate: like Current
			-- create a copy of this type object, with common references to BMM_CLASS objects
		do
			if attached type_constraint as tc then
				create Result.make_constrained (name.twin, tc.create_duplicate, any_type_definition)
			else
				create Result.make (name.twin, any_type_definition)
			end
			if attached inheritance_precursor as ip then
				Result.set_inheritance_precursor (ip)
			end
		end

feature -- Modification

	set_inheritance_precursor (a_gen_parm_def: BMM_PARAMETER_TYPE)
			-- set `inheritance_precursor'
		do
			inheritance_precursor := a_gen_parm_def
		end

feature {NONE} -- Implementation

	any_type_definition: BMM_EFFECTIVE_TYPE

end


