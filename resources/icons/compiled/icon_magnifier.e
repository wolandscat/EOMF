note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_MAGNIFIER

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "magnifier"
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
					A(00,00,00,00) A(00,00,00,00) A(FF,E5,EF,F6) A(FF,9D,C4,DE) A(FF,62,A0,CB) A(FF,3B,87,BD) A(FF,62,A0,CB) A(FF,9D,C4,DE) A(FF,E5,EF,F6) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,E5,EF,F6) A(FF,7C,AE,D2) A(FF,36,83,BA) 
					A(FF,36,83,BA) A(FF,36,83,BA) A(FF,36,83,BA) A(FF,36,83,BA) A(FF,7C,AE,D2) A(FF,E5,EF,F6) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,9D,C1,DB) A(FF,35,80,B7) A(FF,84,B1,D2) A(FF,E3,ED,F5) A(FF,FE,FE,FE) A(FF,E3,ED,F5) A(FF,84,B1,D2) 
					A(FF,35,80,B7) A(FF,9D,C1,DB) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,62,99,C4) 
					A(FF,35,7D,B4) A(FF,E3,ED,F4) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,E3,ED,F4) A(FF,35,7D,B4) A(FF,62,99,C4) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,39,7D,B2) A(FF,34,79,B0) A(FF,FE,FE,FE) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,FE,FE,FE) A(FF,34,79,B0) A(FF,39,7D,B2) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,60,93,BE) A(FF,33,75,AC) A(FF,E2,EB,F3) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,E2,EB,F3) A(FF,33,75,AC) A(FF,60,93,BE) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,95,B6,D2) A(FF,32,71,A7) A(FF,82,A8,C9) 
					A(FF,E2,EB,F2) A(FF,FE,FE,FE) A(FF,E2,EB,F2) A(FF,82,A8,C9) A(FF,32,71,A7) A(FF,9B,BA,D4) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,F0,F4,F8) A(FF,56,86,B3) A(FF,49,7D,AD) A(FF,32,6C,A3) A(FF,32,6C,A3) A(FF,32,6C,A3) A(FF,32,6C,A3) A(FF,32,6C,A3) 
					A(FF,7A,A0,C3) A(FF,E5,EC,F3) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,F0,F4,F8) A(FF,59,86,B1) A(FF,31,68,9E) 
					A(FF,46,77,A8) A(FF,91,AE,CB) A(FF,5E,89,B3) A(FF,36,6C,A0) A(FF,5E,89,B3) A(FF,9B,B5,D0) A(FF,E5,EC,F2) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,F0,F4,F7) A(FF,58,82,AE) A(FF,30,64,9A) A(FF,48,76,A5) A(FF,E7,EC,F3) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,F0,F3,F7) A(FF,58,7F,AA) A(FF,2F,60,96) 
					A(FF,47,72,A2) A(FF,E6,EC,F2) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,FC,FD,FD) A(FF,5D,81,AB) A(FF,2F,5D,93) A(FF,47,70,A0) A(FF,E6,EB,F2) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,C4,D0,DF) 
					A(FF,4B,71,9F) A(FF,E6,EB,F2) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,FC,FD,FD) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
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