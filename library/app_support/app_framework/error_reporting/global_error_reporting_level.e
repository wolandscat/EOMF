note
	component:   "Eiffel Object Modelling Framework"
	description: "Global shared error reporting level"
	keywords:    "error reporting"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class GLOBAL_ERROR_REPORTING_LEVEL

inherit
	ERROR_SEVERITY_TYPES

feature -- Access

	global_error_reporting_level: INTEGER
			-- at this level and above, list entries are included in `as_string' and any other output function
		do
			Result := global_error_reporting_level_cell.item
		end

feature -- Status Setting

	set_global_error_reporting_level (a_level: INTEGER)
		require
			valid_error_level: is_valid_error_type (a_level)
		do
			global_error_reporting_level_cell.put (a_level)
		end

feature {NONE} -- Implementation

	global_error_reporting_level_cell: CELL [INTEGER]
		once ("PROCESS")
			create Result.put (Error_type_warning)
		end

invariant
	Valid_severity_reporting_level: is_valid_error_type (global_error_reporting_level)

end


