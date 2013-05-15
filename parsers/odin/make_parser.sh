# 
#	component:   "Deep Thought Reusable Libraries"
#	description: "ODIN Parser builder script"
#	keywords:    "ODIN, parser"
#	author:      "Thomas Beale"
#	support:     "Ocean Informatics <support@OceanInformatics.com>"
#	copyright:   "Copyright (c) 2000- The openEHR Foundation <http://www.openEHR.org>"
#	license:     "See notice at bottom of class"
#

geyacc --new_typing -v parser_errs.txt -t DADL_TOKENS -o odin_validator.e odin_validator.y

geyacc --doc=html -v parser_errs.txt -t DADL_TOKENS -o odin_validator.html odin_validator.y
