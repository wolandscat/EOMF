note
	component:   "Eiffel Object Modelling Framework"
	description: "Tests OG_PATH functions"
	keywords:    "archetype, ontology, terminology"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	TEST_OG_PATH

inherit
	TEST_UTILITIES

feature -- Test routines

	test_make_from_string
			-- see if make_from_string parses properly
		note
			testing:  "covers/{OG_PATH}.make_from_string"
		local
			a_path_string: STRING
			a_path: OG_PATH
		do
			a_path_string := "/constraint_bindings[AIR93]/items"
			create a_path.make_from_string(a_path_string)
			assert_equal (True, a_path.as_string.is_equal(a_path_string))

			a_path_string := "/constraint_bindings[AIR93(1.0.0)]/items"
			create a_path.make_from_string(a_path_string)
			assert_equal (True, a_path.as_string.is_equal(a_path_string))
		end

end


