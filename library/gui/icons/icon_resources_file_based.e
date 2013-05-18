note
	component:   "Eiffel Object Modelling Framework"
	description: "Version of ICON_RESOURCES that reads ico and png files on startup from a specified directory"
	keywords:    "icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_RESOURCES_FILE_BASED

inherit
	ICON_RESOURCES
		redefine
			make
		end

	KL_SHARED_FILE_SYSTEM

create
	make

feature -- Definitions

	icon_ico_extension: STRING = ".ico"

	icon_png_extension: STRING = ".png"

feature {NONE} -- Initialisation

	make
		do
			precursor
			create icon_directory.make_empty
		end

feature -- Access

	icon_directory: STRING

feature -- Modification

	set_icon_directory (a_dir: STRING)
		require
			dir_exists: file_system.directory_exists (a_dir)
		do
			icon_directory := a_dir
			recursive_load_pixmaps (icon_pixmaps, "")
		end

feature {NONE} -- Implementation

	recursive_load_pixmaps (pixmap_table: HASH_TABLE [EV_PIXMAP, STRING]; rel_path: STRING)
			-- load .png and .ico pixmaps into `pixmaps', keyed by relative path under icons root directory
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


