note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Integer interval, used for representing cardinality, occurrences etc.
				 ]"
	keywords:    "intervals"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2000-2005 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class MULTIPLICITY_INTERVAL

inherit PROPER_INTERVAL [INTEGER]
	rename
		make_bounded as make_bounded_interval,
		make_upper_unbounded as make_upper_unbounded_interval
	redefine
		as_string
	end

create
	default_create,
	make_bounded,
	make_upper_unbounded,
	make_point,
	make_from_interval,
	make_open,
	make_mandatory,
	make_optional,
	make_prohibited,
	make_from_string

convert
	make_from_interval ({INTERVAL[INTEGER]})

feature -- Definitions

	Multiplicity_range_delimiter: STRING = ".."

	Multiplicity_unbounded_marker: CHARACTER = '*'

feature -- Initialisation

	make_bounded (a_lower, an_upper: INTEGER)
			-- make with both limits set
		require
			Valid_order: a_lower <= an_upper
		do
			make_bounded_interval (a_lower, an_upper, True, True)
		ensure
			Lower_set: lower = a_lower
			Upper_set: upper = an_upper
			Bounded_upper: not upper_unbounded
		end

	make_upper_unbounded (a_lower: INTEGER)
			-- make an interval from `a_lower' to +infinity
		do
			make_upper_unbounded_interval (a_lower, True)
		ensure
			Lower_set: lower = a_lower
			Upper_unbounded: upper_unbounded
		end

	make_from_interval (an_int: INTERVAL[INTEGER])
			-- make from a standard INTERVAL[INTEGER]
		do
			lower := an_int.lower
			upper := an_int.upper
			upper_included := an_int.upper_included
			upper_unbounded := an_int.upper_unbounded
			lower_included := True
		end

	make_open
			-- make an open interval from 0 to +infinity
		do
			make_upper_unbounded_interval (0, True)
		ensure
			Lower_set: lower = 0
			Upper_unbounded: upper_unbounded
			open: is_open
		end

	make_optional
			-- make an interval representing optionality, i.e. 0..1
		do
			make_bounded_interval (0, 1, True, True)
		ensure
			Lower_set: lower = 0
			Upper_set: upper = 1
			Upper_bounded: not upper_unbounded
			optional: is_optional
		end

	make_mandatory
			-- make an interval representing mandatoriness, i.e. 1..1
		do
			make_point (1)
		ensure
			Lower_set: lower = 1
			Upper_set: upper = 1
			Upper_bounded: not upper_unbounded
			mandatory: is_mandatory
		end

	make_prohibited
			-- make an interval representing prohibition, i.e. 0..0
		do
			make_point(0)
		ensure
			Lower_set: lower = 0
			Upper_set: upper = 0
			Upper_bounded: not upper_unbounded
			prohibited: is_prohibited
		end

	make_from_string (a_str: STRING)
			-- make from a string of the form "n..m" or just "n", where n and m are integers, or m may be '*'
		require
			valid_multiplicity_string: valid_multiplicity_string (a_str)
		local
			a_lower, an_upper, delim_pos: INTEGER
			a_mult_str: STRING
		do
			a_mult_str := a_str.twin

			-- remove any spaces
			a_mult_str.prune_all (' ')

			-- make the interval
			delim_pos := a_mult_str.substring_index (Multiplicity_range_delimiter, 1)
			-- n..m case
			if delim_pos > 0 then
				a_lower := a_mult_str.substring (1, delim_pos-1).to_integer
				if a_mult_str.item (a_mult_str.count) = Multiplicity_unbounded_marker then
					make_upper_unbounded (a_lower)
				else
					an_upper := a_mult_str.substring (a_mult_str.substring_index (Multiplicity_range_delimiter, 1) + Multiplicity_range_delimiter.count, a_mult_str.count).to_integer
					make_bounded (a_lower, an_upper)
				end
			-- * case
			elseif a_mult_str.item (1) = Multiplicity_unbounded_marker then
				make_upper_unbounded (0)
			-- m (single integer) case
			else
				a_lower := a_mult_str.to_integer
				make_bounded (a_lower, a_lower)
			end
		end

feature -- Status report

	is_open: BOOLEAN
			-- True if this interval imposes no constraints, i.e. is set to 0..*
		do
			Result := lower = 0 and upper_unbounded
		end

	is_optional: BOOLEAN
			-- True if this interval expresses optionality, i.e. 0..1
		do
			Result := lower = 0 and upper = 1
		end

	is_mandatory: BOOLEAN
			-- True if this interval expresses mandation, i.e. 1..1
		do
			Result := lower = 1 and upper = 1
		end

	is_prohibited: BOOLEAN
			-- True if this interval is set to 0..0
		do
			Result := lower = 0 and upper = 0 and not lower_unbounded and not upper_unbounded
		end

	valid_multiplicity_string (a_str: STRING): BOOLEAN
			-- check if string is in form "n..m; ordered; unique" where each subsection after a ';' is optional
		do
			-- for the moment, just assume
			Result := True
		end

feature -- Modification

	set_lower (a_lower: INTEGER)
			-- reset lower to `_lower'
		require
			Lower_valid: a_lower >= 0
		do
			lower := a_lower
			lower_unbounded := False
		end

feature -- Operations

	union (other: like Current)
			-- generate the outer interval of Current and other
		do
			if upper_unbounded or other.upper_unbounded then
				upper_unbounded := True
			else
				upper := upper.max(other.upper)
			end
			lower := lower.min(other.lower)
		end

	add (other: like Current)
			-- generate the interval resulting from sum(lower, other.lower)..sum(upper, other.upper)
		do
			if upper_unbounded or other.upper_unbounded then
				upper_unbounded := True
			else
				upper := upper + other.upper
			end
			lower := lower + other.lower
		end

feature -- Output

	as_string: STRING
		do
			create Result.make(0)
			if upper_unbounded then
				Result.append (serialise_primitive_value (lower) + Multiplicity_range_delimiter)
			elseif not is_point then
				Result.append (serialise_primitive_value (lower) + Multiplicity_range_delimiter + serialise_primitive_value (upper))
			else
				Result.append (serialise_primitive_value (lower))
			end
		end

invariant
	Lower_valid: lower >= 0
	Lower_bounded: not lower_unbounded
	Lower_included: lower_included

end



