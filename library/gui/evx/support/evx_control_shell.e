note
	component:   "Eiffel Object Modelling Framework"
	description: "Basics needed by any control."
	keywords:    "UI"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class EVX_CONTROL_SHELL

inherit
	EVX_DEFINITIONS
		export
			{NONE} all;
			{ANY} deep_twin, is_deep_equal, standard_is_equal
		end

	EVX_UTILITIES
		export
			{NONE} all
		end

feature -- Status Report

	is_displayed: BOOLEAN
		deferred
		end

feature -- Commands

	clear
			-- Wipe out content.
		deferred
		end

	populate
		deferred
		end

	refresh
			-- populate if not already populated
		do
		end

	enable_editable
			-- enable user editing, do nothing if `is_readonly'
		deferred
		end

	disable_editable
			-- disable user editing, do nothing if `is_readonly'
		deferred
		end

	hide
		deferred
		end

	show
		deferred
		end

end


