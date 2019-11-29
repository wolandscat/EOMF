note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Abstract idea of specifying a type in some context. This is not the same as 'defining' a class.
				 A type specification is essentially a reference of some kind, that defines the type of an
				 attribute, or function result or argument. It may include generic parameters that might or might
				 not be bound. See subtypes
				 ]"
	keywords:    "model, UML"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2009 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class BMM_TYPE

inherit
	BMM_ENTITY

feature -- Identification

	type_name: STRING
			-- formal string form of the type as per UML
		deferred
		end

	type_signature: STRING
			-- Signature form of the type, which for generics includes generic parameter constrainer types
			-- E.g. Interval<T:Ordered>
		do
			create Result.make_from_string (type_name)
		end

	entity_metatype: STRING
			-- generate a type category of main target type from Type_cat_xx values
		deferred
		end

feature -- Access

	unitary_type: BMM_UNITARY_TYPE
			-- Effective unitary type, excluding container
		deferred
		end

	effective_type: BMM_EFFECTIVE_TYPE
			-- Effective conformance type, taking into account formal parameter types
		deferred
		end

	flattened_type_list: ARRAYED_LIST [STRING]
			-- completely flattened list of type names, flattening out all generic parameters
		deferred
		end

feature -- Status Report

	is_primitive: BOOLEAN
			-- True if this entity corresponds to a primitive type
		deferred
		end

	has_subtypes: BOOLEAN
			-- Determine if there are any type substitutions.
		deferred
		end

	has_formal_generic_type (a_gen_type_name: STRING): BOOLEAN
			-- True if there is any occurrence of `a_gen_type_name` in the type structure
		do
			-- default: nothing to do
		end

feature -- Factory

	create_duplicate: like Current
			-- create a copy of this type object, with common references to BMM_CLASS objects
		deferred
		end

feature -- Modification

	substitute_formal_generic_type (a_gen_type_name: STRING; a_sub_type: BMM_TYPE)
			-- substitute any occurrence of `a_gen_type_name` in the type structure
			-- with `a_sub_type
		do
			-- default: nothing to do
		end

end


