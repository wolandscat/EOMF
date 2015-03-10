note
	component:   "Eiffel Object Modelling Framework"
	description: "Miscellaneous String utilities."
	keywords:    "formatting"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class DT_STRING_UTILITIES

inherit
	STRING_UTILITIES

feature -- Conversion

	primitive_value_to_simple_string (a_prim_val: ANY): STRING
			-- generate a basic string
		do
			-- FIXME: duration.out does not exist in Eiffel, and in any case would not be ISO8601-compliant
			if attached {DATE_TIME_DURATION} a_prim_val as a_dur then
				Result := (create {ISO8601_DURATION}.make_date_time_duration(a_dur)).as_string
			elseif attached {DATE_TIME} a_prim_val as a_dt then
				Result := (create {ISO8601_DATE_TIME}.make_date_time(a_dt)).as_string
			else
				Result := a_prim_val.out
				-- FIXME: REAL.out is broken (still the case in Eiffel 6.6)
				if (attached {REAL_32} a_prim_val or attached {REAL_64} a_prim_val) and then Result.index_of ('.', 1) = 0 then
					Result.append(".0")
				end
			end
		end

end


