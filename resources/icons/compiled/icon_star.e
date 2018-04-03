note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_STAR

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "star"
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
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,A5,81,04) A(FF,A1,80,03) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,3F,2A,00) A(FF,E8,CB,5F) A(FF,E7,C7,56) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,6C,52,00) A(FF,F8,EE,BC) 
					A(FF,F6,E8,AC) A(FF,6D,50,02) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,E0,B8,3C) A(FF,FF,FB,D7) A(FF,FE,FA,D7) A(FF,DD,B1,26) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,6C,4D,00) 
					A(FF,F1,DC,93) A(FF,FF,F8,CA) A(FF,FF,F8,CB) A(FF,ED,D2,7B) A(FF,35,27,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,33,26,00) A(FF,E2,BB,4C) A(FF,E9,C9,63) A(FF,E9,C9,63) A(FF,E9,C9,66) A(FF,E9,CA,68) A(FF,FD,F4,C0) A(FF,FE,F5,C0) A(FF,FE,F5,C0) A(FF,FB,F1,BB) 
					A(FF,E9,C9,67) A(FF,E9,C9,66) A(FF,E9,C9,63) A(FF,E9,C9,63) A(FF,E0,B7,44) A(FF,35,26,00) A(00,00,00,00) A(FF,A2,79,17) A(FF,F8,E5,91) A(FF,FE,EA,88) 
					A(FF,FE,EB,90) A(FF,FE,ED,9C) A(FF,FE,EF,A5) A(FF,FE,F0,AB) A(FF,FE,F0,AB) A(FF,FE,EF,A3) A(FF,FE,ED,9A) A(FF,FE,EB,8F) A(FF,FE,EA,87) A(FF,F6,E2,8C) 
					A(FF,A1,76,12) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,D5,9D,1F) A(FF,F9,E3,84) A(FF,FE,E1,6D) A(FF,FE,E3,76) A(FF,FE,E5,80) A(FF,FE,E7,87) 
					A(FF,FE,E7,86) A(FF,FE,E5,7F) A(FF,FE,E3,75) A(FF,FE,E1,6C) A(FF,F8,E1,81) A(FF,A1,77,19) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,34,20,02) A(FF,D5,9C,1E) A(FF,FA,CE,2D) A(FF,FE,C6,03) A(FF,FE,C6,03) A(FF,FE,C7,05) A(FF,FE,C6,04) A(FF,FE,C6,03) A(FF,FE,C6,03) A(FF,F9,CF,32) 
					A(FF,D4,99,19) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,65,43,01) A(FF,F7,CB,3D) A(FF,FE,BF,03) 
					A(FF,FE,BF,03) A(FF,FE,BF,03) A(FF,FE,BF,03) A(FF,FE,BF,03) A(FF,FE,BF,03) A(FF,F3,C7,40) A(FF,65,43,01) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,D2,97,25) A(FF,FE,C4,21) A(FF,FE,B9,03) A(FF,FE,B9,03) A(FF,FE,B9,03) A(FF,FE,B9,03) A(FF,FE,B9,03) 
					A(FF,FE,B9,03) A(FF,FD,C9,2F) A(FF,CF,89,0D) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,30,20,00) A(FF,E2,AE,39) 
					A(FF,FE,B6,08) A(FF,FE,B4,03) A(FF,FE,BD,19) A(FF,F2,C1,3F) A(FF,F4,C2,3F) A(FF,FE,BC,16) A(FF,FE,B4,03) A(FF,FE,BA,12) A(FF,D9,A4,35) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,62,3C,01) A(FF,F4,C1,45) A(FF,FF,B7,16) A(FF,F4,C0,43) A(FF,D7,9D,2F) A(FF,62,3E,02) 
					A(FF,98,5E,02) A(FF,D7,9F,31) A(FF,F6,C2,42) A(FF,FF,B6,14) A(FF,E8,B2,3C) A(FF,5F,3E,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,C1,82,1D) A(FF,F5,CE,65) A(FF,CD,96,32) A(FF,62,3A,03) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,69,41,04) A(FF,D0,9B,36) 
					A(FF,F1,D0,73) A(FF,61,3B,02) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,87,58,0F) A(FF,6C,45,04) A(FF,05,02,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,0F,09,00) A(FF,7A,4A,06) A(FF,5B,38,02) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) ;
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