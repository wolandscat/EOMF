note
	description: "Template class for generated icon resources classes for applications"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- openEHR Foundation <http://www.openehr.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class APPLICATION_ICON_RESOURCES

feature -- Access

	icon_load_agents: HASH_TABLE [FUNCTION [ANY, TUPLE, EV_PIXMAP], STRING]
		deferred
		end

end
