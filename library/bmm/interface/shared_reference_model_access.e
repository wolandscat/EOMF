note
	component:   "Eiffel Object Modelling Framework"
	description: "Shared access to service interface to object model"
	keywords:    "ADL, archetype, reference model"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SHARED_REFERENCE_MODEL_ACCESS

feature -- Access

	rm_schemas_access: REFERENCE_MODEL_ACCESS
		once
			create Result.make
		end

	rm_schema_for_id (an_id: STRING): BMM_SCHEMA
			-- validated top-level schema for schema id `an_id'
		require
			has_rm_schema_for_id (an_id)
		do
			check attached rm_schemas_access.valid_top_level_schemas.item (an_id) as sch then
				Result := sch
			end
		end

	rm_schema_all_ids: ARRAYED_LIST [STRING]
		do
			create Result.make_from_array (rm_schemas_access.all_schemas.current_keys)
		end

feature -- Status Report

	has_rm_schema_for_id (an_id: STRING): BOOLEAN
		do
			Result := rm_schemas_access.valid_top_level_schemas.has (an_id)
		end

end



