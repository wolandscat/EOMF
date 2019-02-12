note
	component:   "Eiffel Object Modelling Framework"
	description: "Definition concepts for the basic meta-model"
	keywords:    "basic meta-model"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2009- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_BUILTINS

inherit
	BASIC_DEFINITIONS

feature -- Definitions

	Any_class: BMM_SIMPLE_CLASS
			-- built-in class definition corresponding to the top `Any' class
		once
			create Result.make (Any_type_name, "Built-in Any class (root of type system)", True)
		end

	Any_type: BMM_SIMPLE_TYPE
			-- built-in type definition corresponding to the top `Any' class
		once
			create Result.make (Any_class)
		end

	String_type_name: STRING = "String"

	String_class: BMM_SIMPLE_CLASS
			-- built-in class definition corresponding to the `String' class
		once
			create Result.make (String_type_name, "Built-in String class", True)
		end

	String_type: BMM_SIMPLE_TYPE
			-- built-in class definition corresponding to the  `String' class
		once
			create Result.make (String_class)
		end

	Integer_type_name: STRING = "Integer"

	Integer_class: BMM_SIMPLE_CLASS
			-- built-in class definition corresponding to the `Integer' class
		once
			create Result.make (Integer_type_name, "Built-in Integer class", True)
		end

	Integer_type: BMM_SIMPLE_TYPE
			-- built-in class definition corresponding to the  `Integer' class
		once
			create Result.make (Integer_class)
		end

end
