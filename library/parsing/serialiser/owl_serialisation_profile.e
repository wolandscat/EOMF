note
	component:   "Eiffel Object Modelling Framework"
	description: "Serialisation profile for OWL"
	keywords:    "serialisation, ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"

deferred class OWL_SERIALISATION_PROFILE

inherit
	SERIALISATION_PROFILE

	OWL_DEFINITIONS

feature {ANY_SERIALISER} -- Access

	symbols: HASH_TABLE[STRING, INTEGER]
			-- keywords in this format, keyed by logical name
		once
			create Result.make(0)
			Result.put("Annotation",		SYM_ANNOTATION)
			Result.put("Ontology",			SYM_ONTOLOGY)
			Result.put("Namespace",			SYM_NAMESPACE)
			Result.put("Class",			SYM_CLASS)
			Result.put("ObjectProperty",		SYM_OBJECT_PROPERTY)
			Result.put("DataProperty",		SYM_DATA_PROPERTY)
			Result.put("complete",			SYM_COMPLETE)
			Result.put("partial",			SYM_PARTIAL)
			Result.put("restriction",		SYM_RESTRICTION)
			Result.put("intersectionOf",		SYM_INTERSECTION_OF)
			Result.put("someValuesFrom",		SYM_SOME_VALUES_FROM)
			Result.put("allValuesFrom",		SYM_ALL_VALUES_FROM)
			Result.put("unionOf",			SYM_UNION_OF)
			Result.put("cardinality",		SYM_CARDINALITY)
			Result.put("minCardinality",		SYM_MIN_CARDINALITY)
			Result.put("maxCardinality",		SYM_MAX_CARDINALITY)

			Result.put("(",					SYM_OPEN_PAREN)
			Result.put(")",					SYM_CLOSE_PAREN)
		end

	format_items: HASH_TABLE[STRING, INTEGER]
			-- formatting items
		once
			create Result.make(0)
			Result.put(" ",			FMT_SPACE)
			Result.put("-- ",			FMT_COMMENT)
			Result.put("%N",			FMT_NEWLINE)
			Result.put("%T",			FMT_INDENT)
		end

	styles: HASH_TABLE[STRING, INTEGER]
			-- styles in this format, keyed by logical name
		once
			create Result.make(0)
		end

	tags: HASH_TABLE[STRING, INTEGER]
			-- tag strings, keyed by logical name
		once
			create Result.make(0)
		end

	quote_characters: HASH_TABLE [STRING, CHARACTER]
			-- styles in this format, keyed by logical name
		once
			create Result.make(0)
		end

feature {ANY_SERIALISER} -- Factory

	apply_style(elem:STRING; a_style:INTEGER): STRING
			-- apply `a_style' to `elem', using attr 'class'
		do
			Result := elem
		end

end


