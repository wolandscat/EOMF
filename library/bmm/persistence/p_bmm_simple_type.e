note
	component:   "Eiffel Object Modelling Framework"
	description: "Persistent form of BMM_SIMPLE_TYPE"
	keywords:    "Basic meta-model"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_BMM_SIMPLE_TYPE

inherit
	P_BMM_BASE_TYPE
		redefine
			bmm_type
		end

create
	make_simple

feature -- Initialisation

	make_simple (a_type: STRING)
		do
			type := a_type
		end

feature -- Access (attributes from schema)

	type: STRING
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make_from_string (unknown_type_name)
		end

	bmm_type: detachable BMM_SIMPLE_TYPE
		note
			option: transient
		attribute
		end

feature -- Factory

	create_bmm_type (a_bmm_model: BMM_MODEL; a_class_def: BMM_CLASS)
		do
			check a_bmm_model.has_class_definition (type) and then attached {BMM_SIMPLE_CLASS} a_bmm_model.class_definition (type) as simple_class_def then
				create bmm_type.make (simple_class_def)
				if attached value_constraint as vc then
					bmm_type.set_value_constraint_from_string (vc)
				end
			end
		end

feature -- Output

	as_type_string: STRING
			-- name of the type
		do
			create Result.make (0)
			Result.append (type)
		end

	flattened_type_list: ARRAYED_LIST [STRING]
			-- flattened list of type names making up full type.
		do
			create Result.make (0)
			Result.compare_objects
			Result.extend (type)
		end

end


