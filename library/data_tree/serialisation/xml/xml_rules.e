note
	component:   "Eiffel Object Modelling Framework"
	description: "Object containing rules for controlling XML serialisation of DT graphs. Designed to be populated from an ODIN file."
	keywords:    "serialisation, XML"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class XML_RULES

create
	make

feature -- Initialisation

	make
		do
			create serialisation_rules.make (0)
		end

feature -- Access

	serialisation_rules: HASH_TABLE [XML_SERIALISATION_RULES, STRING]
			-- set of rules, keyed by class name to which they apply

end


