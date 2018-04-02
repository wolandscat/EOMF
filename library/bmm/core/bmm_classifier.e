note
	component:   "Eiffel Object Modelling Framework"
	description: "Abstract idea of specifying a type either by definition or by reference."
	keywords:    "model, UML, BMM"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2009 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class BMM_CLASSIFIER

inherit
	BMM_MODEL_ELEMENT

feature -- Access

	classifier_category: STRING
			-- generate a type category of main target type from Type_category_xx values
		deferred
		end

invariant
	type_category_valid: classifier_categories.has (classifier_category)

end


