-- 
-- 	component:   openEHR Archetype Project
-- 	description: test file for path facilities (OG_ classes)
-- 	keywords:    object graph, paths
--	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
--	support:     "http://www.openehr.org/issues/browse/AWB"
-- 	copyright:   Copyright (c) 2014- openEHR Foundation
--	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"
-- 

motor = <
	block = <"Aluminium 3.01l block">
	head = <"Allow cast head">
	exhaust_manifold_left = <
		gasket = <"EM gasket no 1">
		extractor = <"Extractor left-hand, 3 cyl">
	>
	exhaust_manifold_right = </motor/exhaust_manifold_left>
>
wheels = <
>
body = <
>
chassis = <
>
