note
	component:   "Eiffel Object Modelling Framework"
	description: "Definition of ODIN persistent form of an instance of BMM_ENUMERATION_STRING"
	keywords:    "model, UML"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_BMM_ENUMERATION_STRING

inherit
	P_BMM_ENUMERATION [STRING]
		redefine
			bmm_class
		end

feature -- Access

	bmm_class: detachable BMM_ENUMERATION_STRING
		note
			option: transient
		attribute
		end

end

