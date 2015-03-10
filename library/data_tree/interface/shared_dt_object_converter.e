note
	component:   "Eiffel Object Modelling Framework"
	description: "shared access to DT_OBJECT_CONVERTER"
	keywords:    "data tree"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2005- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SHARED_DT_OBJECT_CONVERTER

feature -- Access

	dt_object_converter: DT_OBJECT_CONVERTER
		once
			create Result
		end

end


