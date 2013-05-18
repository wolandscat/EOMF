note
	component:   "Eiffel Object Modelling Framework"
	description: "Object containing rules for controlling XML serialisation of DT graphs. Designed to be populated by reading an ODIN file."
	keywords:    "serialisation, XML"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "openEHR AWB project <http://www.openehr.org/issues/browse/AWB>"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class XML_IM_CLASS_SERIALISATION_RULES

create
	make

feature -- Initialisation

	make
		do
		end

feature -- Access

	convert_to_xml_attr_attr_names: ARRAYED_LIST [STRING]
			-- set of IM class attribute names that should become, along with their value, an XML attribute on the enclosing XML tag
        attribute
            create Result.make (0)
        end

feature -- Status Report

	output_dt_im_type_name_as_xml_attr: BOOLEAN
			-- True if DT_OBJECT.im_type_name should be output as an XML attribute

feature -- Element Change

	merge (other: XML_IM_CLASS_SERIALISATION_RULES)
			-- merge in rules in `other'
		do
			convert_to_xml_attr_attr_names.append (other.convert_to_xml_attr_attr_names)
			output_dt_im_type_name_as_xml_attr := output_dt_im_type_name_as_xml_attr or other.output_dt_im_type_name_as_xml_attr
		end

end


