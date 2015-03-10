note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_BMM_CLASS

inherit
	BMM_TEST_SET

feature -- Test routines

	test_property_type_01
			-- New test routine
		note
			testing:  "covers/{BMM_CLASS}.property_type", "bmm"
		local
			a_bmm_class: BMM_CLASS
		do
			a_bmm_class := rm_schema.class_definition ("Interval")
			assert ("property_type (%"Interval%", %"lower%")", a_bmm_class.effective_property_type ("Interval", "lower").is_equal ("Ordered"))
		end

	test_property_type_02
			-- New test routine
		note
			testing:  "covers/{BMM_CLASS}.property_type", "bmm"
		local
			a_bmm_class: BMM_CLASS
		do
			a_bmm_class := rm_schema.class_definition ("Interval")
			assert ("property_type (%"Interval<Integer>%", %"lower%")", a_bmm_class.effective_property_type ("Interval<Integer>", "lower").is_equal ("Integer"))
		end

end


