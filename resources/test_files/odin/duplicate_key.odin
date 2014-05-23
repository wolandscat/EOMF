-- 
-- 	component:   Eiffel Object Modelling Framework
-- 	description: Test file containing duplicate key
-- 	author:      Thomas Beale
-- 	copyright:   Copyright (c) 2014 Thomas Beale
-- 	license:     Apache 2.0
-- 

primitive_types = <
	["Any"] = <
		name = <"Any">
		is_abstract = <True>
	>
	["Ordered"] = <
		name = <"Ordered">
		is_abstract = <True>
		ancestors = </primitive_types["Any"], ...>
	>
	["Numeric"] = <
		name = <"Numeric">
		is_abstract = <True>
		ancestors = </primitive_types["Any"], ...>
	>
	["Ordered_Numeric"] = <
		name = <"Ordered_Numeric">
		is_abstract = <True>
		ancestors = </primitive_types["Numeric"], /primitive_types["Ordered"]>
	>
	["Octet"] = <
		name = <"Octet">
		ancestors = </primitive_types["Any"], ...>
	>
	["Boolean"] = <
		name = <"Boolean">
		ancestors = </primitive_types["Any"], ...>
	>
	["Boolean"] = <
		name = <"Integer">
		ancestors = </primitive_types["Ordered_Numeric"], ...>
	>
	["Real"] = <
		name = <"Real">
		ancestors = </primitive_types["Ordered_Numeric"], ...>
	>
	["Double"] = <
		name = <"Double">
		ancestors = </primitive_types["Ordered_Numeric"], ...>
	>
	["Character"] = <
		name = <"Character">
		ancestors = </primitive_types["Any"], ...>
	>
>

