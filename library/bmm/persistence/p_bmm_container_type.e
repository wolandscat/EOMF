note
	component:   "Eiffel Object Modelling Framework"
	description: "Subtype of BMM_TYPE that specifies containers with one generic parameter."
	keywords:    "model, Basic meta-model"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_BMM_CONTAINER_TYPE

inherit
	P_BMM_TYPE
		redefine
			bmm_type, create_bmm_type
		end

feature -- Access (persisted)

	type: detachable STRING
			-- the target type; this converts to the first parameter in generic_parameters in BMM_GENERIC_TYPE_SPECIFIER
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	type_def: detachable P_BMM_TYPE
			-- type definition of the `type', if not a simple String type reference
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	container_type: STRING
			-- the type of the container. This converts to the root_type in BMM_GENERIC_TYPE_SPECIFIER
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make_from_string (unknown_type_name)
		end

feature -- Access

	type_ref: detachable P_BMM_TYPE
			-- the target type; this converts to the first parameter in generic_parameters in BMM_GENERIC_TYPE_SPECIFIER
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		do
			if not attached type_def and attached type as att_type then
				-- probably reliable way of detecting an open gen parm - look for a type name of only 1 character
				if att_type.count = 1 then
					create {P_BMM_SIMPLE_TYPE_OPEN} type_def.make_simple (att_type)
				else
					create {P_BMM_SIMPLE_TYPE} type_def.make_simple (att_type)
				end
			end
			Result := type_def
		end

	bmm_type: detachable BMM_CONTAINER_TYPE
		note
			option: transient
		attribute
		end

feature -- Factory

	create_bmm_type (a_bmm_schema: BMM_SCHEMA; a_class_def: BMM_CLASS)
		do
			if a_bmm_schema.has_class_definition (container_type) and attached type_ref as att_type_ref then
				att_type_ref.create_bmm_type (a_bmm_schema, a_class_def)
				if attached att_type_ref.bmm_type as bt then
					create bmm_type.make (bt, a_bmm_schema.class_definition (container_type))
				end
			end
		end

feature -- Output

	as_type_string: STRING
			-- formal name of the type
		do
			Result := container_type + Generic_left_delim.out + type_ref.as_type_string + Generic_right_delim.out
		end

	flattened_type_list: ARRAYED_LIST [STRING]
			-- flattened list of type names making up full type.
		do
			create Result.make (0)
			Result.compare_objects
			Result.extend (container_type)
			Result.append (type_ref.flattened_type_list)
		end

end


