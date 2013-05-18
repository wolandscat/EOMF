note
	component:   "Eiffel Object Modelling Framework"
	description: "Persistent form of BMM_GENERIC_PROPERTY"
	keywords:    "Basic meta-model"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_BMM_GENERIC_PROPERTY

inherit
	P_BMM_PROPERTY_DEFINITION
		redefine
			type_def, bmm_property_definition
		end

	BMM_DEFINITIONS
		export
			{NONE} all
		end

feature -- Access

	type_def: detachable P_BMM_GENERIC_TYPE_REFERENCE
			-- type of the container of this attribute from its containing class

	bmm_property_definition: detachable BMM_GENERIC_PROPERTY
		note
			option: transient
		attribute
		end

feature -- Factory

	create_bmm_property_definition (a_bmm_schema: BMM_SCHEMA; a_class_def: BMM_CLASS_DEFINITION)
		do
			if attached type_def as td then
				td.create_bmm_generic_type_reference (a_bmm_schema)
				if attached td.bmm_generic_type_reference as gen_type_ref then
					create bmm_property_definition.make (name, gen_type_ref, is_mandatory, is_computed, is_im_infrastructure, is_im_runtime)
				end
			end
		end

end


