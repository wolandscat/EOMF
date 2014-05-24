note
	component:   "Eiffel Object Modelling Framework"
	description: "Definition of ODIN persistent form of an instance of BMM_ENUMERATION_DEFINITION"
	keywords:    "model, UML"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_BMM_ENUMERATION_DEFINITION_INTEGER

inherit
	P_BMM_ENUMERATION_DEFINITION
		redefine
			item_values, bmm_class_definition
		end

feature -- Access (persisted)

	item_values: detachable ARRAYED_LIST [INTEGER]
			-- OPTIONAL list of item integer values; must be of same length as `item_names'

feature -- Access

	bmm_class_definition: detachable BMM_ENUMERATION_DEFINITION_INTEGER
		note
			option: transient
		attribute
		end

end

