note
	component:   "Eiffel Object Modelling Framework"
	description: "Abstract form of a variable within the scope of a routine."
	keywords:    "model, UML, BMM"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2019 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class BMM_VARIABLE

inherit
	BMM_INSTANTIABLE
	BMM_CLASS_SCOPED
--		redefine
--			scope
--		end

feature -- Access

--	scope: BMM_ROUTINE
			-- scope of a variable is a routine

end


