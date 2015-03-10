note
	component:   "Eiffel Object Modelling Framework"
	description: "Type for testing ODIN serialise/deserialise of simple types."
	keywords:    "test, ODIN"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ODIN_CONTAINER_TYPES

feature -- Access

	my_array_integer: ARRAYED_LIST[INTEGER]
			-- arrayed list

	my_table:HASH_TABLE[INTEGER,INTEGER]
			-- hash table

	my_table2:HASH_TABLE[A_CLIENT,INTEGER]
			-- hast table user type

	my_tuple:TUPLE[A_CLIENT,INTEGER]
			-- tuple

	my_list:LINKED_LIST[TUPLE[A_CLIENT]]
			-- linked list tuple

	my_array2:ARRAY[LINKED_LIST[TUPLE[A_CLIENT]]]


feature -- Element change

	set_client(a_client:A_CLIENT)
			--
		do
			my_client := a_client
		end

	set_self_reference
			--
		do
			myself := current
		end


	init_array
			--
		do
			create my_array.make (1, 5)
			my_array.put (my_client, 1)
			my_array.put (my_client, 2)
			my_array.put (my_client, 3)
		end

	init_array2
			--
		local
			list:LINKED_LIST[TUPLE[A_CLIENT]]
			client:A_CLIENT
		do
			create list.make
			create client
			client.set_my_boolean (false)
--			client.set_my_string2 ("client_string_test")
			list.extend([client])
			create my_array2.make (1, 5)
			my_array2.put (list, 1)
		end

	init_tuple
			--
		do
			create my_tuple
			my_tuple.put (my_client,1)
			my_tuple.put_integer (100, 2)
		end

	init_list
			--
		do
			create my_list.make
			my_list.extend ([my_client])
		end

	init_pointer
			--
		local
			integer:INTEGER
		do
			create my_pointer
			my_pointer.set_item (my_client.default_pointer)
		end

	init_empty
			--
		do
			create my_empty
		end

	init_array3
			--
		do
			create my_array3.make(5)
			my_array3.extend(1)
			my_array3.extend(2)
		end

	init_table
			--
		do
			create my_table.make(5)
			my_table.put(2,5)
			my_table.put(3,4)
		end

	init_table2
			--
		do
			create my_table2.make(5)
			my_table2.put(my_client,66)
			my_table2.put(my_client,666)
		end

end



