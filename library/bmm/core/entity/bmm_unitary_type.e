note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Parent of meta-types that may be used as the type of any instantiated object that is not a generic container object.
				 ]"
	keywords:    "model, UML"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2009 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class BMM_UNITARY_TYPE

inherit
	BMM_TYPE

feature -- Access

	base_type: BMM_UNITARY_TYPE
			-- Base type, excluding container
		do
			Result := Current
		end

end


