note
	component:   "Eiffel Object Modelling Framework"
	description: "[
			     Abstract class providing convertibility from a DT structure to any object type.
			     
			     The `make_dt' routine provides a parameterless make routine that can be safely called by DT_OBJECT_CONVERTER during 
			     deserialisation, to ensure invariants are satisfied directly after initial creation.
			     
			     The `persistent_attributes' attribute defines a list of names of attributes that should be persisted, since often 
			     there are other extraneous attributes. If empty, the DT_OBJECT_CONVERTER
			     routines will assume all.
			     ]"
	keywords:    "Data Tree"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class DT_CONVERTIBLE

feature -- Initialisation

	make_dt (make_args: detachable ARRAY[ANY])
			-- basic make routine to guarantee validity on creation
		deferred
		end

feature -- Representation

	dt_representation: DT_COMPLEX_OBJECT
			-- representation as a data tree
		do
			create Result.make_from_object (Current)
		end

feature -- Finalisation

	finalise_dt
			-- finalisation routine to guarantee validity on creation from dt
		do
		end

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: detachable ARRAYED_LIST [STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		deferred
		ensure
			attached Result implies Result.object_comparison
		end

end


