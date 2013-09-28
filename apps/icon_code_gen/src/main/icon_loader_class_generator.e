note
	component:   "Eiffel Object Modelling Framework"
	description : "[
				   Generator for Eiffel class ICON_RESOURCES_COMPILED, which contains instructions to create 
				   icons (i.e. EV_PIXMAPs) from classes named ICON_XXX, containing RGB bitmap code, which were 
				   themselves generated by the icondbc application.
				   ]"
	keywords:    "embedded icons"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	ICON_LOADER_CLASS_GENERATOR

inherit
	ANY_CLASS_GENERATOR
		redefine
			make
		end

create
	make

feature -- Definitions

	default_class_name: STRING = "ICON_RESOURCES_COMPILED"

feature -- Initialisation

	make (an_author_note, a_support_note, a_copyright_note: STRING)
		do
			precursor (an_author_note, a_support_note, a_copyright_note)
			create icon_class_names.make (0)
		end

feature -- Access

	icon_class_names: HASH_TABLE [STRING, STRING]
			-- table of icon class names keyed by icon resource key

feature -- Modification

	add_icon_class_name (a_class_name, a_key: STRING)
		do
			icon_class_names.extend (a_class_name, a_key)
		end

feature {NONE} -- Implementation

	generate_body
		local
			load_feat_str: STRING
		do
			output.append (lazy_load_features)
			output.append ("%N")

			output.append (load_feature_top)
			across icon_class_names as icons_csr loop
				load_feat_str := load_feature_body_element.twin
				load_feat_str.replace_substring_all ("$ICON_CLASS_NAME", icons_csr.item)
				load_feat_str.replace_substring_all ("$ICON_KEY", icons_csr.key)
				output.append (load_feat_str)
			end
			output.append (load_feature_bottom)
		end

feature {NONE} -- Boilerplate

	class_inherit_clause: STRING = "[
inherit
	ICON_RESOURCES
		redefine
			can_lazy_load, lazy_load
		end

	]"

	class_create_clause: STRING = "[
create
	make

	]"

	class_initialisation: STRING = "[
	]"

	lazy_load_features: STRING = "[
feature {NONE} -- Implementation

	can_lazy_load (key: STRING): BOOLEAN
			-- True if icon resource `key' can be lazy-loaded
		do
			Result := load_icon_agents.has (key)
		end

	lazy_load (key: STRING)
			-- load icon into main table
		do
			check attached load_icon_agents.item (key) as load_agt then
				icon_pixmaps.put (load_agt.item ([]), key)
			end
		end

	]"

	load_feature_top: STRING = "[
	load_icon_agents: HASH_TABLE [FUNCTION [ANY, TUPLE, EV_PIXMAP], STRING]
			-- create pixmap table from pixmap classes
		once
			create Result.make (0)

	]"

	load_feature_body_element: STRING = "[
			Result.put (agent :EV_PIXMAP do Result := (create {$ICON_CLASS_NAME}.make).to_pixmap end, "$ICON_KEY")

	]"

	load_feature_bottom: STRING = "[
		end

	]"

end

