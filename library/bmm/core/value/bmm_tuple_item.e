note
	component:   "Eiffel Object Modelling Framework"
	description: "Meta-type of a tuple value item."
	keywords:    "model, BMM"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2019 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_TUPLE_ITEM

feature -- Access

	name: STRING
			-- name of the item
		attribute
			create Result.make_empty
		end

	item: BMM_VALUE
			-- item referred to by the tuple element

end


