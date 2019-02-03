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

class BMM_GENERIC_CLASS

inherit
	BMM_CLASS
		redefine
			suppliers, type, entity_metatype
		end

create
	make

feature -- Identification

	entity_metatype: STRING
		do
			Result := Entity_metatype_generic
		end

feature -- Access

	generic_parameters: STRING_TABLE [BMM_PARAMETER_TYPE]
			-- list of generic parameter definitions, keyed by name of generic parameter;
			-- these are defined either directly on this class or by the addition of an
			-- ancestor class which is generic. Chronological order of insertion
			-- is maintained for iteration.
		attribute
			create Result.make_caseless (0)
		end

	suppliers: ARRAYED_SET [STRING]
			-- <precursor>
			-- Add in suppliers from generic parameters
		local
			ftl: ARRAYED_LIST [STRING]
		do
			Result := precursor

			-- get the types defined in formal generics
			ftl := type.flattened_type_list
			ftl.go_i_th (1)
			ftl.remove
			Result.merge (ftl)
		end

	generic_parameter_conformance_types: ARRAYED_LIST [STRING]
			-- for a generic class, list of types to which generic parameter types of an actual generic type
			-- would have to conform. E.g. if this class is Interval <T: Comparable> then the Result will
			-- be a list containing the single member type 'Comparable'. For unconstrained 'T', the type will be 'Any'.
		do
			create Result.make (0)
			Result.compare_objects
			across generic_parameters as gen_parms_csr loop
				Result.extend (gen_parms_csr.item.base_class.name)
			end
		end

	generic_parameter_conformance_type (a_name: STRING): STRING
			-- for a generic class, type to which generic parameter `a_name' conforms
			-- E.g. if this class is Interval <T: Comparable> then the Result will
			-- be the single type 'Comparable'. For 'T', the type will be 'Any'.
		require
			has_generic_parameter (a_name)
		do
			check attached generic_parameters.item (a_name) as att_gen then
				Result := att_gen.base_class.name
			end
		end

feature -- Status Report

	has_generic_parameter (a_gen_parm_name: STRING): BOOLEAN
			-- True if `a_gen_parm_name' is among the generic parameters, if any exist
		require
			Generic_parameter_name_valid: not a_gen_parm_name.is_empty
		do
			Result := generic_parameters.has (a_gen_parm_name.as_upper)
		end

feature -- Modification

	add_generic_parameter (a_gen_parm_def: BMM_PARAMETER_TYPE)
			-- add a generic parameter, and link it to the corresponding definition in any generic ancestor
		require
			New_gen_parm_def: not has_generic_parameter (a_gen_parm_def.name)
		local
			new_prop: BMM_PROPERTY
		do
			generic_parameters.put (a_gen_parm_def, a_gen_parm_def.name.as_upper)

			-- connect generic parm def with matching def in parent classes if any
			-- first find a direct ancestor that has generic parameters
			if not ancestors.is_empty then
				from ancestors.start until ancestors.off or attached a_gen_parm_def.inheritance_precursor loop
					if attached {BMM_GENERIC_CLASS} ancestors.item_for_iteration.base_class as anc_gen_class then
						if anc_gen_class.has_generic_parameter (a_gen_parm_def.name) and then
							attached anc_gen_class.generic_parameters.item (a_gen_parm_def.name.as_upper) as gen_parm
						then
							a_gen_parm_def.set_inheritance_precursor (gen_parm)
						end
					end
					ancestors.forth
				end
			end

			-- Add synthesised properties for any open type properties whose constrainer types redefine
			-- the constrainer types of the corresponding parent. For example if this class is DV_INTERVAL <T:DV_ORDERED>
			-- and it has a parent Interval <T: Ordered>, where DV_ORDERED further constraints Ordered, then any
			-- properties from Interval of type T should be recreated in DV_INTERVAL.
			across ancestors as anc_class_csr loop
				if attached {BMM_GENERIC_CLASS} anc_class_csr.item.base_class as parent_gen_class then
					across parent_gen_class.generic_parameters as parent_gen_class_gen_parms loop
						if parent_gen_class_gen_parms.item.name.same_string (a_gen_parm_def.name) and
							a_gen_parm_def.is_constrained and then attached a_gen_parm_def.inheritance_precursor as gp_inh_parent
							and then not a_gen_parm_def.effective_conforms_to_type.type_name.same_string (gp_inh_parent.effective_conforms_to_type.type_name)
						then
							across parent_gen_class.flat_properties as parent_props_csr loop
								if attached {BMM_UNITARY_PROPERTY} parent_props_csr.item as parent_prop and then parent_prop.bmm_type = gp_inh_parent then
									debug ("bmm")
										io.put_string ("Schema: " + bmm_model.model_id +
											" found in class " + type.type_signature +
											"; parent type = " + parent_gen_class.type.type_name +
											" gen parm " + a_gen_parm_def.type_signature +
											"; redefined in property " + parent_prop.display_name + "%N")
									end

									create {BMM_UNITARY_PROPERTY} new_prop.make_from_other (parent_prop)
									new_prop.set_is_synthesised_generic
									new_prop.set_bmm_type (a_gen_parm_def)
									properties.force (new_prop, new_prop.name)
								end
							end
						end
					end
				end
			end

			type_cache := Void
			suppliers_cache := Void
			supplier_closure_cache := Void
			suppliers_non_primitive_cache := Void
		ensure
			generic_parameters.item (a_gen_parm_def.name.as_upper) = a_gen_parm_def
		end

feature -- Factory

	type: BMM_GENERIC_TYPE
			-- generate a fully open generic type that corresponds to this class definition
		do
			Result := type_cache
			if not attached Result then
				create Result.make (Current)
				across generic_parameters as gen_parms_csr loop
					Result.add_generic_parameter (gen_parms_csr.item)
				end
				type_cache := Result
			end
		end

end
