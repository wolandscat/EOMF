note
	component:   "Eiffel Object Modelling Framework"
	description: "Test *_INTERVAL classes"
	keywords:    "test, interval"
	author:      "Thomas Beale <wolandscat@gmail.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2016- Thomas Beale <http://wolandscat.net>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"
	testing:     "type/manual"

class
	TEST_INTERVAL

inherit
	TEST_UTILITIES

feature -- Test routines

	test_has
		note
			testing: "covers/{PROPER_INTERVAL}.intersects"
		local
			ivl_a: PROPER_INTERVAL [INTEGER]
		do
			create ivl_a.make_bounded_included (1, 3)
			assert ("IVL |1..3| NOT has (0)", not ivl_a.has (0))
			assert ("IVL |1..3| has (1)", ivl_a.has (1))
			assert ("IVL |1..3| has (2)", ivl_a.has (2))
			assert ("IVL |1..3| has (3)", ivl_a.has (3))
			assert ("IVL |1..3| NOT has (4)", not ivl_a.has (4))

			create ivl_a.make_bounded (1, 3, True, False)
			assert ("IVL |1..3| NOT has (0)", not ivl_a.has (0))
			assert ("IVL |1..3| has (1)", ivl_a.has (1))
			assert ("IVL |1..3| has (2)", ivl_a.has (2))
			assert ("IVL |1..3| NOT has (3)", not ivl_a.has (3))
			assert ("IVL |1..3| NOT has (4)", not ivl_a.has (4))

			create ivl_a.make_bounded (1, 3, False, True)
			assert ("IVL |1..3| NOT has (0)", not ivl_a.has (0))
			assert ("IVL |1..3| NOT has (1)", not ivl_a.has (1))
			assert ("IVL |1..3| has (2)", ivl_a.has (2))
			assert ("IVL |1..3| has (3)", ivl_a.has (3))
			assert ("IVL |1..3| NOT has (4)", not ivl_a.has (4))

			-- more tests required
		end

	test_intersects
		note
			testing: "covers/{PROPER_INTERVAL}.intersects"
		local
			ivl_a, ivl_b: PROPER_INTERVAL [INTEGER]
		do
			-- bounded included intervals
			create ivl_a.make_bounded_included (1, 2)
			create ivl_b.make_bounded_included (3, 4)
			assert ("IVL |1..2| NOT intersects IVL |3..4|", not ivl_a.intersects (ivl_b))

			create ivl_a.make_bounded_included (1, 2)
			create ivl_b.make_bounded_included (2, 4)
			assert ("IVL |1..2| intersects IVL |2..4|", ivl_a.intersects (ivl_b))

			create ivl_a.make_bounded_included (1, 3)
			create ivl_b.make_bounded_included (2, 4)
			assert ("IVL |1..3| intersects IVL |2..4|", ivl_a.intersects (ivl_b))

			create ivl_a.make_bounded_included (1, 3)
			create ivl_b.make_bounded_included (3, 4)
			assert ("IVL |1..3| intersects IVL |3..4|", ivl_a.intersects (ivl_b))

			create ivl_a.make_bounded_included (3, 7)
			create ivl_b.make_bounded_included (8, 10)
			assert ("IVL |3..7| NOT intersects IVL |8..10|", not ivl_a.intersects (ivl_b))

			-- bounded intervals with a limit not included
			create ivl_a.make_bounded (1, 2, True, False)
			create ivl_b.make_bounded_included (3, 4)
			assert ("IVL |1..2| NOT intersects IVL |3..4|", not ivl_a.intersects (ivl_b))

			create ivl_a.make_bounded (1, 2, True, False)
			create ivl_b.make_bounded_included (2, 4)
			assert ("IVL |1..<2| NOT intersects IVL |2..4|", not ivl_a.intersects (ivl_b))

			create ivl_a.make_bounded_included (1, 2)
			create ivl_b.make_bounded (2, 4, False, True)
			assert ("IVL |1..2| NOT intersects IVL |>2..4|", not ivl_a.intersects (ivl_b))

			-- more tests required
		end

	test_contains
		note
			testing: "covers/{PROPER_INTERVAL}.contains"
		local
			ivl_a, ivl_b: PROPER_INTERVAL [INTEGER]
		do
			-- bounded included intervals
			create ivl_a.make_bounded_included (1, 2)
			create ivl_b.make_bounded_included (3, 4)
			assert ("IVL |1..2| NOT contains IVL |3..4|", not ivl_a.contains (ivl_b))

			create ivl_a.make_bounded_included (1, 2)
			create ivl_b.make_bounded_included (2, 4)
			assert ("IVL |1..2| NOT contains IVL |2..4|", not ivl_a.contains (ivl_b))

			create ivl_a.make_bounded_included (1, 3)
			create ivl_b.make_bounded_included (2, 3)
			assert ("IVL |1..3| contains IVL |2..3|", ivl_a.contains (ivl_b))

			create ivl_a.make_bounded (1, 3, True, False)
			create ivl_b.make_bounded_included (2, 3)
			assert ("IVL |1..<3| NOT contains IVL |2..3|", not ivl_a.contains (ivl_b))

			create ivl_a.make_bounded_included (3, 10)
			create ivl_b.make_bounded_included (8, 9)
			assert ("IVL |3..10| contains IVL |8..9|", ivl_a.contains (ivl_b))

			-- more tests required
		end

end


