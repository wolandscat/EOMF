note
	component:   "Eiffel Object Modelling Framework"
	description: "Persistent form of BMM_TYPE_REFERENCE"
	keywords:    "Basic meta-model"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class P_BMM_TYPE

inherit
	P_BMM_TYPE_SPECIFIER

feature -- Access

	bmm_type: detachable BMM_TYPE
		note
			option: transient
		attribute
		end

feature -- Factory

	create_bmm_type (a_bmm_schema: BMM_SCHEMA; a_class_def: BMM_CLASS)
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


