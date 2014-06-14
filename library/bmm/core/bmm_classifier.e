note
	component:   "Eiffel Object Modelling Framework"
	description: "Abstract idea of specifying a type either by definition or by reference."
	keywords:    "model, UML, BMM"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2009- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class BMM_CLASSIFIER

inherit
	BMM_MODEL_ELEMENT

feature -- Access

	flattened_type_list: ARRAYED_LIST [STRING]
			-- completely flattened list of type names, flattening out all generic parameters
		deferred
		end

	base_class: BMM_CLASS
			-- main design class for this type, from which properties etc can be extracted
		deferred
		end

	type_category: STRING
			-- generate a type category of main target type from Type_category_xx values
		deferred
		end

	type_substitutions: ARRAYED_SET [STRING]
		deferred
		end

feature -- Status Report

	has_type_substitutions: BOOLEAN
		deferred
		end

feature -- Output

	as_type_string: STRING
			-- formal string form of the type as per UML
		deferred
		end

	as_display_type_string: STRING
			-- same as `as_type_string' except if a constrained generic,
			-- in the form "T: CONSTRAINER_TYPE"
		do
			Result := as_type_string
		end

	as_rt_type_string: STRING
			-- name of the this type in form allowing other type to be RT-conformance tested against it;
			-- 'RT' conformance means 'relation-target' conformance, which abstracts away container types like
			-- List<>, Set<> etc and compares the dynamic type with the relation target type in the UML sense,
			-- i.e. regardless of whether there is single or multiple containment
		do
			Result := as_type_string
		end

invariant
	type_category_valid: Type_categories.has (type_category)

end


