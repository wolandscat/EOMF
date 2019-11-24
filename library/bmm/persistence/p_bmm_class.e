note
	component:   "Eiffel Object Modelling Framework"
	description: "Definition of ODIN persistent form of an instance of BMM_CLASS"
	keywords:    "model, UML"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_BMM_CLASS

inherit
	P_BMM_MODEL_ELEMENT

	DT_CONVERTIBLE

feature -- Initialisation

	make_dt (make_args: detachable ARRAY[ANY])
		do
			create ancestors.make (0)
			ancestors.compare_objects
		end

feature -- Access (persisted)

	uid: INTEGER
			-- unique id generated for later comparison during merging, in order to detect if two classes are the same
			-- Assigned in post-load processing

	name: STRING
			-- name of the class FROM SCHEMA
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make_from_string (unknown_type_name)
		end

	generic_parameter_defs: detachable HASH_TABLE [P_BMM_GENERIC_PARAMETER, STRING]
			-- list of generic parameter definitions
			-- FIXME: this won't function correctly unless ordering is guaranteed;
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	ancestors: detachable ARRAYED_LIST [STRING]
			-- list of immediate inheritance parents FROM SCHEMA
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	ancestor_defs: detachable ARRAYED_LIST [P_BMM_BASE_TYPE]
			-- list of immediate inheritance parents FROM SCHEMA; must be used if there are
			-- any generic ancestors
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	properties: HASH_TABLE [P_BMM_PROPERTY, STRING]
			-- list of attributes defined in this class FROM SCHEMA
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make (0)
		end

feature -- Access

	ancestor_type_names: ARRAYED_LIST [STRING]
			-- list of ancestor type names
		do
			create Result.make (0)
			Result.compare_objects
			across ancestor_refs as ancs_csr loop
				Result.extend (ancs_csr.item.as_type_string)
			end
		end

	ancestor_class_names: ARRAYED_LIST [STRING]
			-- list of ancestor class names, i.e. type names minus any generic part
		local
			anc_class_name: STRING
		do
			create Result.make (0)
			Result.compare_objects
			across ancestor_refs as ancs_csr loop
				-- find the BMM_CLASS of the ancestor reference
				if attached {P_BMM_GENERIC_TYPE} ancs_csr.item as gen_type then
					anc_class_name := gen_type.root_type
				else
					check attached {P_BMM_SIMPLE_TYPE} ancs_csr.item as simple_type then
						anc_class_name := simple_type.type
					end
				end
				Result.extend (anc_class_name)
			end
		end

	ancestor_refs: ARRAYED_LIST [P_BMM_BASE_TYPE]
			-- structural form of ancestors
			-- TODO: not dealing with inheritance from Enmerated classes - if it is allowed....
		require
			attached p_bmm_schema
		local
			p_bmm_class: P_BMM_CLASS
		do
			if attached ancestor_defs as att_defs then
				Result := att_defs
			else
				create Result.make (0)
				if attached ancestors then
					across ancestors as anc_csr loop
						check p_bmm_schema.has_class_definition (anc_csr.item) then
							p_bmm_class := p_bmm_schema.class_definition (anc_csr.item)
							if p_bmm_class.is_generic then
								Result.extend (create {P_BMM_GENERIC_TYPE}.make_generic_open (anc_csr.item,
								create {ARRAYED_LIST[STRING]}.make_from_array (p_bmm_class.generic_parameter_defs.current_keys)))
							else
								Result.extend (create {P_BMM_SIMPLE_TYPE}.make_simple (anc_csr.item))
							end
						end
					end
				end
			end
		end

	source_schema_id: STRING
			-- reference to original source schema defining this class
		attribute
			create Result.make_from_string (Unknown_schema_id)
		end

	bmm_class: detachable BMM_CLASS
		note
			option: transient
		attribute
		end

	p_bmm_schema: detachable P_BMM_SCHEMA
		note
			option: transient
		attribute
		end

feature -- Status Report

	is_abstract: BOOLEAN
			-- True if this is an abstract type
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	is_generic: BOOLEAN
			-- True if this class is a generic class
		do
			Result := attached generic_parameter_defs
		end

	is_override: BOOLEAN
			-- True if this class definition overrides one found in an included schema

feature -- Modification

	set_uid (val: INTEGER)
		do
			uid := val
		end

	set_is_override
			-- set `is_override'
		do
			is_override := True
		end

	set_source_schema_id (an_id: STRING)
			-- set source schema id
		do
			source_schema_id := an_id
		end

	set_p_bmm_schema (s: P_BMM_SCHEMA)
		do
			p_bmm_schema := s
		end

feature -- Factory

	create_bmm_class
			-- add BMM model elements to `bmm_class'
		do
			if attached generic_parameter_defs as gen_parm_defs then
				create {BMM_GENERIC_CLASS} bmm_class.make (name, documentation, is_abstract)
			else
				create {BMM_SIMPLE_CLASS} bmm_class.make (name, documentation, is_abstract)
			end
			bmm_class.set_source_schema_id (source_schema_id)
		end

	populate_bmm_class (a_bmm_model: BMM_MODEL)
			-- add remaining model elements from Current to `bmm_class'
		local
			anc_class_name: STRING
		do
			check attached bmm_class as att_bmm_class then
				-- populate references to ancestor classes; should be every class except Any
				across ancestor_refs as ancs_csr loop
					-- find the BMM_CLASS of the ancestor reference
					if attached {P_BMM_GENERIC_TYPE} ancs_csr.item as gen_type then
						anc_class_name := gen_type.root_type
					else
						check attached {P_BMM_SIMPLE_TYPE} ancs_csr.item as simple_type then
							anc_class_name := simple_type.type
						end
					end

					check attached a_bmm_model.class_definition (anc_class_name) as anc_class then
						ancs_csr.item.create_bmm_type (a_bmm_model, anc_class)
					end

					-- NOTE: we have to test for {BMM_DEFINED_TYPE} here to avoid
					-- BMM_PARAMETER_TYPE (necessary because P_BMM_GENERIC_TYPE
					-- doesn't inherit from P_BMM_SIMPLE_TYPE.)
					-- Could be fixed, but better to move on to new serial format
					check attached {BMM_ENTITY_TYPE} ancs_csr.item.bmm_type as bt then
						att_bmm_class.add_ancestor (bt)
					end
				end

				-- create generic parameters if a generic class
				-- and add to the BMM_GENERIC_TYPE.generic_parameters list
				if attached {BMM_GENERIC_CLASS} bmm_class as bmm_gen_class_def then
					check attached generic_parameter_defs and then not generic_parameter_defs.is_empty then
						across generic_parameter_defs as gen_parm_defs_csr loop
							gen_parm_defs_csr.item.create_bmm_generic_parameter (a_bmm_model)
							check attached gen_parm_defs_csr.item.bmm_generic_parameter as bm_gen_parm_def then
								bmm_gen_class_def.add_generic_parameter (bm_gen_parm_def)
							end
						end
					end
				end

				-- populate properties
				across properties as props_csr loop
					props_csr.item.create_bmm_property (a_bmm_model, att_bmm_class)
					if attached props_csr.item.bmm_property as bmm_prop_def then
						att_bmm_class.add_property (bmm_prop_def)
					end
				end

				-- mark as complete
				att_bmm_class.set_is_populated
			end
		end

feature {DT_OBJECT_CONVERTER} -- Persistence

	persistent_attributes: detachable ARRAYED_LIST[STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		do
		end

end


