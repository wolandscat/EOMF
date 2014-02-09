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

	make (a_link_id: INTEGER; a_ui_context: EV_WIDGET; an_undo_action, an_undo_display_action, a_redo_action, a_redo_display_action: PROCEDURE [ANY, TUPLE])
		do
			make_simple (a_link_id, a_ui_context, an_undo_action, a_redo_action)
			undo_display_action := an_undo_display_action
			redo_display_action := a_redo_display_action
		end

	make_simple (a_link_id: INTEGER; a_ui_context: EV_WIDGET; an_undo_action, a_redo_action: PROCEDURE [ANY, TUPLE])
		do
			link_id := a_link_id
			ui_context := a_ui_context
			undo_action := an_undo_action
			redo_action := a_redo_action
		end

feature -- Access

	link_id: INTEGER

	undo_action: PROCEDURE [ANY, TUPLE]

	redo_action: PROCEDURE [ANY, TUPLE]

	undo_display_action: detachable PROCEDURE [ANY, TUPLE]

	redo_display_action: detachable PROCEDURE [ANY, TUPLE]

	ui_context: EV_WIDGET
			-- UI widget or other visual context that needs to be shown when undo or redo are called

feature -- Commands

	undo
		local
			p: detachable EV_CONTAINER
		do
-- FOR NOW this doesn't work in EV_NOTEBOOK at least
--			if not ui_context.is_displayed then
--				from p := ui_context.parent until not attached p as att_p or else att_p.is_displayed loop
--					if attached p as a_p then
--						a_p.show
--					end
--					p := p.parent
--				end
--				ui_context.show
--			end
			undo_action.call ([])
			if attached undo_display_action then
				undo_display_action.call ([])
			end
		end

	redo
		local
			p: detachable EV_CONTAINER
		do
-- FOR NOW this doesn't work in EV_NOTEBOOK at least
--			if not ui_context.is_displayed then
--				from p := ui_context.parent until not attached p as att_p or else att_p.is_displayed loop
--					if attached p as a_p then
--						a_p.show
--					end
--					p := p.parent
--				end
--				ui_context.show
--			end
			redo_action.call ([])
			if attached redo_display_action then
				redo_display_action.call ([])
			end
		end

feature {NONE} -- Implementation

end


