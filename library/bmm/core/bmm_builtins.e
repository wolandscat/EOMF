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

	Default_any_package_path: IMMUTABLE_STRING_8
		once
			create Result.make_from_string ("org.openehr.base.foundation_types")
		end

	Default_any_package: BMM_PACKAGE
			-- a default package for Any if Any class not provided in Model
		once
			create Result.make_from_path (Default_any_package_path, "openEHR BASE component foundation_types package")
		end

	Any_class: BMM_SIMPLE_CLASS
			-- built-in class definition corresponding to the top `Any' class
		once
			create Result.make (Any_type_name, "Built-in Any class (root of type system)", True)
				Result.set_package (Default_any_package)
		end

	Any_type: BMM_SIMPLE_TYPE
			-- built-in type definition corresponding to the top `Any' class
		once
			create Result.make (Any_class)
		end

	None_class: BMM_SIMPLE_CLASS
			-- built-in class definition corresponding to the top `None' class
		once
			create Result.make (None_type_name, "Built-in None class (non-conforming type)", True)
		end

	None_type: BMM_SIMPLE_TYPE
			-- built-in type definition corresponding to the top `None' class
		once
			create Result.make (None_class)
		end

	String_type_name: STRING = "String"

	String_class: BMM_SIMPLE_CLASS
			-- built-in class definition corresponding to the `String' class
		once
			create Result.make (String_type_name, "Built-in String class", False)
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
			create Result.make (Integer_type_name, "Built-in Integer class", False)
		end

	Integer_type: BMM_SIMPLE_TYPE
			-- built-in class definition corresponding to the `Integer' class
		once
			create Result.make (Integer_class)
		end

	Boolean_type_name: STRING = "Boolean"

	Boolean_class: BMM_SIMPLE_CLASS
			-- built-in class definition corresponding to the `Boolean' class
		once
			create Result.make (Boolean_type_name, "Built-in Boolean class", False)
		end

	Boolean_type: BMM_SIMPLE_TYPE
			-- built-in class definition corresponding to the `Boolean' class
		once
			create Result.make (Boolean_class)
		end

end
