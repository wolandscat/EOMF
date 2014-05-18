note
	component:   "Eiffel Object Modelling Framework"
	description: "Definition of dADL persistent form of an instance of BMM_CLASS_DEFINITION"
	keywords:    "model, UML"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_BMM_CLASS_DEFINITION

inherit
	P_BMM_TYPE_SPECIFIER

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

	generic_parameter_defs: detachable HASH_TABLE [P_BMM_GENERIC_PARAMETER_DEFINITION, STRING]
			-- list of generic parameter definitions
			-- FIXME: this won't function correctly unless ordering is guaranteed;
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	ancestors: ARRAYED_LIST [STRING]
			-- list of immediate inheritance parents FROM SCHEMA
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make (0)
			Result.compare_objects
		end

	properties: HASH_TABLE [P_BMM_PROPERTY_DEFINITION, STRING]
			-- list of attributes defined in this class FROM SCHEMA
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
		attribute
			create Result.make (0)
		end

feature -- Access

	source_schema_id: STRING
			-- reference to original source schema defining this class
		attribute
			create Result.make_from_string (Unknown_schema_id)
		end

	bmm_class_definition: detachable BMM_CLASS_DEFINITION
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

	create_bmm_class_definition
			-- add remaining model elements from `' to `bmm_class_definition'
		do
			create bmm_class_definition.make (name, is_abstract)
			bmm_class_definition.set_source_schema_id (source_schema_id)
		end

	populate_bmm_class_definition (a_bmm_schema: BMM_SCHEMA)
			-- add remaining model elements from `' to `bmm_class_definition'
		do
			if attached bmm_class_definition as bmm_class_def then
				-- populate references to ancestor classes; should be every class except Any
				if attached ancestors then
					across ancestors as ancs_csr loop
						if attached a_bmm_schema.class_definition (ancs_csr.item) as class_def then
							bmm_class_def.add_ancestor (class_def)
						end
					end
				end

				-- create generic parameters
				if attached generic_parameter_defs then
					across generic_parameter_defs as gen_parm_defs_csr loop
						gen_parm_defs_csr.item.create_bmm_generic_parameter_definition (a_bmm_schema)
						if attached gen_parm_defs_csr.item.bmm_generic_parameter_definition as bm_gen_parm_def then
							bmm_class_def.add_generic_parameter (bm_gen_parm_def)
						end
					end
				end

				-- populate properties
				across properties as props_csr loop
					props_csr.item.create_bmm_property_definition (a_bmm_schema, bmm_class_def)
					if attached props_csr.item.bmm_property_definition as bmm_prop_def then
						bmm_class_def.add_property (bmm_prop_def)
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


