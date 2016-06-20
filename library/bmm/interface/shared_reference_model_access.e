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

	ref_models_access: REFERENCE_MODEL_ACCESS
		once ("PROCESS") 
			create Result.make
		end

	ref_model_for_id (an_id: STRING): BMM_MODEL
			-- validated top-level schema for schema id `an_id'
		require
			has_ref_model_for_id (an_id)
		do
			check attached ref_models_access.valid_models.item (an_id) as sch then
				Result := sch
			end
		end

	rm_schema_all_ids: ARRAYED_LIST [STRING]
		do
			create Result.make_from_array (ref_models_access.all_schemas.current_keys)
		end

feature -- Status Report

	has_ref_model_for_id (an_id: STRING): BOOLEAN
		do
			Result := ref_models_access.valid_models.has (an_id)
		end

end



