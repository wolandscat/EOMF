note
	component:   "Eiffel Object Modelling Framework"
	description: "Persistent form of BMM_OPEN_TYPE."
	keywords:    "Basic meta-model"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_BMM_OPEN_TYPE

inherit
	P_BMM_PROPER_TYPE
		redefine
			bmm_type, create_bmm_type
		end

create
	make_simple

feature -- Initialisation

	make_simple (a_type: STRING)
		do
			type := a_type
		end

feature -- Access (persistence)

	type: STRING
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make_empty
		end

feature -- Access

	bmm_type: detachable BMM_PARAMETER_TYPE
		note
			option: transient
		attribute
		end

feature -- Factory

	create_bmm_type (a_bmm_model: BMM_MODEL; a_class_def: BMM_CLASS)
		do
			check attached {BMM_GENERIC_CLASS} a_class_def as bmm_gen_class  and then
				attached bmm_gen_class.generic_parameters.item (type) as bmm_gen_parm
			then
				bmm_type := bmm_gen_parm
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


