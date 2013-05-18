note
	component:   "Eiffel Object Modelling Framework"
	description: "shared access to LOCALE object"
	keywords:    "locale"

	author:      "Thomas Beale"
	support:     "openEHR support <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2005 Ocean Informatics"
	licence:     "The openEHR Open Source Licence"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class SHARED_LOCALE

feature -- Shared Access

	locale: LOCALE
		once
			create Result.make
		end

end

