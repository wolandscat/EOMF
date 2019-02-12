note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Abstract parent of range-constrained meta-types, which represent class 
				 definitions that include a restriction on legal values with respect to 
				 possible values that would otherwise be allowed.
				 ]"
	keywords:    "model, object"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2019- openEHR Foundation <http://www.openehr.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class BMM_RANGE_CONSTRAINED

inherit
	BMM_SIMPLE_CLASS
		redefine
			entity_metatype
		end

feature -- Identification

	entity_metatype: STRING
		do
			Result := Entity_metatype_range_constrained
		end

end


