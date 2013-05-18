note
	component:   "Eiffel Object Modelling Framework"
	description: "In-memory error database helper class"
	keywords:    "error status reporting"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2005- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class IN_MEMORY_MESSAGE_DB_INITIALISER

feature -- Access

	templates: detachable HASH_TABLE [HASH_TABLE [STRING, STRING], STRING]
			-- temporary copy of templates tables

end



