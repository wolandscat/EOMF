note
	component:   "Eiffel Object Modelling Framework"
	description: "Short (8-dot-3) MS-DOS style paths on Windows."
	keywords:    "path, Windows"
	author:      "Peter Gummer <peter.gummer@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2007 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	WINDOWS_SHORT_PATH

inherit
	C_STRING
		rename
			string as as_long_path
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal, as_long_path
		redefine
			make
		end

create
	make

feature {NONE} -- Initialisation

	make (path: STRING)
			-- If `path' is in Windows short 8.3 format, convert it to a normal long path.
		do
			make_empty (2000)
			set_string (path)
			get_long_path_name (item, capacity)
		end

feature {NONE} -- Externals

	get_long_path_name (path: POINTER; n: INTEGER)
			-- Convert `path' to a normal long path.
		external
			"C inline use <windows.h>"
		alias
			"GetLongPathNameA ((LPCSTR) $path, (LPSTR) $path, (DWORD) $n)"
		end

end

