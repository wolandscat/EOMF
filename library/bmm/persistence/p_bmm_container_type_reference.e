note
	component:   "Eiffel Object Modelling Framework"
	description: "Subtype of BMM_GENERIC_TYPE_SPECIFIER that specifies containers with one generic parameter."
	keywords:    "model, Basic meta-model"

	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_BMM_CONTAINER_TYPE_REFERENCE

inherit
	P_BMM_TYPE_REFERENCE

feature -- Access (persisted)

	type: STRING
			-- the target type; this converts to the first parameter in generic_parameters in BMM_GENERIC_TYPE_SPECIFIER
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make_from_string (unknown_type_name)
		end

	container_type: STRING
			-- the type of the container. This converts to the root_type in BMM_GENERIC_TYPE_SPECIFIER
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make_from_string (unknown_type_name)
		end

feature -- Access

	bmm_container_type_reference: detachable BMM_CONTAINER_TYPE_REFERENCE
		note
			option: transient
		attribute
		end

feature -- Factory

	create_bmm_container_type_reference (a_bmm_schema: BMM_SCHEMA)
		do
			if attached a_bmm_schema.class_definition (type) as type_class_def and attached a_bmm_schema.class_definition (container_type) as cont_type_class_def then
				create bmm_container_type_reference.make (type_class_def, cont_type_class_def)
			end
		end

feature -- Output

	as_type_string: STRING
			-- formal name of the type
		do
			Result := container_type + Generic_left_delim.out + type + Generic_right_delim.out
		end

end


