note
	component:   "Eiffel Object Modelling Framework"
	description: "Persistent form of BMM_MODEL_ELEMENT."
	keywords:    "model, UML, BMM"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class P_BMM_MODEL_ELEMENT

inherit
	BMM_DEFINITIONS

feature -- Access

	documentation: detachable STRING

feature -- Modification

	set_documentation (a_str: STRING)
			-- set `documentation'
		do
			documentation := a_str
		ensure
			documentation = a_str
		end

end


