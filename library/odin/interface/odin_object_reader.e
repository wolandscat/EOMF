note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Control object for reading a file and converting it to an Eiffel object of
				 a type corresponding to the generic parameter.
				 ]"
	keywords:    "odin, object, materialisation, deserialisation"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2014- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ODIN_OBJECT_READER [G -> DT_CONVERTIBLE]

inherit
	OBJECT_READER [G]

	SHARED_DT_OBJECT_CONVERTER
		export
			{NONE} all
		end

	ODIN_MESSAGES_IDS
		export
			{NONE} all
		end

	ODIN_DEFINITIONS
		export
			{NONE} all
		end

create
	make, make_load

feature {NONE} -- Implementation

	dt_engine: ODIN_ENGINE
		once
			create Result.make
		end

feature {NONE} -- Implementation

	do_parse (obj_str: STRING)
			-- do parsing; set `object` if successful
		do
			dt_engine.set_source (obj_str, 1)
			dt_engine.parse
			if dt_engine.parse_succeeded and then attached dt_engine.tree as dt_tree then
				if not attached {G} dt_tree.as_object_from_string (({G}).name, Void) as att_obj then
					add_error ({GENERAL_MESSAGES_IDS}.ec_object_load_failure_exception, <<({G}).name, file_path>>)
				elseif dt_object_converter.errors.has_errors then
					add_error ({GENERAL_MESSAGES_IDS}.ec_object_conv_fail_err, <<({G}).name, file_path, dt_object_converter.errors.as_string>>)
				else
					object := att_obj
					passed := True
				end
			else
				add_error ({GENERAL_MESSAGES_IDS}.ec_object_load_failure, <<({G}).name, file_path, dt_engine.errors.as_string>>)
			end
		end

	do_serialise (obj: G; false_booleans_off: BOOLEAN)
			-- do serialising; set `serialised` if successful
		do
			if false_booleans_off then
				dt_object_converter.set_false_booleans_off_option
			end
			dt_engine.set_tree (obj.dt_representation)
			dt_engine.serialise (Syntax_type_odin, False, False)
			serialised := dt_engine.serialised
		end

	do_serialise_as (obj: G; a_syntax: STRING; false_booleans_off: BOOLEAN): STRING
			-- serialise in a syntax
		do
			if false_booleans_off then
				dt_object_converter.set_false_booleans_off_option
			end
			dt_engine.set_tree (obj.dt_representation)
			dt_engine.serialise (a_syntax, False, False)
			Result := dt_engine.serialised
		end

end

