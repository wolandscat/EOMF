note
	component:   "Eiffel Object Modelling Framework"
	description: "Abstract interface to any parser"
	keywords:    "parsing"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class PARSER_ENGINE

feature {NONE} -- Initialisation

	make
		deferred
		end

feature -- Access

	source: detachable STRING
			-- Source of current artifact.

	source_start_line: INTEGER
			-- Defaults to 0; can be set to line number of text inside some other document.

	tree: detachable ANY
			-- Parser output.

	serialised: STRING
			-- The last result of calling `serialise'.
		attribute
			create Result.make_empty
		end

	errors: ERROR_ACCUMULATOR
			-- Result of last parse.
		do
			Result := parser.errors
		end

feature -- Status Report

	in_parse_mode: BOOLEAN
			-- True if engine in mode where archetype was created from source

	parse_succeeded: BOOLEAN
			-- True if parse succeeded; call after parse()
		do
			Result := attached tree
		end

	has_source: BOOLEAN
		do
			Result := attached source
		end

feature -- Commands

	reset
			-- Clear current state.
		do
			source := Void
			tree := Void
			serialised.wipe_out
		end

	set_source (in_text: STRING; a_source_start_line: INTEGER)
			-- Set `in_text' as working artifact.
		require
			start_line_positive: a_source_start_line >= 0
		do
			source := in_text
			source_start_line := a_source_start_line
			in_parse_mode := True
		ensure
			source_set: source = in_text
			source_start_line_set: source_start_line = a_source_start_line
			parsing: in_parse_mode
		end

	parse
			-- Parse artifact into `tree', then validate the artifact.
		require
			source_attached: has_source
			parsing: in_parse_mode
		do
			tree := Void
			parser_execute
			if not parser.syntax_error then
				assign_parser_result
				serialised.wipe_out
			end
		ensure
			parse_succeeded implies attached tree
		end

	set_tree (a_node: like tree)
			-- Set root node of `tree' from e.g. GUI tool.
		do
			tree := a_node
			in_parse_mode := False
		ensure
			tree_set: tree = a_node
			not_parsing: not in_parse_mode
		end

feature {NONE} -- Implementation

	assign_parser_result
			-- override in descendants to get around limitations in gobo parsers not being able
			-- to be componentised
		do
			tree := parser.output
		end

	parser_execute
			-- call the parser.execute with specific args
		deferred
		end

	parser: PARSER_VALIDATOR
			-- parser

end


