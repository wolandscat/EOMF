note
	component:   "Eiffel Object Modelling Framework"
	description: "Utility functions for XML text"
	keywords:    "xml, utility"

	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class XML_TOOLS

feature -- Access

	xml_tag_position (a_str, tag: STRING; start: INTEGER): INTEGER
			-- Position of "<" character of leading tag 'tag' in 'a_str'
			-- 'a_str' must contain a matching pair of tags
		require
			Str_valid: not a_str.is_empty
			Start_valid: start >= 1 and start <= a_str.count
			Tag_valid: not tag.is_empty
		local
			lpos, rpos: INTEGER
		do
			lpos := a_str.substring_index ("<" + tag + ">", start) + tag.count + 2
			rpos := a_str.substring_index ("</" + tag + ">", start) - 1
			if lpos > 1 and rpos > lpos then
				Result := lpos
			end
		end

	xml_has_tag (a_str, tag: STRING; start: INTEGER): BOOLEAN
			-- True if a_str has the tag pair <tag></tag> at or after position start
		require
			Str_valid: not a_str.is_empty
			Start_valid: start >= 1 and start <= a_str.count
			Tag_valid: not tag.is_empty
		local
			lpos, rpos: INTEGER
		do
			lpos := a_str.substring_index ("<" + tag + ">", start) + tag.count + 2
			rpos := a_str.substring_index ("</" + tag + ">", start) - 1
			Result := lpos > 1 and rpos > lpos
		end

	xml_extract_from_tags (a_str, tag: STRING; start: INTEGER): STRING
			-- extract string xxx from first occurrence of matching tags
			-- pair "<tag>xxx</tag>" starting from 'start'
		require
			xml_has_tag(a_str, tag, start)
		local
			lpos, rpos, next_lpos: INTEGER
		do
			lpos := a_str.substring_index ("<" + tag + ">", start) + tag.count + 2
			rpos := a_str.substring_index ("</" + tag + ">", start) - 1

			from
				next_lpos := a_str.substring_index ("<" + tag + ">", lpos)
			until
				next_lpos = 0 or next_lpos > rpos
			loop
				rpos := a_str.substring_index ("</" + tag + ">", rpos + tag.count + 2) - 1
				next_lpos := a_str.substring_index ("<" + tag + ">", next_lpos + tag.count + 2)
			end

			Result := a_str.substring(lpos, rpos)
		end

	xml_remove_tags (a_str: STRING): STRING
			-- remove outer level of XML-style tags from string
		require
			String_exists: xml_tag_pattern.matches(a_str)
		do
			Result := a_str.twin
			Result.left_adjust
			Result.right_adjust
			Result.replace_substring ("", 1, Result.substring_index(">", 1))
			Result.mirror
			Result.replace_substring ("", 1, Result.substring_index("<", 1))
			Result.mirror
		end

	xml_tag_pattern: RX_PCRE_REGULAR_EXPRESSION
			-- RE for "<..*>..*</..*>"
		once
			create Result.make
			Result.compile ("<..*>..*<\/..*>")
		end

	xml_tag_indent (xml_string: STRING): STRING
			-- indent `xml_string' in the usual way, with one tag per line, and using
			-- 1 TAB character for each indent level
		local
			csr, tag_depth: INTEGER
			in_start_tag: BOOLEAN
			last_c, c: CHARACTER
			indent_str: STRING
		do
			create indent_str.make_filled ('%T', 50)
			create Result.make (0)
			from csr := 1 until csr > xml_string.count loop
				c := xml_string.item(csr)
				if c = '<' then
					if xml_string.item (csr+1) /= '/' then -- start of start tag
						in_start_tag := True
					else
						tag_depth := tag_depth - 1
					end
					if last_c /= '>' then
						Result.append_character ('%N')
						Result.append (indent_str.substring (1, tag_depth))
					end
					Result.append_character(c)

				elseif c = '>' then
					if in_start_tag then
						tag_depth := tag_depth + 1
						in_start_tag := False
					end
					Result.append_character (c)
					Result.append_character ('%N')
					Result.append (indent_str.substring(1, tag_depth))

				else
					Result.append_character(c)
				end
				last_c := c
				csr := csr + 1
			end
		end

	xml_tag_start (tag_name: STRING; attributes: detachable HASH_TABLE [STRING, STRING]): STRING
			-- output opening tag `content' in tags of `tag_name', optionally with attributes in the
			-- lead tag, e.g. '<tag_name attr1="val_1" attr2="val_2">'
		require
			Tag_name_valid: not tag_name.is_empty
		do
			create Result.make(0)

			Result.append ("<" + tag_name)

			if attached attributes as atts then
				across atts as atts_csr loop
					Result.append (" " + atts_csr.key + "=%"" + atts_csr.item + "%"")
				end
			end
			Result.append (">")
		end

	xml_tag_end (tag_name: STRING): STRING
			-- output closing tag  `tag_name'; use for finishing a block
		require
			Tag_name_valid: not tag_name.is_empty
		do
			create Result.make(0)
			Result.append ("</" + tag_name + ">")
		end

	xml_tag_enclose (tag_name, content: STRING; attributes: detachable HASH_TABLE [STRING, STRING]): STRING
			-- enclose `content' in tags of `tag_name' in inline style,
			-- optionally with attributes in the lead tag, e.g.
			-- 	'<tag_name attr1="val_1" attr2="val_2">content</tag_name>'
		require
			Tag_name_valid: not tag_name.is_empty
		do
			-- lead tag
			Result := xml_tag_start(tag_name, attributes)

			-- content
			Result.append (content)

			-- trailing tag
			Result.append (xml_tag_end (tag_name))
		end

	xml_quote (str: STRING): STRING
			-- quote string using XML rules
		do
			create Result.make(0)
			-- FIXME: to be implemented
			Result.append (str)
		end

end

