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
	EVX_CONTROL_SHELL
		export
			{NONE} all;
			{ANY} deep_twin, is_deep_equal, standard_is_equal
		end

create
	make

feature -- Initialisation

	make (an_active_pixmap, an_inactive_pixmap: detachable EV_PIXMAP; a_button_text, a_tooltip_text: detachable STRING;
			a_do_action, a_stop_action: detachable PROCEDURE [ANY, TUPLE])
		do
			active_pixmap := an_active_pixmap
			inactive_pixmap := an_inactive_pixmap
			do_action := a_do_action
			stop_action := a_stop_action

			create ev_button
			if attached a_button_text then
				ev_button.set_text (a_button_text)
			end
			if attached a_tooltip_text then
				ev_button.set_tooltip (a_tooltip_text)
			end
			ev_button.select_actions.extend (agent toggle)
			set_inactive
		end

feature -- Access

	ev_button: EV_BUTTON

	active_pixmap: detachable EV_PIXMAP

	inactive_pixmap: detachable EV_PIXMAP

	do_action: detachable PROCEDURE [ANY, TUPLE]
			-- action to perform some task

	stop_action: detachable PROCEDURE [ANY, TUPLE]
			-- action to stop some task

feature -- Status Report

	is_active: BOOLEAN

	is_displayed: BOOLEAN
		do
			Result := ev_button.is_displayed
		end

feature -- Commands

	clear
		do
		end

	populate
		do
		end

	enable_editable
			-- enable user editing, do nothing if `is_readonly'
		do
		end

	disable_editable
			-- disable user editing, do nothing if `is_readonly'
		do
		end

	hide
		do
		end

	show
		do
		end

feature {NONE} -- Implementation

	toggle
		do
			if not is_active then
				set_active
			else
				set_inactive
			end
		end

	set_active
		do
			is_active := True
			if attached active_pixmap as pm then
				ev_button.set_pixmap (pm)
			end
			if attached do_action as action then
				action.call ([])
			end
		end

	set_inactive
		do
			is_active := False
			if attached inactive_pixmap as pm then
				ev_button.set_pixmap (pm)
			end
			if attached stop_action as action then
				action.call ([])
			end
		end

end


