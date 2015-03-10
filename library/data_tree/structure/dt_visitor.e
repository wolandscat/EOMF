note
	component:   "Eiffel Object Modelling Framework"
	description: "Visitor template for Data Tree structures"
	keywords:    "visitor, Data Tree"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2003-2010 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class DT_VISITOR

feature -- Visitor

	start_complex_object_node (a_node: DT_COMPLEX_OBJECT; depth: INTEGER)
			-- start serialising an DT_COMPLEX_OBJECT_NODE
		deferred
		end

	end_complex_object_node (a_node: DT_COMPLEX_OBJECT; depth: INTEGER)
			-- end serialising an DT_COMPLEX_OBJECT_NODE
		deferred
		end

	start_attribute_node (a_node: DT_ATTRIBUTE; depth: INTEGER)
			-- start serialising an DT_ATTRIBUTE_NODE
		deferred
		end

	end_attribute_node (a_node: DT_ATTRIBUTE; depth: INTEGER)
			-- end serialising an DT_ATTRIBUTE_NODE
		deferred
		end

	start_primitive_object (a_node: DT_PRIMITIVE_OBJECT; depth: INTEGER)
			-- start serialising a DT_OBJECT_SIMPLE
		deferred
		end

	end_primitive_object (a_node: DT_PRIMITIVE_OBJECT; depth: INTEGER)
			-- end serialising a DT_OBJECT_SIMPLE
		deferred
		end

	start_primitive_object_list (a_node: DT_PRIMITIVE_OBJECT_LIST; depth: INTEGER)
			-- start serialising an DT_OBJECT_SIMPLE_LIST
		deferred
		end

	end_primitive_object_list (a_node: DT_PRIMITIVE_OBJECT_LIST; depth: INTEGER)
			-- end serialising an DT_OBJECT_SIMPLE_LIST
		deferred
		end

	start_primitive_object_interval (a_node: DT_PRIMITIVE_OBJECT_INTERVAL; depth: INTEGER)
			-- start serialising a DT_OBJECT_SIMPLE
		deferred
		end

	end_primitive_object_interval (a_node: DT_PRIMITIVE_OBJECT_INTERVAL; depth: INTEGER)
			-- end serialising a DT_OBJECT_SIMPLE
		deferred
		end

	start_primitive_object_interval_list (a_node: DT_PRIMITIVE_OBJECT_INTERVAL_LIST; depth: INTEGER)
			-- start serialising a DT_OBJECT_SIMPLE
		deferred
		end

	end_primitive_object_interval_list (a_node: DT_PRIMITIVE_OBJECT_INTERVAL_LIST; depth: INTEGER)
			-- end serialising a DT_OBJECT_SIMPLE
		deferred
		end

	start_object_reference (a_node: DT_OBJECT_REFERENCE; depth: INTEGER)
			-- start serialising a DT_OBJECT_REFERENCE
		deferred
		end

	end_object_reference (a_node: DT_OBJECT_REFERENCE; depth: INTEGER)
			-- end serialising a DT_OBJECT_REFERENCE
		deferred
		end

	start_object_reference_list (a_node: DT_OBJECT_REFERENCE_LIST; depth: INTEGER)
			-- start serialising a DT_OBJECT_REFERENCE_LIST
		deferred
		end

	end_object_reference_list (a_node: DT_OBJECT_REFERENCE_LIST; depth: INTEGER)
			-- end serialising a DT_OBJECT_REFERENCE_LIST
		deferred
		end

end


