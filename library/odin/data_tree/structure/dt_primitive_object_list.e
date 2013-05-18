note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Node of simple type in a Data Tree. Simple
				 types include: STRING, INTEGER, REAL, CHARACTER,
				 BOOLEAN. Occurrences set to the default of {1..1}
			 ]"
	keywords:    "data tree"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class DT_PRIMITIVE_OBJECT_LIST

inherit
	DT_OBJECT_LEAF

	DT_STRING_UTILITIES
		export
			{NONE} all
		undefine
			is_equal, default_create
		end

	INTERNAL
		export
			{NONE} all
		undefine
			is_equal, default_create
		end

create
	make_identified, make_anonymous

feature -- Access

	value: SEQUENCE [ANY]

feature -- Modification

	set_value (a_value: like value)
		local
			al_string: ARRAYED_LIST [STRING]
			al_date: ARRAYED_LIST [ISO8601_DATE]
			al_time: ARRAYED_LIST [ISO8601_TIME]
			al_date_time: ARRAYED_LIST [ISO8601_DATE_TIME]
			al_duration: ARRAYED_LIST [ISO8601_DURATION]
			al_code_phrase: ARRAYED_LIST [TERMINOLOGY_CODE]
			al_path: ARRAYED_LIST [OG_PATH]
		do
			if attached {ARRAYED_LIST [STRING]} a_value as att_al then
				value := a_value
			elseif attached {ARRAYED_LIST [detachable STRING]} a_value as det_al then
				create al_string.make (0)
				across det_al as al_csr loop if attached al_csr.item as v then al_string.extend (v) end end
				value := al_string
			elseif attached {ARRAYED_LIST [ISO8601_DATE]} a_value as att_al then
				value := a_value
			elseif attached {ARRAYED_LIST [detachable ISO8601_DATE]} a_value as det_al then
				create al_date.make (0)
				across det_al as al_csr loop if attached al_csr.item as v then al_date.extend (v) end end
				value := al_date
			elseif attached {ARRAYED_LIST [ISO8601_TIME]} a_value as att_al then
				value := a_value
			elseif attached {ARRAYED_LIST [ISO8601_DATE_TIME]} a_value as att_al then
				value := a_value
			elseif attached {ARRAYED_LIST [ISO8601_DURATION]} a_value as att_al then
				value := a_value
			elseif attached {ARRAYED_LIST [TERMINOLOGY_CODE]} a_value as att_al then
				value := a_value
			elseif attached {ARRAYED_LIST [detachable TERMINOLOGY_CODE]} a_value as det_al then
				create al_code_phrase.make (0)
				across det_al as al_csr loop if attached al_csr.item as v then al_code_phrase.extend (v) end end
				value := al_code_phrase
			elseif attached {ARRAYED_LIST [OG_PATH]} a_value as det_al then
				value := a_value
			elseif attached {ARRAYED_LIST [detachable OG_PATH]} a_value as det_al then
				create al_path.make (0)
				across det_al as al_csr loop if attached al_csr.item as v then al_path.extend (v) end end
				value := al_path
			--
			-- VOID-SAFETY: this is a hack required to convert non-void safe objects whose types are
			-- assumed to be detachable in the ODIN parser code
			--
			elseif attached {ARRAYED_LIST [detachable ISO8601_TIME]} a_value as det_al then
				create al_time.make (0)
				across det_al as al_csr loop if attached al_csr.item as v then al_time.extend (v) end end
				value := al_time
			elseif attached {ARRAYED_LIST [detachable ISO8601_DATE_TIME]} a_value as det_al then
				create al_date_time.make (0)
				across det_al as al_csr loop if attached al_csr.item as v then al_date_time.extend (v) end end
				value := al_date_time
			elseif attached {ARRAYED_LIST [detachable ISO8601_DURATION]} a_value as det_al then
				create al_duration.make (0)
				across det_al as al_csr loop if attached al_csr.item as v then al_duration.extend (v) end end
				value := al_duration
			else
				value := a_value
			end
			im_type_name := a_value.generating_type
		end

feature -- Conversion

	as_string: STRING
		do
			create Result.make (0)
			from value.start until value.off loop
				if value.index > 1 then
					Result.append (", ")
				end
				Result.append (primitive_value_to_odin_string(value.item))
				value.forth
			end
			if value.count = 1 then -- append syntactic indication of list continuation
				Result.append (", ...")
			end
		end

	as_serialised_string (value_serialiser: FUNCTION [ANY, TUPLE [ANY], STRING]; delimiter, end_delimiter: detachable STRING; cleaner: detachable FUNCTION [ANY, TUPLE [STRING], STRING]): STRING
			-- generate a cleaned form of this object as a structured string with specified delimiters, and cleaning with `cleaner'
		do
			create Result.make(0)
			from value.start until value.off loop
				if attached delimiter as d and value.index > 1 then
					Result.append (d)
				end
				if attached {STRING} value.item as s and attached cleaner as c then
					Result.append (value_serialiser.item ([c.item ([s])]))
				else
					Result.append (value_serialiser.item ([value.item]))
				end
				value.forth
			end
			if attached end_delimiter as d and value.count = 1 then
				Result.append (d)
			end
		end

feature -- Serialisation

	enter_subtree (serialiser: DT_SERIALISER; depth: INTEGER)
			-- perform serialisation at start of block for this node
		do
			serialiser.start_primitive_object_list (Current, depth)
		end

	exit_subtree (serialiser: DT_SERIALISER; depth: INTEGER)
			-- perform serialisation at end of block for this node
		do
			serialiser.end_primitive_object_list (Current, depth)
		end

end


