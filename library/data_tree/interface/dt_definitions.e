note
	component:   "Eiffel Object Modelling Framework"
	description: "Definitions for DT classes"
	keywords:    "data tree"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class DT_DEFINITIONS

feature -- Definitions

	Container_attr_name: STRING = "items"
			-- name assumed for internal attribute of any container type represented in OG, DT or ODIN structure

	Persistence_class_leader: STRING = "P_"

	eiffel_to_standard_type_name (an_eif_type_name: STRING): STRING
			-- convert an Eiffel type name, possibly generic to a BMM type name
		do
			if not eif_openehr_type_map.has (an_eif_type_name) then
				create Result.make_from_string (an_eif_type_name)

				-- replace Persistence class leader
				if Result.starts_with (Persistence_class_leader) then
					Result.remove_head (Persistence_class_leader.count)
				end

				Result.replace_substring_all ("!", "")
				Result.replace_substring_all ("[", "<")
				Result.replace_substring_all ("]", ">")
				Result.replace_substring_all ("_8", "")
				Result.replace_substring_all ("_32", "")

				Result.replace_substring_all ("HASH_TABLE", "Hash")
				Result.replace_substring_all ("ARRAYED_LIST", "List")
				Result.replace_substring_all ("ARRAYED_SET", "Set")

				-- if using Mixed_snake_case uncomment the following line
				-- Result.replace_substring (Result.substring (2, Result.count).as_lower, 2, Result.count)

				eif_openehr_type_map.put (Result, an_eif_type_name)
			else
				check attached eif_openehr_type_map.item (an_eif_type_name) as cvt_type then
					Result := cvt_type
				end
			end
		end

	eif_openehr_type_map: STRING_TABLE[STRING]
		once
			create Result.make(0)
		end

end


