note
	component:   "Eiffel Object Modelling Framework"
	description: "EV_BUTTON with active/inactive setting."
	keywords:    "UI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class EVX_BUTTON

inherit
	EVX_DEFINITIONS
		export
			{NONE} all
		end

	EVX_UTILITIES
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make (an_active_pixmap, an_inactive_pixmap: detachable EV_PIXMAP; a_tooltip_text: detachable STRING; a_select_action: detachable PROCEDURE [ANY, TUPLE])
		do
			active_pixmap := an_active_pixmap
			inactive_pixmap := an_inactive_pixmap
			select_action := a_select_action

			create ev_button
			if attached a_tooltip_text then
				ev_button.set_tooltip (a_tooltip_text)
			end
			is_active := True
			disable_active
		end

feature -- Access

	ev_button: EV_BUTTON

	active_pixmap: detachable EV_PIXMAP

	inactive_pixmap: detachable EV_PIXMAP

	select_action: detachable PROCEDURE [ANY, TUPLE]

feature -- Status Report

	is_active: BOOLEAN

feature -- Commands

	enable_active
			-- set active pixmap and install `select_action'
		do
			if not is_active then
				is_active := True
				if attached active_pixmap then
					ev_button.set_pixmap (active_pixmap)
				end
				if attached select_action then
					ev_button.select_actions.extend (select_action)
				end
			end
		end

	disable_active
			-- set inactive pixmap and uninstall `select_action'
		do
			if is_active then
				is_active := False
				if attached inactive_pixmap then
					ev_button.set_pixmap (inactive_pixmap)
				end
				ev_button.select_actions.wipe_out
			end
		end

feature {NONE} -- Implementation


end


