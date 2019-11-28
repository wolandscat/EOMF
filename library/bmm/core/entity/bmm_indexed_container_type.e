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
			type_name, is_abstract, has_subtypes, create_duplicate
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
			-- formal name of the type in form "Container<K, V>"
		do
			create Result.make_empty
			Result.append (container_class.name + Generic_left_delim.out + index_type.type_name +
				Generic_separator.out + base_type.type_name + Generic_right_delim.out)
		end

feature -- Access

	index_type: BMM_SIMPLE_TYPE
			-- the index type, normnally a primitive type such as String or Integer

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


