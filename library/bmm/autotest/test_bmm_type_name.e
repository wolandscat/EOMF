note
	component:   "Eiffel Object Modelling Framework"
	description: "Autotest for TEST_BMM_TYPE_NAME"
	keywords:    "test, BMM, typename"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2017- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"
	testing:     "type/manual"

class
	TEST_BMM_TYPE_NAME

inherit
	TEST_UTILITIES

	BMM_DEFINITIONS
		undefine
			default_create
		end

feature -- Test routines

	test_create_type_name_simple
			-- New test routine
		note
			testing:  "type_name", "bmm", "covers/{BMM_DEFINITIONS}.create_type_name_from_string"
		local
			orig_type_str: STRING
		do
			orig_type_str := "OBSERVATION"
			if attached create_type_name_from_string (orig_type_str) as att_bmm_type_name then
				assert ("Rountrip test: ", att_bmm_type_name.as_string.same_string(orig_type_str))
				assert ("is_simple: ", att_bmm_type_name.is_simple)
				assert ("Not is_generic: ", not att_bmm_type_name.is_generic)
				assert ("Not is_formal_type_parameter: ", not att_bmm_type_name.is_formal_type_parameter)
				assert ("Not is_open: ", not att_bmm_type_name.is_open)
				assert ("Not is_generic_class_signature: ", not att_bmm_type_name.is_generic_class_signature)
				assert ("is_valid: ", att_bmm_type_name.is_valid)
			else
				assert ("create_type_name_from_string (%"" + orig_type_str + "%")", False)
			end
		end

	test_create_type_name_generic_parameter
			-- New test routine
		note
			testing:  "type_name", "bmm", "covers/{BMM_DEFINITIONS}.create_type_name_from_string"
		local
			orig_type_str: STRING
		do
			orig_type_str := "T"
			if attached create_type_name_from_string (orig_type_str) as att_bmm_type_name then
				assert ("Rountrip test: ", att_bmm_type_name.as_string.same_string(orig_type_str))
				assert ("Not is_simple: ", not att_bmm_type_name.is_simple)
				assert ("Not is_generic: ", not att_bmm_type_name.is_generic)
				assert ("is_formal_type_parameter: ", att_bmm_type_name.is_formal_type_parameter)
				assert ("is_open: ", att_bmm_type_name.is_open)
				assert ("Not is_generic_class_signature: ", not att_bmm_type_name.is_generic_class_signature)
				assert ("is_valid: ", att_bmm_type_name.is_valid)
			else
				assert ("create_type_name_from_string (%"" + orig_type_str + "%")", False)
			end
		end

	test_create_type_name_simple_generic_type
			-- New test routine
		note
			testing:  "type_name", "bmm", "covers/{BMM_DEFINITIONS}.create_type_name_from_string"
		local
			orig_type_str: STRING
		do
			orig_type_str := "Interval<Integer>"
			if attached create_type_name_from_string (orig_type_str) as att_bmm_type_name then
				assert ("Rountrip test: ", att_bmm_type_name.as_string.same_string(orig_type_str))
				assert ("Not is_simple: ", not att_bmm_type_name.is_simple)
				assert ("is_generic: ", att_bmm_type_name.is_generic)
				assert ("Not is_formal_type_parameter: ", not att_bmm_type_name.is_formal_type_parameter)
				assert ("Not is_open: ", not att_bmm_type_name.is_open)
				assert ("Not is_generic_class_signature: ", not att_bmm_type_name.is_generic_class_signature)
				assert ("is_valid: ", att_bmm_type_name.is_valid)
			else
				assert ("create_type_name_from_string (%"" + orig_type_str + "%")", False)
			end
		end

	test_create_type_name_simple_generic_class
			-- New test routine
		note
			testing:  "type_name", "bmm", "covers/{BMM_DEFINITIONS}.create_type_name_from_string"
		local
			orig_type_str: STRING
		do
			orig_type_str := "Interval<T>"
			if attached create_type_name_from_string (orig_type_str) as att_bmm_type_name then
				assert ("Rountrip test: ", att_bmm_type_name.as_string.same_string(orig_type_str))
				assert ("Not is_simple: ", not att_bmm_type_name.is_simple)
				assert ("is_generic: ", att_bmm_type_name.is_generic)
				assert ("Not is_formal_type_parameter: ", not att_bmm_type_name.is_formal_type_parameter)
				assert ("is_open: ", att_bmm_type_name.is_open)
				assert ("is_generic_class_signature: ", att_bmm_type_name.is_generic_class_signature)
				assert ("is_valid: ", att_bmm_type_name.is_valid)
			else
				assert ("create_type_name_from_string (%"" + orig_type_str + "%")", False)
			end
		end

	test_create_type_name_simple_generic_class_constrained
			-- New test routine
		note
			testing:  "type_name", "bmm", "covers/{BMM_DEFINITIONS}.create_type_name_from_string"
		local
			orig_type_str: STRING
		do
			orig_type_str := "Interval<T:Integer>"
			if attached create_type_name_from_string (orig_type_str) as att_bmm_type_name then
				assert ("Rountrip test: ", att_bmm_type_name.as_type_signature (False).same_string(orig_type_str))
				assert ("Not is_simple: ", not att_bmm_type_name.is_simple)
				assert ("is_generic: ", att_bmm_type_name.is_generic)
				assert ("Not is_formal_type_parameter: ", not att_bmm_type_name.is_formal_type_parameter)
				assert ("is_open: ", att_bmm_type_name.is_open)
				assert ("is_generic_class_signature: ", att_bmm_type_name.is_generic_class_signature)
				assert ("is_valid: ", att_bmm_type_name.is_valid)
			else
				assert ("create_type_name_from_string (%"" + orig_type_str + "%")", False)
			end
		end

	test_create_type_name_generic_parameter_constrained
			-- New test routine
		note
			testing:  "type_name", "bmm", "covers/{BMM_DEFINITIONS}.create_type_name_from_string"
		local
			orig_type_str: STRING
		do
			orig_type_str := "T:Integer"
			if attached create_type_name_from_string (orig_type_str) as att_bmm_type_name then
				assert ("Rountrip test: ", att_bmm_type_name.as_type_signature (False).same_string (orig_type_str))
				assert ("Not is_simple: ", not att_bmm_type_name.is_simple)
				assert ("Not is_generic: ", not att_bmm_type_name.is_generic)
				assert ("is_formal_type_parameter: ", att_bmm_type_name.is_formal_type_parameter)
				assert ("is_open: ", att_bmm_type_name.is_open)
				assert ("Not is_generic_class_signature: ", not att_bmm_type_name.is_generic_class_signature)
				assert ("is_valid: ", att_bmm_type_name.is_valid)
			else
				assert ("create_type_name_from_string (%"" + orig_type_str + "%")", False)
			end
		end

	test_create_type_name_generic_complex_1
			-- New test routine
		note
			testing:  "type_name", "bmm", "covers/{BMM_DEFINITIONS}.create_type_name_from_string"
		local
			orig_type_str: STRING
		do
			orig_type_str := "Hash_table<K:Ordered,V>"
			if attached create_type_name_from_string (orig_type_str) as att_bmm_type_name then
				assert ("Rountrip test: ", att_bmm_type_name.as_type_signature (False).same_string (orig_type_str))
				assert ("Not is_simple: ", not att_bmm_type_name.is_simple)
				assert ("is_generic: ", att_bmm_type_name.is_generic)
				assert ("Not is_formal_type_parameter: ", not att_bmm_type_name.is_formal_type_parameter)
				assert ("is_open: ", att_bmm_type_name.is_open)
				assert ("is_generic_class_signature: ", att_bmm_type_name.is_generic_class_signature)
				assert ("is_valid: ", att_bmm_type_name.is_valid)
			else
				assert ("create_type_name_from_string (%"" + orig_type_str + "%")", False)
			end
		end

	test_create_type_name_generic_nested_1
			-- New test routine
		note
			testing:  "type_name", "bmm", "covers/{BMM_DEFINITIONS}.create_type_name_from_string"
		local
			orig_type_str: STRING
		do
			orig_type_str := "Hash_table<String,ARRAYED_LIST<PACKET>>"
			if attached create_type_name_from_string (orig_type_str) as att_bmm_type_name then
				assert ("Rountrip test: ", att_bmm_type_name.as_string.same_string(orig_type_str))
				assert ("Not is_simple: ", not att_bmm_type_name.is_simple)
				assert ("is_generic: ", att_bmm_type_name.is_generic)
				assert ("Not is_formal_type_parameter: ", not att_bmm_type_name.is_formal_type_parameter)
				assert ("Not is_open: ", not att_bmm_type_name.is_open)
				assert ("Not is_generic_class_signature: ", not att_bmm_type_name.is_generic_class_signature)
				assert ("is_generic_type_signature: ", att_bmm_type_name.is_generic_type_signature)
				assert ("is_valid: ", att_bmm_type_name.is_valid)
			else
				assert ("create_type_name_from_string (%"" + orig_type_str + "%")", False)
			end
		end

	test_create_type_name_generic_nested_2
			-- New test routine
		note
			testing:  "type_name", "bmm", "covers/{BMM_DEFINITIONS}.create_type_name_from_string"
		local
			orig_type_str: STRING
		do
			orig_type_str := "Hash_table<Interval<T>,ARRAYED_LIST<PACKET>>"
			if attached create_type_name_from_string (orig_type_str) as att_bmm_type_name then
				assert ("Rountrip test: ", att_bmm_type_name.as_string.same_string(orig_type_str))
				assert ("Not is_simple: ", not att_bmm_type_name.is_simple)
				assert ("is_generic: ", att_bmm_type_name.is_generic)
				assert ("Not is_formal_type_parameter: ", not att_bmm_type_name.is_formal_type_parameter)
				assert ("is_open: ", att_bmm_type_name.is_open)
				assert ("Not is_generic_class_signature: ", not att_bmm_type_name.is_generic_class_signature)
				assert ("is_generic_type_signature: ", att_bmm_type_name.is_generic_type_signature)
				assert ("is_valid: ", att_bmm_type_name.is_valid)
			else
				assert ("create_type_name_from_string (%"" + orig_type_str + "%")", False)
			end
		end

	test_create_type_name_error_1
			-- New test routine
		note
			testing:  "type_name", "bmm", "covers/{BMM_DEFINITIONS}.create_type_name_from_string"
		local
			orig_type_str: STRING
		do
			orig_type_str := "Hash_table<T:Ordered,ARRAYED_LIST<PACKET>>"
			if attached create_type_name_from_string (orig_type_str) as att_bmm_type_name then
				assert ("Rountrip test: ", att_bmm_type_name.as_type_signature (False).same_string(orig_type_str))
				assert ("Not is_valid: ", not att_bmm_type_name.is_valid)
			else
				assert ("create_type_name_from_string (%"" + orig_type_str + "%")", False)
			end
		end

	test_create_type_name_error_2
			-- New test routine
		note
			testing:  "type_name", "bmm", "covers/{BMM_DEFINITIONS}.create_type_name_from_string"
		local
			orig_type_str: STRING
		do
			orig_type_str := "Hash_table<Interval<T:Ordered>,ARRAYED_LIST<PACKET>>"
			if attached create_type_name_from_string (orig_type_str) as att_bmm_type_name then
				assert ("Rountrip test: ", att_bmm_type_name.as_type_signature (False).same_string(orig_type_str))
				assert ("Not is_valid: ", not att_bmm_type_name.is_valid)
			else
				assert ("create_type_name_from_string (%"" + orig_type_str + "%")", False)
			end
		end

	test_is_type_signature
			-- New test routine
		note
			testing:  "type_name", "bmm", "covers/{BMM_TYPE_NAME}.is_type_signature"
		local
			orig_type_str: STRING
		do
			orig_type_str := "Hash_table<K,V>"
			if attached create_type_name_from_string (orig_type_str) as att_bmm_type_name then
				assert ("is_type_signature: ", att_bmm_type_name.is_type_signature)
			end

			orig_type_str := "Hash_table<K:Ordered,V>"
			if attached create_type_name_from_string (orig_type_str) as att_bmm_type_name then
				assert ("not is_type_signature: ", not att_bmm_type_name.is_type_signature)
			end

			orig_type_str := "Hash_table<Interval<T>,ARRAYED_LIST<PACKET>>"
			if attached create_type_name_from_string (orig_type_str) as att_bmm_type_name then
				assert ("is_type_signature: ", att_bmm_type_name.is_type_signature)
			end

			orig_type_str := "T"
			if attached create_type_name_from_string (orig_type_str) as att_bmm_type_name then
				assert ("is_type_signature: ", att_bmm_type_name.is_type_signature)
			end
		end

	test_as_string_list_1
			-- New test routine
		note
			testing:  "type_name", "bmm", "covers/{BMM_TYPE_NAME}.as_string_list"
		local
			orig_type_str: STRING
			flat_list: ARRAYED_LIST [STRING]
			orig_type_list: ARRAY [STRING]
		do
			orig_type_str := "Hash_table<K,V>"
			orig_type_list := <<"Hash_table","K","V">>
			if attached create_type_name_from_string (orig_type_str) as att_bmm_type_name then
				assert ("is_type_signature: ", att_bmm_type_name.is_type_signature)
				flat_list := att_bmm_type_name.as_string_list
				assert ("flat_list: ", across flat_list as list_csr all list_csr.item.same_string (orig_type_list[list_csr.cursor_index]) end)
			end

			orig_type_str := "K"
			orig_type_list := <<"K">>
			if attached create_type_name_from_string (orig_type_str) as att_bmm_type_name then
				assert ("is_type_signature: ", att_bmm_type_name.is_type_signature)
				flat_list := att_bmm_type_name.as_string_list
				assert ("flat_list: ", across flat_list as list_csr all list_csr.item.same_string (orig_type_list[list_csr.cursor_index]) end)
			end

			orig_type_str := "Hash_table<Interval<T>,ARRAYED_LIST<PACKET>>"
			orig_type_list := <<"Hash_table", "Interval", "T","ARRAYED_LIST", "PACKET">>
			if attached create_type_name_from_string (orig_type_str) as att_bmm_type_name then
				assert ("is_type_signature: ", att_bmm_type_name.is_type_signature)
				flat_list := att_bmm_type_name.as_string_list
				assert ("flat_list: ", across flat_list as list_csr all list_csr.item.same_string (orig_type_list[list_csr.cursor_index]) end)
			end

			orig_type_str := "OBSERVATION"
			orig_type_list := <<"OBSERVATION">>
			if attached create_type_name_from_string (orig_type_str) as att_bmm_type_name then
				assert ("is_type_signature: ", att_bmm_type_name.is_type_signature)
				flat_list := att_bmm_type_name.as_string_list
				assert ("flat_list: ", across flat_list as list_csr all list_csr.item.same_string (orig_type_list[list_csr.cursor_index]) end)
			end
		end

	test_generic_parameters_type_list
			-- New test routine
		note
			testing:  "type_name", "bmm", "covers/{BMM_TYPE_NAME}.generic_parameters_type_list"
		local
			orig_type_str: STRING
			flat_list: ARRAYED_LIST [STRING]
			gen_type_list: ARRAY [STRING]
		do
			orig_type_str := "Hash <List<String>, Integer>"
			gen_type_list := <<"List<String>","Integer">>
			if attached create_type_name_from_string (orig_type_str) as att_bmm_type_name then
				assert ("is_type_signature: ", att_bmm_type_name.is_type_signature)
				flat_list := att_bmm_type_name.generic_parameters_type_list
				assert ("flat_list: ", across flat_list as list_csr all list_csr.item.same_string (gen_type_list[list_csr.cursor_index]) end)
			end
		end

end


