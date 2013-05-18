note
	component:   "Eiffel Object Modelling Framework"
	description: "Error database abstraction. Subtypes can be easily turned into a file that is read in as a ODIN text."
	keywords:    "error status reporting"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2005- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class MESSAGE_DB

create
	make

feature -- Definitions

	Catchall_error: STRING = "(Error DB load failure); original error params $1; $2; $3; $4"

feature -- Initialisation

	make
		do
			create message_table.make (100)
		end

feature -- Access

	message_table: HASH_TABLE [STRING, STRING]
			-- error templates in the form of a table of templates keyed by id

	has_message (an_id: STRING): BOOLEAN
		do
			Result := message_table.has (an_id)
		end

	create_message_content (an_id: STRING; args: detachable ARRAY[STRING]): STRING
		local
			i: INTEGER
			idx_str: STRING
			args_list: detachable ARRAY[STRING]
			replacement: STRING
		do
			if message_table.has (an_id) then
				check attached message_table.item (an_id) as msg then
					Result := msg.twin
				end
				args_list := args
			elseif message_table.has ("message_code_error") then
				check attached message_table.item ("message_code_error") as msg then
					Result := msg.twin
				end
				args_list := <<an_id>>
			else -- catchall
				Result := Catchall_error.twin
			end
			Result.replace_substring_all ("%%N", "%N")
			if attached args_list then
				from i := args_list.lower until i > args_list.upper loop
					replacement := args_list.item(i)
					if not attached replacement then
						create replacement.make_empty
					end
					idx_str := i.out
					idx_str.left_adjust
					Result.replace_substring_all ("$" + idx_str, replacement)
					i := i + 1
				end
			end
		end

	create_message_text (an_id: STRING): STRING
		local
			i: INTEGER
			idx_str: STRING
			args_list: detachable ARRAY[STRING]
			replacement: STRING
		do
			if message_table.has (an_id) then
				check attached message_table.item (an_id) as msg then
					Result := msg
				end
			elseif message_table.has ("message_code_error") then
				check attached message_table.item ("message_code_error") as msg then
					Result := msg.twin
				end
				Result.replace_substring_all ("$1", an_id)
			else -- catchall
				Result := Catchall_error.twin
			end
		end

	create_message_line (an_id: STRING; args: detachable ARRAY[STRING]): STRING
			-- create message as a full line
		do
			Result := create_message_content (an_id, args)
			Result.append_character ('%N')
		end

feature -- Status Report

	database_loaded: BOOLEAN
		do
			Result := not message_table.is_empty
		end

feature -- Modification

	add_table (a_msg_table: MESSAGE_DB)
		do
			message_table.merge (a_msg_table.message_table)
		end

end



