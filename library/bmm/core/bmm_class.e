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

class BMM_CLASS

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

create
	make

feature -- Initialisation

	make (a_name: STRING; a_doc: detachable STRING; abstract_flag: BOOLEAN)
		require
			Name_valid: not a_name.is_empty
		do
			name := a_name
			documentation := a_doc
			is_abstract := abstract_flag
		end

feature -- Identification

	name: STRING
			-- name of the class FROM SCHEMA

	type: BMM_SIMPLE_TYPE
			-- type related to this class
		do
			Result := type_cache
			if not attached Result then
				create Result.make (Current)
				type_cache := Result
			end
		end

	entity_metatype: STRING
		do
			Result := Entity_metatype_simple
		end

feature -- Access

	bmm_model: BMM_MODEL
			-- reverse reference to parent schema
		attribute
			create Result.default_create
		end

	ancestors: STRING_TABLE [BMM_SIMPLE_TYPE]
			-- list of directly inheritance parent types, which may include
			-- closed, open and partial generic type signatures
			-- keyed by type name, which may be generic
		attribute
			create Result.make_caseless (0)
		end

	properties: STRING_TABLE [BMM_PROPERTY [BMM_TYPE]]
			-- list of attributes defined in this class
		attribute
			create Result.make_caseless (0)
		end

	package: detachable BMM_PACKAGE
			-- package this class belongs to

	source_schema_id: STRING
			-- reference to original source schema defining this class
		attribute
			create Result.make_from_string ("(uninitialised)")
		end

	all_ancestor_classes: ARRAYED_SET [STRING]
			-- list of all inheritance parent class names
		do
			Result := all_ancestor_classes_cache
			if not attached Result then
				create Result.make (0)
				Result.compare_objects
				across ancestors as ancs_csr loop
					Result.extend (ancs_csr.item.base_class.name)
					Result.merge (ancs_csr.item.base_class.all_ancestor_classes)

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
					Result.merge (ancs_csr.item.base_class.all_ancestor_types)
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
			Result := bmm_model.schema_id + Schema_name_delimiter + class_path
		end

	suppliers: ARRAYED_SET [STRING]
			-- list of names of immediate supplier classes, including concrete generic parameters,
			-- concrete descendants of abstract statically defined types, and inherited suppliers.
			-- (where generics are unconstrained, no class name is added, since logically it would be
			-- 'ANY' and this can always be assumed anyway)
			-- This list includes primitive types
		local
			ftl: ARRAYED_LIST [STRING]
		do
			if attached suppliers_cache as sc then
				Result := sc
			else
				create Result.make(0)
				Result.compare_objects

				-- get the types of all the properties (including inherited)
				across flat_properties as props_csr loop
					-- get the statically defined type(s) of the property (could be >1 due to generics)
					ftl := props_csr.item.bmm_type.flattened_type_list
					Result.merge (ftl)
					-- now get the descendant types, since these could be bound at runtime
					across ftl as gen_types_csr loop
						across bmm_model.class_definition (gen_types_csr.item).immediate_descendants as imm_descs_csr loop
							Result.extend (imm_descs_csr.item.name)
						end
					end
				end

				suppliers_cache := Result
			end
		end

	suppliers_non_primitive: ARRAYED_SET [STRING]
			-- same as `suppliers' minus primitive types, as defined in input schema
		do
			if attached suppliers_non_primitive_cache as snpc then
				Result := snpc
			else
				create Result.make (0)
				Result.compare_objects
				Result.merge (suppliers)
				Result.subtract (bmm_model.primitive_types)
				suppliers_non_primitive_cache := Result
			end
		end

	supplier_closure: ARRAYED_SET [STRING]
			-- list of names of all classes in full supplier closure, including concrete generic parameters;
			-- (where generics are unconstrained, no class name is added, since logically it would be
			-- 'ANY' and this can always be assumed anyway)
			-- This list includes primitive types.
		do
			if attached supplier_closure_cache as scc then
				Result := scc
			else
				closure_types_done.wipe_out
				closure_types_done.extend (name)
				create Result.make(0)
				supplier_closure_cache := Result
				Result.compare_objects
				Result.merge (suppliers)
				across suppliers as suppliers_csr loop
					if not closure_types_done.has (suppliers_csr.item) then
						Result.merge (bmm_model.class_definition (suppliers_csr.item).supplier_closure)
						closure_types_done.extend (suppliers_csr.item)
					end
				end
			end
		end

	generic_properties: ARRAYED_LIST [BMM_PROPERTY [BMM_GENERIC_TYPE]]
			-- list of all generic properties in this class
		do
			create Result.make (0)
			across properties as prop_csr loop
				if attached {BMM_PROPERTY [BMM_GENERIC_TYPE]} prop_csr.item as gen_prop then
					Result.extend (gen_prop)
				end
			end
		end

	flat_properties: STRING_TABLE [BMM_PROPERTY [BMM_TYPE]]
			-- list of all properties due to current and ancestor classes, keyed by property name
		do
			if attached flat_properties_cache as fpc then
				Result := fpc
			else

				create Result.make_caseless (0)
				-- merge ancestor properties
				across ancestors as ancestors_csr loop
					Result.merge (ancestors_csr.item.base_class.flat_properties)
				end

				-- now merge the current properties - merging afterward will correctly replace
				-- ancestor properties of same name
				Result.merge (properties)

				flat_properties_cache := Result
			end
		end

	property_definition_at_path (a_prop_path: OG_PATH): BMM_PROPERTY [BMM_TYPE]
			-- retrieve the property definition for `a_prop_path' in flattened class
			-- note that the internal cursor of the path is used to know how much to
			-- read - from cursor to end (this allows recursive evaluation)
		require
			Property_path_valid: has_property_path (a_prop_path)
		local
			a_path_pos: INTEGER
			i: INTEGER
			found: BOOLEAN
			bmm_prop: detachable BMM_PROPERTY [BMM_TYPE]
		do
			a_path_pos := a_prop_path.items.index
			if has_property (a_prop_path.item.attr_name) then
				check attached flat_properties.item (a_prop_path.item.attr_name) as fp then
					Result := fp
				end
				a_prop_path.forth
				if not a_prop_path.off and then attached bmm_model.class_definition (Result.bmm_type.base_class.name) as class_def then
					Result := class_def.property_definition_at_path (a_prop_path)
				end
			else -- look in the descendants
				from i := 1 until i > immediate_descendants.count or found loop
					if immediate_descendants.i_th(i).has_property_path (a_prop_path) then
						bmm_prop := immediate_descendants.i_th(i).property_definition_at_path (a_prop_path)
						found := True
					end
					i := i + 1
				end
				check attached bmm_prop as bp then
					Result := bp
				end
			end
			a_prop_path.go_i_th (a_path_pos)
		end

	class_definition_at_path (a_prop_path: OG_PATH): BMM_CLASS
			-- retrieve the class definition for the class containing the terminal property in `a_prop_path' in flattened class
			-- note that the internal cursor of the path is used to know how much to read - from cursor to end (this allows
			-- recursive evaluation)
		require
			Property_path_valid: has_property_path (a_prop_path)
		local
			a_path_pos: INTEGER
			i: INTEGER
			found: BOOLEAN
			bmm_prop: detachable BMM_PROPERTY [BMM_TYPE]
			bmm_class: detachable BMM_CLASS
		do
			a_path_pos := a_prop_path.items.index
			if has_property (a_prop_path.item.attr_name) then
				check attached flat_properties.item (a_prop_path.item.attr_name) as fp then
					bmm_prop := fp
					Result := Current
				end
				a_prop_path.forth
				if not a_prop_path.off and then attached bmm_model.class_definition (bmm_prop.bmm_type.base_class.name) as class_def then
					Result := class_def.class_definition_at_path (a_prop_path)
				end
			else -- look in the descendants
				from i := 1 until i > immediate_descendants.count or found loop
					if immediate_descendants.i_th(i).has_property_path (a_prop_path) then
						bmm_class := immediate_descendants.i_th(i).class_definition_at_path (a_prop_path)
						found := True
					end
					i := i + 1
				end
				check attached bmm_class as att_bmm_class then
					Result := att_bmm_class
				end
			end
			a_prop_path.go_i_th (a_path_pos)
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
			Result := a_class_name.is_case_insensitive_equal (any_type) or else
				all_ancestor_classes.has (a_class_name)
		end

	has_immediate_descendant (a_class_name: STRING): BOOLEAN
			-- True if a_class_name is among the immediate descendant classes
		require
			Class_name_valid: not a_class_name.is_empty
		do
			Result := across immediate_descendants as descs_csr some descs_csr.item.name.is_case_insensitive_equal (a_class_name) end
		end

	has_property_path (a_path: OG_PATH): BOOLEAN
			-- is `a_path' possible based on this reference model?
			-- note that the internal cursor of the path is used to know how much to read - from cursor to end (this allows
			-- recursive evaluation)
		local
			a_path_pos: INTEGER
			i: INTEGER
		do
			a_path_pos := a_path.items.index
			if has_property (a_path.item.attr_name) and then attached flat_properties.item (a_path.item.attr_name) as flat_prop then
				if attached bmm_model.class_definition (flat_prop.bmm_type.base_class.name) as class_def then
					a_path.forth
					if not a_path.off then
						Result := class_def.has_property_path (a_path)
					else
						Result := True
					end
				end
			else -- look in the descendants
				from i := 1 until i > immediate_descendants.count or Result loop
					Result := immediate_descendants.i_th(i).has_property_path(a_path)
					i := i + 1
				end
			end
			a_path.go_i_th (a_path_pos)
		end

	valid_candidate_property (a_prop_def: BMM_PROPERTY [BMM_TYPE]): BOOLEAN
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

	do_supplier_closure (flat_flag: BOOLEAN; continue_action: FUNCTION [ANY, TUPLE [BMM_PROPERTY [BMM_TYPE]], BOOLEAN];
				enter_action: PROCEDURE [ANY, TUPLE [BMM_PROPERTY [BMM_TYPE], INTEGER]];
				exit_action: detachable PROCEDURE [ANY, TUPLE [BMM_PROPERTY [BMM_TYPE]]])
			-- On all nodes in supplier closure of this class, execute `enter_action',
			-- then recurse into its subnodes, then execute `exit_action'.
			-- If `flat_flag' = True, use the inheritance-flattened closure
			-- THIS CAN BE AN EXPENSIVE COMPUTATION, so it is limited by the max_depth argument
		local
			props: STRING_TABLE [BMM_PROPERTY [BMM_TYPE]]
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

	add_ancestor (an_anc_type: BMM_SIMPLE_TYPE)
			-- add an ancestor class
		require
			New_ancestor: not ancestors.has_item (an_anc_type)
		do
			ancestors.put (an_anc_type, an_anc_type.type_name)
			an_anc_type.base_class.add_immediate_descendant (Current)
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

	add_property (a_prop_def: BMM_PROPERTY [BMM_TYPE])
			-- add a property to the class definition
			-- Properties should be added after all Ancestors have been added.
		require
			Valid_property: valid_candidate_property (a_prop_def)
		do
			properties.put (a_prop_def, a_prop_def.name)

			suppliers_cache := Void
			supplier_closure_cache := Void
			suppliers_non_primitive_cache := Void
			reset_flat_properties_cache
		end

	overwrite_property (a_prop_def: BMM_PROPERTY [BMM_TYPE])
			-- overwrite a property in the class definition, i.e. replace or add,
			-- in the case of overwriting an inherited property
		require
			Valid_property: valid_candidate_property (a_prop_def)
		do
			properties.force (a_prop_def, a_prop_def.name)

			suppliers_cache := Void
			supplier_closure_cache := Void
			suppliers_non_primitive_cache := Void
			reset_flat_properties_cache
		end

feature {BMM_CLASS} -- Implementation

	add_immediate_descendant (a_class: BMM_CLASS)
			-- add a class def to the descendants list
		do
			-- avoid multiple copies
			if not immediate_descendants.has (a_class) then
				immediate_descendants.extend (a_class)
				all_descendants_cache := Void
				suppliers_cache := Void
				supplier_closure_cache := Void
				suppliers_non_primitive_cache := Void
			end
		end

	type_cache: detachable like type

	flat_properties_cache: detachable STRING_TABLE [BMM_PROPERTY [BMM_TYPE]]
			-- reference list of all attributes due to inheritance flattening of this type

	suppliers_cache: detachable ARRAYED_SET [STRING]
			-- cache for `suppliers'

	suppliers_non_primitive_cache: detachable ARRAYED_SET [STRING]
			-- cache for `suppliers_non_primitive'

	supplier_closure_cache: detachable ARRAYED_SET [STRING]
			-- cache for `supplier_closure'

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

	do_property_supplier_closure (a_prop: BMM_PROPERTY [BMM_TYPE]; flat_flag: BOOLEAN;
				continue_action: FUNCTION [ANY, TUPLE [BMM_PROPERTY [BMM_TYPE]], BOOLEAN];
				enter_action: PROCEDURE [ANY, TUPLE [BMM_PROPERTY [BMM_TYPE], INTEGER]];
				exit_action: detachable PROCEDURE [ANY, TUPLE [BMM_PROPERTY [BMM_TYPE]]];
				depth: INTEGER)
			-- On all nodes in supplier closure of `a_prop', execute `enter_action', then recurse into
			-- its subnodes, then execute `exit_action'.
			-- If `flat_flag' = True, use the inheritance-flattened closure
			-- THIS CAN BE AN EXPENSIVE COMPUTATION, so it is limited by the max_depth argument
		local
			props: STRING_TABLE [BMM_PROPERTY [BMM_TYPE]]
			prop_type_name: STRING
		do
			prop_type_name := a_prop.bmm_type.base_class.name
			if not supplier_closure_stack.has (prop_type_name) then
				supplier_closure_stack.extend (prop_type_name)

				enter_action(a_prop, depth)

				if continue_action.item ([a_prop, depth]) then
					if flat_flag then
						-- props := bmm_model.class_definition (prop_type_name).flat_properties
						props := a_prop.bmm_type.base_class.flat_properties
					else
						-- props := bmm_model.class_definition (prop_type_name).properties
						props := a_prop.bmm_type.base_class.properties
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

	closure_types_done: ARRAYED_SET [STRING]
			-- list of types for which supplier_closure has already been called, used to avoid doing rework
		attribute
			create Result.make (0)
			Result.compare_objects
		end

end


