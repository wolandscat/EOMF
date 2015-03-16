note
	description: "Icon loader class"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_RESOURCES_COMPILED

inherit
	ICON_RESOURCES
		redefine
			can_lazy_load, lazy_load
		end

create
	make

feature -- Commands

	add_icons (icon_resources: APPLICATION_ICON_RESOURCES)
			-- merge generated `icon_resources'
		do
			load_icon_agents.merge (icon_resources.icon_load_agents)
		end

feature {NONE} -- Implementation

	can_lazy_load (key: STRING): BOOLEAN
			-- True if icon resource `key' can be lazy-loaded
		do
			Result := load_icon_agents.has (key)
		end

	lazy_load (key: STRING)
			-- load icon into main table
		do
			check attached load_icon_agents.item (key) as load_agt then
				icon_pixmaps.put (load_agt.item ([]), key)
			end
		end

	load_icon_agents: HASH_TABLE [FUNCTION [ANY, TUPLE, EV_PIXMAP], STRING]
			-- create pixmap table from pixmap classes
		once
			create Result.make (0)
		end

end
