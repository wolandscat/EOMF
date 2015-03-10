note
	component:   "Eiffel Object Modelling Framework"
	description: "Shared cache for object type ids and type names"
	keywords:    "type"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class SHARED_TYPE_ID_CACHE

inherit
	INTERNAL
		export 
			{NONE} all
		end
		
feature -- Access

	type_id (a_type_name: STRING): INTEGER
		require
			a_type_name /= Void and then not a_type_name.is_empty
		do
			if type_id_cache.has(a_type_name) then
				Result := type_id_cache.item(a_type_name)
			else
				Result := dynamic_type_from_string(a_type_name)
				if Result /= -1 then
				    type_id_cache.put(Result, a_type_name)
				end
			end
		end

feature {NONE} -- Implementation

    type_id_cache: HASH_TABLE [INTEGER, STRING]
			-- table of type ids keyed by type name
		once
			create Result.make(0)
		end

end
	
