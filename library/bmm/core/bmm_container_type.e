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
			entity_metatype
		end

create
	make

feature -- Initialisation

	make (a_base_type: like base_type; a_container_type: like container_type)
		do
			base_type := a_base_type
			container_type := a_container_type
		end

feature -- Identification

	type_name: STRING
			-- formal name of the type
		do
			create Result.make_empty
			Result.append (container_type.name + Generic_left_delim.out + base_type.type_name + Generic_right_delim.out)
		end

	entity_metatype: STRING
		do
			Result := Entity_metatype_container
		end

feature -- Access

	base_type: BMM_BASE_TYPE
			-- the target type; this converts to the first parameter in generic_parameters in BMM_GENERIC_TYPE

	container_type: BMM_GENERIC_CLASS
			-- the type of the container. This converts to the root_type in BMM_GENERIC_TYPE

	base_class: BMM_CLASS
			-- the 'design' type of this type, ignoring containers, multiplicity etc.
		do
			Result := base_type.base_class
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

	type_substitutions: ARRAYED_SET [STRING]
		local
			cont_sub_type_list, item_sub_type_list: ARRAYED_LIST [STRING]
		do
			cont_sub_type_list := container_type.all_descendants.deep_twin
			if cont_sub_type_list.is_empty then
				cont_sub_type_list.extend (container_type.name)
			end

			item_sub_type_list := base_type.type_substitutions

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
			Result := base_type.is_abstract or container_type.is_abstract
		end

	has_type_substitutions: BOOLEAN
		do
			Result := container_type.has_descendants or base_type.has_type_substitutions
		end

end


