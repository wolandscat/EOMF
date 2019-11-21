note
	component:   "Eiffel Object Modelling Framework"
	description: "Type reference to a single type, either open or closed."
	keywords:    "model, UML"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_SIMPLE_TYPE

inherit
	BMM_ENTITY_TYPE
		redefine
			defining_class
		end

create
	make

feature -- Identification

	type_name: STRING
			-- formal name of the type
		do
			Result := defining_class.name
		end

feature -- Access

	defining_class: BMM_SIMPLE_CLASS
			-- the base class of this type

	flattened_type_list: ARRAYED_LIST [STRING]
			-- completely flattened list of type names, flattening out all generic parameters
			-- note that for this type, we throw away the container_type because we are tring to match
			-- the type of an object as being a valid member of the container, e.g. ELEMENT in List<ELEMENT>
		do
			create Result.make (0)
			Result.compare_objects
			Result.extend (defining_class.name)
		end

	subtypes: ARRAYED_SET [STRING]
		do
			Result := defining_class.all_descendants
		end

feature -- Status Report

	is_abstract: BOOLEAN
			-- generate a type category of main target type from Type_cat_xx values
		do
			Result := defining_class.is_abstract
		end

	has_subtypes: BOOLEAN
		do
			Result := defining_class.has_descendants
		end

feature -- Factory

	create_duplicate: like Current
			-- create a copy of this type object, with common references to BMM_CLASS objects
		do
			create Result.make (defining_class)
		end

end


