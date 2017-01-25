note
	component:   "Eiffel Object Modelling Framework"
	description: "Definition of a generic parameter in a class definition of a generic type."
	keywords:    "model, object"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2009- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_GENERIC_PARAMETER

inherit
	BMM_TYPE_ELEMENT
		redefine
			type_signature
		end

create
	make, make_constrained

feature -- Initialisation

	make (a_name: STRING; a_doc: detachable STRING; any_class: BMM_CLASS)
			-- any_type is a reference to the Any definition from this schema
		do
			name := a_name
			documentation := a_doc
			any_class_definition := any_class
		end

	make_constrained (a_name: STRING; a_doc: detachable STRING; a_conforms_to_type, any_class: BMM_CLASS)
			-- any_type is a reference to the Any definition from this schema
		do
			name := a_name
			documentation := a_doc
			conforms_to_type := a_conforms_to_type
			any_class_definition := any_class
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
			if attached flattened_conforms_to_type as att_conf_type then
				Result.append_character (Generic_constraint_delimiter)
				Result.append (att_conf_type.type_name)
			end
		end

feature -- Access

	documentation: detachable STRING

	inheritance_precursor: detachable BMM_GENERIC_PARAMETER
			-- if set, is the corresponding generic parameter definition in an ancestor class

	base_class: BMM_CLASS
			-- the effective conformance type of this parameter, 'Any' if none other
		do
			if attached flattened_conforms_to_type as fctt then
				Result := fctt
			else
				Result := any_class_definition
			end
		end

	conforms_to_type: detachable BMM_CLASS
			-- optional conformance constraint that must be another valid class name.

	flattened_conforms_to_type: detachable BMM_CLASS
			-- ultimate type conformance constraint on this generic parameter due to inheritance;
			-- Void if no constraint type.
		do
			if attached conforms_to_type then
				Result := conforms_to_type
			elseif attached inheritance_precursor as att_inh_prec then
				Result := att_inh_prec.flattened_conforms_to_type
			end
		end

	effective_conforms_to_type: BMM_CLASS
			-- Effective conformance type: either defined in model, or 'Any' if none from the model.
		do
			if attached flattened_conforms_to_type as att_fct then
				Result := att_fct
			else
				Result := any_class_definition
			end
		end

	flattened_type_list: ARRAYED_LIST [STRING]
			-- completely flattened list of type names, flattening out all generic parameters
			-- note that for this type, we output "ANY" if there is no constraint
		do
			create Result.make(0)
			Result.compare_objects
			if attached flattened_conforms_to_type as att_fct then
				Result.append (att_fct.flattened_type_list)
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

feature -- Status Report

	is_constrained: BOOLEAN
			-- True if this generic parameter has a type constraint
		do
			Result := attached flattened_conforms_to_type
		end

feature -- Modification

	set_inheritance_precursor (a_gen_parm_def: BMM_GENERIC_PARAMETER)
			-- set `inheritance_precursor'
		do
			inheritance_precursor := a_gen_parm_def
		end

feature {NONE} -- Implementation

	any_class_definition: BMM_CLASS

end


