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

feature -- Identification

	type_name: STRING
			-- formal string form of the type as per UML
		deferred
		end

	conformance_type_name: STRING
			-- name of the this type in form allowing other type to be RT-conformance tested against it;
			-- 'RT' conformance means 'relation-target' conformance, which abstracts away container types like
			-- List<>, Set<> etc and compares the dynamic type with the relation target type in the UML sense,
			-- i.e. regardless of whether there is single or multiple containment
		do
			create Result.make_from_string (type_name)
		end

	type_signature: STRING
			-- Signature form of the type, which for generics includes generic parameter constrainer types
			-- E.g. Interval<T:Ordered>
		do
			create Result.make_from_string (type_name)
		end

feature -- Access

	base_class: BMM_CLASS
			-- main design class for this type, from which properties etc can be extracted
		deferred
		end

	flattened_type_list: ARRAYED_LIST [STRING]
			-- completely flattened list of type names, flattening out all generic parameters
		deferred
		end

	type_category: STRING
			-- generate a type category of main target type from Type_category_xx values
		deferred
		end

invariant
	type_category_valid: Type_categories.has (type_category)

end


