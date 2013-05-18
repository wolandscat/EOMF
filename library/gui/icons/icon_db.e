note
	component:   "Eiffel Object Modelling Framework"
	description: "Shared UI resources"
	keywords:    "icon access"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_DB

inherit
	EVX_DEFINITIONS
		export
			{NONE} all
		end

	EV_STOCK_PIXMAPS
		rename
			implementation as pixmaps_implementation
		export
			{NONE} all
		undefine
			copy, default_create
		end

feature -- Definitions

	icon_ico_extension: STRING = ".ico"

	icon_png_extension: STRING = ".png"

feature -- Access

	app_logo_icon: EV_PIXMAP
		do
			Result := get_icon_pixmap (application_name)
		end

	has_icon (key: STRING): BOOLEAN
			-- True if icon corresponding to `key' exists
		do
			Result := icon_pixmaps.has (key.as_lower)
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
			else
				post_error (generator, "get_icon_pixmap", "no_pixmap_found", <<key>>)
				create Result.default_create
			end
		end

feature {NONE} -- Implementation

	icon_pixmaps: attached HASH_TABLE [EV_PIXMAP, STRING]
			-- Table of pixmap file paths keyed by relative path, e.g.
			-- tool/compile.ico
			-- added/c_attribute.ico
			-- rm/openehr/entry.ico
		require
			has_icon_directory
		once
			create Result.make (0)
			recursive_load_pixmaps (Result, "")
		end

	recursive_load_pixmaps (pixmap_table: HASH_TABLE [EV_PIXMAP, STRING]; rel_path: STRING)
			-- load .png and .ico pixmaps into `pixmaps', keyed by relative path under icons root directory
		require
			has_icon_directory
		local
			pixmap: EV_PIXMAP
			abs_path, full_path, new_rel_path, key: STRING
			dir: DIRECTORY
			dir_items: ARRAYED_LIST [STRING_32]
		do
			abs_path := file_system.pathname (icon_directory, rel_path)
			create dir.make (abs_path)
			dir.open_read
			dir_items := dir.linear_representation_32

			-- process files
			across dir_items as dir_items_csr loop
				if dir_items_csr.item.item (1) /= '.' then
					full_path := file_system.pathname (abs_path, dir_items_csr.item)
					new_rel_path := file_system.pathname (rel_path, dir_items_csr.item)
					if file_system.directory_exists (full_path) then
						-- process child directory
						recursive_load_pixmaps (pixmap_table, new_rel_path)

					elseif full_path.ends_with (icon_ico_extension) or full_path.ends_with (icon_png_extension) then
						create pixmap
						pixmap.set_with_named_file (full_path)
						pixmap.set_minimum_size (pixmap.width, pixmap.height)
						key := new_rel_path.twin
						key.remove_tail (key.count - key.last_index_of ('.', key.count) + 1)
						key.to_lower
						key.replace_substring_all ("\", "/")
						pixmap_table.put (pixmap, key)
					end
				end
			end
		end

end


