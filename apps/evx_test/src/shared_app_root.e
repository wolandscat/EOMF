note
	component:   "Eiffel Object Modelling Framework"
	description: "Shared access to application root object"
	keywords:    "test, EVX"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SHARED_APP_ROOT

feature -- Access

	app_root: APP_ROOT
		once
			create Result.make
		end

end



