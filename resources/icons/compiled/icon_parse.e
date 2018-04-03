note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_PARSE

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "parse"
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
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,0B,4F,96) A(FF,5C,A0,DC) A(FF,56,9E,DC) A(FF,56,9E,DC) A(FF,5B,9F,DC) A(FF,03,47,8D) 
					A(00,00,00,00) A(FF,00,18,31) A(FF,04,5E,C2) A(FF,00,17,30) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,00,2C,5E) A(FF,60,A2,DA) A(FF,90,CA,EB) A(FF,90,CA,EB) A(FF,94,C8,EA) A(FF,00,2E,5F) A(FF,00,16,2E) A(FF,44,8C,D1) A(FF,BA,DD,F1) A(FF,64,A2,DB) 
					A(FF,00,44,8F) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,1C,6C,BF) A(FF,91,C7,E9) A(FF,8D,C7,E9) A(FF,8B,C6,E9) 
					A(FF,75,AE,DE) A(FF,00,2B,5B) A(FF,00,15,2A) A(FF,23,70,BE) A(FF,8D,BC,E3) A(FF,B1,D8,F0) A(FF,71,A8,DB) A(FF,00,2A,57) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,00,27,56) A(FF,76,AE,DC) A(FF,8A,C3,E7) A(FF,49,89,C9) A(FF,78,AF,DC) A(FF,51,8F,CD) A(FF,00,15,2A) A(00,00,00,00) A(00,00,00,00) 
					A(FF,02,3E,85) A(FF,78,AC,DA) A(FF,A4,D0,EC) A(FF,35,79,C2) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,1E,61,B1) A(FF,85,BD,E4) A(FF,66,9F,D2) 
					A(FF,00,24,52) A(FF,0E,43,80) A(FF,23,64,B0) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,08,3D,7F) A(FF,92,C1,E5) A(FF,7F,B1,DC) 
					A(FF,00,23,50) A(00,00,00,00) A(00,00,00,00) A(FF,41,79,BA) A(FF,7A,B4,E0) A(FF,31,6D,B2) A(00,00,00,00) A(00,00,00,00) A(FF,00,11,27) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,22,4D) A(FF,5C,92,C8) A(FF,88,BB,E2) A(FF,00,21,4D) A(00,00,00,00) A(00,00,00,00) A(FF,35,70,B3) 
					A(FF,50,98,D4) A(FF,13,4D,9A) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,1C,47) 
					A(FF,3A,76,B9) A(FF,58,9C,D6) A(FF,03,47,9A) A(00,00,00,00) A(00,00,00,00) A(FF,26,5D,A3) A(FF,29,7C,C8) A(FF,18,4C,96) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,00,15,2A) A(FF,00,2E,6C) A(FF,00,0C,22) A(FF,00,1A,42) A(FF,34,79,BF) A(FF,35,7E,C3) A(FF,00,1A,42) A(00,00,00,00) 
					A(00,00,00,00) A(FF,0B,3D,7A) A(FF,2C,79,C5) A(FF,28,5F,A6) A(FF,00,0B,1E) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,16,3D) A(FF,3E,71,B0) 
					A(FF,0B,2D,64) A(FF,1C,4E,95) A(FF,1F,71,C1) A(FF,2C,64,A9) A(FF,00,21,35) A(00,00,00,00) A(00,00,00,00) A(FF,00,12,38) A(FF,2F,64,A8) A(FF,28,71,C0) 
					A(FF,14,3E,84) A(FF,00,08,1C) A(00,00,00,00) A(00,00,00,00) A(FF,03,1F,57) A(FF,2C,74,C1) A(FF,24,67,B5) A(FF,22,6C,BC) A(FF,2A,71,BF) A(FF,0D,2A,75) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,07,21,54) A(FF,2F,69,B2) A(FF,25,6B,BB) A(FF,2D,58,9B) A(FF,03,18,50) A(00,00,00,00) 
					A(FF,1E,42,85) A(FF,13,61,BA) A(FF,06,58,B6) A(FF,0F,5F,B9) A(FF,1E,45,8A) A(FF,00,09,1A) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,08,1C,4E) A(FF,32,60,A4) A(FF,27,4D,8E) A(FF,00,09,23) A(FF,00,05,26) A(FF,31,5B,9C) A(FF,23,68,BD) A(FF,21,67,BC) A(FF,26,6B,BE) 
					A(FF,3A,61,A0) A(FF,00,0D,2D) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,07,1F) A(FF,00,03,0C) 
					A(00,00,00,00) A(00,00,00,00) A(FF,00,0B,29) A(FF,00,0C,2E) A(FF,00,0C,2E) A(FF,00,0C,2E) A(FF,00,0C,2B) A(FF,00,02,0C) A(00,00,00,00) A(00,00,00,00) 
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