note
	component:   "Eiffel Object Modelling Framework"
	description: "Ancestor type of all BMM model element types"
	keywords:    "model, UML"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class BMM_MODEL_ELEMENT

inherit
	BMM_DEFINITIONS
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal, generating_type
		end

feature -- Access

	name: STRING
			-- Name of this model element.

	documentation: detachable STRING
			-- Optional documentation of this element.

--	scope: BMM_MODEL_ELEMENT
--			-- scope in which this declaration is valid
--		deferred
--		end

end


