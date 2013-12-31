note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Abstract generic class defining an interval (i.e. range) of a comparable type, allowing half-ranges, i.e. with
				 -infinity as lower limit or +infinity as upper limit.
				 FIXME: should really be defined as INTERVAL[COMPARABLE] but DATE_TIME_DURATION (one of the types occurring
				 as a generic parameter of this type) is strangely only PART_COMPARABLE.
				 ]"
	keywords:    "intervals"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2000- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class INTERVAL [G -> PART_COMPARABLE]

inherit
	ANY
		redefine
			out, is_equal
		end

feature -- Access

	lower: detachable G
			-- lower limit of interval

	upper: detachable G
			-- upper limit of interval
		deferred
		end

	midpoint: detachable G
			-- generate midpoint of limits
		deferred
		end

feature -- Status report

	lower_unbounded: BOOLEAN
			-- True if lower limit open, i.e. -infinity
		deferred
		end

	upper_unbounded: BOOLEAN
			-- True if upper limit open, i.e. +infinity
		deferred
		end

	lower_included: BOOLEAN
			-- True if lower limit point included in interval
		deferred
		end

	upper_included: BOOLEAN
			-- True if upper limit point included in interval
		deferred
		end

	is_point: BOOLEAN
			-- Is current interval a point (width = 0)?
		deferred
		end

	unbounded: BOOLEAN
			-- True if interval is completely open
		deferred
		end

feature -- Comparison

	has (v: G): BOOLEAN
			-- Does current interval have `v' between its bounds?
		deferred
		end

	intersects (other: like Current): BOOLEAN
			-- True if there is any overlap between intervals represented by Current and other
		deferred
		end

	contains (other: like Current): BOOLEAN
			-- Does current interval properly contain `other'? True if at least one limit of other
			-- is stricly inside the limits of this interval
		deferred
		end

feature -- Comparison

	is_equal  (other: like Current): BOOLEAN
			-- True if current object's interval is semantically same as `other'
			-- even if the concrete types are different
		do
			Result := lower ~ other.lower and
				upper ~ other.upper and
				upper_included = other.upper_included and
				upper_unbounded = other.upper_unbounded and
				lower_included = other.lower_included and
				lower_unbounded = other.lower_unbounded
		end

feature -- Output

	as_string: STRING
		deferred
		end

	out: STRING
		do
			Result := as_string
		end

invariant
	lower_attached_if_bounded: not lower_unbounded implies attached lower
	upper_attached_if_bounded: not upper_unbounded implies attached upper
	limits_consistent: attached lower as l and then attached upper as u implies l <= u

end



