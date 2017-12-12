note
	component:   "Eiffel Object Modelling Framework"
	description : "[
				   Generator for Eiffel class source text containing message id constants

				    class COMPILED_MESSAGE_IDS
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
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2012- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	MESSAGE_IDS_CLASS_GENERATOR

create
	make

feature -- Definitions

	default_class_name: STRING = "IDS"

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

	class_name: STRING

	output: STRING
			-- class text
		attribute
			create Result.make (20000)
		end

feature -- Commands

	generate (a_source_struct: like source_structure; a_classname_leader: STRING)
		do
			source_structure := a_source_struct
			output.wipe_out
			output.append (class_header)

			if not a_classname_leader.is_empty then
				class_name.prepend (a_classname_leader + "_")
			end
			output.replace_substring_all ("$class_name", class_name)

			-- main content
			across source_structure as ss_csr loop
				output.append ("%T%Tec_" + ss_csr.key + ": STRING = " + "%"" + ss_csr.key + "%"%N")
			end
			output.append (class_footer)
		end

feature {NONE} -- Boilerplate

	class_header: STRING = "[
note
	component:   "Eiffel Object Modelling Framework"
	description: "Generated class from message text files"
	keywords:    "Internationalisation, I18N, Localisation, L10N, command line"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class $class_name

feature -- Definitions

	]"

	class_footer: STRING = "[
	
end
	]"

end


