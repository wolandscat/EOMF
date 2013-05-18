note
	component:   "Eiffel Object Modelling Framework"
	description: "Common things for all SML archetypes"
	keywords:    "test, SML"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

class SERIALISER_DEFINITIONS

feature -- Access

	FMT_SPACE: INTEGER = 100

	FMT_INDENT:	INTEGER = 101

	FMT_NEWLINE: INTEGER = 102

	FMT_DOC_START: INTEGER = 103

	FMT_DOC_END: INTEGER = 104

	FMT_DOC_STYLES: INTEGER = 105

	FMT_START_BODY: INTEGER = 106

	FMT_END_BODY: INTEGER = 107

	FMT_START_SPAN: INTEGER = 108

	FMT_END_SPAN: INTEGER = 109

	FMT_COMMENT: INTEGER = 110

	FMT_START_TITLE: INTEGER = 111

	FMT_END_TITLE: INTEGER = 112

	FMT_META_ITEM: INTEGER = 113

	FMT_LIST_ITEM_SEPARATOR: INTEGER = 114

	FMT_ASSUMED_VALUE_SEPARATOR: INTEGER = 115

	FMT_IDENTIFIER: INTEGER = 116

	STYLE_KEYWORD: INTEGER = 200

	STYLE_IDENTIFIER: INTEGER = 201

	STYLE_OPERATOR: INTEGER = 202

	STYLE_TERM_REF: INTEGER = 203

	STYLE_VALUE: INTEGER = 204

	STYLE_COMMENT: INTEGER = 205

	STYLE_INHERITED_IDENTIFIER: INTEGER = 301

	STYLE_REDEFINED_IDENTIFIER: INTEGER = 401

end


