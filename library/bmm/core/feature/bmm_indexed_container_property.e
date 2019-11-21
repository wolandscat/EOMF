note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Subtype of BMM_CONTAINER_PROPERTY that represents a container type based on one of the 
				 inbuilt types Hash<> or any other indexed container.
				 ]"
	keywords:    "model, BMM"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2009- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_INDEXED_CONTAINER_PROPERTY

inherit
	BMM_CONTAINER_PROPERTY
		redefine
			bmm_type, display_name
		end

create
	make, make_from_other, make_from_other_generic

feature -- Identification

	display_name: STRING
			-- name of this attribute to display in screen form, grid etc
		do
			Result := name.twin
			Result.append (": " + bmm_type.container_class.name + Generic_left_delim.out + bmm_type.index_type.type_name + Generic_separator.out + Generic_right_delim.out)
		end

feature -- Access

	bmm_type: BMM_INDEXED_CONTAINER_TYPE
			-- formal meta-type of this attribute

end


