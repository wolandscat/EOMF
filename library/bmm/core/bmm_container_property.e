note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Subtype of BMM_PROPERTY_DEFINITION that represents a container type based on one of the 
				 inbuilt types List <>, Set <>, Array <>.
				 ]"
	keywords:    "model, UML"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2009- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_CONTAINER_PROPERTY

inherit
	BMM_PROPERTY_DEFINITION
		redefine
			type, make, display_name
		end

create
	make

feature -- Initialisation

	make (a_name: STRING; a_type: like type; is_mandatory_flag, is_computed_flag, is_im_infrastructure_flag, is_im_runtime_flag: BOOLEAN)
		do
			precursor (a_name, a_type, is_mandatory_flag, is_computed_flag, is_im_infrastructure_flag, is_im_runtime_flag)
			create cardinality.make_open
		end

feature -- Access

	display_name: STRING
			-- name of this attribute to display in screen form, grid etc
		do
			Result := name.twin
			Result.append (": " + type.container_type.name + Generic_left_delim.out + Generic_right_delim.out)
		end

	cardinality: MULTIPLICITY_INTERVAL

	type: BMM_CONTAINER_TYPE_REFERENCE
			-- type of the contained type

feature -- Modification

	set_cardinality (a_cardinality: MULTIPLICITY_INTERVAL)
		do
			cardinality := a_cardinality
		end

end


