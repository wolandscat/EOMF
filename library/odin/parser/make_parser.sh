# 
#	component:   "Eiffel Object Modelling Framework"
#	description: "ODIN Parser builder script"
#	keywords:    "ODIN, parser"
#	author:      "Thomas Beale"
#	support:     "Ocean Informatics <support@OceanInformatics.com>"
#	copyright:   "Copyright (c) 2000- The openEHR Foundation <http://www.openEHR.org>"
#	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"
#

geyacc --rescue-on-abort -v parser_errs.txt -t ODIN_TOKENS -o odin_parser.e odin_parser.y

geyacc --doc=html -v parser_errs.txt -t ODIN_TOKENS -o odin_parser.html odin_parser.y
