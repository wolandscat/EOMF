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
			type, entity_metatype
		end

create
	make

feature -- Initialisation

    make (an_anc_gen_type: BMM_GENERIC_TYPE)
    		-- create as a copy from a BMM_GENERIC_CLASS, i.e. a_gen_type.base_class
    		-- and then create property overrides for filled generic parameters
    	local
    		an_anc_class: BMM_GENERIC_CLASS
    		new_prop: BMM_PROPERTY[BMM_TYPE]
    		gen_param_name: STRING
    		gen_sub_type: BMM_TYPE
    	do
	   		an_anc_class := an_anc_gen_type.base_class
    		make_class (an_anc_class.name.twin, Void, an_anc_class.is_abstract)

			-- make this class's ancestor the original type-generating generic class
			add_ancestor (an_anc_gen_type.base_class.type)

			-- take a copy of the generating class's gen parms list
			ancestor_generic_parameters := an_anc_class.generic_parameters

    		-- take only the remaining open generic parameters
    		across an_anc_gen_type.generic_parameters as parent_gen_parms_csr loop
    			if attached {BMM_PARAMETER_TYPE} parent_gen_parms_csr.item as bmm_param_type then
    				check attached an_anc_class.generic_parameters.item (bmm_param_type.name) as gen_class_param_def then
    					add_generic_parameter (gen_class_param_def)
    				end
    			end
    		end

    		package := an_anc_class.package
    		is_override := an_anc_class.is_override
    		is_primitive := an_anc_class.is_primitive

  			-- now that the type def is stable, make a copy of the type
			type_cache := an_anc_gen_type

	   		-- populate `generic_substitutions' from `an_anc_gen_type`;
    		-- we rely on the fact that iteration through a HASH_TABLE respects the chronological order
    		-- of insertion.
			across an_anc_class.generic_parameters as gen_parms_csr loop
				-- see if the parameter is substituted or still open; if substituted,
				-- record it in the table
				gen_sub_type := type.generic_parameters.i_th (gen_parms_csr.cursor_index)
				if not attached {BMM_PARAMETER_TYPE} gen_sub_type then
					generic_substitutions.put (gen_sub_type, gen_parms_csr.item.name)
				end
			end

    		-- iterate through flat properties, and any that are of open type, build
    		-- a replacement from `generic_substitutions'
    		across flat_properties as props_csr loop
    			if attached {BMM_PROPERTY[BMM_PARAMETER_TYPE]} props_csr.item as open_gen_prop then
    				gen_param_name := open_gen_prop.bmm_type.name
    				if generic_substitutions.has (gen_param_name) then
	    				gen_sub_type := generic_substitutions.item (gen_param_name)
	    				if attached {BMM_GENERIC_TYPE} gen_sub_type as gen_type then
							create {BMM_PROPERTY[BMM_GENERIC_TYPE]} new_prop.make_from_other(open_gen_prop, gen_type)
							overwrite_property (new_prop)
	    				elseif attached {BMM_SIMPLE_TYPE} gen_sub_type as simple_type then
							create {BMM_PROPERTY[BMM_SIMPLE_TYPE]} new_prop.make_from_other(open_gen_prop, simple_type)
							overwrite_property (new_prop)
	    				elseif attached {BMM_CONTAINER_TYPE} gen_sub_type as cont_type then
							create {BMM_PROPERTY[BMM_CONTAINER_TYPE]} new_prop.make_from_other(open_gen_prop, cont_type)
							overwrite_property (new_prop)
						else
							-- do nothing; the parameter is still BMM_PARAMETER_TYPE
	    				end
	    			end
    			end
    		end
    	ensure
    		source_schema_id = Void
    	end

feature -- Identification

	type: BMM_GENERIC_TYPE
			-- generate a type that corresponds to this class definition
		do
			Result := type_cache
			if not attached Result then
				create Result.make (Current)
				across ancestor_generic_parameters as anc_gen_parms_csr loop
					if generic_substitutions.has (anc_gen_parms_csr.key) then
						check attached generic_substitutions.item (anc_gen_parms_csr.key) as subst_type then
							Result.add_generic_parameter (subst_type)
						end
					else
						Result.add_generic_parameter (anc_gen_parms_csr.item)
					end
				end
			end
		end

	entity_metatype: STRING
		do
			Result := Entity_metatype_generic_effective
		end

feature -- Access

	ancestor_generic_parameters: STRING_TABLE [BMM_PARAMETER_TYPE]
			-- quick access to generic parameters of inheritance ancestor
		attribute
			create Result.make_caseless (0)
		end

	generic_substitutions: STRING_TABLE [BMM_TYPE]
			-- list of generic parameter substitutions, keyed by formal parameter name, e.g. 'T', 'U'
		attribute
			create Result.make_caseless (0)
		end

end
