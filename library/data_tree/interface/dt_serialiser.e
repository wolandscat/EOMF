note
	component:   "Eiffel Object Modelling Framework"
	description: "Serialise Data Tree archetype to any format"
	keywords:    "Data Tree"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class DT_SERIALISER

inherit
	ANY_SERIALISER
		redefine
			reset
		end

	DT_VISITOR

feature -- Status Report

	full_type_marking_on: BOOLEAN
			-- output all type information

	output_typed_encapsulated: BOOLEAN
			-- output with typed object wrapper, rather than just the series of attributes innside the object

feature -- Status Settinng

	set_output_typed_encapsulated
			-- set `output_typed_encapsulated'
		do
			output_typed_encapsulated := True
		end

	set_full_type_marking_on
		do
			full_type_marking_on := True
		end

feature -- Commands

	reset
			-- set up serialiser
		do
			precursor
			output_typed_encapsulated := False
			full_type_marking_on := False
		end

end


