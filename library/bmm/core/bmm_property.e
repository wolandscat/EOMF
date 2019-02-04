note
	component:   "Eiffel Object Modelling Framework"
	description: "Abstract idea of a property definition within a class definition"
	keywords:    "model, UML"
	author:      "Thomas Beale"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	copyright:   "Copyright (c) 2009 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class BMM_PROPERTY

inherit
	BMM_MUTABLE
		redefine
			scope
		end

feature {NONE} -- Initialisation

	make (a_name: STRING; a_doc: detachable STRING; a_bmm_type: like bmm_type;
			is_nullable_flag, is_computed_flag, is_im_infrastructure_flag, is_im_runtime_flag: BOOLEAN)
		do
			name := a_name
			documentation := a_doc
			is_nullable := is_nullable_flag
			is_computed := is_computed_flag
			is_im_infrastructure := is_im_infrastructure_flag
			is_im_runtime := is_im_runtime_flag
			bmm_type := a_bmm_type
		end

	make_from_other (other: like Current)
			-- make from a BMM_PROPERTY of any generic flavour
		do
			name := other.name.twin
			documentation := if attached other.documentation as att_doc then att_doc.twin else Void end
			is_nullable := other.is_nullable
			is_computed := other.is_computed
			is_im_infrastructure := other.is_im_infrastructure
			is_im_runtime := other.is_im_runtime
			bmm_type := other.bmm_type
		end

	make_from_other_generic (other: BMM_PROPERTY; a_bmm_type: like bmm_type)
			-- make from a BMM_PROPERTY of any flavour
		do
			name := other.name.twin
			documentation := if attached other.documentation as att_doc then att_doc.twin else Void end
			is_nullable := other.is_nullable
			is_computed := other.is_computed
			is_im_infrastructure := other.is_im_infrastructure
			is_im_runtime := other.is_im_runtime
			bmm_type := a_bmm_type
		end

feature -- Identification

	display_name: STRING
			-- name of this attribute to display in screen form, grid etc
		do
			Result := name
		end

feature -- Access

	existence: MULTIPLICITY_INTERVAL
			-- interval form of 0..1, 1..1 etc, generated from is_mandatory
		do
			if is_nullable then
				create Result.make_bounded (0, 1)
			else
				create Result.make_point (1)
			end
		end

	multiplicity_key_string: STRING
			-- string name of pixmap for attribute rm_attr
		do
			create Result.make_empty
			Result.append ("property")
			if is_computed then
				Result.append ("_computed")
			end
			Result.append ("." + object_multiplicity.as_quantifier_text)
		end

	object_multiplicity: MULTIPLICITY_INTERVAL
			-- return the effective child object multiplicity of the property definition for `a_prop_name' in flattened class
			-- corresponding to `a_type_name'. By default, the same as `existence'; override in descendants.
		do
			Result := existence.deep_twin
		end

	signature: STRING
			-- Formal signature of this element, in the form 'name: Type'
		do
			create Result.make_from_string (name)
			Result.append_character ({BMM_DEFINITIONS}.Type_delimiter)
			Result.append (bmm_type.type_signature)
		end

	scope: BMM_CLASS
		do
			Result := bmm_type.effective_base_class
		end

feature -- Status Report

	is_computed: BOOLEAN
			-- True if this property is computed rather than stored in objects of this class

	is_im_infrastructure: BOOLEAN
			-- True if this property is info model 'infrastructure' rather than 'data'

	is_im_runtime: BOOLEAN
			-- True if this property is info model 'runtime' property

	is_container: BOOLEAN
			-- True if type is a container type
		do
			Result := attached {BMM_CONTAINER_TYPE} bmm_type
		end

	is_synthesised_generic: BOOLEAN
			-- True if this property was synthesised due to generic substitution

feature -- Factory

	create_duplicate: like Current
			-- create a copy of this property object
		deferred
		end

feature -- Comparison

	bmm_conforms_to (other: BMM_PROPERTY): BOOLEAN
			-- True if this property conforms to `other' such that it could be used to override it
		do
			-- FIXME: to be implemented
			Result := True
		end

feature -- Modification

	set_bmm_type (a_bmm_type: like bmm_type)
			-- set `bmm_type`
		do
			bmm_type := a_bmm_type
		end

	set_is_synthesised_generic
			-- set `is_synthesised_generic`
		do
			is_synthesised_generic := True
		end

end


