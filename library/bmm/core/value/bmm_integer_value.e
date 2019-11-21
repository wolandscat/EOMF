note
	component:   "Eiffel Object Modelling Framework"
	description: "Meta-type for an Integer value, for which type is fixed to the BMM_TYPE representing Integer."
	keywords:    "model, UML, BMM"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2019 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_INTEGER_VALUE

inherit
	BMM_LITERAL_VALUE
		redefine
			make, bmm_type, value, value_literal
		end

create
	make_value

feature -- Initialisation

	make (a_value_literal: like value_literal; a_bmm_type: like bmm_type)
			-- make with a literal value and a type representing the relevant type from the model
		do
			precursor (a_value_literal, a_bmm_type)
			if value_literal.is_integer then
				value := value_literal.to_integer
			end
		end

feature -- Access

	bmm_type: BMM_SIMPLE_TYPE
		attribute
			Result := Integer_type
		end

	value_literal: STRING
		attribute
			create {STRING} Result.make_from_string ("1")
		end

	value: INTEGER_32_REF
		attribute
			Result := 1
		end

end

