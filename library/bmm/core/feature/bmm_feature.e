note
	component:   "Eiffel Object Modelling Framework"
	description: "Ancestor type of formally referencable model elements, which all have a signature."
	keywords:    "model, UML"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2019- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class BMM_FEATURE

inherit
	BMM_DECLARATION

feature -- Access

	scope: BMM_DECLARATION
			-- scope of this feature.

	signature: BMM_SIGNATURE
			-- Signature of this feature.
		deferred
		end

end


