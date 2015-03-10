note
	component:   "Eiffel Object Modelling Framework"
	description: "OWL syntax definitions"
	keywords:    "serialisation, OWL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class OWL_DEFINITIONS

feature -- Access

	SYM_ANNOTATION: INTEGER = 501
	SYM_ONTOLOGY: INTEGER = 502
	SYM_NAMESPACE: INTEGER = 503
	SYM_CLASS: INTEGER = 504
	SYM_OBJECT_PROPERTY: INTEGER = 505
	SYM_DATA_PROPERTY: INTEGER = 506
	SYM_COMPLETE: INTEGER = 507
	SYM_PARTIAL: INTEGER = 508
	SYM_RESTRICTION: INTEGER = 509
	SYM_INTERSECTION_OF: INTEGER = 510
	SYM_SOME_VALUES_FROM: INTEGER = 511
	SYM_ALL_VALUES_FROM: INTEGER = 512
	SYM_UNION_OF: INTEGER = 513
	
	SYM_CARDINALITY: INTEGER = 514
	SYM_MIN_CARDINALITY: INTEGER = 515
	SYM_MAX_CARDINALITY: INTEGER = 516
	
	SYM_OPEN_PAREN: INTEGER = 517
	SYM_CLOSE_PAREN: INTEGER = 518
		
end


