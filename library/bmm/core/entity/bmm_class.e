note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Definition of a class in an object model. A class is type that may be open 
				 or closed in terms of other types mentioned within.
				 ]"
	keywords:    "model, Basic meta-model"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2009 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class BMM_CLASS

inherit
	BMM_MODEL_ELEMENT

	BMM_ENTITY
		export
			{ANY} valid_type_name
		end

	IDENTIFIED_TOOL_ARTEFACT
		export
			{NONE} all
		end

feature -- Initialisation

	make (a_name: STRING; a_doc: detachable STRING; abstract_flag: BOOLEAN)
		require
			Name_valid: not a_name.is_empty
		do
			name := a_name
			documentation := a_doc
			is_abstract := abstract_flag
		end

feature -- Access

	bmm_model: BMM_MODEL
			-- reverse reference to parent schema
		attribute
			create Result.default_create
		end

	ancestors: STRING_TABLE [BMM_MODEL_TYPE]
			-- list of directly inheritance parent types, which may include
			-- closed, open and partial generic type signatures
			-- keyed by type name, which may be generic
		attribute
			create Result.make_caseless (0)
		end

	properties: STRING_TABLE [BMM_PROPERTY]
			-- list of attributes defined in this class
		attribute
			create Result.make_caseless (0)
		end

	package: detachable BMM_PACKAGE
			-- package this class belongs to

	source_schema_id: STRING
			-- reference to original source schema defining this class
		attribute
			create Result.make_empty
		end

	all_ancestor_classes: ARRAYED_SET [STRING]
			-- list of all inheritance parent class names
		do
			Result := all_ancestor_classes_cache
			if not attached Result then
				create Result.make (0)
				Result.compare_objects
				across ancestors as ancs_csr loop
					Result.extend (ancs_csr.item.defining_class.name)
					Result.merge (ancs_csr.item.defining_class.all_ancestor_classes)

					-- remove own class name, which might appear due to generic types
					Result.prune (name)
				end
				all_ancestor_classes_cache := Result
			end
		ensure
			strict: not Result.has (name)
		end

	all_ancestor_types: ARRAYED_SET [STRING]
			-- list of all inheritance parent type names
		do
			Result := all_ancestor_types_cache
			if not attached Result then
				create Result.make (0)
				Result.compare_objects
				across ancestors as ancs_csr loop
					Result.extend (ancs_csr.key.as_string_8)
					Result.merge (ancs_csr.item.defining_class.all_ancestor_types)
				end
				all_ancestor_types_cache := Result
			end
		end

	immediate_descendants: ARRAYED_LIST [BMM_CLASS]
			-- list of immediate inheritance descendants
		attribute
			create Result.make (0)
		end

	all_descendants: ARRAYED_SET [STRING]
			-- obtain type names of all descendant classes of this class.
			-- If there are none, the result is empty;
		do
			Result := all_descendants_cache
			if not attached Result then
				create Result.make(0)
				Result.compare_objects
				across immediate_descendants as imm_descs_csr loop
					Result.extend (imm_descs_csr.item.name)
					Result.merge (imm_descs_csr.item.all_descendants)
				end
				all_descendants_cache := Result
			end
		ensure
			strict: not Result.has (name)
		end

	package_path: STRING
			-- fully qualified package name, of form: 'package.package'
		require
			attached package
		do
			check attached package as att_pkg then
				Result := att_pkg.path
			end
		end

	class_path: STRING
			-- fully qualified class name, of form: 'package.package.CLASS'
			-- with package path in lower-case and class in original case
		do
			Result := package_path
			Result.append_character (package_name_delimiter)
			Result.append (name)
		end

	globally_qualified_path: STRING
			-- fully qualified class name prepended with schema id of containing top-level schema, of form:
			-- 'schema_id::package.package.CLASS' to enable identification in situation when a given class/package
			-- has been imported into more than one schema.
		do
			Result := bmm_model.model_id + Schema_name_delimiter + class_path
		end

	generic_properties: ARRAYED_LIST [BMM_PROPERTY]
			-- list of all generic properties in this class
		do
			create Result.make (0)
			across properties as prop_csr loop
				if attached {BMM_GENERIC_TYPE} prop_csr.item.bmm_type then
					Result.extend (prop_csr.item)
				end
			end
		end

	flat_properties: STRING_TABLE [BMM_PROPERTY]
			-- list of all properties due to current and ancestor classes, keyed by property name
		do
			if attached flat_properties_cache as fpc then
				Result := fpc
			else
				create Result.make_caseless (0)

				-- merge ancestor properties
				across ancestors as ancestors_csr loop
					Result.merge (ancestors_csr.item.defining_class.flat_properties)
				end

				-- now merge the current properties - merging afterward will correctly replace
				-- ancestor properties of same name
				Result.merge (properties)

				flat_properties_cache := Result
			end
		end

	effective_property_type (a_prop_name: STRING): STRING
			-- determine the property type for `a_prop_name' in type corresponding to `a_type_name'
		require
			Property_valid: has_property (a_prop_name)
		do
			if attached flat_properties.item (a_prop_name) as prop_def then
				Result := prop_def.bmm_type.type_name
			else
				Result := unknown_type_name
			end
		end

	global_artefact_identifier: STRING
			-- tool-wide unique id for this artefact
		do
			Result := globally_qualified_path
		end

	global_artefact_category: STRING
			-- tool-wide category for this artefact, useful for indexing visual type indeicators
			-- like pixmap etc
		do
			Result := entity_category
		end

