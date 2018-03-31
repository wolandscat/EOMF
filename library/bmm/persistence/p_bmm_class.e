note
	component:   "Eiffel Object Modelling Framework"
	description: "Definition of dADL persistent form of an instance of BMM_CLASS"
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

	ancestor_defs: detachable ARRAYED_LIST [P_BMM_GENERIC_TYPE]
			-- list of immediate inheritance parents FROM SCHEMA
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

	ancestor_refs: ARRAYED_LIST [P_BMM_PROPER_TYPE]
			-- structural form of ancestors
		do
			if attached ancestor_defs as att_defs then
				Result := att_defs
			elseif attached ancestors as att_anc_strings then
				create Result.make (0)
				across att_anc_strings as anc_csr loop
					Result.extend (create {P_BMM_SIMPLE_TYPE}.make_simple (anc_csr.item))
				end
			else
				create Result.make (0)
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

feature -- Factory

	create_bmm_class
			-- add BMM model elements to `bmm_class'
		do
			if attached generic_parameter_defs as gen_parm_defs then
				create {BMM_GENERIC_CLASS} bmm_class.make (name, documentation, is_abstract)
			else
				create bmm_class.make (name, documentation, is_abstract)
			end
			bmm_class.set_source_schema_id (source_schema_id)
		end

	populate_bmm_class (a_bmm_model: BMM_MODEL)
			-- add remaining model elements from Current to `bmm_class'
		do
			if attached bmm_class as att_bmm_class then
				-- create generic parameters
				if attached generic_parameter_defs and then attached {BMM_GENERIC_CLASS} bmm_class as bmm_gen_class_def then
					across generic_parameter_defs as gen_parm_defs_csr loop
						gen_parm_defs_csr.item.create_bmm_generic_parameter (a_bmm_model)
						check attached gen_parm_defs_csr.item.bmm_generic_parameter as bm_gen_parm_def then
							bmm_gen_class_def.add_generic_parameter (bm_gen_parm_def)
						end
					end
				end

				-- populate references to ancestor classes; should be every class except Any
				across ancestor_refs as ancs_csr loop
					ancs_csr.item.create_bmm_type (a_bmm_model, att_bmm_class)

					-- add a BMM_TYPE to the BMM_GENERIC_TYPE.generic_parameters list
					-- NOTE: we have to test for {BMM_SIMPLE_TYPE} here because P_BMM_GENERIC_TYPE
					-- doesn't inherit from P_BMM_SIMPLE_TYPE as BMM_GENERIC_TYPE inherits from
					-- BMM_SIMPLE_TYPE. Could be fixed, but better to move on to new serial format
					check attached {BMM_SIMPLE_TYPE} ancs_csr.item.bmm_type as bt then
						bmm_class.add_ancestor (bt)
					end
				end

				-- populate properties
				across properties as props_csr loop
					props_csr.item.create_bmm_property (a_bmm_model, att_bmm_class)
					if attached props_csr.item.bmm_property as bmm_prop_def then
						att_bmm_class.add_property (bmm_prop_def)
					end
				end
			end
		end

feature {DT_OBJECT_CONVERTER} -- Persistence

	persistent_attributes: detachable ARRAYED_LIST[STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		do
		end

end


