# 
#	component:   "Eiffel Object Modelling Framework"
#	description: "ODIN Parser builder script"
#	keywords:    "ODIN, fast, non-validating, parser"
#	author:      "Thomas Beale"
#	support:     "Ocean Informatics <support@OceanInformatics.com>"
#	copyright:   "Copyright (c) 2014- The openEHR Foundation <http://www.openEHR.org>"
#	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"
#

geyacc --new_typing  --rescue-on-abort -v parser_errs.txt -t FAST_ODIN_TOKENS -o fast_odin_parser.e fast_odin_parser.y

geyacc --doc=html -v parser_errs.txt -t FAST_ODIN_TOKENS -o fast_odin_parser.html fast_odin_parser.y
