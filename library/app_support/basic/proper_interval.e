note
	component:   "Eiffel Object Modelling Framework"

	description: "[
				 Generic class defining the proper interval form of INTERVAL [G], i.e. intervals that
				 are not degenerate, i.e. intervals that have 2 sides or else are half-open.
				 ]"
	keywords:    "intervals"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class PROPER_INTERVAL [G -> PART_COMPARABLE]

inherit
	INTERVAL [G]
		redefine
			default_create
		end

	STRING_UTILITIES
		export
			{NONE} all
		undefine
		default_create, out, is_equal
		end

create
	default_create,
	make_bounded, make_bounded_included,
	make_lower_unbounded,
	make_upper_unbounded,
	make_unbounded,
	make_point,
	make

feature -- Initialization

	default_create
			-- Create satisfying the invariant.
		do
			lower_unbounded := True
			upper_unbounded := True
		ensure then
			unbounded: lower_unbounded and upper_unbounded
		end

	make_point (a_value: G)
			-- make with both limits set to the same value
		do
			lower := a_value
			upper := a_value
			lower_included := True
			upper_included := True
		ensure
			Lower_set: lower = a_value
			Upper_set: upper = a_value
			lower_included_set: lower_included
			upper_included_set: upper_included
			Is_point: is_point
		end

	make_bounded (a_lower, an_upper: G; lower_included_flag, upper_included_flag: BOOLEAN)
			-- make with both limits set
		require
			Valid_order: a_lower <= an_upper
		do
			lower := a_lower
			upper := an_upper
			lower_included := lower_included_flag
			upper_included := upper_included_flag
		ensure
			Lower_set: lower = a_lower
			Upper_set: upper = an_upper
			lower_included_set: lower_included = lower_included_flag
			upper_included_set: upper_included = upper_included_flag
		end

	make_bounded_included (a_lower, an_upper: G)
			-- make with both limits set and included, the most typical situation
		require
			Valid_order: a_lower <= an_upper
		do
			lower := a_lower
			upper := an_upper
			lower_included := True
			upper_included := True
		ensure
			Lower_set: lower = a_lower
			Upper_set: upper = an_upper
			lower_included_set: lower_included
			upper_included_set: upper_included
		end

	make_lower_unbounded (an_upper: G; upper_included_flag: BOOLEAN)
			-- make an interval from -infinity to `an_upper'
		do
			upper := an_upper
			lower_unbounded := True
			upper_included := upper_included_flag
		ensure
			Lower_unbounded: lower_unbounded
			Upper_set: upper = an_upper
			upper_included_set: upper_included = upper_included_flag
		end

	make_upper_unbounded (a_lower: G; lower_included_flag: BOOLEAN)
			-- make an interval from `a_lower' to +infinity
		do
			lower := a_lower
			upper_unbounded := True
			lower_included := lower_included_flag
		ensure
			Lower_set: lower = a_lower
			Upper_unbounded: upper_unbounded
			lower_included_set: lower_included = lower_included_flag
		end

	make_unbounded
			-- make an interval from -infinity to +infinity, usually
			-- only sensible as the result of two half-intervals
		do
			lower_unbounded := True
			upper_unbounded := True
		ensure
			Lower_unbounded: lower_unbounded
			Upper_unbounded: upper_unbounded
		end

	make (a_lower, an_upper: G; a_lower_unbounded, an_upper_unbounded, a_lower_included, an_upper_included: BOOLEAN)
			-- make from parts of another interval
		do
			lower := a_lower
			upper := an_upper
			lower_unbounded := a_lower_unbounded
			upper_unbounded := an_upper_unbounded
			lower_included := a_lower_included
			upper_included := an_upper_included
		ensure
			Lower_set: lower = a_lower
			Upper_set: upper = an_upper
			Lower_unbounded_set: lower_unbounded = a_lower_unbounded
			Upper_unbounded_set: upper_unbounded = an_upper_unbounded
			lower_included_set: lower_included = a_lower_included
			upper_included_set: upper_included = an_upper_included
		end

