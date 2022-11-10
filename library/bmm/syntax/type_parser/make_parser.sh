# 
#	component:   "Eiffel Object Modelling Framework"
#	description: "BMM type name Parser builder script"
#	keywords:    "typename, parser"
#	author:      "Thomas Beale <thomas.beale@openehr.org>"
#	support:     "http://www.openehr.org/issues/browse/AWB"
#	copyright:   "Copyright (c) 2017- The openEHR Foundation <http://www.openEHR.org>"
#	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


geyacc --rescue-on-abort -v parser_errs.txt -t BMM_TYPE_NAME_TOKENS -o bmm_type_name_parser.e bmm_type_name_parser.y

geyacc --doc=html -v parser_errs.txt -t BMM_TYPE_NAME_TOKENS -o bmm_type_name_parser.html bmm_type_name_parser.y
