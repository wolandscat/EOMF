note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 Meta-data to defined a 'value set' within an external resource, e.g. a 
				 reference data service.
				 ]"
	keywords:    "model, object"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2019- openEHR Foundation <http://www.openehr.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_VALUE_SET_SPEC

inherit
	BASIC_DEFINITIONS
		export
			{NONE} all;
			{ANY} deep_twin, is_deep_equal, standard_is_equal, Terminology_separator
		end

create

	make, make_from_string

feature -- Initialisation

	make (a_resource_id, a_value_set_id: STRING)
			-- make with a resource id and a value-set id
		do
			set_resource_id (a_resource_id)
			set_value_set_id (a_value_set_id)
		end

	make_from_string (a_constraint_str: STRING)
			-- set from a String of the form "resource_id::value_set_id". The first part may be empty.
		do
			set_from_string (a_constraint_str)
		end

feature -- Access

	resource_id: STRING
		attribute
			create Result.make_empty
		end

	value_set_id: STRING
		attribute
			create Result.make_empty
		end

feature -- Modification

	set_resource_id (a_resource_id: STRING)
		do
			resource_id := a_resource_id
		end

	set_value_set_id (a_value_set_id: STRING)
		do
			value_set_id := a_value_set_id
		end

	set_from_string (a_constraint_str: STRING)
			-- set from a String of the form "resource_id::value_set_id". The first part may be empty.
		require
			Valid_string: a_constraint_str.has_substring (Terminology_separator)
		local
			res_id, vs_id: STRING
			pos: INTEGER
		do
			pos := a_constraint_str.substring_index (Terminology_separator, 1)
			if pos > 1 then
				res_id := a_constraint_str.substring (1, pos-1)
			else
				create res_id.make_empty
			end

			vs_id := a_constraint_str.substring (pos + Terminology_separator.count, a_constraint_str.count)

			resource_id := res_id
			value_set_id := vs_id
		end

feature -- Output

	as_string: STRING
			-- generate a single string in the form resource_id :: value_set_id
		do
			Result := resource_id + Terminology_separator + value_set_id
		end

end


