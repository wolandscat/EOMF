note
	description: "Icon loader class generated by icondbc"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_EDIT

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "edit"
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
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,00) A(FF,D6,D6,D6) A(FF,E8,E8,E8) 
					A(FF,E8,E8,E8) A(FF,E8,E8,E8) A(FF,E8,E8,E8) A(FF,E8,E8,E8) A(FF,E5,E5,E5) A(FF,AA,AA,AA) A(FF,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,00) A(FF,E2,E1,E1) A(FF,F4,F3,F3) A(FF,F4,F3,F3) A(FF,F4,F3,F3) A(FF,F4,F3,F3) A(FF,F2,F1,F1) 
					A(FF,DF,DF,DF) A(FF,C9,C8,C8) A(FF,AE,AE,AE) A(FF,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,00) 
					A(FF,E2,E1,E1) A(FF,F3,F2,F2) A(FF,F3,F2,F2) A(FF,F3,F2,F2) A(FF,F3,F2,F2) A(FF,F2,F1,F1) A(FF,E4,E3,E3) A(FF,BD,BD,BD) A(FF,FB,FB,FB) A(FF,AE,AE,AE) 
					A(FF,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,00) A(FF,E1,E1,E1) A(FF,E1,E0,E0) A(FF,D5,D4,D4) A(FF,D2,D1,D1) 
					A(FF,DC,DB,DB) A(FF,E1,E0,E0) A(FF,E6,E5,E5) A(FF,B9,B9,B9) A(FF,AC,AC,AC) A(FF,AE,AE,AE) A(FF,89,88,88) A(FF,64,35,35) A(FF,71,42,42) A(00,00,00,00) 
					A(00,00,00,00) A(FF,00,00,00) A(FF,E1,E1,E1) A(FF,E0,DF,DF) A(FF,DD,DC,DC) A(FF,DD,DC,DC) A(FF,CF,CF,CF) A(FF,DF,DF,DF) A(FF,E7,E7,E7) A(FF,D4,D3,D3) 
					A(FF,C9,C8,C8) A(FF,C1,C1,C1) A(FF,C3,B0,B0) A(FF,E8,93,93) A(FF,A9,3A,3A) A(FF,20,00,00) A(00,00,00,00) A(FF,00,00,00) A(FF,E1,E1,E1) A(FF,DE,DE,DE) 
					A(FF,D7,D7,D7) A(FF,D3,D3,D3) A(FF,CE,CE,CE) A(FF,E2,E2,E2) A(FF,CC,CA,CA) A(FF,CE,CE,CE) A(FF,CD,CC,CC) A(FF,E5,E0,CA) A(FF,EF,EF,EF) A(FF,9B,83,83) 
					A(FF,73,08,08) A(FF,20,00,00) A(00,00,00,00) A(FF,00,00,00) A(FF,E1,E1,E1) A(FF,DD,DD,DD) A(FF,D1,D1,D1) A(FF,DB,DA,DA) A(FF,CD,CC,CC) A(FF,D9,D9,D9) 
					A(FF,CD,CC,CC) A(FF,DE,DE,DE) A(FF,E9,DF,B6) A(FF,FD,DC,6C) A(FF,C2,98,4B) A(FF,45,44,44) A(FF,08,08,08) A(FF,00,00,00) A(00,00,00,00) A(FF,00,00,00) 
					A(FF,E0,E0,E0) A(FF,DC,DC,DC) A(FF,CB,CB,CB) A(FF,DA,DA,DA) A(FF,CB,CB,CB) A(FF,CB,CB,CB) A(FF,E2,E2,E2) A(FF,E4,DC,B6) A(FF,FC,DD,6D) A(FF,E9,9E,0D) 
					A(FF,B3,74,33) A(FF,90,8E,8C) A(FF,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,00) A(FF,E0,E0,E0) A(FF,DB,DA,DA) A(FF,DB,DB,DB) A(FF,CB,CA,CA) 
					A(FF,E0,DF,DF) A(FF,CB,CB,CB) A(FF,E7,DF,BE) A(FF,FC,DF,6D) A(FF,EE,A4,11) A(FF,A6,63,1C) A(FF,BE,B9,B4) A(FF,9C,9C,9C) A(FF,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,00,00,00) A(FF,E0,E0,E0) A(FF,D9,D9,D9) A(FF,D5,D5,D5) A(FF,CB,CB,CB) A(FF,C9,C9,C9) A(FF,E6,E0,C3) A(FF,FB,DF,6C) A(FF,F1,A8,15) 
					A(FF,A8,61,14) A(FF,A1,9B,95) A(FF,D9,D9,D9) A(FF,A2,A2,A2) A(FF,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,00) A(FF,E0,E0,E0) A(FF,E9,E8,E8) 
					A(FF,E9,E8,E8) A(FF,E9,E8,E8) A(FF,EC,E7,D0) A(FF,FB,E0,6C) A(FF,F4,AD,1A) A(FF,B4,68,14) A(FF,A9,A1,99) A(FF,DA,DA,DA) A(FF,E9,E9,E9) A(FF,A2,A2,A2) 
					A(FF,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,00) A(FF,E0,E0,E0) A(FF,E8,E7,E7) A(FF,E8,E7,E7) A(FF,EA,E4,D0) A(FF,FA,E0,6D) A(FF,F6,B1,1E) 
					A(FF,B9,6A,0F) A(FF,A0,94,8A) A(FF,D4,D4,D4) A(FF,E7,E7,E7) A(FF,E9,E8,E8) A(FF,A2,A2,A2) A(FF,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,00) 
					A(FF,DB,DB,DB) A(FF,EA,EA,EA) A(FF,EA,EA,EA) A(FF,DF,CA,AB) A(FF,DD,AF,59) A(FF,C0,6F,0D) A(FF,9D,8F,83) A(FF,D3,D3,D3) A(FF,E9,E9,E9) A(FF,EA,EA,EA) 
					A(FF,EC,EC,EC) A(FF,A3,A3,A3) A(FF,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,00) A(FF,8E,8E,8E) A(FF,87,87,87) A(FF,97,94,90) A(FF,C4,A1,66) 
					A(FF,A6,70,0A) A(FF,5C,4A,35) A(FF,71,71,71) A(FF,86,86,86) A(FF,87,87,87) A(FF,87,87,87) A(FF,88,88,88) A(FF,53,53,53) A(FF,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,31,29,1D) A(FF,12,0C,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) 
					A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(00,00,00,00) ;
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