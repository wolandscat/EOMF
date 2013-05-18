note
	component:   "Eiffel Object Modelling Framework"
	description: "Serialise DT tree to OWL"
	keywords:    "serialisation, OWL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003, 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class DT_OWL_SERIALISER

inherit
	DT_SERIALISER

create
	make

feature -- Modification

	start_complex_object_node(a_node: DT_COMPLEX_OBJECT_NODE; depth: INTEGER)
			-- start serialising an DT_COMPLEX_OBJECT_NODE
		do
		end

	end_complex_object_node(a_node: DT_COMPLEX_OBJECT_NODE; depth: INTEGER)
			-- end serialising an DT_COMPLEX_OBJECT_NODE
		do
		end

	start_attribute_node(a_node: DT_ATTRIBUTE_NODE; depth: INTEGER)
			-- start serialising an DT_ATTRIBUTE_NODE
		do
		end

	end_attribute_node(a_node: DT_ATTRIBUTE_NODE; depth: INTEGER)
			-- end serialising an DT_ATTRIBUTE_NODE
		do
		end

	start_primitive_object(a_node: DT_PRIMITIVE_OBJECT; depth: INTEGER)
			-- start serialising a DT_PRIMITIVE_OBJECT
		do
		end

	end_primitive_object(a_node: DT_PRIMITIVE_OBJECT; depth: INTEGER)
			-- end serialising a DT_PRIMITIVE_OBJECT
		do
		end

	start_primitive_object_list(a_node: DT_PRIMITIVE_OBJECT_LIST; depth: INTEGER)
			-- start serialising an DT_PRIMITIVE_OBJECT_LIST
		do
		end

	end_primitive_object_list(a_node: DT_PRIMITIVE_OBJECT_LIST; depth: INTEGER)
			-- end serialising an DT_PRIMITIVE_OBJECT_LIST
		do
		end

	start_primitive_object_interval(a_node: DT_PRIMITIVE_OBJECT_INTERVAL; depth: INTEGER)
			-- start serialising a DT_PRIMITIVE_OBJECT_INTERVAL
		do
		end

	end_primitive_object_interval(a_node: DT_PRIMITIVE_OBJECT_INTERVAL; depth: INTEGER)
			-- end serialising a DT_PRIMITIVE_OBJECT_INTERVAL
		do
		end

	start_object_reference(a_node: DT_OBJECT_REFERENCE; depth: INTEGER)
			-- start serialising a DT_OBJECT_REFERENCE
		do
		end

	end_object_reference(a_node: DT_OBJECT_REFERENCE; depth: INTEGER)
			-- end serialising a DT_OBJECT_REFERENCE
		do
		end

	start_object_reference_list(a_node: DT_OBJECT_REFERENCE_LIST; depth: INTEGER)
			-- start serialising a DT_OBJECT_REFERENCE_LIST
		do
		end

	end_object_reference_list(a_node: DT_OBJECT_REFERENCE_LIST; depth: INTEGER)
			-- end serialising a DT_OBJECT_REFERENCE_LIST
		do
		end

end


