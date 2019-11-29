note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Meta-type that specifies linear containers with a generic parameter corresponding 
				 to the type of contained item, and whose container type is a generic type such as
				 `List<T>`, `Set<T>` etc..
				 ]"
	keywords:    "model, UML, BMM"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2009- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_CONTAINER_TYPE

inherit
	BMM_TYPE
		redefine
			has_formal_generic_type, substitute_formal_generic_type
		end

create
	make

feature -- Initialisation

	make (a_base_type: like item_type; a_container_class: like container_class)
		do
			item_type := a_base_type
			container_class := a_container_class
		end

feature -- Identification

	type_name: STRING
			-- formal name of the type in the form "Container<V>"
		do
			create Result.make_empty
			Result.append (container_class.name + Generic_left_delim.out + item_type.type_name + Generic_right_delim.out)
		end

	entity_metatype: STRING
		do
			Result := Entity_metatype_container
		end

feature -- Access

	item_type: BMM_UNITARY_TYPE
			-- The container item type

	unitary_type: BMM_UNITARY_TYPE
			-- Effective unitary type
		do
			Result := item_type
		end

	effective_type: BMM_EFFECTIVE_TYPE
			-- Effective conformance type,taking into account formal parameter types
		do
			Result := item_type.effective_type
		end

	container_class: BMM_GENERIC_CLASS
			-- the type of the container. This converts to the root_type in BMM_GENERIC_TYPE

	flattened_type_list: ARRAYED_LIST [STRING]
			-- completely flattened list of type names, with container_type removed
			-- because we are tring to match the type of an object as being a valid
			-- member of the container, e.g. ELEMENT in List<ELEMENT>
		do
			create Result.make (0)
			Result.compare_objects
			Result.append (item_type.flattened_type_list)
		end

    properties: STRING_TABLE [BMM_PROPERTY]
			-- list of all properties defined by this entity, keyed by property name
		do
			Result := item_type.properties
		end

    flat_properties: STRING_TABLE [BMM_PROPERTY]
			-- list of all properties of an instance of this entity, keyed by property name
		do
			Result := item_type.flat_properties
		end

feature -- Status Report

	is_abstract: BOOLEAN
			-- abstract status of this class or type
		do
			Result := item_type.is_abstract or container_class.is_abstract
		end

	is_primitive: BOOLEAN
			-- True if this entity corresponds to a primitive type
		do
			Result := item_type.is_primitive
		end

	has_subtypes: BOOLEAN
		do
			Result := container_class.has_descendants or item_type.has_subtypes
		end

	has_formal_generic_type (a_gen_type_name: STRING): BOOLEAN
			-- True if there is any occurrence of `a_gen_type_name` in the type structure
		do
			Result := item_type.has_formal_generic_type (a_gen_type_name)
		end

feature -- Factory

	create_duplicate: like Current
			-- create a copy of this type object, with common references to BMM_CLASS objects
		do
			create Result.make (item_type.create_duplicate, container_class)
		end

feature -- Modification

	substitute_formal_generic_type (a_gen_type_name: STRING; a_sub_type: BMM_EFFECTIVE_TYPE)
			-- substitute any occurrence of `a_gen_type_name` in the type structure
			-- with `a_sub_type
		do
			if attached {BMM_PARAMETER_TYPE} item_type as param_type and then param_type.name.is_equal (a_gen_type_name) then
				item_type := a_sub_type
			elseif attached {BMM_GENERIC_TYPE} item_type as gen_type then
				gen_type.substitute_formal_generic_type (a_gen_type_name, a_sub_type)
			end
		end

end


