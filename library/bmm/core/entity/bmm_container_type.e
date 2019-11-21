note
	component:   "Eiffel Object Modelling Framework"
	description: "Type reference that specifies containers with one generic parameter."
	keywords:    "model, UML, BMM"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2009- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_CONTAINER_TYPE

inherit
	BMM_TYPE
		redefine
			entity_metatype, has_formal_generic_type, substitute_formal_generic_type
		end

create
	make

feature -- Initialisation

	make (a_base_type: like base_type; a_container_class: like container_class)
		do
			base_type := a_base_type
			container_class := a_container_class
		end

feature -- Identification

	type_name: STRING
			-- formal name of the type
		do
			create Result.make_empty
			Result.append (container_class.name + Generic_left_delim.out + base_type.type_name + Generic_right_delim.out)
		end

	entity_metatype: STRING
		do
			Result := Entity_metatype_container
		end

feature -- Access

	base_type: BMM_UNITARY_TYPE
			-- the target type; this converts to the first parameter in generic_parameters in BMM_GENERIC_TYPE

	container_class: BMM_GENERIC_CLASS
			-- the type of the container. This converts to the root_type in BMM_GENERIC_TYPE

	effective_base_class: BMM_CLASS
			-- the 'design' type of this type, ignoring containers, multiplicity etc.
		do
			Result := base_type.effective_base_class
		end

	flattened_type_list: ARRAYED_LIST [STRING]
			-- completely flattened list of type names, flattening out all generic parameters
			-- note that for this type, we throw away the container_type because we are tring to match
			-- the type of an object as being a valid member of the container, e.g. ELEMENT in List<ELEMENT>
		do
			create Result.make (0)
			Result.compare_objects
			Result.append (base_type.flattened_type_list)
		end

	subtypes: ARRAYED_SET [STRING]
		local
			cont_sub_type_list, item_sub_type_list: ARRAYED_LIST [STRING]
		do
			cont_sub_type_list := container_class.all_descendants.deep_twin
			if cont_sub_type_list.is_empty then
				cont_sub_type_list.extend (container_class.name)
			end

			item_sub_type_list := base_type.subtypes

			create Result.make (0)
			across cont_sub_type_list as cont_sub_types_csr loop
				across item_sub_type_list as item_sub_types_csr loop
					Result.extend (cont_sub_types_csr.item + generic_left_delim.out + item_sub_types_csr.item + generic_right_delim.out)
				end
			end
		end

feature -- Status Report

	is_abstract: BOOLEAN
			-- abstract status of this class or type
		do
			Result := base_type.is_abstract or container_class.is_abstract
		end

	has_subtypes: BOOLEAN
		do
			Result := container_class.has_descendants or base_type.has_subtypes
		end

	has_formal_generic_type (a_gen_type_name: STRING): BOOLEAN
			-- True if there is any occurrence of `a_gen_type_name` in the type structure
		do
			Result := base_type.has_formal_generic_type (a_gen_type_name)
		end

feature -- Factory

	create_duplicate: like Current
			-- create a copy of this type object, with common references to BMM_CLASS objects
		do
			create Result.make (base_type.create_duplicate, container_class)
		end

feature -- Modification

	substitute_formal_generic_type (a_gen_type_name: STRING; a_sub_type: BMM_DEFINED_TYPE)
			-- substitute any occurrence of `a_gen_type_name` in the type structure
			-- with `a_sub_type
		do
			if attached {BMM_PARAMETER_TYPE} base_type as param_type and then param_type.name.is_equal (a_gen_type_name) then
				base_type := a_sub_type
			elseif attached {BMM_GENERIC_TYPE} base_type as gen_type then
				gen_type.substitute_formal_generic_type (a_gen_type_name, a_sub_type)
			end
		end

end


