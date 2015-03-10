note
	component:   "Eiffel Object Modelling Framework"
	description: "Definitions used in XML serialisation"
	keywords:    "XML, archetype, serialisation, serialiser"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2003-2011 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class XML_DT_SERIALISATION_PROFILE

inherit
	XML_SERIALISATION_PROFILE

create
	make

feature {NONE} -- Implementation

	symbols: HASH_TABLE[STRING, INTEGER]
			-- keywords in this format, keyed by logical name
		once
			create Result.make(0)
		end

	tags: HASH_TABLE[STRING, INTEGER]
			-- keywords in this format, keyed by logical name
		once
			create Result.make(0)
		end

end


