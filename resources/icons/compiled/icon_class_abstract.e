note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_CLASS_ABSTRACT

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "class_abstract"
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
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,2F,B6,F1) A(FF,2B,BA,F7) A(FF,29,BC,FB) A(FF,29,BE,FF) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,36,AD,E0) A(FF,33,B1,E7) A(FF,2F,B2,EB) A(FF,2F,B6,F1) 
					A(FF,2C,B8,F4) A(FF,29,BC,FB) A(FF,29,BD,FD) A(FF,29,BE,FF) A(FF,38,C1,FC) A(FF,54,C2,F2) A(FF,62,C4,EE) A(FF,78,C6,EA) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,36,AD,E0) A(FF,34,AF,E4) A(FF,2F,B2,EB) A(FF,2F,B5,EF) A(FF,2C,B8,F4) A(FF,2B,BA,F7) A(FF,29,BD,FD) A(FF,29,BE,FF) A(FF,38,C1,FC) 
					A(FF,45,C1,F7) A(FF,62,C4,EE) A(FF,6C,C5,EC) A(FF,7F,CA,ED) A(FF,85,CF,EF) A(00,00,00,00) A(FF,36,AB,DE) A(FF,34,AF,E4) A(FF,33,B1,E7) A(FF,2F,B5,EF) 
					A(FF,2F,B6,F1) A(FF,2B,BA,F7) A(FF,29,BC,FB) A(FF,29,BE,FF) A(FF,29,BE,FF) A(FF,45,C1,F7) A(FF,54,C2,F2) A(FF,6C,C5,EC) A(FF,78,C6,EA) A(FF,85,CF,EF) 
					A(FF,8D,D1,F1) A(FF,9D,D9,F5) A(FF,36,AD,E0) A(FF,33,B1,E7) A(FF,2F,B2,EB) A(FF,2F,B6,F1) A(FF,2C,B8,F4) A(FF,29,BC,FB) A(FF,29,BD,FD) A(FF,29,BE,FF) 
					A(FF,38,C1,FC) A(FF,54,C2,F2) A(FF,62,C4,EE) A(FF,78,C6,EA) A(FF,7F,CA,ED) A(FF,8D,D1,F1) A(FF,96,D5,F2) A(FF,A5,DD,F7) A(FF,34,AF,E4) A(FF,2F,B2,EB) 
					A(FF,2F,B5,EF) A(FF,2C,B8,F4) A(FF,2B,BA,F7) A(FF,29,BD,FD) A(FF,29,BE,FF) A(FF,38,C1,FC) A(FF,45,C1,F7) A(FF,62,C4,EE) A(FF,6C,C5,EC) A(FF,7F,CA,ED) 
					A(FF,85,CF,EF) A(FF,96,D5,F2) A(FF,9D,D9,F5) A(FF,AC,E0,F8) A(FF,33,B1,E7) A(FF,2F,B5,EF) A(FF,2F,B6,F1) A(FF,2B,BA,F7) A(FF,29,BC,FB) A(FF,29,BE,FF) 
					A(FF,29,BE,FF) A(FF,45,C1,F7) A(FF,54,C2,F2) A(FF,6C,C5,EC) A(FF,78,C6,EA) A(FF,85,CF,EF) A(FF,8D,D1,F1) A(FF,9D,D9,F5) A(FF,A5,DD,F7) A(FF,B4,E2,FA) 
					A(00,00,00,00) A(FF,2F,B6,F1) A(FF,2C,B8,F4) A(FF,29,BC,FB) A(FF,29,BD,FD) A(FF,29,BE,FF) A(FF,38,C1,FC) A(FF,54,C2,F2) A(FF,62,C4,EE) A(FF,78,C6,EA) 
					A(FF,7F,CA,ED) A(FF,8D,D1,F1) A(FF,96,D5,F2) A(FF,A5,DD,F7) A(FF,AC,E0,F8) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,2B,BA,F7) A(FF,29,BD,FD) 
					A(FF,29,BE,FF) A(FF,38,C1,FC) A(FF,45,C1,F7) A(FF,62,C4,EE) A(FF,6C,C5,EC) A(FF,7F,CA,ED) A(FF,85,CF,EF) A(FF,96,D5,F2) A(FF,9D,D9,F5) A(FF,AC,E0,F8) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,54,C2,F2) A(FF,6C,C5,EC) 
					A(FF,78,C6,EA) A(FF,85,CF,EF) A(FF,8D,D1,F1) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
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