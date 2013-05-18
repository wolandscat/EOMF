note
	component:   "Eiffel Object Modelling Framework"
	description: "Persistent form of BMM_CONTAINER_PROPERTY"
	keywords:    "model, Basic meta-model"

	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class P_BMM_CONTAINER_PROPERTY

inherit
	P_BMM_PROPERTY_DEFINITION
		redefine
			type_def, bmm_property_definition
		end

feature -- Access

	cardinality: detachable INTERVAL [INTEGER]
			-- needs to be this basic type because this attribute is scanned in from schema, else would
			-- have used MULTIPLICITY_INTERVAL
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	type_def: detachable P_BMM_CONTAINER_TYPE_REFERENCE
			-- type of the contained type
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	bmm_property_definition: detachable BMM_CONTAINER_PROPERTY
		note
			option: transient
		attribute
		end

feature -- Factory

	create_bmm_property_definition (a_bmm_schema: BMM_SCHEMA; a_class_def: BMM_CLASS_DEFINITION)
		local
			new_bmm_property_definition: BMM_CONTAINER_PROPERTY
		do
			if attached type_def as td then
				td.create_bmm_container_type_reference (a_bmm_schema)
				if attached td.bmm_container_type_reference as bmm_cont_type_ref then
					create new_bmm_property_definition.make (name, bmm_cont_type_ref, is_mandatory, is_computed, is_im_infrastructure, is_im_runtime)
					bmm_property_definition := new_bmm_property_definition
					if attached cardinality then
						new_bmm_property_definition.set_cardinality (cardinality)
					end
				end
			end
		end

end


