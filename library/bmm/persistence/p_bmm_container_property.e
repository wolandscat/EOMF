note
	component:   "Eiffel Object Modelling Framework"
	description: "Persistent form of BMM_CONTAINER_PROPERTY"
	keywords:    "model, Basic meta-model"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class P_BMM_CONTAINER_PROPERTY

inherit
	P_BMM_PROPERTY
		redefine
			bmm_property_definition, create_bmm_property_definition
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

	bmm_property_definition: detachable BMM_CONTAINER_PROPERTY
		note
			option: transient
		attribute
		end

feature -- Factory

	create_bmm_property_definition (a_bmm_schema: BMM_SCHEMA; a_class_def: BMM_CLASS)
		do
			precursor (a_bmm_schema, a_class_def)
			if attached bmm_property_definition as att_pb and attached cardinality as att_card then
				att_pb.set_cardinality (att_card)
			end
		end

end


