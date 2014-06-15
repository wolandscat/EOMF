note
	component:   "Eiffel Object Modelling Framework"
	description: "Type reference that specifies containers with one generic parameter."
	keywords:    "model, UML, BMM"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2009- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_CONTAINER_TYPE

inherit
	BMM_TYPE
		redefine
			as_conformance_type_string
		end

create
	make

feature -- Initialisation

	make (a_type: BMM_TYPE; a_container_type: BMM_CLASS)
		do
			base_type := a_type
			container_type := a_container_type
		end

feature -- Access

	base_type: BMM_TYPE
			-- the target type; this converts to the first parameter in generic_parameters in BMM_GENERIC_TYPE

	container_type: BMM_CLASS
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

	type_category: STRING
			-- generate a type category of main target type from Type_cat_xx values
		do
			if base_type.type_category = Type_cat_abstract_class or container_type.is_abstract then
				Result := Type_cat_abstract_class
			elseif has_type_substitutions then
				Result := Type_cat_concrete_class_supertype
			else
				Result := Type_cat_concrete_class
			end
		end

	type_substitutions: ARRAYED_SET [STRING]
		local
			cont_sub_type_list, item_sub_type_list: ARRAYED_LIST [STRING]
		do
			cont_sub_type_list := container_type.type_substitutions
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

	has_type_substitutions: BOOLEAN
		do
			Result := container_type.has_type_substitutions or base_type.has_type_substitutions
		end

feature -- Output

	as_type_string: STRING
			-- formal name of the type
		do
			create Result.make_empty
			Result.append (container_type.name + Generic_left_delim.out + base_type.as_type_string + Generic_right_delim.out)
		end

	as_conformance_type_string: STRING
			-- name of the this type in form allowing other type to be conformance tested against it;
			-- Remove generic container type, i.e. 'List <ELEMENT>' becomes 'ELEMENT'
		do
			Result := base_type.as_conformance_type_string
		end

end


