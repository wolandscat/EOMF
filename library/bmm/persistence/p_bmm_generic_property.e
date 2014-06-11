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
	BMM_DEFINITIONS
		export
			{NONE} all
		end

	P_BMM_PROPERTY
		redefine
			bmm_property_definition
		end

feature -- Access (persisted)

	type_def: detachable P_BMM_GENERIC_TYPE
			-- type definition of this property, if not a simple String type reference
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

feature -- Access

	bmm_property_definition: detachable BMM_PROPERTY [BMM_GENERIC_TYPE]
		note
			option: transient
		attribute
		end

end


