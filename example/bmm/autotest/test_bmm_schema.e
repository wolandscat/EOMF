note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_BMM_SCHEMA

inherit
	BMM_TEST_SET

feature -- Test routines

	test_has_property_path_01
			-- New test routine
		note
			testing:  "covers/{BMM_SCHEMA}.has_property_path", "bmm"
		do
			assert ("CARE_ENTRY has /protocol", rm_schema.has_property_path ("CARE_ENTRY", "/protocol"))
			assert ("CARE_ENTRY has /data/events/data", rm_schema.has_property_path ("CARE_ENTRY", "/data/events/data"))
		end

	test_has_property_path_02
			-- New test routine
		note
			testing:  "covers/{BMM_SCHEMA}.has_property_path", "bmm"
		do
			assert ("OBSERVATION has /protocol", rm_schema.has_property_path ("OBSERVATION", "/protocol"))
			assert ("OBSERVATION has /data/events/data", rm_schema.has_property_path ("OBSERVATION", "/data/events/data"))
			assert ("OBSERVATION has /data/events/data/items", rm_schema.has_property_path ("CARE_ENTRY", "/data/events/data/items"))
		end

	test_has_property_path_03
			-- New test routine
		note
			testing:  "covers/{BMM_SCHEMA}.has_property_path", "bmm"
		do
			assert ("OBSERVATION has /data/events[at0003]/math_function", rm_schema.has_property_path ("OBSERVATION", "/data/events[at0003]/math_function"))
			assert ("OBSERVATION has /data/events[at0002]/data/items[at0.76]/items", rm_schema.has_property_path ("OBSERVATION", "/data/events[at0002]/data/items[at0.76]/items"))
			assert ("OBSERVATION has /data/events/data/items", rm_schema.has_property_path ("CARE_ENTRY", "/data/events/data/items"))
		end

	test_has_property_path_04
			-- New test routine
		note
			testing:  "covers/{BMM_SCHEMA}.has_property_path", "bmm"
		do
			assert ("COMPOSITION not has /xxxx", not rm_schema.has_property_path ("COMPOSITION", "/xxxx"))
		end

	test_has_property_path_05
			-- New test routine
		note
			testing:  "covers/{BMM_SCHEMA}.has_property_path", "bmm"
		do
			assert ("CLUSTER has /items/items/items", rm_schema.has_property_path ("CLUSTER", "/items/items/items"))
		end

	test_is_descendant_of_01
		note
			testing:  "covers/{BMM_SCHEMA}.is_descendant_of", "bmm"
		do
			assert ("COMPOSITION is a subclass of LOCATABLE", rm_schema.is_descendant_of ("COMPOSITION", "LOCATABLE"))
			assert ("LOCATABLE is a subclass of COMPOSITION", not rm_schema.is_descendant_of ("LOCATABLE", "COMPOSITION"))
		end

	test_type_conforms_to_01
		note
			testing:  "covers/{BMM_SCHEMA}.type_conforms_to", "bmm"
		do
			assert ("COMPOSITION conforms to LOCATABLE", rm_schema.type_conforms_to ("COMPOSITION", "LOCATABLE"))
			assert ("COMPOSITION conforms to Any", rm_schema.type_conforms_to ("LOCATABLE", "Any"))
			assert ("COMPOSITION conforms to COMPOSITION", rm_schema.type_conforms_to ("COMPOSITION", "COMPOSITION"))
			assert ("not Any conforms to LOCATABLE", not rm_schema.type_conforms_to ("Any", "LOCATABLE"))
			assert ("not LOCATABLE conforms to COMPOSITION", not rm_schema.type_conforms_to ("LOCATABLE", "COMPOSITION"))
		end

	test_type_conforms_to_02
		note
			testing:  "covers/{BMM_SCHEMA}.type_conforms_to", "bmm"
		do
			assert ("Interval<Integer> conforms to Interval", rm_schema.type_conforms_to ("Interval<Integer>", "Interval"))
			assert ("Interval<Integer> conforms to Interval<T>", rm_schema.type_conforms_to ("Interval<Integer>", "Interval<T>"))
			assert ("not Interval<String> conforms to Interval<T>", not rm_schema.type_conforms_to ("Interval<String>", "Interval<T>"))
			assert ("not Interval conforms to Interval<T>", not rm_schema.type_conforms_to ("Interval", "Interval<T>"))
			assert ("not Interval conforms to Interval<Integer>", not rm_schema.type_conforms_to ("Interval", "Interval<Integer>"))
		end

	test_ms_conformant_property_type_01
		note
			testing:  "covers/{BMM_SCHEMA}.ms_conformant_property_type", "bmm"
		do
			assert ("HISTORY<ITEM_LIST> conforms to type of OBSERVATION.data", rm_schema.ms_conformant_property_type ("OBSERVATION", "data", "HISTORY<ITEM_LIST>"))
			assert ("EVENT<ITEM_LIST> conforms to type of HISTORY<ITEM_LIST>.events", rm_schema.ms_conformant_property_type ("HISTORY<ITEM_LIST>", "events", "EVENT<ITEM_LIST>"))
			assert ("ITEM_LIST conforms to type of EVENT<ITEM_LIST>.data", rm_schema.ms_conformant_property_type ("EVENT<ITEM_LIST>", "data", "ITEM_LIST"))
			assert ("HISTORY conforms to type of OBSERVATION.data", rm_schema.ms_conformant_property_type ("OBSERVATION", "data", "HISTORY"))
		end

end


