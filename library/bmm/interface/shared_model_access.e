note
	component:   "Eiffel Object Modelling Framework"
	description: "Shared access to service interface to object model"
	keywords:    "ADL, archetype, reference model"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SHARED_MODEL_ACCESS

feature -- Access

	models_access: BMM_MODEL_ACCESS
		once ("PROCESS") 
			create Result.make
		end

	model_for_id (an_id: STRING): BMM_MODEL
			-- validated top-level schema for schema id `an_id'
		require
			has_model_for_id (an_id)
		do
			check attached models_access.valid_models.item (an_id) as sch then
				Result := sch
			end
		end

	model_ids: ARRAYED_LIST [STRING]
		do
			create Result.make_from_array (models_access.valid_models.current_keys)
		end

feature -- Status Report

	has_model_for_id (an_id: STRING): BOOLEAN
		do
			Result := models_access.valid_models.has (an_id)
		end

end



