note
	component:   "Eiffel Object Modelling Framework"
	description: "Shared method dispatcher"
	keywords:    "method dispatch"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class SHARED_METHOD_DISPATCHER

inherit

	FEATURE_TYPES
		export 
			{NONE} all;
		end

feature -- Access

	method_dispatcher: METHOD_DISPATCHER
	    once
			create Result.make(True, True)
	    end

end
	
