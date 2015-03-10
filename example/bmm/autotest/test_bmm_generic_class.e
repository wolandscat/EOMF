note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_BMM_GENERIC_TYPE

inherit
	BMM_TEST_SET

feature -- Test routines

	test_type_substitutions_01
			-- New test routine
		note
			testing:  "covers/{BMM_GENERIC_TYPE}.type_substitutions", "bmm"
		local
			type_subs: ARRAYED_SET [STRING]
		do
			if attached {BMM_GENERIC_type} rm_schema.create_bmm_type_from_name ("Interval<Ordered>") as bmm_gen_type then
				type_subs := bmm_gen_type.type_substitutions
				assert ("type_substitutions.has (%"Interval<Integer>%"", type_subs.has ("Interval<Integer>"))
				assert ("type_substitutions.has (%"DV_INTERVAL<Integer>%"", type_subs.has ("DV_INTERVAL<Integer>"))
				assert ("type_substitutions.has (%"Interval<Real>%"", type_subs.has ("Interval<Real>"))
				assert ("type_substitutions.has (%"DV_INTERVAL<Real>%"", type_subs.has ("DV_INTERVAL<Real>"))
				assert ("type_substitutions.has (%"Interval<DV_QUANTITY>%"", type_subs.has ("Interval<DV_QUANTITY>"))
				assert ("type_substitutions.has (%"DV_INTERVAL<DV_QUANTITY>%"", type_subs.has ("DV_INTERVAL<DV_QUANTITY>"))
				assert ("type_substitutions.has (%"Interval<DV_PROPORTION>%"", type_subs.has ("Interval<DV_PROPORTION>"))
				assert ("type_substitutions.has (%"DV_INTERVAL<DV_PROPORTION>%"", type_subs.has ("DV_INTERVAL<DV_PROPORTION>"))
				assert ("type_substitutions.has (%"Interval<DV_ORDINAL>%"", type_subs.has ("Interval<DV_ORDINAL>"))
				assert ("type_substitutions.has (%"DV_INTERVAL<DV_ORDINAL>%"", type_subs.has ("DV_INTERVAL<DV_ORDINAL>"))
				assert ("type_substitutions.has (%"Interval<DV_DATE>%"", type_subs.has ("Interval<DV_DATE>"))
				assert ("type_substitutions.has (%"DV_INTERVAL<DV_DATE>%"", type_subs.has ("DV_INTERVAL<DV_DATE>"))
				assert ("type_substitutions.has (%"Interval<DV_DATE_TIME>%"", type_subs.has ("Interval<DV_DATE_TIME>"))
				assert ("type_substitutions.has (%"DV_INTERVAL<DV_DATE_TIME>%"", type_subs.has ("DV_INTERVAL<DV_DATE_TIME>"))
			end
		end

end