feature -- Building

	is_populated: BOOLEAN
			-- True if this object has had `

feature -- Status Report

	is_abstract: BOOLEAN
			-- True if this is an abstract type

	is_primitive: BOOLEAN
			-- True if this class is designated a primitive type within the overall type system of the schema

	is_override: BOOLEAN
			-- True if this definition overrides a class of the same name in an included schema

	has_descendants: BOOLEAN
		do
			Result := not immediate_descendants.is_empty
		end

	has_ancestor (a_class_name: STRING): BOOLEAN
			-- True if `a_class_name` is the name of an ancestor class of this class
		do
			Result := all_ancestor_classes.has (a_class_name)
		end

	has_property (a_prop_name: STRING): BOOLEAN
			-- True if a_prop_name valid in this type, due to this type definition, or any ancestor
		require
			Attr_name_valid: not a_prop_name.is_empty
		do
			Result := flat_properties.has (a_prop_name)
		end

	has_ancestor_class (a_class_name: STRING): BOOLEAN
			-- True if a_class_name is among the ancestor classes
		require
			Class_name_valid: not a_class_name.is_empty
		do
			Result := a_class_name.is_case_insensitive_equal (Any_type_name) or else
				all_ancestor_classes.has (a_class_name)
		end

	has_immediate_descendant (a_class_name: STRING): BOOLEAN
			-- True if a_class_name is among the immediate descendant classes
		require
			Class_name_valid: not a_class_name.is_empty
		do
			Result := across immediate_descendants as descs_csr some descs_csr.item.name.is_case_insensitive_equal (a_class_name) end
		end

	valid_candidate_property (a_prop_def: BMM_PROPERTY): BOOLEAN
			-- True if `a_prop_def' is a valid candidate for adding as a new property:
			-- either it does not exist in the current flat properties (i.e. inherited properties)
			-- or if it does, it is conformant to the inherited property
		do
			if flat_properties.has (a_prop_def.name) and then attached flat_properties.item (a_prop_def.name) as flat_prop then
				Result := a_prop_def.bmm_conforms_to (flat_prop)
			else
				Result := True
			end
		end

