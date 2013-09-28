note
	component:   "Eiffel Object Modelling Framework"
	description : "[
				   Generator for Eiffel class source text of form

				    class COMPILED_MESSAGE_DB
				    feature -- Access
				    	messages: [HASH_TABLE [STRING, STRING]]
				    		once
				    			create Result.make(0)
				    			Result.put ("text $1 text $2", "CodeA")
				    			Result.put ("text $1 text", "CodeB")
				    			Result.put ("text $1, $2, $3", "CodeC")
				    		end
				    end

				    This class can then be inherited by the class MESSAGE_DB in any app.
				   ]"
	keywords:    "Internationalisation, I18N, Localisation, L10N"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	MESSAGE_DB_CLASS_GENERATOR

create
	make

feature -- Definitions

	default_class_name: STRING = "COMPILED_MESSAGE_DB"

feature -- Initialization

	make
		do
			create output.make (20000)
			class_name := default_class_name.twin
		end

feature -- Access

	source_structure: HASH_TABLE [STRING, STRING]
		attribute
			create Result.make (0)
		end

	output: STRING
			-- class text
		attribute
			create Result.make (20000)
		end

	class_name: STRING

feature -- Commands

	generate (a_source_struct: like source_structure; a_class_name_leader, ids_class_name: STRING)
		local
			s: STRING
		do
			source_structure := a_source_struct
			output.wipe_out
			output.append (class_header)

			if not a_class_name_leader.is_empty then
				class_name.prepend (a_class_name_leader + "_")
			end
			output.replace_substring_all ("$class_name", class_name)
			output.replace_substring_all ("$ids_class_name", ids_class_name)

			-- output the make feature
			output.append (feature_top)
			s := feature_make.twin
			s.replace_substring_all ("$1", source_structure.count.out)
			output.append (s)
			across source_structure as ss_csr loop
				output.append ("%T%T%Tmessage_table.put (%"" + ss_csr.item + "%", ec_" + ss_csr.key + ")%N")
			end
			output.append (feature_bottom)

			-- end of class
			output.append (class_footer)
		end

feature {NONE} -- Boilerplate

	class_header: STRING = "[
note
	component:   "Eiffel Object Modelling Framework"
	description: "Generated class from message text files"
	keywords:    "Internationalisation, I18N, Localisation, L10N, command line"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class $class_name

inherit
	$ids_class_name

	MESSAGE_DB
		redefine
			make
		end

create
	make

feature -- Initialisation

	]"

	feature_top: STRING = "[

	make
		do

	]"

	feature_make: STRING = "[
			create message_table.make ($1)

	]"

	feature_bottom: STRING = "[
		end
	]"

	class_footer: STRING = "[
	
end
	]"

end


