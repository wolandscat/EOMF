note
	description: "Icon loader class generated by icondbc"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ICON_HISTORY_FORWARD

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "history_forward"
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
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,0E,23,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,6F,A1,41) A(FF,3E,6A,1A) A(FF,15,20,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,99,BC,68) A(FF,DB,E8,A2) A(FF,6B,9C,39) A(FF,10,20,04) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,10,1F,04) A(FF,20,3E,08) A(FF,20,3E,08) A(FF,20,3E,08) A(FF,20,3E,08) A(FF,20,3E,08) 
					A(FF,20,3E,08) A(FF,20,3E,08) A(FF,94,B7,5E) A(FF,DF,ED,99) A(FF,E1,ED,9F) A(FF,96,BA,60) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,20,3C,07) A(FF,DF,EC,9D) A(FF,D9,E9,92) A(FF,D9,E9,92) A(FF,D9,E9,92) A(FF,D9,E9,92) A(FF,D9,E9,92) A(FF,D9,E9,92) A(FF,D6,E7,8C) A(FF,D3,E6,86) 
					A(FF,D3,E6,86) A(FF,D5,E7,8A) A(FF,B8,D0,79) A(FF,43,68,1C) A(FF,0F,1E,02) A(00,00,00,00) A(FF,20,3A,06) A(FF,CD,E1,80) A(FF,C4,DD,71) A(FF,C4,DD,71) 
					A(FF,C4,DD,71) A(FF,C4,DD,71) A(FF,C4,DD,71) A(FF,C4,DD,71) A(FF,C4,DD,71) A(FF,C4,DD,71) A(FF,C4,DD,71) A(FF,C4,DD,71) A(FF,C5,DD,73) A(FF,C5,DB,7C) 
					A(FF,6E,99,37) A(FF,20,3D,02) A(FF,1F,38,05) A(FF,AC,CE,49) A(FF,9F,C6,33) A(FF,9F,C6,33) A(FF,9F,C6,33) A(FF,9F,C6,33) A(FF,9F,C6,33) A(FF,9F,C6,33) 
					A(FF,9F,C6,33) A(FF,9F,C6,33) A(FF,9F,C6,33) A(FF,9F,C6,33) A(FF,9F,C6,33) A(FF,9F,C6,34) A(FF,B1,D1,52) A(FF,64,8F,29) A(FF,1F,36,04) A(FF,8D,BC,1E) 
					A(FF,7A,B0,03) A(FF,7A,B0,03) A(FF,7A,B0,03) A(FF,7A,B0,03) A(FF,7A,B0,03) A(FF,7A,B0,03) A(FF,7A,B0,03) A(FF,7A,B0,03) A(FF,7A,B0,03) A(FF,7A,B0,03) 
					A(FF,7D,B2,07) A(FF,8D,B8,26) A(FF,5D,88,1C) A(FF,1E,31,02) A(FF,1E,34,03) A(FF,94,BF,35) A(FF,82,B4,1E) A(FF,82,B4,1E) A(FF,82,B4,1E) A(FF,82,B4,1E) 
					A(FF,82,B4,1E) A(FF,82,B4,1E) A(FF,77,AE,10) A(FF,6C,A7,02) A(FF,6C,A7,02) A(FF,76,AD,0F) A(FF,7C,A5,2B) A(FF,37,56,0C) A(FF,0E,1A,01) A(00,00,00,00) 
					A(FF,0F,1A,00) A(FF,1E,33,02) A(FF,1E,33,02) A(FF,1E,33,02) A(FF,1E,33,02) A(FF,1E,33,02) A(FF,1E,33,02) A(FF,1E,33,02) A(FF,63,8E,1B) A(FF,62,A0,03) 
					A(FF,77,AC,1F) A(FF,63,89,20) A(FF,1D,33,01) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,67,90,23) A(FF,73,A2,27) A(FF,4B,6E,10) A(FF,0E,18,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,49,67,12) A(FF,2A,41,01) A(FF,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
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