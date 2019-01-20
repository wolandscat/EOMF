note
	component:   "Eiffel Object Modelling Framework"
	description: "Data Tree serialisers"
	keywords:    "serialisation"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- openEHR Foundation <http://www.openehr.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SHARED_DT_SERIALISERS

feature -- Access

	dt_serialiser_formats: ARRAYED_LIST[STRING]
			-- list of format names
		once
			create Result.make(0)
			Result.compare_objects
			across dt_serialisers as dt_serialisers_csr loop
				Result.extend (dt_serialisers_csr.key)
			end
		end

	dt_serialiser_for_format (a_format: STRING): DT_SERIALISER
			-- get a specific ADL serialiser
		require
			Format_valid: has_dt_serialiser_format (a_format)
		do
			check attached dt_serialisers.item (a_format) as dt_ser then
				Result := dt_ser
			end
		end

feature -- Status Report

	has_dt_serialiser_format (a_format: STRING): BOOLEAN
		do
			Result := dt_serialisers.has (a_format)
		end

feature {NONE} -- Implementation

	dt_serialisers: HASH_TABLE [DT_SERIALISER, STRING]
		once
			create Result.make(0)
		end

end


