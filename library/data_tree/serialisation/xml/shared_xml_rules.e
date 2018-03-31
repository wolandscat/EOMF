note
	component:   "Eiffel Object Modelling Framework"
	description: "Object containing rules for controlling XML serialisation and deserialisation in ADL Workbench"
	keywords:    "serialisation, XML"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SHARED_XML_RULES

feature -- Definitions

	xsi_type_marker: IMMUTABLE_STRING_8
		once
			create Result.make_from_string ("xsi:type")
		end

feature -- Access

	xml_rules: XML_RULES
			-- set of rules to do with IM class, keyed by class name to which they apply
		do
			if xml_rules_out_of_date then
				if attached xml_load_rules_agent_cache.item as load_agt and then attached load_agt.item ([]) as x then
					Result := x
				else
					create Result.make
				end
				xml_rules_cache.put (Result)
			elseif attached xml_rules_cache.item as xr then
				Result := xr
			else
				create Result.make
			end
		end

feature -- Status Report

	xml_rules_out_of_date: BOOLEAN
			-- True if rules have changed and need to be reread
		do
			Result := not attached xml_rules_cache.item
		end

feature -- Element change

	mark_xml_rules_put_of_date
			-- force later re-read of rules; assumes changes have not been committed yet, but will be
		do
			xml_rules_cache.put (Void)
		end

feature {NONE} -- Implementation

	xml_rules_cache: CELL [detachable XML_RULES]
		once ("PROCESS") 
			create Result.put (Void)
		end

	xml_load_rules_agent_cache: CELL [detachable FUNCTION [ANY, TUPLE, detachable XML_RULES]]
			-- rule loader
		once ("PROCESS") 
			create Result.put (Void)
		end

end


