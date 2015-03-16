note
	component:   "Eiffel Object Modelling Framework"
	description: "Generated class from message text files"
	keywords:    "Internationalisation, I18N, Localisation, L10N, command line"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class EVX_MESSAGES_DB

inherit
	EVX_MESSAGES_IDS

	MESSAGE_DB
		redefine
			make
		end

create
	make

feature -- Initialisation

	make
		do
			create message_table.make (27)
			message_table.put ("No pixmap found for $1", ec_get_icon_pixmap)
			message_table.put ("No pixmap found for $1", ec_no_pixmap_found)
			message_table.put ("(unknown)", ec_unknown_value)
			message_table.put ("Browse...", ec_browse_button_text)
			message_table.put ("OK", ec_ok_button_text)
			message_table.put ("Cancel", ec_cancel_button_text)
			message_table.put (">>", ec_collapse_button_text)
			message_table.put ("<<", ec_expand_button_text)
			message_table.put ("Tree Zoom", ec_view_label_text)
			message_table.put ("Expand All", ec_expand_complete_button_text)
			message_table.put ("Collapse All", ec_collapse_complete_button_text)
			message_table.put ("Expand One", ec_expand_one_level_button_text)
			message_table.put ("Collapse One", ec_collapse_one_level_button_text)
			message_table.put ("Add new row", ec_add_mi)
			message_table.put ("Remove row", ec_remove_mi)
			message_table.put ("Completely expand the tree", ec_expand_complete_tooltip)
			message_table.put ("Completely collapse the tree", ec_collapse_complete_tooltip)
			message_table.put ("Expand one level of the tree", ec_expand_one_level_tooltip)
			message_table.put ("Collapse one level of the tree", ec_collapse_one_level_tooltip)
			message_table.put ("View", ec_view_controls_text)
			message_table.put ("Save", ec_save_button_text)
			message_table.put ("Save editor contents to file", ec_save_button_tooltip)
			message_table.put ("+ Line Numbers", ec_add_line_numbers_text)
			message_table.put ("Add line numbers to text", ec_add_line_numbers_tooltip)
			message_table.put ("Row Filter", ec_row_filter_frame_text)
			message_table.put ("Filter which rows are shown in the Path Analysis", ec_row_filter_combo_tooltip)
			message_table.put ("Column View", ec_column_frame_text)
end	
end
