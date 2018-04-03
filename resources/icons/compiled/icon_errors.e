note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_ERRORS

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "errors"
			make_with_size (16, 16)
			fill_memory
		end

feature {NONE} -- Image data
	
	c_colors_0 (a_ptr: POINTER; a_offset: INTEGER)
			-- Fill `a_ptr' with colors data from `a_offset'.
		external
			"C inline"
		alias
			"{
				{
					#define B(q) #q
					#ifdef EIF_WINDOWS
						#define A(a,r,g,b) B(\x##b\x##g\x##r\x##a)
					#else
						#define A(a,r,g,b) B(\x##r\x##g\x##b\x##a)
					#endif

					char l_data[] =
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,13,13,13) A(FF,61,61,61) A(FF,60,60,60) A(FF,12,12,12) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,14,14,14) A(FF,44,43,43) A(FF,C4,C0,A0) A(FF,BC,B6,8E) A(FF,43,43,43) A(FF,12,12,12) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,29,29,29) A(FF,47,46,42) A(FF,CA,C6,A5) A(FF,FE,FA,DB) 
					A(FF,FD,FA,DA) A(FF,C0,BA,87) A(FF,42,42,42) A(FF,13,13,13) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,3D,3D,3D) A(FF,4A,49,41) A(FF,CE,C9,9E) A(FF,FE,F8,D1) A(FF,FD,F8,D1) A(FF,FD,F8,CE) A(FF,FD,F7,CA) A(FF,C2,BA,75) A(FF,42,42,42) 
					A(FF,13,13,13) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,3D,3D,3D) A(FF,4E,4C,41) A(FF,D3,CB,97) A(FF,FD,F6,C7) 
					A(FF,FD,F6,C5) A(FF,3F,3E,3D) A(FF,3B,3B,3A) A(FF,FD,F3,B1) A(FF,FC,F1,A5) A(FF,C2,B5,5B) A(FF,3E,3E,3E) A(FF,13,13,13) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,3D,3D,3D) A(FF,52,50,41) A(FF,D8,CE,92) A(FF,FD,F4,BC) A(FF,FD,F3,B8) A(FF,FD,F2,B3) A(FF,6A,68,62) A(FF,63,62,5D) A(FF,FC,ED,96) 
					A(FF,FB,EB,86) A(FF,FB,E8,72) A(FF,C0,AE,3B) A(FF,3F,3E,3D) A(FF,13,13,13) A(00,00,00,00) A(FF,37,37,37) A(FF,55,52,40) A(FF,DD,CF,88) A(FF,FD,EF,AB) 
					A(FF,FD,EE,A6) A(FF,FD,ED,A0) A(FF,FD,EC,98) A(FF,74,71,60) A(FF,69,66,55) A(FF,FA,DD,44) A(FF,FA,D9,2A) A(FF,F9,D7,22) A(FF,F9,D7,21) A(FF,C2,A7,1A) 
					A(FF,43,42,3D) A(FF,0F,0F,0F) A(FF,0B,0B,0B) A(FF,C3,AE,50) A(FF,FD,E9,91) A(FF,FC,E8,8D) A(FF,FC,E7,88) A(FF,FC,E6,82) A(FF,FB,E0,66) A(FF,81,76,48) 
					A(FF,71,69,43) A(FF,FA,D0,15) A(FF,FA,D0,15) A(FF,FA,D0,14) A(FF,FA,D0,13) A(FF,FA,D0,14) A(FF,8C,76,0F) A(FF,06,06,06) A(FF,00,00,00) A(FF,3D,34,12) 
					A(FF,F6,D8,64) A(FF,FC,DE,6C) A(FF,FC,DD,67) A(FF,FB,D2,3B) A(FF,FA,CB,14) A(FF,B9,A0,3F) A(FF,AF,98,45) A(FF,FA,C9,0D) A(FF,FA,C9,0D) A(FF,FA,C9,0D) 
					A(FF,FA,C9,0E) A(FF,E1,B8,1B) A(FF,27,21,08) A(FF,00,00,00) A(00,00,00,00) A(FF,00,00,00) A(FF,3A,31,0F) A(FF,F2,CB,49) A(FF,FB,C8,23) A(FF,FB,C3,0E) 
					A(FF,FB,C3,0C) A(FF,7D,65,18) A(FF,69,57,19) A(FF,FB,C2,09) A(FF,FB,C2,09) A(FF,FB,C2,0A) A(FF,DD,AF,18) A(FF,23,1D,08) A(FF,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,00,00,00) A(FF,35,2B,0B) A(FF,EC,B5,19) A(FF,FC,BD,09) A(FF,FC,BC,07) A(FF,65,59,39) A(FF,54,4D,3A) A(FF,FC,BC,07) 
					A(FF,FC,BC,08) A(FF,D9,A7,17) A(FF,1E,18,07) A(FF,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,00) 
					A(FF,30,25,09) A(FF,E9,AD,16) A(FF,FC,B6,06) A(FF,FC,C0,28) A(FF,FC,C1,2D) A(FF,FC,B7,07) A(FF,D4,9E,16) A(FF,1A,14,06) A(FF,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,00) A(FF,2C,21,09) A(FF,E5,A6,14) A(FF,FD,B2,05) 
					A(FF,FD,B2,06) A(FF,CF,97,16) A(FF,14,10,06) A(FF,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,00) A(FF,26,1D,08) A(FF,E0,A1,19) A(FF,CB,93,18) A(FF,0F,0C,05) A(FF,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) 
					A(FF,00,00,00) A(FF,06,06,06) A(FF,04,04,04) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) 
					A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) ;
					memcpy ((EIF_NATURAL_32 *)$a_ptr + $a_offset, &l_data, sizeof l_data - 1);
				}
			}"
		end

	build_colors (a_ptr: POINTER)
			-- Build `colors'
		do
			c_colors_0 (a_ptr, 0)
		end

end