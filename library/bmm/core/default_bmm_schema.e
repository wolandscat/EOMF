note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Default schema instance.
				 ]"
	keywords:    "Basic meta-model"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class DEFAULT_BMM_SCHEMA

inherit
	BMM_SCHEMA

feature -- Access (Attributes from schema load post-processing)

	primitive_types_count: INTEGER
			-- Report number of primitive types found
		do
		end

	class_definitions_count: INTEGER
			-- Report number of primitive types found
		do
		end

feature {BMM_SCHEMA_DESCRIPTOR, BMM_MODEL_ACCESS} -- Schema Processing

	validate_created
		do
			passed := True
			state := State_validated_created
		end

	load_finalise
		do
			state := State_includes_processed
		end

	merge (included_schema: BMM_SCHEMA)
		do
		end

	validate
		do
		end

feature -- Factory

	create_bmm_model
			-- generate a BMM_MODEL object
		do
		end

end
