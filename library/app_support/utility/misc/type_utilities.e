note
	component:   "Eiffel Object Modelling Framework"
	description: "Type conversion routines to help Eiffel's type system"
	keywords:    "type conversion"

	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class TYPE_UTILITIES

feature -- Conversion

	interval_integer_to_interval_integer_ref(a_ivl_integer: INTERVAL[INTEGER]): INTERVAL [INTEGER_REF]
			-- convert INTERVAL[INTEGER] -> INTERVAL[INTEGER_REF]
		require
			Ivl_validity: a_ivl_integer /= Void
		local
			a_lower, an_upper: INTEGER_REF
		do
			if a_ivl_integer.lower_unbounded then
				create an_upper
				an_upper.set_item(a_ivl_integer.upper)
				create Result.make_lower_unbounded(an_upper, a_ivl_integer.upper_included)
			elseif a_ivl_integer.upper_unbounded then
				create a_lower
				a_lower.set_item(a_ivl_integer.lower)
				create Result.make_upper_unbounded(a_lower, a_ivl_integer.lower_included)
			else
				create a_lower
				a_lower.set_item(a_ivl_integer.lower)
				create an_upper
				an_upper.set_item(a_ivl_integer.upper)
				create Result.make_bounded(a_lower, an_upper, a_ivl_integer.lower_included, a_ivl_integer.upper_included)
			end
		end

	interval_real_to_interval_real_ref(a_ivl_real: INTERVAL[REAL]): INTERVAL [REAL_REF]
			-- convert INTERVAL[REAL] -> INTERVAL[REAL_REF]
		require
			Ivl_validity: a_ivl_real /= Void
		local
			a_lower, an_upper: REAL_REF
		do
			if a_ivl_real.lower_unbounded then
				create an_upper
				an_upper.set_item(a_ivl_real.upper)
				create Result.make_lower_unbounded(an_upper, a_ivl_real.upper_included)
			elseif a_ivl_real.upper_unbounded then
				create a_lower
				a_lower.set_item(a_ivl_real.lower)
				create Result.make_upper_unbounded(a_lower, a_ivl_real.lower_included)
			else
				create a_lower
				a_lower.set_item(a_ivl_real.lower)
				create an_upper
				an_upper.set_item(a_ivl_real.upper)
				create Result.make_bounded(a_lower, an_upper, a_ivl_real.lower_included, a_ivl_real.upper_included)
			end
		end

	interval_integer_ref_to_interval_integer(a_ivl_integer_ref: INTERVAL[INTEGER_REF]): INTERVAL [INTEGER]
			-- convert INTERVAL[INTEGER_REF] -> INTERVAL[INTEGER]
		require
			Ivl_validity: a_ivl_integer_ref /= Void
		do
			if a_ivl_integer_ref.lower_unbounded then
				create Result.make_lower_unbounded(a_ivl_integer_ref.upper.item, a_ivl_integer_ref.upper_included)
			elseif a_ivl_integer_ref.upper_unbounded then
				create Result.make_upper_unbounded(a_ivl_integer_ref.lower.item, a_ivl_integer_ref.lower_included)
			else
				create Result.make_bounded(a_ivl_integer_ref.lower.item, a_ivl_integer_ref.upper.item,
						a_ivl_integer_ref.lower_included, a_ivl_integer_ref.upper_included)
			end
		end

	interval_real_ref_to_interval_real(a_ivl_real_ref: INTERVAL[REAL_REF]): INTERVAL [REAL]
			-- convert INTERVAL[REAL_REF] -> INTERVAL[REAL]
		require
			Ivl_validity: a_ivl_real_ref /= Void
		do
			if a_ivl_real_ref.lower_unbounded then
				create Result.make_lower_unbounded(a_ivl_real_ref.upper.item, a_ivl_real_ref.upper_included)
			elseif a_ivl_real_ref.upper_unbounded then
				create Result.make_upper_unbounded(a_ivl_real_ref.lower.item, a_ivl_real_ref.lower_included)
			else
				create Result.make_bounded(a_ivl_real_ref.lower.item, a_ivl_real_ref.upper.item,
					a_ivl_real_ref.lower_included, a_ivl_real_ref.upper_included)
			end
		end

	interval_double_ref_to_interval_double(a_ivl_ref: INTERVAL[DOUBLE_REF]): INTERVAL [DOUBLE]
			-- convert INTERVAL[DOUBLE_REF] -> INTERVAL[DOUBLE]
		require
			Ivl_validity: a_ivl_ref /= Void
		do
			if a_ivl_ref.lower_unbounded then
				create Result.make_lower_unbounded(a_ivl_ref.upper.item, a_ivl_ref.upper_included)
			elseif a_ivl_ref.upper_unbounded then
				create Result.make_upper_unbounded(a_ivl_ref.lower.item, a_ivl_ref.lower_included)
			else
				create Result.make_bounded(a_ivl_ref.lower.item, a_ivl_ref.upper.item,
					a_ivl_ref.lower_included, a_ivl_ref.upper_included)
			end
		end

end

