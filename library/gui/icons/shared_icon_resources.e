note
	component:   "Eiffel Object Modelling Framework"
	description: "Shared access to icon resources"
	keywords:    "icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SHARED_ICON_RESOURCES

feature -- Access

	get_icon_pixmap (key: STRING): EV_PIXMAP
			-- obtain pixmap corresponding to `key' or else a generic pixmap
		do
			Result := icon_resources.item.get_icon_pixmap (key)
		end

feature -- Status Report

	has_icon_pixmap (key: STRING): BOOLEAN
			-- True if pixmap corresponding to `key' exists
		do
			Result := icon_resources.item.has_icon_pixmap (key.as_lower)
		end

feature -- Shared Objects

	icon_resources: CELL[ICON_RESOURCES]
		once ("PROCESS")
			create Result.put (create {ICON_RESOURCES_COMPILED}.make)
		end

end


