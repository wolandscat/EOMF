note
	component:   "Eiffel Object Modelling Framework"
	description: "Abstract idea of a property definition of a unitary type within a class definition"
	keywords:    "model, UML"
	author:      "Thomas Beale"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	copyright:   "Copyright (c) 2009 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_UNITARY_PROPERTY

inherit
	BMM_PROPERTY
		redefine
			bmm_type
		end

create
	make, make_from_other, make_from_other_generic

feature -- Access

	bmm_type: BMM_UNITARY_TYPE
			-- formal meta-type of this attribute

feature -- Factory

	create_duplicate: like Current
			-- create a copy of this property object
		do
			Create Result.make_from_other (Current)
			Result.set_bmm_type (bmm_type.create_duplicate)
		end

end


