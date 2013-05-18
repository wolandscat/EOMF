note
	component:   "Eiffel Object Modelling Framework"
	description: "Ancestor for test classes"
	keywords:    "archetype, ontology, terminology"
	author:      "Peter Gummer <peter.gummer@oceaninfomatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2009- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	TEST_UTILITIES

inherit
	EQA_TEST_SET
		rename
			file_system as test_file_system
		end

feature {NONE} -- Assertions

	assert_equal (expected, actual: detachable ANY)
			-- Assert that `actual' is equal to `expected'.
		local
			tag: STRING
		do
			tag := "Expected "

			if attached expected then
				tag.append ("'" + expected.out + "'")
			else
				tag.append ("Void")
			end

			tag.append (" but was ")

			if attached actual then
				tag.append ("'" + actual.out + "'")
			else
				tag.append ("Void")
			end

			assert (tag, actual ~ expected)
		end

end


