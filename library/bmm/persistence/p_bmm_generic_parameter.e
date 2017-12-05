note
	component:   "Eiffel Object Modelling Framework"
	description: "Persistent form of BMM_GENERIC_PARAMETER"
	keywords:    "Basic meta-model"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_BMM_GENERIC_PARAMETER

inherit
	P_BMM_MODEL_ELEMENT

feature -- Access (attributes from schema)

	name: STRING
			-- name of the parameter, e.g. 'T' etc
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make_empty
		end

	conforms_to_type: detachable STRING
			-- optional conformance constraint
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

feature -- Access

	bmm_generic_parameter: detachable BMM_GENERIC_PARAMETER
		note
			option: transient
		attribute
		end

feature -- Factory

	create_bmm_generic_parameter (a_bmm_model: BMM_MODEL)
		do
			if attached conforms_to_type as conf_type and then attached a_bmm_model.class_definition (conf_type) as class_def_conf_type then
				create bmm_generic_parameter.make_constrained (name, documentation, class_def_conf_type, a_bmm_model.any_class_definition)
			else
				create bmm_generic_parameter.make (name, documentation, a_bmm_model.any_class_definition)
			end
		end

end


