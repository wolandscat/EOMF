note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Subtype of BMM_PROPERTY that represents a container type based on one of the 
				 inbuilt types List <>, Set <>, Array <>.
				 ]"
	keywords:    "model, BMM"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2009- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_CONTAINER_PROPERTY

inherit
	BMM_PROPERTY
		redefine
			bmm_type, make, make_from_other, make_from_other_generic, display_name, object_multiplicity
		end

create
	make, make_from_other, make_from_other_generic

feature -- Initialisation

	make (a_name: STRING; a_doc: detachable STRING; a_type: like bmm_type; is_nullable_flag, is_computed_flag, is_im_infrastructure_flag, is_im_runtime_flag: BOOLEAN)
		do
			precursor (a_name, a_doc, a_type, is_nullable_flag, is_computed_flag, is_im_infrastructure_flag, is_im_runtime_flag)
			create cardinality.make_open
		end

	make_from_other (other: like Current)
			-- make from a BMM_PROPERTY of any generic flavour
		do
			precursor (other)
			cardinality := other.cardinality.twin
		end

	make_from_other_generic (other: like Current; a_bmm_type: like bmm_type)
			-- make from a BMM_PROPERTY of any flavour
		do
			precursor (other, a_bmm_type)
			cardinality := other.cardinality.twin
		end

feature -- Identification

	display_name: STRING
			-- name of this attribute to display in screen form, grid etc
		do
			Result := name.twin
			Result.append (": " + bmm_type.container_class.name + Generic_left_delim.out + Generic_right_delim.out)
		end

feature -- Access

	bmm_type: BMM_CONTAINER_TYPE
			-- formal meta-type of this attribute

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

feature -- Factory

	create_duplicate: like Current
			-- create a copy of this property object
		do
			Create Result.make_from_other (Current)
			Result.set_bmm_type (bmm_type.create_duplicate)
		end

end


