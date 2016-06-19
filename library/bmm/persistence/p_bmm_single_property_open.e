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
	P_BMM_PROPERTY
		redefine
			bmm_property
		end

feature -- Access (persisted)

	type: detachable STRING
			-- type definition of this property, if a simple String type reference
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
			-- Really we should use `type_def' to be regular in the schema, but that makes the
			-- schema more wordy and less clear. So we use this persisted String value, and
			-- compute the `type_def' on the fly.

	type_ref: detachable P_BMM_SIMPLE_TYPE_OPEN
			-- type definition of this property, if not a simple String type reference
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
			-- Can be used in schema instead of `type', but less readable

feature -- Access

	type_def: detachable P_BMM_SIMPLE_TYPE_OPEN
			-- generate `type_ref' from `type' and save
		do
			if not attached type_ref and attached type as att_type then
				create type_ref.make_simple (att_type)
			end
			Result := type_ref
		end

feature -- Access

	bmm_property: detachable BMM_PROPERTY [BMM_OPEN_TYPE]
		note
			option: transient
		attribute
		end

end


