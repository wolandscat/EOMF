note
	description: "Icon loader class generated by icondbc"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_GO

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "go"
			make_with_size (32, 32)
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
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,46,7C,0F) A(FF,44,86,13) A(FF,42,86,16) 
					A(FF,44,85,14) A(FF,43,85,14) A(FF,43,85,14) A(FF,44,85,14) A(FF,42,86,16) A(FF,44,86,13) A(FF,46,7C,0F) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,45,86,10) A(FF,43,82,15) A(FF,61,99,26) 
					A(FF,A5,C6,54) A(FF,CF,E2,80) A(FF,D8,E8,8C) A(FF,EC,F4,AC) A(FF,EC,F4,AC) A(FF,D8,E8,8C) A(FF,CF,E2,80) A(FF,A5,C6,54) A(FF,61,99,26) A(FF,43,82,15) 
					A(FF,45,86,10) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,55,80,00) A(FF,40,83,14) A(FF,75,A5,2E) 
					A(FF,C2,DA,73) A(FF,E9,F3,A7) A(FF,ED,F5,B7) A(FF,EE,F6,B9) A(FF,EB,F4,AF) A(FF,E9,F3,A7) A(FF,E9,F3,A7) A(FF,EB,F4,AF) A(FF,EE,F6,B9) A(FF,ED,F5,B7) 
					A(FF,E9,F3,A7) A(FF,C2,DA,73) A(FF,75,A5,2E) A(FF,41,83,13) A(FF,55,80,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,3D,86,0C) A(FF,44,82,17) 
					A(FF,96,BC,44) A(FF,E0,EE,85) A(FF,E7,F2,A0) A(FF,E3,EF,90) A(FF,D8,EA,69) A(FF,CF,E5,45) A(FF,C8,E1,2A) A(FF,C5,DF,1B) A(FF,C5,DF,1B) A(FF,C8,E1,2A) 
					A(FF,CF,E5,45) A(FF,D8,EA,69) A(FF,E3,EF,90) A(FF,E7,F1,9F) A(FF,DF,ED,84) A(FF,95,BB,42) A(FF,44,82,17) A(FF,47,80,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,40,80,00) 
					A(FF,47,85,18) A(FF,96,BD,3B) A(FF,D9,EA,75) A(FF,DC,EC,7E) A(FF,CE,E4,4D) A(FF,C2,DD,1E) A(FF,BD,DB,0D) A(FF,BC,DA,09) A(FF,BC,DA,09) A(FF,BC,DA,09) 
					A(FF,BC,DA,09) A(FF,BC,DA,09) A(FF,BC,DA,09) A(FF,BD,DB,0D) A(FF,C2,DD,1E) A(FF,CE,E4,4D) A(FF,DC,EC,7E) A(FF,D9,EA,75) A(FF,96,BC,3B) A(FF,44,85,17) 
					A(FF,39,8E,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,43,80,15) A(FF,82,AE,21) A(FF,D1,E5,61) A(FF,D3,E6,67) A(FF,C3,DD,30) A(FF,BA,D8,10) A(FF,B8,D7,09) A(FF,B8,D7,09) A(FF,B8,D7,09) 
					A(FF,B8,D7,09) A(FF,B8,D7,09) A(FF,B8,D7,09) A(FF,B8,D7,09) A(FF,B8,D7,09) A(FF,B8,D7,09) A(FF,B8,D7,09) A(FF,BA,D8,10) A(FF,C3,DD,30) A(FF,D3,E6,68) 
					A(FF,D1,E5,61) A(FF,81,AC,20) A(FF,42,7F,12) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,40,80,11) A(FF,5C,92,0F) A(FF,C1,DC,35) A(FF,CC,E2,5A) A(FF,BD,D9,27) A(FF,B4,D5,0C) A(FF,B3,D4,08) A(FF,B3,D4,08) 
					A(FF,B3,D4,08) A(FF,B3,D4,08) A(FF,B3,D4,08) A(FF,B3,D4,08) A(FF,B3,D4,08) A(FF,B3,D4,08) A(FF,B3,D4,08) A(FF,B3,D4,08) A(FF,B3,D4,08) A(FF,B3,D4,08) 
					A(FF,B4,D5,0C) A(FF,BD,D9,27) A(FF,CC,E2,5A) A(FF,C1,DC,35) A(FF,5A,91,0F) A(FF,3F,79,12) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,40,7B,10) A(FF,88,B3,0B) A(FF,C4,DD,4A) A(FF,B9,D7,2A) A(FF,AF,D2,0C) A(FF,AE,D1,08) 
					A(FF,AE,D1,08) A(FF,AE,D1,08) A(FF,8C,A7,0B) A(FF,AE,D1,08) A(FF,AE,D1,08) A(FF,AE,D1,08) A(FF,AE,D1,08) A(FF,AE,D1,08) A(FF,AE,D1,08) A(FF,AE,D1,08) 
					A(FF,AE,D1,08) A(FF,AE,D1,08) A(FF,AE,D1,08) A(FF,AF,D2,0C) A(FF,B9,D7,2A) A(FF,C4,DD,4A) A(FF,86,B2,0B) A(FF,40,7B,10) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,39,7D,11) A(FF,53,8A,0E) A(FF,AD,D0,14) A(FF,B9,D7,36) A(FF,AB,CF,0D) 
					A(FF,A9,CE,07) A(FF,A9,CE,07) A(FF,A9,CE,07) A(FF,A9,CE,07) A(FF,2D,2F,25) A(FF,39,41,12) A(FF,88,A5,0A) A(FF,A9,CE,07) A(FF,A9,CE,07) A(FF,A9,CE,07) 
					A(FF,A9,CE,07) A(FF,A9,CE,07) A(FF,A9,CE,07) A(FF,A9,CE,07) A(FF,A9,CE,07) A(FF,A9,CE,07) A(FF,AB,CF,0D) A(FF,B9,D7,36) A(FF,AD,D0,14) A(FF,53,8A,0E) 
					A(FF,39,7D,11) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,3E,76,0F) A(FF,71,A0,0B) A(FF,AF,D1,26) 
					A(FF,AB,CE,19) A(FF,A4,CA,07) A(FF,A4,CA,07) A(FF,A4,CA,07) A(FF,A4,CA,07) A(FF,A4,CA,07) A(FF,57,58,52) A(FF,45,45,45) A(FF,23,23,23) A(FF,3C,46,11) ;
					memcpy ((EIF_NATURAL_32 *)$a_ptr + $a_offset, &l_data, sizeof l_data - 1);
				}
			}"
		end
	
	c_colors_1 (a_ptr: POINTER; a_offset: INTEGER)
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
					A(FF,87,A6,0A) A(FF,A4,CA,07) A(FF,A4,CA,07) A(FF,A4,CA,07) A(FF,A4,CA,07) A(FF,A4,CA,07) A(FF,A4,CA,07) A(FF,A4,CA,07) A(FF,A4,CA,07) A(FF,AB,CE,19) 
					A(FF,AF,D1,26) A(FF,70,9F,0B) A(FF,42,77,0F) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,3F,75,0D) 
					A(FF,89,B5,08) A(FF,A9,CD,22) A(FF,A0,C8,0A) A(FF,9E,C7,06) A(FF,9E,C7,06) A(FF,9E,C7,06) A(FF,9E,C7,06) A(FF,9E,C7,06) A(FF,54,56,4F) A(FF,50,50,50) 
					A(FF,50,50,50) A(FF,40,40,40) A(FF,20,20,20) A(FF,40,4D,10) A(FF,86,A7,08) A(FF,9E,C7,06) A(FF,9E,C7,06) A(FF,9E,C7,06) A(FF,9E,C7,06) A(FF,9E,C7,06) 
					A(FF,9E,C7,06) A(FF,A0,C8,0A) A(FF,A9,CD,22) A(FF,89,B5,08) A(FF,3F,75,0D) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,3E,75,0D) A(FF,92,BE,06) A(FF,A2,C9,1D) A(FF,98,C3,06) A(FF,98,C3,06) A(FF,98,C3,06) A(FF,98,C3,06) A(FF,98,C3,06) A(FF,98,C3,06) 
					A(FF,50,52,4B) A(FF,4C,4C,4C) A(FF,4C,4C,4C) A(FF,4C,4C,4C) A(FF,4C,4C,4C) A(FF,3A,3A,3A) A(FF,1D,1D,1D) A(FF,42,51,0E) A(FF,84,A8,08) A(FF,98,C3,06) 
					A(FF,98,C3,06) A(FF,98,C3,06) A(FF,98,C3,06) A(FF,98,C3,06) A(FF,A2,C9,1D) A(FF,92,BE,06) A(FF,3E,75,0D) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,40,74,0C) A(FF,93,C0,05) A(FF,9A,C5,16) A(FF,93,C0,05) A(FF,93,C0,05) A(FF,93,C0,05) A(FF,93,C0,05) 
					A(FF,93,C0,05) A(FF,93,C0,05) A(FF,4B,4D,47) A(FF,47,47,47) A(FF,47,47,47) A(FF,47,47,47) A(FF,47,47,47) A(FF,47,47,47) A(FF,47,47,47) A(FF,34,34,34) 
					A(FF,1C,1C,1A) A(FF,44,56,0D) A(FF,82,A9,07) A(FF,93,C0,05) A(FF,93,C0,05) A(FF,93,C0,05) A(FF,9A,C5,16) A(FF,93,C0,05) A(FF,40,74,0C) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,3F,72,0B) A(FF,8D,BC,05) A(FF,93,BF,10) A(FF,8D,BC,05) A(FF,8D,BC,05) 
					A(FF,8D,BC,05) A(FF,8D,BC,05) A(FF,8D,BC,05) A(FF,8D,BC,05) A(FF,47,49,43) A(FF,43,43,43) A(FF,43,43,43) A(FF,43,43,43) A(FF,43,43,43) A(FF,43,43,43) 
					A(FF,43,43,43) A(FF,43,43,43) A(FF,42,42,42) A(FF,43,48,34) A(FF,65,80,15) A(FF,8D,BC,05) A(FF,8D,BC,05) A(FF,8D,BC,05) A(FF,93,BF,10) A(FF,8D,BC,05) 
					A(FF,3F,72,0B) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,3E,70,0A) A(FF,82,B3,05) A(FF,8D,BB,11) 
					A(FF,87,B8,05) A(FF,87,B8,05) A(FF,87,B8,05) A(FF,87,B8,05) A(FF,87,B8,05) A(FF,87,B8,05) A(FF,42,44,3E) A(FF,3E,3E,3E) A(FF,3E,3E,3E) A(FF,3E,3E,3E) 
					A(FF,3E,3E,3E) A(FF,3E,3E,3E) A(FF,3E,3E,3E) A(FF,57,5D,49) A(FF,92,A3,63) A(FF,B5,D3,64) A(FF,9B,C4,2F) A(FF,87,B8,05) A(FF,87,B8,05) A(FF,87,B8,05) 
					A(FF,8D,BC,12) A(FF,82,B3,05) A(FF,3E,70,0A) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,3E,6C,08) 
					A(FF,73,A5,05) A(FF,89,B9,13) A(FF,83,B6,06) A(FF,82,B5,04) A(FF,82,B5,04) A(FF,82,B5,04) A(FF,82,B5,04) A(FF,82,B5,04) A(FF,3F,40,3A) A(FF,3A,3A,3A) 
					A(FF,3A,3A,3A) A(FF,3A,3A,3A) A(FF,3A,3A,3A) A(FF,5B,62,49) A(FF,9A,AF,66) A(FF,AF,D0,5F) A(FF,95,C0,2A) A(FF,82,B5,04) A(FF,82,B5,04) A(FF,82,B5,04) 
					A(FF,82,B5,04) A(FF,83,B6,06) A(FF,89,B9,13) A(FF,73,A5,05) A(FF,3E,6C,08) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,3F,6B,06) A(FF,5D,8F,06) A(FF,85,B6,15) A(FF,81,B4,0E) A(FF,7C,B1,04) A(FF,7C,B1,04) A(FF,7C,B1,04) A(FF,7C,B1,04) A(FF,7C,B1,04) 
					A(FF,3B,3D,37) A(FF,36,36,36) A(FF,36,36,36) A(FF,62,6C,4B) A(FF,9D,B4,68) A(FF,A8,CB,58) A(FF,8A,BA,20) A(FF,7C,B1,04) A(FF,7C,B1,04) A(FF,7C,B1,04) 
					A(FF,7C,B1,04) A(FF,7C,B1,04) A(FF,7C,B1,04) A(FF,81,B4,0E) A(FF,85,B6,15) A(FF,5C,8E,06) A(FF,3C,6E,06) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,39,6C,06) A(FF,48,77,06) A(FF,7A,B0,0A) A(FF,84,B6,1C) A(FF,78,AF,06) A(FF,76,AE,03) A(FF,76,AE,03) 
					A(FF,76,AE,03) A(FF,76,AE,03) A(FF,3B,3D,35) A(FF,66,72,4D) A(FF,A0,BA,6B) A(FF,9F,C6,4E) A(FF,82,B5,1A) A(FF,76,AE,03) A(FF,76,AE,03) A(FF,76,AE,03) 
					A(FF,76,AE,03) A(FF,76,AE,03) A(FF,76,AE,03) A(FF,76,AE,03) A(FF,78,AF,06) A(FF,84,B6,1C) A(FF,7A,B0,0A) A(FF,48,77,06) A(FF,39,6C,06) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,3C,69,07) A(FF,5F,93,04) A(FF,85,B6,26) A(FF,7B,B0,15) 
					A(FF,72,AB,05) A(FF,71,AA,03) A(FF,71,AA,03) A(FF,71,AA,03) A(FF,A2,C0,67) A(FF,97,C1,47) A(FF,7B,B0,15) A(FF,71,AA,03) A(FF,71,AA,03) A(FF,71,AA,03) 
					A(FF,71,AA,03) A(FF,71,AA,03) A(FF,71,AA,03) A(FF,71,AA,03) A(FF,71,AA,03) A(FF,72,AB,05) A(FF,7B,B0,15) A(FF,85,B6,26) A(FF,5E,92,04) A(FF,3C,69,07) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,3C,66,00) A(FF,48,77,04) 
					A(FF,7A,AF,1A) A(FF,86,B6,2E) A(FF,75,AD,12) A(FF,6D,A8,04) A(FF,6C,A7,02) A(FF,6C,A7,02) A(FF,71,AA,0B) A(FF,6C,A7,02) A(FF,6C,A7,02) A(FF,6C,A7,02) 
					A(FF,6C,A7,02) A(FF,6C,A7,02) A(FF,6C,A7,02) A(FF,6C,A7,02) A(FF,6C,A7,02) A(FF,6C,A7,02) A(FF,6D,A8,04) A(FF,75,AD,13) A(FF,86,B6,2E) A(FF,7A,AF,1A) 
					A(FF,48,76,04) A(FF,3F,67,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,3F,67,05) A(FF,57,87,0D) A(FF,83,B5,30) A(FF,85,B6,34) A(FF,74,AB,17) A(FF,69,A5,06) A(FF,67,A4,02) A(FF,67,A4,02) A(FF,67,A4,02) 
					A(FF,67,A4,02) A(FF,67,A4,02) A(FF,67,A4,02) A(FF,67,A4,02) A(FF,67,A4,02) A(FF,67,A4,02) A(FF,67,A4,02) A(FF,69,A5,06) A(FF,74,AB,17) A(FF,85,B6,34) 
					A(FF,83,B5,30) A(FF,57,87,0E) A(FF,3F,67,05) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,40,55,00) A(FF,3E,67,08) A(FF,61,90,1C) A(FF,86,B6,3B) A(FF,89,B8,40) A(FF,78,AE,25) A(FF,69,A5,0C) 
					A(FF,63,A2,03) A(FF,62,A1,01) A(FF,62,A1,01) A(FF,62,A1,01) A(FF,62,A1,01) A(FF,62,A1,01) A(FF,62,A1,01) A(FF,63,A2,03) A(FF,69,A5,0C) A(FF,78,AE,25) 
					A(FF,89,B8,40) A(FF,85,B6,3B) A(FF,60,8E,1C) A(FF,3E,67,08) A(FF,39,55,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) ;
					memcpy ((EIF_NATURAL_32 *)$a_ptr + $a_offset, &l_data, sizeof l_data - 1);
				}
			}"
		end
	
	c_colors_2 (a_ptr: POINTER; a_offset: INTEGER)
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
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,3D,55,00) A(FF,3C,62,04) A(FF,60,8C,1F) A(FF,88,B8,44) 
					A(FF,91,BD,52) A(FF,8C,BA,49) A(FF,7E,B1,34) A(FF,72,AA,20) A(FF,68,A4,12) A(FF,63,A1,09) A(FF,63,A1,09) A(FF,68,A4,12) A(FF,72,AA,20) A(FF,7E,B1,34) 
					A(FF,8C,BA,49) A(FF,91,BD,52) A(FF,88,B8,44) A(FF,5F,8C,1F) A(FF,3C,64,04) A(FF,39,55,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,2B,55,00) 
					A(FF,3B,60,02) A(FF,51,7B,13) A(FF,77,A4,39) A(FF,91,BD,55) A(FF,97,C1,5E) A(FF,97,C1,5F) A(FF,93,BE,59) A(FF,91,BD,55) A(FF,91,BD,55) A(FF,93,BE,59) 
					A(FF,97,C1,5F) A(FF,97,C1,5E) A(FF,91,BD,55) A(FF,77,A4,39) A(FF,51,7B,13) A(FF,3B,60,02) A(FF,2B,55,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,27,3D,00) A(FF,38,5B,01) A(FF,49,71,0E) A(FF,65,90,28) A(FF,7C,A9,40) A(FF,83,AE,47) A(FF,92,BD,59) 
					A(FF,92,BD,59) A(FF,83,AE,47) A(FF,7C,A9,40) A(FF,65,90,28) A(FF,49,71,0E) A(FF,38,5B,01) A(FF,26,3B,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,15,20,00) A(FF,2C,44,02) A(FF,36,56,00) 
					A(FF,38,59,00) A(FF,3C,60,01) A(FF,3C,60,01) A(FF,38,57,00) A(FF,36,56,00) A(FF,2C,47,02) A(FF,12,22,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) ;
					memcpy ((EIF_NATURAL_32 *)$a_ptr + $a_offset, &l_data, sizeof l_data - 1);
				}
			}"
		end

	build_colors (a_ptr: POINTER)
			-- Build `colors'
		do
			c_colors_0 (a_ptr, 0)
			c_colors_1 (a_ptr, 400)
			c_colors_2 (a_ptr, 800)
		end

end