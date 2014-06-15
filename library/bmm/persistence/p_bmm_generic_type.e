note
	component:   "Eiffel Object Modelling Framework"
	description: "Persistent form of BMM_GENERIC_TYPE"
	keywords:    "Basic meta-model"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_BMM_GENERIC_TYPE

inherit
	P_BMM_TYPE
		redefine
			bmm_type, create_bmm_type
		end

feature -- Access (attributes from schema)

	root_type: STRING
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make_empty
		end

	generic_parameters: detachable ARRAYED_LIST [STRING]
			-- generic parameters of the root_type in this type specifier, if simple types.
			-- The order must match the order of the owning class's formal generic parameter declarations
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	generic_parameter_defs: detachable ARRAYED_LIST [P_BMM_TYPE]
			-- generic parameters of the root_type in this type specifier if non-simple types
			-- The order must match the order of the owning class's formal generic parameter declarations
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

feature -- Access

	generic_parameter_refs: detachable ARRAYED_LIST [P_BMM_TYPE]
			-- generic parameters of the root_type in this type specifier
			-- The order must match the order of the owning class's formal generic parameter declarations
		do
			if not attached generic_parameter_defs and attached generic_parameters as att_gen_parms_strings then
				create generic_parameter_defs.make (0)
				across att_gen_parms_strings as gen_parms_csr loop
					-- probably reliable way of detecting an open gen parm - look for a type name of only 1 character
					if gen_parms_csr.item.count = 1 then
						generic_parameter_defs.extend (create {P_BMM_SIMPLE_TYPE_OPEN}.make_simple (gen_parms_csr.item))
					else
						generic_parameter_defs.extend (create {P_BMM_SIMPLE_TYPE}.make_simple (gen_parms_csr.item))
					end
				end
			end
			Result := generic_parameter_defs
		end

	bmm_type: detachable BMM_GENERIC_TYPE
		note
			option: transient
		attribute
		end

feature -- Factory

	create_bmm_type (a_bmm_schema: BMM_SCHEMA; a_class_def: BMM_CLASS)
		local
			new_bmm_type: BMM_GENERIC_TYPE
		do
			-- handle simple generic param types if found in schema
			if a_bmm_schema.has_class_definition (root_type) and
				attached {BMM_GENERIC_CLASS} a_bmm_schema.class_definition (root_type) as bmm_gen_class and
				attached generic_parameter_refs as att_gen_parm_refs
			then
				create new_bmm_type.make (bmm_gen_class)
				bmm_type := new_bmm_type
				across att_gen_parm_refs as gen_parms_csr loop
					gen_parms_csr.item.create_bmm_type (a_bmm_schema, a_class_def)
					if attached gen_parms_csr.item.bmm_type as bt then
						new_bmm_type.add_generic_parameter (bt)
					end
				end
			end
		end

feature -- Output

	as_type_string: STRING
			-- name of the type
		do
			create Result.make (0)
			Result.append (root_type)
			Result.append_character (Generic_left_delim)
			across generic_parameter_refs as gen_parms_csr loop
				Result.append (gen_parms_csr.item.as_type_string)
				if not gen_parms_csr.is_last then
					Result.append_character (generic_separator)
				end
			end
			Result.append_character (Generic_right_delim)
		end

	flattened_type_list: ARRAYED_LIST [STRING]
			-- flattened list of type names making up full type.
		do
			create Result.make (0)
			Result.compare_objects
			Result.extend (root_type)
			across generic_parameter_refs as gen_parms_csr loop
				Result.append (gen_parms_csr.item.flattened_type_list)
			end
		end

end


