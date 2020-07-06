note
	component:   "Eiffel Object Modelling Framework"
	description: "Persistent form of BMM_TYPE"
	keywords:    "Basic meta-model"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class P_BMM_TYPE

inherit
	BMM_DEFINITIONS

feature -- Access

	bmm_type: detachable BMM_TYPE
		note
			option: transient
		attribute
		end

	base_type: STRING
			-- return the effective base type
		deferred
		end

feature -- Factory

	create_bmm_type (a_bmm_model: BMM_MODEL; a_class_def: BMM_CLASS)
		deferred
		end

feature -- Output

	as_type_string: STRING
			-- formal name of the type
		deferred
		end

	flattened_type_list: ARRAYED_LIST [STRING]
			-- flattened list of type names making up full type.
		deferred
		end

end


