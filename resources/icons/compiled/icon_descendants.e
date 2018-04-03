note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_DESCENDANTS

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "descendants"
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
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,A6,63,2C) A(FF,B2,6C,2C) A(FF,BE,75,2C) A(FF,CB,7E,2C) A(FF,D0,88,29) 
					A(FF,D2,8E,28) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,99,5A,2C) 
					A(FF,9F,5F,2C) A(FF,AC,68,2C) A(FF,B8,71,2C) A(FF,C5,7A,2C) A(FF,CD,83,2B) A(FF,D2,8E,28) A(FF,D4,93,26) A(FF,D9,9E,23) A(FF,DE,A8,20) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,93,56,2B) A(FF,9F,5F,2C) A(FF,A6,63,2C) A(FF,B2,6C,2C) A(FF,BE,75,2C) A(FF,CB,7E,2C) 
					A(FF,D0,88,29) A(FF,D4,93,26) A(FF,D7,98,25) A(FF,DC,A3,22) A(FF,E0,AD,1F) A(FF,E5,B8,1C) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,99,5A,2C) A(FF,A6,63,2C) A(FF,AC,68,2C) A(FF,B8,71,2C) A(FF,C5,7A,2C) A(FF,CD,83,2B) A(FF,D2,8E,28) A(FF,D7,98,25) A(FF,D9,9E,23) A(FF,DE,A8,20) 
					A(FF,E3,B2,1E) A(FF,E8,BD,1B) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,AC,68,2C) A(FF,B2,6C,2C) A(FF,BE,75,2C) 
					A(FF,CB,7E,2C) A(FF,D0,88,29) A(FF,D4,93,26) A(FF,D9,9E,23) A(FF,DC,A3,22) A(FF,E0,AD,1F) A(FF,E5,B8,1C) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,C5,7A,2C) A(FF,CD,83,2B) A(FF,D2,8E,28) A(FF,D7,98,25) A(FF,DC,A3,22) 
					A(FF,DE,A8,20) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,00) A(00,00,00,00) A(FF,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,00,00,00) A(00,00,00,00) A(FF,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,00) A(FF,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,00) A(FF,00,00,00) 
					A(FF,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,29,6C,C9) A(FF,2A,70,D0) A(FF,44,85,D8) A(FF,5F,99,E0) A(FF,7A,AE,E8) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,29,6C,C9) A(FF,2A,70,D0) A(FF,44,85,D8) A(FF,5F,99,E0) A(FF,7A,AE,E8) A(00,00,00,00) A(FF,29,6C,C9) A(FF,2A,70,D0) A(FF,44,85,D8) A(FF,5F,99,E0) 
					A(FF,7A,AE,E8) A(FF,94,C3,EF) A(FF,AE,D7,F7) A(00,00,00,00) A(00,00,00,00) A(FF,29,6C,C9) A(FF,2A,70,D0) A(FF,44,85,D8) A(FF,5F,99,E0) A(FF,7A,AE,E8) 
					A(FF,94,C3,EF) A(FF,AE,D7,F7) A(FF,2A,70,D0) A(FF,44,85,D8) A(FF,5F,99,E0) A(FF,7A,AE,E8) A(FF,94,C3,EF) A(FF,AE,D7,F7) A(FF,C9,EC,FF) A(00,00,00,00) 
					A(00,00,00,00) A(FF,2A,70,D0) A(FF,44,85,D8) A(FF,5F,99,E0) A(FF,7A,AE,E8) A(FF,94,C3,EF) A(FF,AE,D7,F7) A(FF,C9,EC,FF) A(FF,44,85,D8) A(FF,5F,99,E0) 
					A(FF,7A,AE,E8) A(FF,94,C3,EF) A(FF,AE,D7,F7) A(FF,C9,EC,FF) A(FF,AB,CF,E6) A(00,00,00,00) A(00,00,00,00) A(FF,44,85,D8) A(FF,5F,99,E0) A(FF,7A,AE,E8) 
					A(FF,94,C3,EF) A(FF,AE,D7,F7) A(FF,C9,EC,FF) A(FF,AB,CF,E6) A(00,00,00,00) A(FF,7A,AE,E8) A(FF,94,C3,EF) A(FF,AE,D7,F7) A(FF,C9,EC,FF) A(FF,AB,CF,E6) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,7A,AE,E8) A(FF,94,C3,EF) A(FF,AE,D7,F7) A(FF,C9,EC,FF) A(FF,AB,CF,E6) A(00,00,00,00) 
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