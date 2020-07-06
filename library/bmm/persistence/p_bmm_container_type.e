note
	component:   "Eiffel Object Modelling Framework"
	description: "Subtype of BMM_TYPE that specifies containers with one generic parameter."
	keywords:    "model, Basic meta-model"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_BMM_CONTAINER_TYPE

inherit
	P_BMM_TYPE
		redefine
			bmm_type
		end

feature -- Access (persisted)

	type: detachable STRING
			-- the target type; this converts to the first parameter in generic_parameters in BMM_GENERIC_TYPE
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	type_def: detachable P_BMM_UNITARY_TYPE
			-- type definition of the `type', if not a simple String type reference
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	container_type: STRING
			-- the type of the container. This converts to the root_type in BMM_GENERIC_TYPE
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make_from_string (unknown_type_name)
		end

feature -- Access

	type_ref: detachable P_BMM_UNITARY_TYPE
			-- the target type
		do
			if not attached type_def and attached type as att_type then
				if valid_generic_type_name (att_type) then
					create {P_BMM_OPEN_TYPE} Result.make_simple (att_type)
				else
					create {P_BMM_SIMPLE_TYPE} Result.make_simple (att_type)
				end
			else
				Result := type_def
			end
		end

	bmm_type: detachable BMM_CONTAINER_TYPE
		note
			option: transient
		attribute
		end

	base_type: STRING
			-- return the effective unitary type
		do
			if attached type as att_type then
				Result := att_type
			else
				check attached type_def then
					Result := type_def.base_type
				end
			end
		end

feature -- Factory

	create_bmm_type (a_bmm_model: BMM_MODEL; a_class_def: BMM_CLASS)
		local
			bmm_cont_class: BMM_GENERIC_CLASS
		do
			if a_bmm_model.has_class_definition (container_type) and attached type_ref as tr then
				check attached {BMM_GENERIC_CLASS} a_bmm_model.class_definition (container_type) as bmm_gc then
					bmm_cont_class := bmm_gc
				end
				tr.create_bmm_type (a_bmm_model, a_class_def)
				if attached {BMM_UNITARY_TYPE} tr.bmm_type as bt then
					create bmm_type.make (bt, bmm_cont_class)
				end
			end
		end

feature -- Output

	as_type_string: STRING
			-- formal name of the type
		do
			check attached type_ref then
				Result := container_type + Generic_left_delim.out + type_ref.as_type_string + Generic_right_delim.out
			end
		end

	flattened_type_list: ARRAYED_LIST [STRING]
			-- flattened list of type names making up full type.
		do
			create Result.make (0)
			Result.compare_objects
			Result.extend (container_type)
			check attached type_ref as att_type_ref then
				Result.append (att_type_ref.flattened_type_list)
			end
		end

end


