note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Tool bar button with active/inactive setting.
				 ]"
	keywords:    "UI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class EVX_TOOL_BAR_BUTTON

inherit
	EVX_DEFINITIONS
		export
			{NONE} all;
			{ANY} standard_is_equal, is_deep_equal, deep_copy, deep_twin
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
			if attached a_tooltip_text as tt_text then
				ev_button.set_tooltip (tt_text)
			end
			is_active := True
			disable_active
		end

feature -- Access

	ev_button: EV_TOOL_BAR_BUTTON

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
				if attached active_pixmap as pm then
					ev_button.set_pixmap (pm)
				end
				if attached select_action as action then
					ev_button.select_actions.extend (action)
				end
			end
		end

	disable_active
			-- set inactive pixmap and uninstall `select_action'
		do
			if is_active then
				is_active := False
				if attached inactive_pixmap as pm then
					ev_button.set_pixmap (pm)
				end
				ev_button.select_actions.wipe_out
			end
		end

feature {NONE} -- Implementation


end


