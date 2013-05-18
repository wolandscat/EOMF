note
	component:   "Eiffel Object Modelling Framework"
	description: "Persistent form of BMM_GENERIC_TYPE_REFERENCE"
	keywords:    "Basic meta-model"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_BMM_GENERIC_TYPE_REFERENCE

inherit
	P_BMM_TYPE_REFERENCE

feature -- Access (attributes from schema)

	root_type: STRING
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make_empty
		end

	generic_parameters: ARRAYED_LIST [STRING]
			-- generic parameters of the root_type in this type specifier
			-- The order must match the order of the owning class's formal generic parameter declarations
			-- FIXME: currently the code below is limited to handling only 1 level of generic parameter nesting
		attribute
			create Result.make (0)
			Result.compare_objects
		end

	bmm_generic_type_reference: detachable BMM_GENERIC_TYPE_REFERENCE
		note
			option: transient
		attribute
		end

feature -- Factory

	create_bmm_generic_type_reference (a_bmm_schema: BMM_SCHEMA)
		local
			new_bmm_generic_type_reference: BMM_GENERIC_TYPE_REFERENCE
		do
			if attached a_bmm_schema.class_definition (root_type) as a_root_class_def then
				create new_bmm_generic_type_reference.make (a_root_class_def)
				bmm_generic_type_reference := new_bmm_generic_type_reference
				across generic_parameters as gen_parms_csr loop
					-- if it is a real class name
					if a_bmm_schema.has_class_definition (gen_parms_csr.item) and attached a_bmm_schema.class_definition (gen_parms_csr.item) as gen_class_def then
						new_bmm_generic_type_reference.add_generic_parameter (gen_class_def)

					-- else it is an open generic parameter like 'T', 'U' etc
					elseif attached a_root_class_def.generic_parameters.item (gen_parms_csr.item) as gen_parm_def then
						new_bmm_generic_type_reference.add_generic_parameter (gen_parm_def)
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
			from generic_parameters.start until generic_parameters.off loop
				Result.append (generic_parameters.item)
				if not generic_parameters.islast then
					Result.append_character (generic_separator)
				end
			end
			Result.append_character (Generic_right_delim)
		end

end


