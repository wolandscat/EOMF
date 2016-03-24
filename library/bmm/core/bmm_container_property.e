note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Subtype of BMM_PROPERTY that represents a container type based on one of the 
				 inbuilt types List <>, Set <>, Array <>.
				 ]"
	keywords:    "model, UML"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2009- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_CONTAINER_PROPERTY

inherit
	BMM_PROPERTY [BMM_CONTAINER_TYPE]
		redefine
			make, display_name, object_multiplicity
		end

create
	make

feature -- Initialisation

	make (a_name: STRING; a_doc: detachable STRING; a_type: like type; is_mandatory_flag, is_computed_flag, is_im_infrastructure_flag, is_im_runtime_flag: BOOLEAN)
		do
			precursor (a_name, a_doc, a_type, is_mandatory_flag, is_computed_flag, is_im_infrastructure_flag, is_im_runtime_flag)
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

	object_multiplicity: MULTIPLICITY_INTERVAL
			-- return the effective child object multiplicity of the property definition for `a_prop_name' in flattened class
			-- corresponding to `a_type_name'.
			-- Multiplicity is computed as the possible numeric range of child instances under this property at run time, i.e.
			-- 0 .. cardinality.upper
		do
			if cardinality.upper_unbounded then
				create Result.make_upper_unbounded (0)
			else
				create Result.make_bounded (0, cardinality.upper)
			end
		end

feature -- Modification

	set_cardinality (a_cardinality: MULTIPLICITY_INTERVAL)
		do
			cardinality := a_cardinality
		end

end


