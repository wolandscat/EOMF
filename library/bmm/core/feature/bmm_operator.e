note
	component:   "Eiffel Object Modelling Framework"
	description: "Meta-type representing an operator."
	keywords:    "model, BMM"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2019- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_OPERATOR

creation
	make

feature -- Initialisation

	make
		do
			create name.make ("umknown")
			create {ARRAYED_LIST[STRING]} symbols.make(0)
		end

feature -- Access

	name: STRING
			-- Name of the operator, e.g. "addition"

	symbols: LIST[STRING]
			-- Symbol(s) used to represent this operator, e.g. "+" for addition etc

	position: BMM_OPERATOR_POSITION
			-- position infix or prefix

end


