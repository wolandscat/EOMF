note
	component:   "Eiffel Object Modelling Framework"
	description: "Application constant redefinitions"
	keywords:    "constants"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class EVX_DEFINITIONS

inherit
	EOMF_COMPILED_MESSAGE_IDS
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, standard_is_equal, is_deep_equal
		end

feature -- Definitions

	default_min_height: INTEGER
			-- create as 1.5 x default font height
		once
			Result := ((create {EV_FONT}).height * 1.5).floor
		end

	default_min_width: INTEGER = 50

	Sane_screen_coord: INTEGER = -2500
			-- assumed 'most negative' screen X or Y position that app could, due to use of multiple screens. If it is more negative
			-- than this, at least on windows, assume that the app was minimised and start it in a default screen location instead

	Default_padding_width: INTEGER = 3

	Default_border_width: INTEGER = 3

	Max_padding_width: INTEGER = 10

	Max_border_width: INTEGER = 10

	editable_colour: EV_COLOR
		once
			create Result.make_with_8_bit_rgb (255, 255, 255)
		end

	readonly_colour: EV_COLOR
		once
			create Result.make_with_8_bit_rgb (250, 250, 250)
		end

	background_colour: EV_COLOR
		once
			create Result.make_with_8_bit_rgb (240, 240, 240)
		end

	Line_numbers_bg_color: EV_COLOR
		once
			create Result.make_with_8_bit_rgb (0xaa, 0xaa, 0xaa)
		end

	screen_10_pt_regular_font: EV_FONT
		do
			create Result
			Result.set_family ({EV_FONT_CONSTANTS}.Family_screen)
			Result.set_weight ({EV_FONT_CONSTANTS}.Weight_regular)
			Result.set_shape ({EV_FONT_CONSTANTS}.Shape_regular)
			Result.set_height_in_points (10)
		end

	Text_min_height: INTEGER
			-- create as 1.5 x default font height
		once
			Result := ((create {EV_FONT}).height * 1.5).floor
		end

	Text_char_width: INTEGER
			-- obtain from default font height
		once
			Result := (create {EV_FONT}).width
		end

	Default_grid_expansion_factor: REAL = 1.04
			-- amount to spread columns by to enhance readability

	Default_grid_row_expansion: INTEGER = 4
			-- number of pixels to add to height of grid row to enhance readability

end

