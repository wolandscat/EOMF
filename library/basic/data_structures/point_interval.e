note
	component:   "Eiffel Object Modelling Framework"
	description: "Form of INTERVAL [G] that represents point (i.e. 'degenerate') intervals."
	keywords:    "point interval, degenerate interval"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class POINT_INTERVAL [G -> PART_COMPARABLE]

inherit
	INTERVAL [G]
		redefine
			lower
		end

	STRING_UTILITIES
		export
			{NONE} all
		undefine
		out, is_equal
		end

create
	make

feature -- Initialization

	make (a_value: G)
			-- make with both limits set to the same value
		do
			lower := a_value
		ensure
			Lower_set: lower = a_value
			Upper_set: upper = a_value
			lower_included_set: lower_included
			upper_included_set: upper_included
			Is_point: is_point
		end

feature -- Access

	lower: G
			-- lower limit of interval

	upper: G
			-- upper limit of interval
		do
			Result := lower
		end

	midpoint: G
			-- generate midpoint of limits
		do
			Result := lower
		end

feature -- Status report

	lower_unbounded: BOOLEAN
			-- True if lower limit open, i.e. -infinity
		do
			Result := False
		end

	upper_unbounded: BOOLEAN
			-- True if upper limit open, i.e. +infinity
		do
			Result := False
		end

	lower_included: BOOLEAN
			-- True if lower limit point included in interval
		do
			Result := True
		end

	upper_included: BOOLEAN
			-- True if upper limit point included in interval
		do
			Result := True
		end

	is_point: BOOLEAN
			-- Is current interval a point (width = 0)?
		do
			Result := True
		end

	unbounded: BOOLEAN
			-- True if interval is completely open
		do
			Result := False
		end

feature -- Comparison

	has (v: G): BOOLEAN
			-- Does current interval have `v' between its bounds?
		do
			Result := lower = v
		end

	intersects (other: INTERVAL [G]): BOOLEAN
			-- True if there is any overlap between intervals represented by Current and other
		do
			Result := other.has (lower)
		end

	contains (other: like Current): BOOLEAN
			-- Does current interval properly contain `other'?
		do
			Result := is_equal (other)
		end

feature -- Output

	as_string: STRING
		do
			Result := primitive_value_out (lower)
		end

end

