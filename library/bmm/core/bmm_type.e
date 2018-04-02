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
	BMM_CLASSIFIER

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

feature -- Access

	base_class: BMM_CLASS
			-- model-semantic class for this type, from which properties etc can be extracted;
			-- abstracts away container types.
		deferred
		end

	flattened_type_list: ARRAYED_LIST [STRING]
			-- completely flattened list of type names, flattening out all generic parameters
		deferred
		end

	type_substitutions: ARRAYED_SET [STRING]
			-- List of type substitutions if any available for this type within the current BMM model.
		deferred
		end

	documentation: detachable STRING
		do
			Result := base_class.documentation
		end

feature -- Status Report

	has_type_substitutions: BOOLEAN
			-- Determine if there are any type substitutions.
		deferred
		end

end


