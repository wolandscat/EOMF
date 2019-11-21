note
	component:   "Eiffel Object Modelling Framework"
	description: "Instance value. In an abstract syntax, represented by a literal value."
	keywords:    "model, UML, BMM"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2019 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_LITERAL_VALUE

inherit
	BMM_TYPED
		redefine
			bmm_type, out
		end

create
	make, make_value

feature -- Initialisation

	make (a_value_literal: like value_literal; a_bmm_type: like bmm_type)
			-- make with a literal value and a type representing the relevant type from the model
		do
			value_literal := a_value_literal
			bmm_type := a_bmm_type
		end

	make_value (a_value: like value)
			-- make with just a literal value; `type` is either default 'Any' or could be
			-- overridden in descendant
		do
			value := a_value
		end

feature -- Access

	bmm_type: BMM_ENTITY_TYPE
			-- Declared or inferred static type of the entity.
		attribute
			Result := Any_type
		end

	value_literal: STRING
		attribute
			create Result.make_from_string ("default")
		end

	value: ANY
		attribute
			create {STRING} Result.make_from_string ("default")
		end

feature -- Output

	out: STRING
		do
			Result := value_literal
		end

end


