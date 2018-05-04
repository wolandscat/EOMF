note
	component:   "Eiffel Object Modelling Framework"
	description: "Basic Meta-model model abstraction - 'include' specifier"
	keywords:    "model, UML"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_INCLUDE_SPEC

feature -- Access

	id: STRING
			-- id of schema
        attribute
            create Result.make_empty
        end

end


