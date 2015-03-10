note
	component:   "Eiffel Object Modelling Framework"
	description: "Common things for all SML archetypes"
	keywords:    "serialiser, serialisation"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"
	void_safety: "initial"

deferred class ANY_SERIALISER

inherit
	SERIALISER_DEFINITIONS
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

feature -- Definitions

	Buffer_size: INTEGER = 10000
			-- initial size of output buffer

feature -- Initialisation

	make (a_profile: SERIALISATION_PROFILE)
			-- set profile
		do
			profile := a_profile
		end

feature -- Commands

	reset
			-- set up serialiser
		do
			create last_result.make (buffer_size)
		end

feature -- Access

	last_result: STRING
			-- result of last call to serialisation procedures
        attribute
            create Result.make (Buffer_size)
        end

	symbol (sym_id: INTEGER): STRING
			-- retrieve symbol string for `sym_id'
		require
			has_symbol (sym_id)
		do
			create Result.make_empty
			if attached profile.symbols.item (sym_id) as s then
				Result.append (s)
			end
		end

	tag (tag_id: INTEGER): STRING
			-- retrieve tag for `tag_id'
		require
			has_tag (tag_id)
		do
			create Result.make_empty
			if attached profile.tags.item (tag_id) as s then
				Result.append (s)
			end
		end

	format_item (fmt_id: INTEGER): STRING
			-- retrieve formatting string for `fmt_id'
		require
			has_format_item (fmt_id)
		do
			create Result.make_empty
			if attached profile.format_items.item (fmt_id) as s then
				Result.append (s)
			end
		end

	style (style_id: INTEGER): STRING
			-- retrieve formatting string for `style_id'
		require
			has_style (style_id)
		do
			create Result.make_empty
			if attached profile.styles.item (style_id) as s then
				Result.append (s)
			end
		end

	output_format: STRING
			-- output format this serialiser is associated with
		do
			Result := profile.output_format
		end

feature -- Status Report

	has_style (style_id: INTEGER): BOOLEAN
			-- true if `style_id' exists in style table
		do
			Result := profile.styles.has (style_id)
		end

	has_symbol (sym_id: INTEGER): BOOLEAN
			-- true if `sym_id' exists in symbol table
		do
			Result := profile.symbols.has (sym_id)
		end

	has_tag (tag_id: INTEGER): BOOLEAN
			-- true if `tag_id' exists in tag table
		do
			Result := profile.tags.has (tag_id)
		end

	has_format_item (fmt_id: INTEGER): BOOLEAN
			-- true if `fmt_id' exists in format item table
		do
			Result := profile.format_items.has (fmt_id)
		end

feature -- Factory

	apply_style (elem: STRING; a_style: INTEGER): STRING
			-- apply `a_style' to `elem'
		require
			Style_valid: has_style (a_style)
		do
			Result := profile.apply_style (elem, a_style)
		end

	clean (elem: STRING): STRING
			-- clean `elem' using quoting rules of ADL
		do
			Result := profile.clean (elem)
		end

	create_indent (indent_level: INTEGER): STRING
		require
			indent_level >= 0
		do
			Result := profile.create_indent (indent_level)
		end

	safe_comment (a_text: STRING): STRING
			-- make a comment text taken from the ontology safe for inclusion
			-- by removing newlines and restricting its length
		local
			nl_pos: INTEGER
		do
			nl_pos := a_text.index_of('%N', 1)
			if nl_pos > 0 then
				create Result.make(nl_pos - 1)
				Result.append(a_text.substring(1, nl_pos-1))
			else
				Result := a_text
			end
		end

feature {NONE} -- Implementation

	profile: SERIALISATION_PROFILE
			-- generic plugin containing styles, format items, and symbols

end


