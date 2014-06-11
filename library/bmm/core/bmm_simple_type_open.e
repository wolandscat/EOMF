note
	component:   "Eiffel Object Modelling Framework"
	description: "Open type reference to a single type."
	keywords:    "model, UML"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2014- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_SIMPLE_TYPE_OPEN

inherit
	BMM_TYPE

create
	make

feature -- Initialisation

	make (a_type: BMM_GENERIC_PARAMETER)
		do
			type := a_type
		end

feature -- Access

	type: BMM_GENERIC_PARAMETER
			-- the target type

	semantic_class: BMM_CLASS
			-- the 'design' type of this type, ignoring containers, multiplicity etc.
		do
			Result := type.semantic_class
		end

	flattened_type_list: ARRAYED_LIST [STRING]
			-- completely flattened list of type names, flattening out all generic parameters
			-- note that for this type, we throw away the container_type because we are tring to match
			-- the type of an object as being a valid member of the container, e.g. ELEMENT in List<ELEMENT>
		do
			Result := type.flattened_type_list
		end

	type_category: STRING
			-- generate a type category of main target type from Type_cat_xx values
		do
			Result := type.type_category
		end

	type_substitutions: ARRAYED_SET [STRING]
		do
			Result := type.type_substitutions
		end

feature -- Status Report

	has_type_substitutions: BOOLEAN
		do
			Result := type.has_type_substitutions
		end

feature -- Output

	as_type_string: STRING
			-- formal name of the type
		do
			Result := type.as_type_string
		end

end


