note
	component:   "Eiffel Object Modelling Framework"
	description: "Type reference to a single type, either open or closed."
	keywords:    "model, UML"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2014- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_SIMPLE_TYPE

inherit
	BMM_TYPE

create
	make

feature -- Initialisation

	make (a_class: BMM_CLASS)
		do
			base_class := a_class
		end

feature -- Access

	base_class: BMM_CLASS
			-- the target type; this converts to the first parameter in generic_parameters in BMM_GENERIC_TYPE

	flattened_type_list: ARRAYED_LIST [STRING]
			-- completely flattened list of type names, flattening out all generic parameters
			-- note that for this type, we throw away the container_type because we are tring to match
			-- the type of an object as being a valid member of the container, e.g. ELEMENT in List<ELEMENT>
		do
			create Result.make (0)
			Result.compare_objects
			Result.append (base_class.flattened_type_list)
		end

	type_category: STRING
			-- generate a type category of main target type from Type_cat_xx values
		do
			if base_class.is_abstract then
				Result := Type_cat_abstract_class
			elseif base_class.is_primitive_type then
				Result := Type_cat_primitive_class
			elseif has_type_substitutions then
				Result := Type_cat_concrete_class_supertype
			else
				Result := Type_cat_concrete_class
			end
		end

	type_substitutions: ARRAYED_SET [STRING]
		do
			Result := base_class.all_descendants
		end

feature -- Status Report

	has_type_substitutions: BOOLEAN
		do
			Result := base_class.has_descendants
		end

feature -- Output

	as_type_string: STRING
			-- formal name of the type
		do
			Result := base_class.as_type_string
		end

end


