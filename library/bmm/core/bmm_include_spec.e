note
	component:   "Eiffel Object Modelling Framework"
	description: "Basic Meta-model model abstraction - 'include' specifier"
	keywords:    "model, UML"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "openEHR AWB project <http://www.openehr.org/issues/browse/AWB>"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_INCLUDE_SPEC

feature -- Access

	id: STRING
			-- id of schema
        attribute
            create Result.make_empty
        end

	namespace: STRING
			-- namespace under which types of included schema will be known in this schema
        attribute
            create Result.make_empty
        end

end


