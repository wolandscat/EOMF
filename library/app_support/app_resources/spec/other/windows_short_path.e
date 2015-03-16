note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Short (8-dot-3) MS-DOS style paths on Windows.
				 Stub implementation for non-Windows platforms, which do not have the 8.3 short path problem.
				 ]"
	keywords:    "path, Windows"

	author:      "Peter Gummer"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2007 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class
	WINDOWS_SHORT_PATH

create
	make

feature {NONE} -- Initialisation

	make (path: STRING)
			-- Stub implementation: simply set `as_long_path'.
		require
			not_void: path /= Void
		do
			as_long_path := path
		end

feature -- Access

	as_long_path: STRING
			-- The path that was passed to `make'.

invariant
	as_long_path_attached: as_long_path /= Void

end

