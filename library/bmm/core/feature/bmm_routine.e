note
	component:   "Eiffel Object Modelling Framework"
	description: "Ancestor meta-type of routine definition types."
	keywords:    "model, BMM"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2019- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class BMM_ROUTINE

inherit
	BMM_FEATURE
--		redefine
--			scope
--		end

feature -- Access

	parameters: LIST[BMM_PARAMETER]
			-- routine parameters

	locals: LIST[BMM_LOCAL]
			-- routine local variables

	signature: BMM_SIGNATURE
			-- Signature of this model element.
		do
			create Result.make
		end

	scope: BMM_CLASS
			-- class in which this routine is defined

end


