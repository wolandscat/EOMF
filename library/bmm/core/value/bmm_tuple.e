note
	component:   "Eiffel Object Modelling Framework"
	description: "Meta-type of a tuple value, consisting of items of any type."
	keywords:    "model, BMM"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2019 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_TUPLE

inherit
	BMM_VALUE

feature -- Access

	items: LIST[BMM_TUPLE_ITEM]
			-- members of the tuple

	value: ANY
		do
			create {STRING} Result.make_from_string ("default")
		end

end


