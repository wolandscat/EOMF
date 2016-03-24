note
	component:   "Eiffel Object Modelling Framework"
	description: "Abstract idea of a property definition within a class definition"
	keywords:    "model, UML"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2009 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_PROPERTY [G -> BMM_TYPE]

inherit
	BMM_MODEL_ELEMENT

create
	make

feature {NONE} -- Initialisation

	make (a_name: STRING; a_doc: detachable STRING; a_type: like type; is_mandatory_flag, is_computed_flag, is_im_infrastructure_flag, is_im_runtime_flag: BOOLEAN)
		do
			name := a_name
			documentation := a_doc
			is_mandatory := is_mandatory_flag
			is_computed := is_computed_flag
			is_im_infrastructure := is_im_infrastructure_flag
			is_im_runtime := is_im_runtime_flag
			type := a_type
		end

feature -- Access

	name: STRING
			-- name of this attribute
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	documentation: detachable STRING

	display_name: STRING
			-- name of this attribute to display in screen form, grid etc
		do
			Result := name
		end

	type: G
			-- formal type of this attribute

	existence: MULTIPLICITY_INTERVAL
			-- interval form of 0..1, 1..1 etc, generated from is_mandatory
		do
			if is_mandatory then
				create Result.make_point (1)
			else
				create Result.make_bounded (0, 1)
			end
		end

	multiplicity_key_string: STRING
			-- string name of pixmap for attribute rm_attr
		do
			create Result.make_empty
			Result.append ("c_attribute")
			if is_computed then
				Result.append ("_computed")
			end
			if is_container then
				Result.append (".multiple")
			end
			if not is_mandatory then
				Result.append (".optional")
			end
		end

	object_multiplicity: MULTIPLICITY_INTERVAL
			-- return the effective child object multiplicity of the property definition for `a_prop_name' in flattened class
			-- corresponding to `a_type_name'. By default, the same as `existence'; override in descendants.
		do
			Result := existence.deep_twin
		end

feature -- Status Report

	is_mandatory: BOOLEAN
			-- True if this propert is mandatory in its class

	is_computed: BOOLEAN
			-- True if this property is computed rather than stored in objects of this class

	is_im_infrastructure: BOOLEAN
			-- True if this property is info model 'infrastructure' rather than 'data'

	is_im_runtime: BOOLEAN
			-- True if this property is info model 'runtime' property

	is_container: BOOLEAN
			-- True if type is a container type
		do
			Result := attached {BMM_CONTAINER_TYPE} type
		end

feature -- Comparison

	bmm_conforms_to (other: BMM_PROPERTY [BMM_TYPE]): BOOLEAN
			-- True if this property conforms to `other' such that it could be used to override it
		do
			-- FIXME: to be implemented
			Result := True
		end

end


