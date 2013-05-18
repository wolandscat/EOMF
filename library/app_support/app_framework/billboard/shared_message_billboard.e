note
	component:   "Eiffel Object Modelling Framework"
	description: "Shared access to error and information messages."
	keywords:    "logging"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class SHARED_MESSAGE_BILLBOARD

inherit
	ERROR_SEVERITY_TYPES
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

feature -- Access

	billboard: MESSAGE_BILLBOARD
			-- text of the billboard in locale current language
		once
			create Result.make
		end

feature -- Commands

	post_error (poster_object_classname: STRING; poster_routine: STRING; id: STRING; args: detachable ARRAY[STRING])
			-- append to the  current contents of billboard an error message corresponding to id,
			-- with positional parameters replaced by contents of optional args
		require
			Poster_valid: not poster_routine.is_empty
		do
			billboard.post_error (poster_object_classname, poster_routine, id, args)
		end

	post_warning (poster_object_classname: STRING; poster_routine: STRING; id: STRING; args: detachable ARRAY[STRING])
			-- append to the  current contents of billboard a warning message corresponding to id,
			-- with positional parameters replaced by contents of optional args
		require
			Poster_valid: not poster_routine.is_empty
		do
			billboard.post_warning (poster_object_classname, poster_routine, id, args)
		end

	post_info (poster_object_classname: STRING; poster_routine: STRING; id: STRING; args: detachable ARRAY[STRING])
			-- append to the  current contents of billboard an info message corresponding to id,
			-- with positional parameters replaced by contents of optional args
		require
			Poster_valid: not poster_routine.is_empty
		do
			billboard.post_info (poster_object_classname, poster_routine, id, args)
		end

end

