note
	description: "Icon loader class generated by icon_code_gen"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class APP_ICON_RESOURCES

inherit
	APPLICATION_ICON_RESOURCES


feature -- Access

	icon_load_agents: HASH_TABLE [FUNCTION [ANY, TUPLE, EV_PIXMAP], STRING]
			-- create pixmap table from pixmap classes
		once
			create Result.make (0)
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_ANNOTATIONS}.make).to_pixmap end, "annotations")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_CLASS_ABSTRACT}.make).to_pixmap end, "class_abstract")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_CLASS_CONCRETE}.make).to_pixmap end, "class_concrete")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_CLASS_CONCRETE_SUPERTYPE}.make).to_pixmap end, "class_concrete_supertype")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_CLASS_CONTAINER_TYPE_ABSTRACT}.make).to_pixmap end, "class_container_type_abstract")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_CLASS_CONTAINER_TYPE_CONCRETE}.make).to_pixmap end, "class_container_type_concrete")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_CLASS_ENUMERATION}.make).to_pixmap end, "class_enumeration")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_CLASS_GENERIC_ABSTRACT}.make).to_pixmap end, "class_generic_abstract")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_CLASS_GENERIC_CONCRETE}.make).to_pixmap end, "class_generic_concrete")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_CLASS_GENERIC_EFFECTIVE}.make).to_pixmap end, "class_generic_effective")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_CLASS_PRIMITIVE}.make).to_pixmap end, "class_primitive")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_CLASS_TOOL}.make).to_pixmap end, "class_tool")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_CLASS_TOOL_NEW}.make).to_pixmap end, "class_tool_new")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_COMPILE}.make).to_pixmap end, "compile")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_CONSOLE}.make).to_pixmap end, "console")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_DESCENDANTS}.make).to_pixmap end, "descendants")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_DESCRIPTION}.make).to_pixmap end, "description")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_DIFF}.make).to_pixmap end, "diff")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_DIFF32}.make).to_pixmap end, "diff32")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_DIFF_CLASS}.make).to_pixmap end, "diff_class")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_EDIT}.make).to_pixmap end, "edit")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_EDIT_ACTIVE}.make).to_pixmap end, "edit_active")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_EDIT_INACTIVE}.make).to_pixmap end, "edit_inactive")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_ERRORS}.make).to_pixmap end, "errors")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_ERRORS_GREY}.make).to_pixmap end, "errors_grey")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_FLAT}.make).to_pixmap end, "flat")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_FLAT_CLASS}.make).to_pixmap end, "flat_class")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_GENERIC_PARAMETER}.make).to_pixmap end, "generic_parameter")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_GENERIC_PARAMETER_CONSTRAINED}.make).to_pixmap end, "generic_parameter_constrained")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_GLOBE}.make).to_pixmap end, "globe")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_GO}.make).to_pixmap end, "go")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_HISTORY_BACK}.make).to_pixmap end, "history_back")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_HISTORY_FORWARD}.make).to_pixmap end, "history_forward")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_INFO}.make).to_pixmap end, "info")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_MAGNIFIER}.make).to_pixmap end, "magnifier")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_METRICS}.make).to_pixmap end, "metrics")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_METRICS_GREY}.make).to_pixmap end, "metrics_grey")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_NODE_MAP}.make).to_pixmap end, "node_map")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_OPEN_ARCHETYPE}.make).to_pixmap end, "open_archetype")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_PARSE}.make).to_pixmap end, "parse")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_PARSE_ERRORS}.make).to_pixmap end, "parse_errors")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_PAUSE}.make).to_pixmap end, "pause")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_PROPERTIES}.make).to_pixmap end, "properties")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_REDO_INACTIVE}.make).to_pixmap end, "redo_inactive")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_SAVE}.make).to_pixmap end, "save")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_SERIALISED}.make).to_pixmap end, "serialised")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_STAR}.make).to_pixmap end, "star")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_STOP}.make).to_pixmap end, "stop")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_TEST_FAILED}.make).to_pixmap end, "test_failed")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_TEST_NOT_APPLICABLE}.make).to_pixmap end, "test_not_applicable")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_TEST_PASSED}.make).to_pixmap end, "test_passed")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_TOOLS}.make).to_pixmap end, "tools")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_TREE_COLLAPSE}.make).to_pixmap end, "tree_collapse")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_TREE_COLLAPSE_ALL}.make).to_pixmap end, "tree_collapse_all")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_TREE_EXPAND}.make).to_pixmap end, "tree_expand")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_TREE_EXPAND_ALL}.make).to_pixmap end, "tree_expand_all")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_UNDO_INACTIVE}.make).to_pixmap end, "undo_inactive")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_VALIDITY_ERRORS}.make).to_pixmap end, "validity_errors")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_WARNINGS}.make).to_pixmap end, "warnings")
			Result.put (agent :EV_PIXMAP do Result := (create {ICON_XML}.make).to_pixmap end, "xml")
		end
end