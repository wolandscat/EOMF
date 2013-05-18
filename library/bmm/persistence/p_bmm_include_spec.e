note
	component:   "Eiffel Object Modelling Framework"
	description: "Persistent form of BMM_INCLUDE_SPEC"
	keywords:    "Basic meta-model"

	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class P_BMM_INCLUDE_SPEC

feature -- Access

	id: STRING
			-- id of schema

	namespace: STRING
			-- namespace under which types of included schema will be known in this schema

end


