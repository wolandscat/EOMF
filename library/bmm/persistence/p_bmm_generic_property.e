note
	component:   "Eiffel Object Modelling Framework"
	description: "Persistent form of BMM_GENERIC_PROPERTY"
	keywords:    "Basic meta-model"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_BMM_GENERIC_PROPERTY

inherit
	P_BMM_PROPERTY
		redefine
			bmm_property
		end

feature -- Access (persisted)

	type_def: detachable P_BMM_GENERIC_TYPE
			-- type definition of this property, if not a simple String type reference
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

feature -- Access

	bmm_property: detachable BMM_UNITARY_PROPERTY
		note
			option: transient
		attribute
		end

feature -- Status Report

	is_open: BOOLEAN
			-- True if there is any open actual parameter
		do
			Result := attached type_def as td and then td.is_open
		end

feature -- Factory

	create_bmm_property (a_bmm_model: BMM_MODEL; a_class_def: BMM_CLASS)
		do
			if attached type_def then
				type_def.create_bmm_type (a_bmm_model, a_class_def)
				check attached {BMM_UNITARY_TYPE} type_def.bmm_type as b_ut then
					create bmm_property.make (name, documentation, b_ut, not is_mandatory, is_computed, is_im_infrastructure, is_im_runtime)
				end
			end
		end

end


