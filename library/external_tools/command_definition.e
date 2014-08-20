note
	component:   "Eiffel Object Modelling Framework"
	description: "Simple concept of a command line, broken into components"
	keywords:    "command line"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class COMMAND_DEFINITION

create
	make

feature -- Initialisation

	make (a_command_name, a_switches_args: STRING; executes_in_directory_flag: BOOLEAN)
		do
			command_name := a_command_name
			switches_args := a_switches_args
			executes_in_directory := executes_in_directory_flag
		end

feature -- Access

	command_name: STRING

	switches_args: STRING

	executes_in_directory: BOOLEAN
			-- True if this command must be executed in a specific directory to which the 
			-- command relates

end
