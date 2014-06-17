note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Abstract idea of specifying a type in some context. This is not the same as 'defining' a class.
				 A type specification is essentially a reference of some kind, that defines the type of an
				 attribute, or function result or argument. It may include generic parameters that might or might
				 not be bound. See subtypes
				 ]"
	keywords:    "model, UML"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2009 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class BMM_TYPE

inherit
	BMM_CLASSIFIER

feature -- Access

	type_substitutions: ARRAYED_SET [STRING]
		deferred
		end

feature -- Status Report

	has_type_substitutions: BOOLEAN
		deferred
		end

feature -- Output

	as_display_type_string: STRING
			-- same as `as_type_string' except if a constrained generic,
			-- in the form "T: CONSTRAINER_TYPE"
		do
			Result := as_type_string
		end

end


