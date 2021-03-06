note
	component:   "Eiffel Object Modelling Framework"
	description: "Abstract idea of specifying a type either by definition or by reference."
	keywords:    "model, UML, BMM"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2009 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class BMM_ENTITY

inherit
	BMM_DEFINITIONS
		export
			{NONE} all;
			{ANY} deep_twin, is_deep_equal, standard_is_equal, generating_type
		end

	BMM_BUILTINS
		export
			{NONE} all
		end

feature -- Definition

	Entity_metatype_simple: STRING = "simple_entity"
	Entity_metatype_range_constrained: STRING = "range_constrained_entity"
	Entity_metatype_enumeration: STRING = "enumeration_entity"
	Entity_metatype_generic: STRING = "generic_entity"
	Entity_metatype_generic_parameter: STRING = "generic_parameter_entity"
	Entity_metatype_container: STRING = "container_entity"
	Entity_metatype_signature: STRING = "signature_entity"
	Entity_metatype_tuple: STRING = "tuple_entity"

	Entity_category_modifier_abstract: STRING = "abstract"
	Entity_category_modifier_primitive: STRING = "primitive"
	Entity_category_modifier_override: STRING = "override"

	Entity_category_axis_delimiter: CHARACTER = '-'
			-- delimiter for category codes generated by `entity_category`

	Entity_category_simple_abstract: STRING = "simple_entity_abstract"
--	FIXME: should be a once routine, but static referenceing not allowed from client calling contexts
--		once
--			Result := entity_category_generator (Entity_metatype_simple, True, False)
--		end

feature -- Access

	entity_category: STRING
			-- generate a multi-axial code-string that represents the meta-type of
			-- tihs model definition entity. Of the form:
			-- 	String { '-' String }*
			-- e.g. "simple", "generic-abstract", "container-primitive" etc.
		do
			Result := entity_category_generator (entity_metatype, is_abstract, is_primitive)
		end

	entity_metatype: STRING
		deferred
		end

    properties: STRING_TABLE [BMM_PROPERTY]
			-- list of all properties defined by this entity, keyed by property name
		deferred
		end

    flat_properties: STRING_TABLE [BMM_PROPERTY]
			-- list of all properties of an instance of this entity, keyed by property name
		deferred
		end

feature -- Status Report

	is_abstract: BOOLEAN
			-- abstract status of this class or type
		deferred
		end

	is_primitive: BOOLEAN
			-- True if this this class or type represents a primitive type
		deferred
		end

feature {NONE} -- Implementation

	entity_category_generator (a_metatype: STRING; is_abstract_flag, is_primitive_flag: BOOLEAN): STRING
			-- generate a multi-axial code-string that represents the meta-type of
			-- a model definition entity. Of the form:
			-- 	String { '-' String }*
			-- e.g. "simple", "generic-abstract", "container-primitive" etc.
		do
			create Result.make_from_string (a_metatype)

			if is_abstract_flag then
				Result.append_character (Entity_category_axis_delimiter)
				Result.append (Entity_category_modifier_abstract)
			end

			if is_primitive_flag then
				Result.append_character (Entity_category_axis_delimiter)
				Result.append (Entity_category_modifier_primitive)
			end
		end

end