feature -- Traversal

	do_supplier_closure (flat_flag: BOOLEAN; continue_action: FUNCTION [ANY, TUPLE [BMM_PROPERTY], BOOLEAN];
				enter_action: PROCEDURE [ANY, TUPLE [BMM_PROPERTY, INTEGER]];
				exit_action: detachable PROCEDURE [ANY, TUPLE [BMM_PROPERTY]])
			-- On all nodes in supplier closure of this class, execute `enter_action',
			-- then recurse into its subnodes, then execute `exit_action'.
			-- If `flat_flag' = True, use the inheritance-flattened closure
			-- THIS CAN BE AN EXPENSIVE COMPUTATION, so it is limited by the max_depth argument
		local
			props: STRING_TABLE [BMM_PROPERTY]
		do
			supplier_closure_stack.wipe_out
			supplier_closure_stack.extend (name)

			if flat_flag then
				props := flat_properties
			else
				props := properties
			end

			across props as props_csr loop
				do_property_supplier_closure (props_csr.item, flat_flag, continue_action, enter_action, exit_action, 0)
			end
		end

feature -- Output

	description: STRING
			-- output a description of this class for use in e.g. tooltips, other places in the UI
		do
	 	 	create Result.make_empty
	 	 	Result.append (class_path)
	 	 	Result.append ("%NSource schema: " + source_schema_id)
	 	 	if is_override then
	 	 		Result.append ("%N(overrides previous definition)")
	 	 	end
	 	 end

feature -- Modification

	set_bmm_model (a_bmm_model: BMM_MODEL)
		do
			bmm_model := a_bmm_model
		end

	set_package (a_package: BMM_PACKAGE)
			-- put this class into the package
		do
			package := a_package
		end

	set_primitive_type
		do
			is_primitive := True
		ensure
			is_primitive
		end

	set_source_schema_id (an_id: STRING)
			-- set source schema id
		do
			source_schema_id := an_id
		end

	add_ancestor (an_anc_type: BMM_MODEL_TYPE)
			-- add an ancestor class
		require
			New_ancestor: not ancestors.has_item (an_anc_type)
		local
			subst_type: BMM_TYPE
			new_prop: BMM_PROPERTY
			anc_gen_subs: STRING_TABLE [BMM_TYPE]
		do
			ancestors.put (an_anc_type, an_anc_type.type_name)
			an_anc_type.defining_class.add_immediate_descendant (Current)

			-- if the new ancestor is an effective generic type, we need to synthesise
			-- replacements in the current class for inherited properties of open types
			-- or based on an open type, from the ancestor's base class.
			if attached {BMM_GENERIC_TYPE} an_anc_type as anc_gen_type and then anc_gen_type.is_partially_closed then
				anc_gen_subs := anc_gen_type.generic_substitutions
				across flat_properties as props_csr loop
					-- if property is of a formal type for which there is a substitution, replace it
					if attached {BMM_PARAMETER_TYPE} props_csr.item.bmm_type as formal_type and then
						anc_gen_subs.has (formal_type.name)
					then
						-- The replacement may be of any type, except an open type
						subst_type := anc_gen_subs.item (formal_type.name)
						if attached {BMM_GENERIC_TYPE} subst_type as gen_type then
							create {BMM_UNITARY_PROPERTY} new_prop.make_from_other_generic (props_csr.item, gen_type.create_duplicate)
						elseif attached {BMM_CONTAINER_TYPE} subst_type as cont_type and attached {BMM_CONTAINER_PROPERTY} props_csr.item as cont_prop then
							create {BMM_CONTAINER_PROPERTY} new_prop.make_from_other_generic (cont_prop, cont_type.create_duplicate)
						elseif attached {BMM_SIMPLE_TYPE} subst_type as simple_type then
							create {BMM_UNITARY_PROPERTY} new_prop.make_from_other_generic (props_csr.item, simple_type.create_duplicate)
						end

						check attached new_prop end
						new_prop.set_is_synthesised_generic
						overwrite_property (new_prop)

					-- else if the property is of a type containing any open parameter
					-- with a substitution in the ancestor type
					else
						if
							across anc_gen_subs as gen_subs_csr some
								props_csr.item.bmm_type.has_formal_generic_type (gen_subs_csr.key.as_string_8)
							end
						then
							-- substitute all occurrences of the open type
							new_prop := props_csr.item.create_duplicate

							across anc_gen_subs as anc_gen_subs_csr loop
								if new_prop.bmm_type.has_formal_generic_type (anc_gen_subs_csr.key.as_string_8) then
									-- create a new BMM_PROPERTY of the same meta-type, and then
									-- substitute all occurrences of the open type
									new_prop.bmm_type.substitute_formal_generic_type (anc_gen_subs_csr.key.as_string_8, anc_gen_subs_csr.item.create_duplicate)
								end
							end
							new_prop.set_is_synthesised_generic
							overwrite_property (new_prop)
						end
					end
				end
			end

			-- clear caches
			all_ancestor_types_cache := Void
			all_ancestor_classes_cache := Void
			reset_flat_properties_cache
		ensure
			Ancestor_added: ancestors.item (an_anc_type.type_name) = an_anc_type
		end

	set_is_override
			-- set `is_override'
		do
			is_override := True
		end

	add_property (a_prop_def: BMM_PROPERTY)
			-- add a property to the class definition
			-- Properties should be added after all Ancestors have been added.
		require
			Valid_property: valid_candidate_property (a_prop_def)
		do
			properties.put (a_prop_def, a_prop_def.name)

			suppliers := Void
			supplier_closure := Void
			suppliers_non_primitive := Void
			reset_flat_properties_cache
		end

	overwrite_property (a_prop_def: BMM_PROPERTY)
			-- overwrite a property in the class definition, i.e. replace or add,
			-- in the case of overwriting an inherited property
		require
			Valid_property: valid_candidate_property (a_prop_def)
		do
			properties.force (a_prop_def, a_prop_def.name)

			suppliers := Void
			supplier_closure := Void
			suppliers_non_primitive := Void
			reset_flat_properties_cache
		end

	set_is_populated
			-- set `is_populated`
		do
			is_populated := True
		end

	set_suppliers (a_suppliers: ARRAYED_SET [STRING])
			-- set cache for `suppliers'
		do
			suppliers := a_suppliers
		end

	set_suppliers_non_primitive (a_suppliers: ARRAYED_SET [STRING])
			-- cache for `suppliers_non_primitive'
		do
			suppliers_non_primitive := a_suppliers
		end

	set_supplier_closure (a_suppliers: ARRAYED_SET [STRING])
			-- cache for `supplier_closure'
		do
			supplier_closure := a_suppliers
		end

feature -- Factory

	type: BMM_MODEL_TYPE
			-- type related to this class
		deferred
		end

feature {BMM_MODEL} -- Implementation

	suppliers: detachable ARRAYED_SET [STRING]
			-- cache for `suppliers'

	suppliers_non_primitive: detachable ARRAYED_SET [STRING]
			-- cache for `suppliers_non_primitive'

	supplier_closure: detachable ARRAYED_SET [STRING]
			-- cache for `supplier_closure'

