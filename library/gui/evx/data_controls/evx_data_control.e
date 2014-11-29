note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 General model of a primitive data control, consisting of a data source, a visual control, a title,
				 routines for populate, clear, and agents for editing.
				 ]"
	keywords:    "UI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class EVX_DATA_CONTROL

inherit
	EVX_CONTROL_SHELL

feature -- Access

	ev_data_control: EV_PRIMITIVE
		deferred
		end

	data_source_agent: FUNCTION [ANY, TUPLE, detachable ANY]
			-- specialise in descendants

	data_source_setter_agent: detachable PROCEDURE [ANY, TUPLE [ANY]]
			-- agent for creating & setting the data source

	data_source_remove_agent: detachable PROCEDURE [ANY, TUPLE]
			-- agent for removing an the data source when it becomes empty,
			-- in the case where it is a detachable attribute
			-- of its owning class.

	undo_redo_chain: detachable UNDO_REDO_CHAIN
			-- reference to undo/redo chain from owning visual context

feature -- Status Report

	is_displayed: BOOLEAN
		do
			Result := ev_data_control.is_displayed
		end

	is_readonly: BOOLEAN
			-- True if user interaction of this control is not allowed

	is_editable: BOOLEAN
			-- True if `ev_data_control' enabled for user interaction

	is_show_requested: BOOLEAN
			-- True if `ev_data_control' shown
		do
			Result := ev_data_control.is_show_requested
		end

feature -- Modification

	add_linked_control (a_control: EVX_TITLED_DATA_CONTROL)
			-- add a control that is to be repopulated if this control is selected in some way
		do
			if not attached linked_data_controls then
				create linked_data_controls.make(0)
			end
			linked_data_controls.extend (a_control)
		end

feature -- Commands

	enable_editable
			-- enable user editing, do nothing if `is_readonly'
		do
			if not is_readonly then
				do_enable_editable
				is_editable := True
			end
		end

	disable_editable
			-- disable user editing, do nothing if `is_readonly'
		do
			if not is_readonly then
				do_disable_editable
				is_editable := False
			end
		end

	hide
		do
			ev_data_control.hide
		end

	show
		do
			ev_data_control.show
		end

	enable_sensitive
		do
			ev_data_control.enable_sensitive
			ev_data_control.set_background_color (editable_colour)
		end

	disable_sensitive
		do
			ev_data_control.disable_sensitive
			ev_data_control.set_background_color (readonly_colour)
		end

feature {NONE} -- Implementation

	create_ev_data_control
		deferred
		end

	linked_data_controls: detachable ARRAYED_LIST [EVX_DATA_CONTROL]

	do_enable_editable
			-- enable user editing, do nothing if `is_readonly'
		do
		end

	do_disable_editable
			-- disable user editing, do nothing if `is_readonly'
		do
		end

end
