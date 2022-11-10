note
	component:   "Eiffel Object Modelling Framework"
	description: "Shared UI resources"
	keywords:    "test, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2009- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"
	testing:     "type/manual"

class
	TEST_BMM2

inherit
	TEST_UTILITIES
		redefine
			on_prepare
		end

	SHARED_TEST_ENV
		undefine
			default_create
		end

feature {NONE} -- Events

	on_prepare
			-- <Precursor>
		do
			bmm_env_setup
			if not has_errors then
				bmm_model_cache.put (bmm_model ("hl7_fhir_0.5.0"))
			end
		end

feature -- Test routines

	test_has_property_path
			-- New test routine
		note
			testing:  "paths", "bmm", "covers/{SCHEMA_ACCESS}.has_property_path"
		do
		end

	test_property_definition_at_path
			-- New test routine
		note
			testing:  "paths", "bmm", "covers/{SCHEMA_ACCESS}.property_definition_at_path"
		do
		end

	test_is_descendant_of
			-- New test routine
		note
			testing:  "is_descendant_of", "bmm", "covers/{BMM_SCHEMA}.is_descendant_of"
		do
		end

	test_type_name_conforms_to
			-- New test routine
		note
			testing:  "type_name_conforms_to", "bmm", "covers/{BMM_SCHEMA}.type_name_conforms_to"
		do
			assert ("List<Reference<ServiceRequest>> conforms to List<IReference<Any>>", not test_bmm_model.type_conforms_to ("List<Reference<ServiceRequest>>", "List<IReference<Any>>"))
		end

	test_immediate_suppliers
			-- New test routine
		note
			testing:  "immediate_suppliers", "bmm", "covers/{BMM_CLASS_DEFINITION}.immediate_suppliers"
		local
			supps: ARRAYED_SET [STRING]
		do
		end

	test_supplier_closure
			-- New test routine
		note
			testing:  "all_suppliers", "bmm", "covers/{BMM_CLASS_DEFINITION}.supplier_closure"
		local
			supps: ARRAYED_SET [STRING]
		do
		end

end


