note
	component:   "Eiffel Object Modelling Framework"
	description: "Container for icons for a project, keyed by logical path taken from original directory structure of icon files."
	keywords:    "icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class ICON_RESOURCES

inherit
	EV_STOCK_PIXMAPS
		export
			{NONE} all;
			{ANY} deep_twin, is_deep_equal, standard_is_equal;
		end

	EVX_MESSAGES_IDS
		export
			{NONE} all
		end

feature {NONE} -- Initialisation

	make
		do
			create errors.make
		end

feature -- Access

	has_icon_pixmap (key: STRING): BOOLEAN
			-- True if pixmap corresponding to `key' exists
		do
			Result := icon_pixmaps.has (key) or else can_lazy_load (key)
		end

	get_icon_pixmap (key: STRING): EV_PIXMAP
			-- obtain pixmap corresponding to `key' or else a generic pixmap
		local
			pixmap_name: STRING
		do
			pixmap_name := key.as_lower
			if icon_pixmaps.has (pixmap_name) then
				check attached icon_pixmaps.item (pixmap_name) as pxm then
					Result := pxm
				end
			elseif can_lazy_load (pixmap_name) then
				lazy_load (pixmap_name)
				check attached icon_pixmaps.item (pixmap_name) as pxm then
					Result := pxm
				end
			else
				errors.add_error (ec_no_pixmap_found, <<key>>, Void)
				create Result.default_create
			end
		end

	errors: ERROR_ACCUMULATOR

feature {NONE} -- Implementation

	icon_pixmaps: HASH_TABLE [EV_PIXMAP, STRING]
			-- Table of pixmap file paths keyed by relative path, e.g.
			-- tool/compile.ico
			-- added/c_attribute.ico
			-- rm/openehr/entry.ico
		once
			create Result.make (0)
		end

	can_lazy_load (key: STRING): BOOLEAN
			-- True if icon resource `key' can be lazy-loaded
		do
		end

	lazy_load (key: STRING)
			-- load resource with `key' into `icon_pixmaps'
		require
			can_lazy_load (key)
		do
		ensure
			icon_pixmaps.has (key)
		end

end

