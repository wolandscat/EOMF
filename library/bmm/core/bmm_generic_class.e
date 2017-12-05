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
			effective_property_type, suppliers, type_name, type_signature, flattened_type_list
		end

create
	make

feature -- Identification

	type_name: STRING
			-- name of the type, in form:
			--    name < generic_param_name, .... >
			-- e.g. Interval<T>
		do
			create Result.make_from_string (name)
			Result.append_character (generic_left_delim)
			across generic_parameters as gen_parms_csr loop
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
			across generic_parameters as gen_parms_csr loop
				Result.append (gen_parms_csr.item.type_signature)
				if not gen_parms_csr.is_last then
					Result.append_character (generic_separator)
				end
			end
			Result.append_character (generic_right_delim)
		end

feature -- Access

	generic_parameters: HASH_TABLE [BMM_GENERIC_PARAMETER, STRING]
			-- list of generic parameter definitions, keyed by name of generic parameter;
			-- these are defined either directly on this class or by the addition of an
			-- ancestor class which is generic
		attribute
			create Result.make (0)
		end

	suppliers: ARRAYED_SET [STRING]
			-- <precursor>
			-- Add in suppliers from generic parameters
		local
			ftl: ARRAYED_LIST [STRING]
		do
			Result := precursor

			-- get the types defined in formal generics
			ftl := flattened_type_list
			ftl.go_i_th (1)
			ftl.remove
			Result.merge (ftl)
		end

	flattened_type_list: ARRAYED_LIST [STRING]
			-- completely flattened list of type names, flattening out all generic parameters
			-- e.g. "HASH_TABLE <LINKED_LIST <STRING>, STRING>" => <<"HASH_TABLE", "LINKED_LIST", "STRING", "STRING">>
		do
			Result := precursor
			across generic_parameters as gen_parms_csr loop
				Result.append (gen_parms_csr.item.flattened_type_list)
			end
		end

	effective_property_type (a_type_name, a_prop_name: STRING): STRING
			-- determine the property type for `a_prop_name' in type corresponding to `a_type_name'
			-- same as property_definition.type, except if a_type_name is generic, in which case:
			-- `a_type_name' will be an actual type name, e.g. "INTERVAL<TIME>", whereas
			-- Current's type is "INTERVAL<T>"
		local
			prop_type: BMM_TYPE
			i, gen_param_count: INTEGER
			gen_param_type: detachable STRING
		do
			if attached flat_properties.item (a_prop_name) as prop_def then
				prop_type := prop_def.bmm_type
				if attached {BMM_OPEN_TYPE} prop_type as simple_type_open then
					i := 1
					-- we traverse the generic parameters Hash instead of just keying into it so as
					-- to get the index in order of the required parameter
					across generic_parameters as gen_parms_csr loop
						if gen_parms_csr.item.name.is_equal (simple_type_open.generic_constraint.name) then
							-- if the supplied type lacked generic parameters, e.g. just "INTERVAL" was
							-- supplied as a constraint, then we need to use the RM's idea of its generic prameter types
							gen_param_type := gen_parms_csr.item.base_class.type_name
							gen_param_count := i
						end
						i := i + 1
					end

					-- if the supplied type has generic parameters, e.g. "INTERVAL<TIME>" then use that
					if is_generic_type_name (a_type_name) then
						Result := generic_parameter_types (a_type_name).i_th (gen_param_count)
					else
						check attached gen_param_type as gpt then
							Result := gen_param_type
						end
					end
				else
					Result := prop_type.type_name
				end
			else
				Result := unknown_type_name
			end
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

	add_generic_parameter (a_gen_parm_def: BMM_GENERIC_PARAMETER)
			-- add a generic parameter, and link it to the corresponding definition in any generic ancestor
		require
			New_gen_parm_def: not has_generic_parameter (a_gen_parm_def.name)
		local
			new_prop: BMM_PROPERTY[BMM_OPEN_TYPE]
			new_type: BMM_OPEN_TYPE
			doc: detachable STRING
		do
			generic_parameters.put (a_gen_parm_def, a_gen_parm_def.name.as_upper)

			-- connect generic parm def with matching def in parent classes if any
			-- first find a direct ancestor that has generic parameters
			if not ancestors.is_empty then
				from ancestors.start until ancestors.off or attached a_gen_parm_def.inheritance_precursor loop
					if attached {BMM_GENERIC_CLASS} ancestors.item_for_iteration as anc_gen_class then
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
				if attached {BMM_GENERIC_CLASS} anc_class_csr.item as parent_gen_class then
					across parent_gen_class.generic_parameters as parent_gen_class_gen_parms loop
						if parent_gen_class_gen_parms.item.name.same_string (a_gen_parm_def.name) and
							a_gen_parm_def.is_constrained and then attached a_gen_parm_def.inheritance_precursor as gp_inh_parent
							and then a_gen_parm_def.effective_conforms_to_type /= gp_inh_parent.effective_conforms_to_type
						then
							across parent_gen_class.flat_properties as parent_props_csr loop
								if attached {BMM_PROPERTY[BMM_OPEN_TYPE]} parent_props_csr.item as parent_prop_type and then
									parent_prop_type.bmm_type.generic_constraint = a_gen_parm_def.inheritance_precursor
								then
									debug ("bmm")
										io.put_string ("Schema: " + bmm_model.schema_id + " found in class " + type_signature +
											"; parent type = " + parent_gen_class.type_name +
											" gen parm " + a_gen_parm_def.type_signature +
											"; redefined in property " + parent_prop_type.display_name + "%N")
									end
									create new_type.make (a_gen_parm_def)
									if attached parent_prop_type.documentation as att_doc then doc := att_doc.twin end
									create new_prop.make (parent_prop_type.name.twin,
										doc,
										new_type,
										parent_prop_type.is_mandatory,
										parent_prop_type.is_computed,
										parent_prop_type.is_im_infrastructure,
										parent_prop_type.is_im_runtime)
									properties.force (new_prop, new_prop.name)
								end
							end
						end
					end
				end
			end

			suppliers_cache := Void
			supplier_closure_cache := Void
			suppliers_non_primitive_cache := Void
		ensure
			generic_parameters.item (a_gen_parm_def.name.as_upper) = a_gen_parm_def
		end

end


