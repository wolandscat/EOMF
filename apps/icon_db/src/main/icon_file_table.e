note
	component:   "Eiffel Object Modelling Framework"
	description: "Load all icons files in a directory and put them in a Hash table keyed by path"
	keywords:    "embedded icons, pixmaps, class generation"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_FILE_TABLE

inherit
	KL_SHARED_FILE_SYSTEM

create
	make

feature -- Definitions

	icon_ico_extension: STRING = ".ico"

	icon_png_extension: STRING = ".png"

feature -- Initialisation

	make (an_icon_dir: STRING; verbose_mode_flag: BOOLEAN)
			-- make with a directory under which icons can be found
		require
			file_system.directory_exists (an_icon_dir)
		do
			icon_directory := an_icon_dir
			verbose_mode := verbose_mode_flag
			create icon_pixmaps.make (0)
			recursive_load_pixmaps (icon_pixmaps, "")
		end

feature -- Access

	icon_directory: STRING

	icon_pixmaps: HASH_TABLE [EV_PIXEL_BUFFER, STRING]
			-- Table of pixmap file paths keyed by relative path, e.g.
			-- tool/save
			-- tool/edit
			-- rm/openehr/entry

feature -- Status Report

	verbose_mode: BOOLEAN

feature {NONE} -- Implementation

	recursive_load_pixmaps (pixmap_table: HASH_TABLE [EV_PIXEL_BUFFER, STRING]; rel_path: STRING)
			-- load .png and .ico pixmaps into `pixmaps', keyed by relative path under icons root directory
		local
			pixmap: EV_PIXEL_BUFFER
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
				--		pixmap.set_minimum_size (pixmap.width, pixmap.height)
						key := new_rel_path.twin
						key.remove_tail (key.count - key.last_index_of ('.', key.count) + 1)
						key.to_lower
						key.replace_substring_all ("\", "/")
						pixmap_table.put (pixmap, key)
						if verbose_mode then
							io.put_string ("loaded " + key + "%N")
						end
					end
				end
			end
		end

end


