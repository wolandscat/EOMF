note
	component:   "Eiffel Object Modelling Framework"
	description: "Shared access to service interface to object model"
	keywords:    "Basic meta-model"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SHARED_BMM_MODEL_ACCESS

feature -- Access

	bmm_models_access: BMM_MODEL_ACCESS
		once ("PROCESS")
			create Result.make
		end

	bmm_model (a_model_id: STRING): BMM_MODEL
			-- Return BMM model containing `a_model_id', e.g. "openEHR-EHR"
		require
			has_bmm_model (a_model_id)
		do
			Result := bmm_models_access.bmm_model (a_model_id)
		end

	bmm_model_ids: ARRAYED_LIST [READABLE_STRING_GENERAL]
		do
			create Result.make_from_array (bmm_models_access.bmm_models.current_keys)
		end

feature -- Status Report

	has_bmm_model (a_model_id: STRING): BOOLEAN
		do
			Result := bmm_models_access.has_bmm_model (a_model_id)
		end

end



