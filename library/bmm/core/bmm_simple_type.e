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
	BMM_BASE_TYPE

create
	make

feature -- Initialisation

	make (a_class: like base_class)
		do
			base_class := a_class
		end

feature -- Identification

	type_name: STRING
			-- formal name of the type
		do
			Result := base_class.name
		end

	classifier_category: STRING
			-- generate a type category of main target type from Type_cat_xx values
		do
			Result := base_class.classifier_category
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
			Result.extend (base_class.name)
		end

	type_substitutions: ARRAYED_SET [STRING]
		do
			Result := base_class.all_descendant_types
		end

feature -- Status Report

	is_abstract: BOOLEAN
			-- generate a type category of main target type from Type_cat_xx values
		do
			Result := base_class.is_abstract
		end

	has_type_substitutions: BOOLEAN
		do
			Result := base_class.has_descendants
		end

end


