note
	component:   "Eiffel Object Modelling Framework"
	description: "Meta-type of a tuple value, consisting of items of any type."
	keywords:    "model, expression, EL"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2019 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class EL_EXPRESSION

feature -- Access

	effective_type: BMM_TYPE
			-- execution-time type of this expression
		deferred
		end

	value: ANY
			-- computed value
		deferred
		end

end


