note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Concrete implementation of BMM_SCHEMA_DESCRIPTOR for BMM 2.x files.
				 schema files.
	             ]"
	keywords:    "meta-model, object model"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2009- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_BMM_SCHEMA_DESCRIPTOR

inherit
	BMM_SCHEMA_DESCRIPTOR
		redefine
			bmm_schema, schema_file_accessor
		end

create
	make

feature -- Access

	bmm_schema: detachable P_BMM_SCHEMA
			-- persistent form of model; concrete form set in descendants

feature {NONE} -- Implementation

	schema_file_accessor: ODIN_OBJECT_READER [P_BMM_SCHEMA]

	create_schema_file_accessor (a_schema_path: STRING)
		do
			create schema_file_accessor.make (a_schema_path)
		end

end
