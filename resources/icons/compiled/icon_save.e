note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_SAVE

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "save"
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
					A(FF,4B,68,8D) A(FF,49,66,8A) A(FF,47,63,86) A(FF,45,60,83) A(FF,43,5E,7F) A(FF,41,5B,7C) A(FF,40,59,78) A(FF,3E,56,75) A(FF,3C,54,71) A(FF,3A,51,6E) 
					A(FF,38,4E,6B) A(FF,37,4C,67) A(FF,35,49,64) A(FF,33,47,60) A(FF,31,44,5D) A(FF,2F,42,59) A(FF,4B,68,8D) A(FF,B1,C2,D4) A(FF,AF,C1,D2) A(FF,FA,D4,C6) 
					A(FF,FA,D4,C6) A(FF,FA,D4,C6) A(FF,FA,D4,C6) A(FF,FA,D4,C6) A(FF,FA,D4,C6) A(FF,FA,D4,C6) A(FF,FA,D4,C6) A(FF,FA,D4,C6) A(FF,FA,D4,C6) A(FF,9D,AF,C1) 
					A(FF,9C,AD,BF) A(FF,2F,42,59) A(FF,4B,68,8D) A(FF,B1,C2,D4) A(FF,41,4D,5C) A(FF,FA,D4,C6) A(FF,FA,D4,C6) A(FF,FA,D4,C6) A(FF,FA,D4,C6) A(FF,FA,D4,C6) 
					A(FF,FA,D4,C6) A(FF,FA,D4,C6) A(FF,FA,D4,C6) A(FF,FA,D4,C6) A(FF,FA,D4,C6) A(FF,41,4D,5C) A(FF,9C,AD,BF) A(FF,2F,42,59) A(FF,4B,68,8D) A(FF,B1,C2,D4) 
					A(FF,8C,A0,B5) A(FF,FE,FB,FA) A(FF,FE,FB,FA) A(FF,FE,FB,FA) A(FF,FE,FB,FA) A(FF,FE,FB,FA) A(FF,FE,FB,FA) A(FF,FE,FB,FA) A(FF,FE,FB,FA) A(FF,FE,FB,FA) 
					A(FF,FE,FB,FA) A(FF,6B,7E,94) A(FF,9C,AD,BF) A(FF,2F,42,59) A(FF,4B,68,8D) A(FF,B1,C2,D4) A(FF,8C,A0,B5) A(FF,FA,D4,C6) A(FF,FA,D4,C6) A(FF,FA,D4,C6) 
					A(FF,FA,D4,C6) A(FF,FA,D4,C6) A(FF,FA,D4,C6) A(FF,FA,D4,C6) A(FF,FA,D4,C6) A(FF,FA,D4,C6) A(FF,FA,D4,C6) A(FF,6B,7E,94) A(FF,9C,AD,BF) A(FF,2F,42,59) 
					A(FF,4B,68,8D) A(FF,B1,C2,D4) A(FF,8C,A0,B5) A(FF,FE,FB,FA) A(FF,FE,FB,FA) A(FF,FE,FB,FA) A(FF,FE,FB,FA) A(FF,FE,FB,FA) A(FF,FE,FB,FA) A(FF,FE,FB,FA) 
					A(FF,FE,FB,FA) A(FF,FE,FB,FA) A(FF,FE,FB,FA) A(FF,6B,7E,94) A(FF,9C,AD,BF) A(FF,2F,42,59) A(FF,4B,68,8D) A(FF,B1,C2,D4) A(FF,8C,A0,B5) A(FF,FA,D4,C6) 
					A(FF,FA,D4,C6) A(FF,FA,D4,C6) A(FF,FA,D4,C6) A(FF,FA,D4,C6) A(FF,FA,D4,C6) A(FF,FA,D4,C6) A(FF,FA,D4,C6) A(FF,FA,D4,C6) A(FF,FA,D4,C6) A(FF,6B,7E,94) 
					A(FF,9C,AD,BF) A(FF,2F,42,59) A(FF,4B,68,8D) A(FF,B1,C2,D4) A(FF,8C,A0,B5) A(FF,FE,FB,FA) A(FF,FE,FB,FA) A(FF,FE,FB,FA) A(FF,FE,FB,FA) A(FF,FE,FB,FA) 
					A(FF,FE,FB,FA) A(FF,FE,FB,FA) A(FF,FE,FB,FA) A(FF,FE,FB,FA) A(FF,FE,FB,FA) A(FF,6B,7E,94) A(FF,9C,AD,BF) A(FF,2F,42,59) A(FF,4B,68,8D) A(FF,B1,C2,D4) 
					A(FF,8C,A0,B5) A(FF,F3,D1,C5) A(FF,FA,D4,C6) A(FF,FA,D4,C6) A(FF,FA,D4,C6) A(FF,FA,D4,C6) A(FF,FA,D4,C6) A(FF,FA,D4,C6) A(FF,FA,D4,C6) A(FF,FA,D4,C6) 
					A(FF,F1,CF,C3) A(FF,6B,7E,94) A(FF,9C,AD,BF) A(FF,2F,42,59) A(FF,4B,68,8D) A(FF,B1,C2,D4) A(FF,8C,A0,B5) A(FF,89,9D,B2) A(FF,86,9A,AF) A(FF,83,97,AC) 
					A(FF,80,94,A9) A(FF,7D,91,A6) A(FF,7A,8E,A3) A(FF,77,8A,A0) A(FF,74,87,9D) A(FF,71,84,9A) A(FF,6E,81,97) A(FF,6B,7E,94) A(FF,9C,AD,BF) A(FF,2F,42,59) 
					A(FF,4B,68,8D) A(FF,B1,C2,D4) A(FF,8C,A0,B5) A(FF,89,9D,B2) A(FF,4E,6B,8E) A(FF,47,63,86) A(FF,44,5E,80) A(FF,40,5A,7A) A(FF,3D,55,73) A(FF,3A,51,6D) 
					A(FF,37,4C,67) A(FF,33,48,61) A(FF,34,46,5E) A(FF,6B,7E,94) A(FF,9C,AD,BF) A(FF,2F,42,59) A(FF,4B,68,8D) A(FF,B1,C2,D4) A(FF,8C,A0,B5) A(FF,89,9D,B2) 
					A(FF,4A,68,8C) A(FF,F4,F5,F8) A(FF,EC,EC,EC) A(FF,D8,D8,D8) A(FF,F0,F0,F0) A(FF,F8,F8,F8) A(FF,EA,EA,EA) A(FF,E9,EA,EC) A(FF,30,43,5B) A(FF,6B,7E,94) 
					A(FF,9C,AD,BF) A(FF,2F,42,59) A(FF,4B,68,8D) A(FF,B1,C2,D4) A(FF,A2,B4,C7) A(FF,89,9D,B2) A(FF,4A,68,8C) A(FF,FF,FF,FF) A(FF,6E,82,9B) A(FF,66,79,91) 
					A(FF,F0,F0,F0) A(FF,F8,F8,F8) A(FF,EA,EA,EA) A(FF,F6,F6,F6) A(FF,30,43,5B) A(FF,6B,7E,94) A(FF,9C,AD,BF) A(FF,2F,42,59) A(FF,4B,68,8D) A(FF,8A,A0,B8) 
					A(FF,AF,C1,D2) A(FF,A0,B2,C5) A(FF,4A,68,8C) A(FF,FF,FF,FF) A(FF,44,5E,80) A(FF,40,5A,7A) A(FF,F0,F0,F0) A(FF,F8,F8,F8) A(FF,EA,EA,EA) A(FF,F6,F6,F6) 
					A(FF,30,43,5B) A(FF,6B,7E,94) A(FF,9C,AD,BF) A(FF,2F,42,59) A(9F,4A,68,8C) A(FF,49,66,8A) A(FF,88,9E,B6) A(FF,AE,BF,D1) A(FF,4A,68,8C) A(FF,FF,FF,FF) 
					A(FF,44,5E,80) A(FF,40,5A,7A) A(FF,F0,F0,F0) A(FF,F8,F8,F8) A(FF,EA,EA,EA) A(FF,F6,F6,F6) A(FF,30,43,5B) A(FF,9D,AF,C1) A(FF,9C,AD,BF) A(FF,2F,42,59) 
					A(00,00,00,00) A(9F,48,65,89) A(FF,47,63,86) A(FF,45,60,83) A(FF,43,5E,7F) A(FF,CC,CC,CC) A(FF,CC,CC,CC) A(FF,CC,CC,CC) A(FF,CC,CC,CC) A(FF,CC,CC,CC) 
					A(FF,CC,CC,CC) A(FF,CC,CC,CC) A(FF,35,49,64) A(FF,33,47,60) A(FF,31,44,5D) A(FF,2F,42,59) ;
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