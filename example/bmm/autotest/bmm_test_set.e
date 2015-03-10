note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	BMM_TEST_SET

inherit
	EQA_TEST_SET
		redefine
			on_prepare
		end

	SHARED_TEST_ENV
		rename
			file_system as kl_file_system
		undefine
			default_create
		end

feature {NONE} -- Events

	on_prepare
			-- <Precursor>
		do
			bmm_env_setup
		end

end


