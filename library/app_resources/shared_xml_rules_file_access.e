note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Shared access to ODIN->XML conversion rules file access object. Inherit into application
				 root class only, and make the call set_xml_load_rules_agent.
				 ]"
	keywords:    "config, XML"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011-2012 openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SHARED_XML_RULES_FILE_ACCESS

inherit
	SHARED_APP_RESOURCES

	SHARED_XML_RULES

feature -- Access

	xml_rules_cfg: CONFIG_FILE_ACCESS
			-- accessor object for application config file
		local
			p: STRING
		once
			if file_system.file_exists (xml_rules_file_path) then
				p := xml_rules_file_path
			else
				p := Default_xml_rules_file_path
			end
			create Result.make (create {ODIN_CONFIG_FILE_ACCESS}.make)
			Result.initialise (p)
		end

	xml_rules_load: detachable XML_RULES
			-- load rules or else create new
		do
			if attached {XML_RULES} xml_rules_cfg.object_value ("/", ({XML_RULES}).name) as x then
				Result := x
			end
		end

feature -- Commands

	set_xml_load_rules_agent
		do
			xml_load_rules_agent_cache.put (agent xml_rules_load)
		end

end

