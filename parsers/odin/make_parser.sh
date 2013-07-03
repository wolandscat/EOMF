# 
#	component:   "Eiffel Object Modelling Framework"
#	description: "ODIN Parser builder script"
#	keywords:    "ODIN, parser"
#	author:      "Thomas Beale"
#	support:     "Ocean Informatics <support@OceanInformatics.com>"
#	copyright:   "Copyright (c) 2000- The openEHR Foundation <http://www.openEHR.org>"
#	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"
#

geyacc --new_typing -v parser_errs.txt -t ODIN_TOKENS -o odin_validator.e odin_validator.y

geyacc --doc=html -v parser_errs.txt -t ODIN_TOKENS -o odin_validator.html odin_validator.y
