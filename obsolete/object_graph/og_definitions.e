note
	component:   "Eiffel Object Modelling Framework"
	description: "Definitions for OG_ classes."
	keywords:    "dADL, object graph"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class OG_DEFINITIONS

feature -- Definitions

	Anonymous_node_id: STRING = "unknown"
			-- default node id for non-identified object nodes

	movable_leader: STRING = "//"

	segment_separator: CHARACTER = '/'

	feature_call_separator: CHARACTER = '/'

end


