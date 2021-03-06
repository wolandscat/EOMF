note
	component:   "Eiffel Object Modelling Framework"
	description: "Basic Meta-model abstraction of a single-valued property"
	keywords:    "Basic meta-model"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_BMM_SINGLE_PROPERTY

inherit
	P_BMM_UNITARY_PROPERTY

feature -- Access (persisted)

	type: detachable STRING
			-- type definition of this property, if a simple String type reference
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	type_ref: detachable P_BMM_SIMPLE_TYPE
			-- type definition of this property, if not a simple String type reference
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA
			-- Can be used in schema instead of `type', but less readable
		note
			option: transient
		attribute
		end

feature -- Access

	type_def: detachable P_BMM_SIMPLE_TYPE
			-- generate `type_ref' from `type' and save
		do
			if not attached type_ref and attached type as att_type then
				create type_ref.make_simple (att_type)
			end
			Result := type_ref
		end

end


