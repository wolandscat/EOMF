note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_TEST_NOT_APPLICABLE

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "test_not_applicable"
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
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,24,24,92) A(FF,55,55,AA) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,24,24,92) A(FF,55,55,AA) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,D1,D1,E7) A(FF,3F,3F,9F) A(FF,3F,3F,9F) A(FF,3F,3F,9F) A(FF,91,91,C8) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,88,88,C3) A(FF,1B,1B,8D) 
					A(FF,D4,D4,E9) A(FF,91,91,C8) A(FF,3F,3F,9F) A(FF,3F,3F,9F) A(FF,A3,A3,D1) A(00,00,00,00) A(FF,C2,C2,E0) A(FF,00,00,80) A(FF,2D,2D,96) A(FF,C5,C5,E1) 
					A(FF,00,00,80) A(FF,AA,AA,D4) A(00,00,00,00) A(FF,E6,E6,F2) A(FF,48,48,A4) A(FF,48,48,A4) A(00,00,00,00) A(FF,DA,DA,EC) A(FF,BF,BF,DF) A(FF,88,88,C3) 
					A(FF,00,00,80) A(FF,C2,C2,E0) A(FF,C2,C2,E0) A(FF,00,00,80) A(FF,B6,B6,DA) A(FF,CE,CE,E6) A(FF,00,00,80) A(FF,AA,AA,D4) A(00,00,00,00) A(FF,9D,9D,CE) 
					A(FF,00,00,80) A(FF,DA,DA,EC) A(FF,D4,D4,E9) A(FF,36,36,9B) A(FF,67,67,B3) A(FF,5B,5B,AD) A(FF,00,00,80) A(FF,C2,C2,E0) A(FF,C2,C2,E0) A(FF,00,00,80) 
					A(FF,B6,B6,DA) A(FF,CE,CE,E6) A(FF,00,00,80) A(FF,AA,AA,D4) A(FF,E3,E3,F0) A(FF,27,27,93) A(FF,75,75,BA) A(FF,F5,F5,FA) A(FF,AA,AA,D4) A(FF,00,00,80) 
					A(FF,CD,CD,E6) A(FF,B5,B5,DA) A(FF,00,00,80) A(FF,C2,C2,E0) A(FF,D1,D1,E7) A(FF,3F,3F,9F) A(FF,C8,C8,E3) A(FF,DA,DA,EC) A(FF,3F,3F,9F) A(FF,BF,BF,DE) 
					A(FF,A9,A9,D4) A(FF,18,18,8C) A(FF,B5,B5,DA) A(00,00,00,00) A(00,00,00,00) A(FF,91,91,C8) A(FF,3F,3F,9F) A(FF,3F,3F,9F) A(FF,3F,3F,9F) A(FF,D1,D1,E7) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,18,18,8C) A(FF,61,61,B0) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,C5,C5,E2) A(FF,D7,D7,EB) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
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