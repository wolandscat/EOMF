note
	component:   "Eiffel Object Modelling Framework"
	description: "Feature type definitions for method dispatch"
	keywords:    "method dispatch"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003, 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class FEATURE_TYPES

feature -- Access

	Procedure:INTEGER = 0
	Function_reference:INTEGER = 1
	Function_boolean:INTEGER = 2
	Function_character:INTEGER = 3
	Function_integer:INTEGER = 4
	Function_real:INTEGER = 5
	Function_double:INTEGER = 6
	Function_pointer:INTEGER = 7
	Function_bit:INTEGER = 8
	Field_reference:INTEGER = 9

feature -- Status

	is_valid_feature_type(n:INTEGER):BOOLEAN
		do
			Result := n >= Procedure and n <= Field_reference
		end

end
	
