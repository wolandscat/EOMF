note
	component:   "Eiffel Object Modelling Framework"
	description: "Type reference that specifies containers with one generic parameter."
	keywords:    "model, UML, BMM"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2009- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_INDEXED_CONTAINER_TYPE

inherit
	BMM_CONTAINER_TYPE
		rename
			make as make_container
		redefine
			type_name, is_abstract, has_subtypes, subtypes, create_duplicate
		end

create
	make

feature -- Initialisation

	make (a_base_type: like base_type; an_index_type: like index_type; a_container_class: like container_class)
		do
			make_container (a_base_type, a_container_class)
			index_type := an_index_type
		end

feature -- Identification

	type_name: STRING
			-- formal name of the type
		do
			create Result.make_empty
			Result.append (container_class.name + Generic_left_delim.out + index_type.type_name +
				Generic_separator.out + base_type.type_name + Generic_right_delim.out)
		end

feature -- Access

	index_type: BMM_SIMPLE_TYPE
			-- the index type, normnally a primitive type such as String or Integer

	subtypes: ARRAYED_SET [STRING]
		local
			cont_sub_type_list, item_sub_type_list, index_sub_type_list: ARRAYED_LIST [STRING]
		do
			cont_sub_type_list := container_class.all_descendants.deep_twin
			if cont_sub_type_list.is_empty then
				cont_sub_type_list.extend (container_class.name)
			end

			item_sub_type_list := base_type.subtypes
			index_sub_type_list := index_type.subtypes

			create Result.make (0)
			across cont_sub_type_list as cont_sub_types_csr loop
				across item_sub_type_list as item_sub_types_csr loop
					across index_sub_type_list as index_sub_types_csr loop
						Result.extend (cont_sub_types_csr.item + generic_left_delim.out + index_sub_types_csr.item +
							Generic_separator.out + item_sub_types_csr.item + generic_right_delim.out)
					end
				end
			end
		end

feature -- Status Report

	is_abstract: BOOLEAN
			-- abstract status of this class or type
		do
			Result := precursor or index_type.is_abstract
		end

	has_subtypes: BOOLEAN
		do
			Result := precursor or index_type.has_subtypes
		end

feature -- Factory

	create_duplicate: like Current
			-- create a copy of this type object, with common references to BMM_CLASS objects
		do
			create Result.make (base_type.create_duplicate, index_type.create_duplicate, container_class)
		end

end


