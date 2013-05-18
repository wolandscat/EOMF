note
	component:   "Eiffel Object Modelling Framework"
	description: "Basic Meta-model abstraction of a single-valued property"
	keywords:    "Basic meta-model"

	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_BMM_SINGLE_PROPERTY

inherit
	P_BMM_PROPERTY_DEFINITION
		redefine
			bmm_property_definition
		end

feature -- Access

	bmm_property_definition: detachable BMM_SINGLE_PROPERTY
		note
			option: transient
		attribute
		end

feature -- Factory

	create_bmm_property_definition (a_bmm_schema: BMM_SCHEMA; a_class_def: BMM_CLASS_DEFINITION)
		do
			if attached a_bmm_schema.class_definition (type) as class_def then
				create bmm_property_definition.make (name, class_def, is_mandatory, is_computed, is_im_infrastructure, is_im_runtime)
			end
		end

end