feature {BMM_CLASS} -- Implementation

	add_immediate_descendant (a_class: BMM_CLASS)
			-- add a class def to the descendants list
		do
			-- avoid multiple copies
			if not immediate_descendants.has (a_class) then
				immediate_descendants.extend (a_class)
				all_descendants_cache := Void
				suppliers := Void
				supplier_closure := Void
				suppliers_non_primitive := Void
			end
		end

	type_cache: detachable like type

	flat_properties_cache: detachable STRING_TABLE [BMM_PROPERTY]
			-- reference list of all attributes due to inheritance flattening of this type


	all_ancestor_types_cache: detachable ARRAYED_SET [STRING]
			-- cache for `all_ancestor_types'

	all_ancestor_classes_cache: detachable ARRAYED_SET [STRING]
			-- cache for `all_ancestor_classes'

	all_descendants_cache: detachable ARRAYED_SET [STRING]
			-- cache for `all_descendants'

	reset_flat_properties_cache
			-- recusively clear current and all descendant flat_property caches
		do
			flat_properties_cache := Void
			immediate_descendants.do_all (
				agent (a_desc: BMM_CLASS)
					do
						a_desc.reset_flat_properties_cache
					end
			)
		end

feature {NONE} -- Implementation

	do_property_supplier_closure (a_prop: BMM_PROPERTY; flat_flag: BOOLEAN;
				continue_action: FUNCTION [ANY, TUPLE [BMM_PROPERTY], BOOLEAN];
				enter_action: PROCEDURE [ANY, TUPLE [BMM_PROPERTY, INTEGER]];
				exit_action: detachable PROCEDURE [ANY, TUPLE [BMM_PROPERTY]];
				depth: INTEGER)
			-- On all nodes in supplier closure of `a_prop', execute `enter_action', then recurse into
			-- its subnodes, then execute `exit_action'.
			-- If `flat_flag' = True, use the inheritance-flattened closure
			-- THIS CAN BE AN EXPENSIVE COMPUTATION, so it is limited by the max_depth argument
		local
			props: STRING_TABLE [BMM_PROPERTY]
			prop_type_name: STRING
		do
			prop_type_name := a_prop.bmm_type.effective_type.type_base_name
			if not supplier_closure_stack.has (prop_type_name) then
				supplier_closure_stack.extend (prop_type_name)

				enter_action(a_prop, depth)

				if continue_action.item ([a_prop, depth]) then
					if flat_flag then
						-- props := bmm_model.class_definition (prop_type_name).flat_properties
						props := a_prop.bmm_type.flat_properties
					else
						-- props := bmm_model.class_definition (prop_type_name).properties
						props := a_prop.bmm_type.properties
					end

					across props as props_csr loop
						do_property_supplier_closure (props_csr.item, flat_flag, continue_action, enter_action, exit_action, depth + 1)
					end
				end

				if attached exit_action then
					exit_action(a_prop)
				end
				supplier_closure_stack.remove
			end
		end

	supplier_closure_stack: ARRAYED_STACK [STRING]
			-- list of classes on this tree branch, to prevent cycling
		attribute
			create Result.make (0)
			Result.compare_objects
		end

end


