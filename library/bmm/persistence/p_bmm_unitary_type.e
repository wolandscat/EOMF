note
	component:   "Eiffel Object Modelling Framework"
	description: "Persistent form of BMM_PROPER_TYPE"
	keywords:    "Basic meta-model"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class P_BMM_UNITARY_TYPE

inherit
	P_BMM_TYPE
		redefine
			bmm_type
		end

feature -- Access (attributes from schema)

	value_constraint: detachable STRING
			-- optional value-set constraint, specified as a two-part String, with '::' separator

	bmm_type: detachable BMM_UNITARY_TYPE
		note
			option: transient
		attribute
		end

end


