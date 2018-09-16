note
	component:   "Eiffel Object Modelling Framework"
	description: "Persistent form of BMM_PROPERTY objects"
	keywords:    "Basic meta-model"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class P_BMM_PROPERTY

inherit
	P_BMM_MODEL_ELEMENT

feature -- Access (persisted)

	name: STRING
			-- name of this attribute
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
        attribute
            create Result.make_empty
        end

	type_def: detachable P_BMM_TYPE
			-- type definition of this property, if not a simple String type reference
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		deferred
		end

	is_mandatory: BOOLEAN
			-- True if this property is mandatory in its class
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	is_computed: BOOLEAN
			-- True if this property is computed rather than stored in objects of this class
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	is_im_infrastructure: BOOLEAN
			-- True if this property is info model 'infrastructure' rather than 'data'
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	is_im_runtime: BOOLEAN
			-- True if this property is info model 'runtime' settable property
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

feature -- Access

	bmm_property: detachable BMM_PROPERTY
		note
			option: transient
		attribute
		end

feature -- Factory

	create_bmm_property (a_bmm_model: BMM_MODEL; a_class_def: BMM_CLASS)
		deferred
		end

end


