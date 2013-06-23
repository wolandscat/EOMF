note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 One undo/redo object in an undo/redo chain.
				 ]"
	keywords:    "UI, ADL"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class UNDO_REDO_ACTION

create
	make, make_simple

feature -- Initialisation

	make (a_ui_context: EV_WIDGET; an_undo_action, an_undo_display_action, a_redo_action, a_redo_display_action: PROCEDURE [ANY, TUPLE])
		do
			ui_context := a_ui_context
			undo_action := an_undo_action
			redo_action := a_redo_action
			undo_display_action := an_undo_display_action
			redo_display_action := a_redo_display_action
		end

	make_simple (a_ui_context: EV_WIDGET; an_undo_action, a_redo_action: PROCEDURE [ANY, TUPLE])
		do
			ui_context := a_ui_context
			undo_action := an_undo_action
			redo_action := a_redo_action
		end

feature -- Access

	undo_action: PROCEDURE [ANY, TUPLE]

	redo_action: PROCEDURE [ANY, TUPLE]

	undo_display_action: detachable PROCEDURE [ANY, TUPLE]

	redo_display_action: detachable PROCEDURE [ANY, TUPLE]

	ui_context: EV_WIDGET
			-- UI widget or other visual context that needs to be shown when undo or redo are called

feature -- Commands

	undo
		do
			if not ui_context.is_show_requested then
				ui_context.show
			end
			undo_action.call ([])
			if attached undo_display_action then
				undo_display_action.call ([])
			end
		end

	redo
		do
			if not ui_context.is_show_requested then
				ui_context.show
			end
			redo_action.call ([])
			if attached redo_display_action then
				redo_display_action.call ([])
			end
		end

feature {NONE} -- Implementation

end


