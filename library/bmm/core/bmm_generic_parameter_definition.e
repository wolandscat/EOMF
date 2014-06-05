note
	component:   "Eiffel Object Modelling Framework"
	description: "Definition of a generic parameter in a class definition of a generic type."
	keywords:    "model, object"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2009- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_GENERIC_PARAMETER_DEFINITION

inherit
	BMM_TYPE_SPECIFIER
		redefine
			as_display_type_string, as_conformance_type_string
		end

create
	make, make_constrained

feature -- Initialisation

	make (a_name: STRING; any_type_def: BMM_CLASS_DEFINITION)
			-- any_type is a reference to the Any definition from this schema
		do
			name := a_name
			any_class_definition := any_type_def
		end

	make_constrained (a_name: STRING; a_conforms_to_type, any_type_def: BMM_CLASS_DEFINITION)
			-- any_type is a reference to the Any definition from this schema
		do
			name := a_name
			conforms_to_type := a_conforms_to_type
			any_class_definition := any_type_def
		end

feature -- Access (attributes from schema)

	name: STRING
			-- name of the parameter, e.g. 'T' etc

	conforms_to_type: detachable BMM_CLASS_DEFINITION
			-- optional conformance constraint derived from `conforms_to_type'

	inheritance_precursor: detachable BMM_GENERIC_PARAMETER_DEFINITION
			-- if set, is the corresponding generic parameter definition in an ancestor class

	semantic_class: BMM_CLASS_DEFINITION
			-- the 'design' class of this type, ignoring containers, multiplicity etc.
		do
			if attached flattened_conforms_to_type as fctt then
				Result := fctt
			else
				Result := any_class_definition
			end
		end

feature -- Access

	flattened_conforms_to_type: detachable BMM_CLASS_DEFINITION
			-- get any ultimate type conformance constraint on this generic parameter due to inheritance
		do
			if attached conforms_to_type then
				Result := conforms_to_type
			elseif attached inheritance_precursor then
				Result := inheritance_precursor.flattened_conforms_to_type
			end
		end

	flattened_type_list: ARRAYED_LIST [STRING]
			-- completely flattened list of type names, flattening out all generic parameters
			-- note that for this type, we output "ANY" if there is no constraint
		do
			create Result.make(0)
			Result.compare_objects
			if is_constrained then
				Result.append (flattened_conforms_to_type.flattened_type_list)
			else
				Result.extend (Any_type)
			end
		end

	type_category: STRING
			-- generate a type category of main target type from Type_cat_xx values
		do
			if attached flattened_conforms_to_type then
				Result := Type_cat_constrained_generic_parameter
			else
				Result := Type_cat_generic_parameter
			end
		end

	type_substitutions: ARRAYED_SET [STRING]
		do
			if attached flattened_conforms_to_type then
				Result := flattened_conforms_to_type.type_substitutions
			else
				Result := any_class_definition.type_substitutions
			end
		end

feature -- Status Report

	has_type_substitutions: BOOLEAN = True
			-- True if there are types subsitutable for this one according to the model

	is_constrained: BOOLEAN
			-- True if this generic parameter has a type constraint
		do
			Result := attached flattened_conforms_to_type
		end

feature -- Modification

	set_inheritance_precursor (a_gen_parm_def: BMM_GENERIC_PARAMETER_DEFINITION)
			-- set `inheritance_precursor'
		do
			inheritance_precursor := a_gen_parm_def
		end

feature -- Output

	as_type_string: STRING
			-- name of the type; if constrained, in the form "T: CONSTRAINER_TYPE"
		do
			create Result.make_empty
			Result.append (name)
			if is_constrained then
				Result.append_character (Generic_constraint_delimiter)
				Result.append_character (' ')
				Result.append (flattened_conforms_to_type.as_type_string)
			end
		end

	as_display_type_string: STRING
			-- name of the type; if constrained, in the form "T: CONSTRAINER_TYPE"
		do
			create Result.make_empty
			Result.append (name)
			if is_constrained then
				Result.append_character (Generic_constraint_delimiter)
				Result.append_character (' ')
				Result.append (flattened_conforms_to_type.as_type_string)
			end
		end

	as_conformance_type_string: STRING
			-- name of the this type in form allowing other type to be conformance tested against it;
			-- if constrained, then return the constrainer type, else just return Any
		do
			create Result.make_empty
			if is_constrained then
				Result.append (flattened_conforms_to_type.as_type_string)
			else
				Result.append (Any_type)
			end
		end

feature {NONE} -- Implementation

	any_class_definition: BMM_CLASS_DEFINITION

end


