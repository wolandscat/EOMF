note
	component:   "Eiffel Object Modelling Framework"
	description: "Persistent form of BMM_CONTAINER_PROPERTY"
	keywords:    "model, Basic meta-model"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_BMM_CONTAINER_PROPERTY

inherit
	P_BMM_PROPERTY
		redefine
			bmm_property, create_bmm_property
		end

feature -- Access (persisted)

	type_def: detachable P_BMM_CONTAINER_TYPE
			-- type definition of this property, if not a simple String type reference
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

feature -- Access

	cardinality: detachable INTERVAL [INTEGER]
			-- needs to be this basic type because this attribute is scanned in from schema, else would
			-- have used MULTIPLICITY_INTERVAL
			-- DO NOT RENAME OR OTHERWISE CHANGE THIS ATTRIBUTE EXCEPT IN SYNC WITH RM SCHEMA

	bmm_property: detachable BMM_CONTAINER_PROPERTY
		note
			option: transient
		attribute
		end

feature -- Factory

	create_bmm_property (a_bmm_model: BMM_MODEL; a_class_def: BMM_CLASS)
		do
			precursor (a_bmm_model, a_class_def)
			if attached bmm_property and attached cardinality then
				bmm_property.set_cardinality (cardinality)
			end
		end

end


