note
	description: "Icon loader class generated by icondbc"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_XML

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "xml"
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
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) 
					A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,00,00,00) A(FF,F8,F8,F8) 
					A(FF,FB,FB,FB) A(FF,FC,FC,FC) A(FF,FC,FC,FC) A(FF,FC,FC,FC) A(FF,FC,FC,FC) A(FF,FC,FC,FC) A(FF,FC,FC,FC) A(FF,F8,F8,F8) A(FF,94,94,94) A(FF,00,00,00) 
					A(FF,00,00,00) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,00,00,00) A(FF,FB,FB,FB) A(FF,F4,F4,F4) A(FF,F5,F5,F5) A(FF,F5,F5,F5) A(FF,F5,F5,F5) 
					A(FF,F1,F1,F1) A(FF,EF,EF,EF) A(FF,E9,E9,E9) A(FF,FC,FC,FC) A(FF,E7,E7,E7) A(FF,95,95,95) A(FF,00,00,00) A(FF,00,00,00) A(FF,FF,FF,FF) A(FF,00,00,00) 
					A(FF,00,00,00) A(FF,FC,FC,FC) A(FF,F7,F7,F7) A(FF,F9,F9,F9) A(FF,F7,F7,F7) A(FF,F7,F7,F7) A(FF,F3,F3,F3) A(FF,F0,F0,F0) A(FF,EA,EA,EA) A(FF,FC,FC,FC) 
					A(FF,F6,F6,F6) A(FF,F4,F4,F4) A(FF,99,99,99) A(FF,00,00,00) A(FF,FF,FF,FF) A(FF,00,00,00) A(FF,00,00,00) A(FF,F0,F5,FA) A(FF,F9,F9,F9) A(FF,F9,F9,F9) 
					A(FF,F9,F9,F9) A(FF,F7,F7,F7) A(FF,F6,F6,F6) A(FF,F2,F2,F2) A(FF,EB,EB,EB) A(FF,FC,FC,FC) A(FF,FC,FC,FC) A(FF,FC,FC,FC) A(FF,FC,FC,FC) A(FF,00,00,00) 
					A(FF,FF,FF,FF) A(FF,00,00,00) A(FF,0B,1F,33) A(FF,71,B3,EA) A(FF,62,AF,E8) A(FF,FC,FC,FC) A(FF,67,B7,EC) A(FF,72,B7,EB) A(FF,EC,F1,F7) A(FF,F5,F5,F5) 
					A(FF,F1,F1,F1) A(FF,EC,EC,EC) A(FF,EA,EA,EA) A(FF,E6,E6,E6) A(FF,FC,FC,FC) A(FF,00,00,00) A(FF,FF,FF,FF) A(FF,2D,7F,D3) A(FF,44,92,D8) A(FF,72,B6,EB) 
					A(FF,65,A9,E8) A(FF,FC,FC,FC) A(FF,6A,B5,EB) A(FF,76,BB,EC) A(FF,70,B0,EA) A(FF,EA,EF,F6) A(FF,F5,F5,F5) A(FF,F2,F2,F2) A(FF,EF,EF,EF) A(FF,ED,ED,ED) 
					A(FF,FC,FC,FC) A(FF,00,00,00) A(FF,2E,84,DE) A(FF,5B,AB,E9) A(FF,71,B5,EA) A(FF,65,A7,E8) A(FF,E5,ED,F8) A(FF,FC,FC,FC) A(FF,E6,EF,F9) A(FF,66,AE,E9) 
					A(FF,71,B5,EA) A(FF,5D,A8,E8) A(FF,B0,C9,ED) A(FF,F6,F6,F6) A(FF,F3,F3,F3) A(FF,F2,F2,F2) A(FF,FC,FC,FC) A(FF,00,00,00) A(FF,57,A7,E7) A(FF,79,B8,EC) 
					A(FF,58,A4,E5) A(FF,D1,DF,F4) A(FF,FC,FC,FC) A(FF,FC,FC,FC) A(FF,FC,FC,FC) A(FF,D2,E1,F5) A(FF,5B,A6,E6) A(FF,75,B2,E9) A(FF,5A,9E,E4) A(FF,F4,F5,F8) 
					A(FF,F6,F6,F6) A(FF,F6,F6,F6) A(FF,FC,FC,FC) A(FF,00,00,00) A(FF,27,73,D9) A(FF,55,9F,E5) A(FF,6A,AA,E8) A(FF,5F,9C,E4) A(FF,E5,EB,F8) A(FF,FC,FC,FC) 
					A(FF,E5,ED,F8) A(FF,62,A2,E5) A(FF,6A,AA,E8) A(FF,57,9C,E3) A(FF,AF,C5,ED) A(FF,F9,F9,F9) A(FF,F9,F9,F9) A(FF,F8,F8,F8) A(FF,FC,FC,FC) A(FF,00,00,00) 
					A(FF,FF,FF,FF) A(FF,1F,5F,C9) A(FF,39,78,CF) A(FF,65,A3,E5) A(FF,5D,94,E1) A(FF,FC,FC,FC) A(FF,61,A0,E5) A(FF,68,A8,E7) A(FF,67,9B,E3) A(FF,EB,F0,F8) 
					A(FF,FA,FA,FA) A(FF,FA,FA,FA) A(FF,F8,F8,F8) A(FF,F8,F8,F8) A(FF,FC,FC,FC) A(FF,00,00,00) A(FF,FF,FF,FF) A(FF,00,00,00) A(FF,06,14,2F) A(FF,65,95,E1) 
					A(FF,55,90,E0) A(FF,FC,FC,FC) A(FF,59,9A,E3) A(FF,67,99,E3) A(FF,EE,F1,F8) A(FF,FA,FA,FA) A(FF,FA,FA,FA) A(FF,FA,FA,FA) A(FF,FA,FA,FA) A(FF,FA,FA,FA) 
					A(FF,FC,FC,FC) A(FF,00,00,00) A(FF,FF,FF,FF) A(FF,00,00,00) A(FF,00,00,00) A(FF,FC,FC,FC) A(FF,FC,FC,FC) A(FF,FC,FC,FC) A(FF,FC,FC,FC) A(FF,FC,FC,FC) 
					A(FF,FB,FB,FB) A(FF,FB,FB,FB) A(FF,FB,FB,FB) A(FF,FB,FB,FB) A(FF,FB,FB,FB) A(FF,FB,FB,FB) A(FF,FC,FC,FC) A(FF,00,00,00) A(FF,FF,FF,FF) A(FF,00,00,00) 
					A(FF,00,00,00) A(FF,FC,FC,FC) A(FF,FC,FC,FC) A(FF,FC,FC,FC) A(FF,FC,FC,FC) A(FF,FC,FC,FC) A(FF,FC,FC,FC) A(FF,FC,FC,FC) A(FF,FC,FC,FC) A(FF,FC,FC,FC) 
					A(FF,FC,FC,FC) A(FF,FC,FC,FC) A(FF,FC,FC,FC) A(FF,00,00,00) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,00,00,00) A(FF,F9,F9,F9) A(FF,FC,FC,FC) A(FF,FC,FC,FC) 
					A(FF,FC,FC,FC) A(FF,FC,FC,FC) A(FF,FC,FC,FC) A(FF,FC,FC,FC) A(FF,FC,FC,FC) A(FF,FC,FC,FC) A(FF,FC,FC,FC) A(FF,FC,FC,FC) A(FF,F9,F9,F9) A(FF,00,00,00) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) 
					A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) ;
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