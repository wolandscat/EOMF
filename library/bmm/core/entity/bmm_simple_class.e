note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Definition of a generic class in an object model.
				 ]"
	keywords:    "model, Basic meta-model"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2009 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_SIMPLE_CLASS

inherit
	BMM_CLASS

create
	make

feature -- Identification

	entity_metatype: STRING
		do
			Result := Entity_metatype_simple
		end

feature -- Factory

	type: BMM_SIMPLE_TYPE
			-- type related to this class
		do
			Result := type_cache
			if not attached Result then
				create Result.make (Current)
				type_cache := Result
			end
		end

end
