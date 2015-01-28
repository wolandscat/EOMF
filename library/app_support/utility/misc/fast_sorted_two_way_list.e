note
	component:   "Eiffel Object Modelling Framework"
      description: "[
			 Version of SORTED_TWO_WAY_LIST[G] with faster searching,
		  	 based on the idea that the next search request will usually be for
			 an item just after the last.
			 ]"
	keywords:    "type conversion"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


class FAST_SORTED_TWO_WAY_LIST[G -> COMPARABLE ]

inherit
	SORTED_TWO_WAY_LIST[G]
	    redefine
	    	search_after, search_before
	    end

create
	make

create {TWO_WAY_LIST}
	make_sublist

feature -- Access

	search_after (v: like item)
			-- Go to first item that is
			-- greater than or equal to `v'!
		do
			if off then
				from start until after or else v <= item loop
					forth
				end
			else
				-- Search backwards.
				-- Cursor may end up before the target position
				-- or even `before'.
				from until before or else v > item loop
					back
				end
				-- Search forwards.
				if before then start end
				from until after or else v <= item loop
					forth
				end
			end
		end

	search_before (v: like item)
			-- Go to first position with item less than or
			-- equal to `v', using the binary split method.
		local
			i,j,k: INTEGER
			found: BOOLEAN
		do
			from
				start
				i := 0
				j := count
			until
				i + 1 > j or found
			loop
				k := (i + j)//2
				go_i_th (k)
				if v > item then
					i := k
				elseif v < item then
					j := k - 1
					go_i_th (j)
				else
					found := True
				end
			end
		end

end