feature -- Access

	upper: detachable G
			-- upper limit of interval

	midpoint: detachable G
			-- generate midpoint of limits
		do

		end

feature -- Status report

	lower_unbounded: BOOLEAN
			-- True if lower limit open, i.e. -infinity

	upper_unbounded: BOOLEAN
			-- True if upper limit open, i.e. +infinity

	lower_included: BOOLEAN
			-- True if lower limit point included in interval

	upper_included: BOOLEAN
			-- True if upper limit point included in interval

	is_point: BOOLEAN
			-- Is current interval a point (width = 0)?
		do
			Result := not lower_unbounded and not upper_unbounded and
						(attached lower as l and then attached upper as u and then
						(lower_included and upper_included) and then l.is_equal (u))
--		ensure
--			Result = attached lower as l and then attached upper as u and then
--						(lower_included and upper_included) and then l.is_equal (u)
		end

	unbounded: BOOLEAN
			-- True if interval is completely open
		do
			Result := lower_unbounded and upper_unbounded
		end

feature -- Comparison

	has (v: G): BOOLEAN
			-- Does current interval have `v' between its bounds?
		do
			Result := ((not lower_unbounded and attached lower as l) implies (lower_included and v >= l or else v > l)) and
				((not upper_unbounded and attached upper as u) implies ((upper_included and v <= u or else v < u)))
		end

	intersects (other: like Current): BOOLEAN
			-- True if there is any overlap between intervals represented by Current and other
		do
			Result := unbounded or other.unbounded or
				(lower_unbounded and (other.lower_unbounded or
					(attached other.lower as other_l and then attached upper as u and then u >= other_l))) or
				(upper_unbounded and (other.upper_unbounded or
					(attached other.upper as other_u and then attached lower as l and then l <= other_u))) or
				((attached other.lower as other_l and then attached upper as u and then u >= other_l) or
					 (attached other.upper as other_u and then attached lower as l and then l <= other_u))
		end

	contains (other: like Current): BOOLEAN
			-- Does current interval properly contain `other'? True if at least one limit of other
			-- is stricly inside the limits of this interval
		do
			if other.lower_unbounded then
				if other.upper_unbounded then
					Result := lower_unbounded and upper_unbounded
				else
					Result := lower_unbounded and then attached other.upper as other_u and then attached upper as u and then other_u < u
				end
			elseif other.upper_unbounded then
				Result := upper_unbounded and then attached other.lower as other_l and then attached lower as l and then l < other_l
			elseif lower_unbounded then
				if upper_unbounded then
					Result := True
				else
					Result := attached other.upper as other_u and then attached upper as u and then other_u <= u
				end
			elseif upper_unbounded then
				Result := attached other.lower as other_l and then attached lower as l and then l <= other_l
			elseif attached other.lower as other_l and then attached lower as l and then
				attached other.upper as other_u and then attached upper as u
			then
				if l = other_l then
					Result := other_u < u
				elseif u = other_u then
					Result := l < other_l
				else
					Result :=  l < other_l and other_u < u
				end
			end
		end

feature -- Output

	as_string: STRING
		do
			create Result.make(0)
			if lower_unbounded and attached upper as u then
				if upper_included then
					Result.append("<=" + serialise_primitive_value (u))
				else
					Result.append("<" + serialise_primitive_value (u))
				end
			elseif upper_unbounded and attached lower as l then
				if lower_included then
					Result.append(">=" + serialise_primitive_value (l))
				else
					Result.append(">" + serialise_primitive_value (l))
				end
				elseif not is_point and attached lower as l and then attached upper as u then
				if lower_included and upper_included then
					Result.append(serialise_primitive_value (l) + ".." + serialise_primitive_value (u))
				elseif lower_included then
					Result.append(serialise_primitive_value (l) + "..<" + serialise_primitive_value (u))
				elseif upper_included then
					Result.append(">" + serialise_primitive_value (l) + ".." + serialise_primitive_value (u))
				else
					Result.append(">" + serialise_primitive_value (l) + "..<" + serialise_primitive_value (u))
				end
			elseif attached lower as l then
				Result.append (serialise_primitive_value (l))
			end
		end

end

