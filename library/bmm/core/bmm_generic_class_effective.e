note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Computed form of generic class structure that represents a generic type based on a generic class,
				 with at least one filled generic parameter.
				 ]"
	keywords:    "model, Basic meta-model"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2017 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_GENERIC_CLASS_EFFECTIVE

inherit
	BMM_GENERIC_CLASS
		rename
			make as make_class
		redefine
			type_name, type_signature
		end

create
	make

feature -- Initialisation

    make (a_gen_type: BMM_GENERIC_TYPE)
    		-- create as a copy from a BMM_GENERIC_CLASS, i.e. a_gen_type.base_class
    	local
    		a_base_class: BMM_GENERIC_CLASS
    		new_prop: BMM_PROPERTY[BMM_TYPE]
    		i: INTEGER
    		gen_param_name: STRING
    	do
    		a_base_class := a_gen_type.base_class
    		make_class (a_base_class.name.twin, clone(a_base_class.documentation), a_base_class.is_abstract)

    		generic_parameters.merge (a_base_class.generic_parameters)
    		ancestors.merge (a_base_class.ancestors)
    		immediate_descendants.fill (a_base_class.immediate_descendants)
    		properties.merge (a_base_class.properties)
    		package := a_base_class.package
    		source_schema_id := a_base_class.source_schema_id.twin
    		is_override := a_base_class.is_override
    		is_primitive_type := a_base_class.is_primitive_type

    		-- populate `generic_substitutions' from `a_gen_type'; here we rely on the
    		-- fact that iteration through a HASH_TABLE respects the chronological order
    		-- of insertion.
    		i := 1
			across generic_parameters as gen_parms_csr loop
				generic_substitutions.put (a_gen_type.generic_parameters.i_th (i), gen_parms_csr.item.name)
				i := i + 1
			end

    		-- iterate through flat properties, and any that are of open type, build
    		-- a replacement from `generic_substitutions'
    		across flat_properties as props_csr loop
    			if attached {BMM_PROPERTY[BMM_OPEN_TYPE]} props_csr.item as open_gen_prop then
    				gen_param_name := open_gen_prop.bmm_type.generic_constraint.name
    				check generic_substitutions.has (gen_param_name) end
    				if attached {BMM_SIMPLE_TYPE} generic_substitutions.item (gen_param_name) as simple_type then
						create {BMM_PROPERTY[BMM_SIMPLE_TYPE]} new_prop.make_from_other(open_gen_prop, simple_type)
						overwrite_property (new_prop)
    				elseif attached {BMM_CONTAINER_TYPE} generic_substitutions.item (gen_param_name) as cont_type then
						create {BMM_PROPERTY[BMM_CONTAINER_TYPE]} new_prop.make_from_other(open_gen_prop, cont_type)
						overwrite_property (new_prop)
    				elseif attached {BMM_GENERIC_TYPE} generic_substitutions.item (gen_param_name) as gen_type then
						create {BMM_PROPERTY[BMM_GENERIC_TYPE]} new_prop.make_from_other(open_gen_prop, gen_type)
						overwrite_property (new_prop)
					else
						-- do nothing; the parameter is still BMM_OPEN_TYPE
    				end
    			end
    		end
    	end

feature -- Access

	generic_substitutions: HASH_TABLE [BMM_TYPE, STRING]
			-- list of generic parameter subsitutions, keyed by formal parameter name, e.g. 'T', 'U'
		attribute
			create Result.make (0)
		end

feature -- Identification

	type_name: STRING
			-- Type name with substitutions, e.g. Interval<Time>; there may still
			-- be open parameters.
		do
			create Result.make_from_string (name)
			Result.append_character (generic_left_delim)
			across generic_substitutions as gen_parms_csr loop
				Result.append (gen_parms_csr.item.type_name)
				if not gen_parms_csr.is_last then
					Result.append_character (generic_separator)
				end
			end
			Result.append_character (generic_right_delim)
		end

	type_signature: STRING
			-- Signature form of the type, which for generics includes generic parameter constrainer types
			-- E.g. Interval<T:Ordered>
		do
			create Result.make_from_string (name)
			Result.append_character (generic_left_delim)
			across generic_substitutions as gen_parms_csr loop
				Result.append (gen_parms_csr.item.type_signature)
				if not gen_parms_csr.is_last then
					Result.append_character (generic_separator)
				end
			end
			Result.append_character (generic_right_delim)
		end

end
