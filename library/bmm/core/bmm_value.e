note
	component:   "Eiffel Object Modelling Framework"
	description: "Instance value. In an abstract syntax, represented by a literal value."
	keywords:    "model, UML, BMM"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2019 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_VALUE

inherit
	BMM_VALUE_RETURNING
		export
			{ANY} out
		redefine
			out
		end

create
	make, make_value

feature -- Initialisation

	make (a_value: like value; a_bmm_type: like bmm_type)
			-- make with a value and a type representing the relevant type from the model
		do
			value := a_value
			bmm_type := a_bmm_type
		end

	make_value (a_value: like value)
			-- make with just a value; `type` is either default 'Any' or could be
			-- overridden in descendant
		do
			value := a_value
		end

feature -- Access

	value: ANY
		attribute
			create {STRING} Result.make_from_string ("default")
		end

feature -- Output

	out: STRING
		do
			Result := value.out
		end

end


