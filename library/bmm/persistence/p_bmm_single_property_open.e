note
	component:   "Eiffel Object Modelling Framework"
	description: "Persistent form of a BMM_SINGLE_PROPERTY_OPEN"
	keywords:    "Basic meta-model"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_BMM_SINGLE_PROPERTY_OPEN

inherit
	P_BMM_PROPERTY_DEFINITION
		redefine
			bmm_property_definition
		end

feature -- Access

	bmm_property_definition: detachable BMM_SINGLE_PROPERTY_OPEN
		note
			option: transient
		attribute
		end

feature -- Factory

	create_bmm_property_definition (a_bmm_schema: BMM_SCHEMA; a_class_def: BMM_CLASS_DEFINITION)
		do
			if attached a_class_def.generic_parameters.item (type) as ts then
				create bmm_property_definition.make (name, ts, is_mandatory, is_computed, is_im_infrastructure, is_im_runtime)
			end
		end

end


