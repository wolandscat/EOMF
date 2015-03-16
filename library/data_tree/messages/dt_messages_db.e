note
	component:   "Eiffel Object Modelling Framework"
	description: "Generated class from message text files"
	keywords:    "Internationalisation, I18N, Localisation, L10N, command line"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2012 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class DT_MESSAGES_DB

inherit
	DT_MESSAGES_IDS

	MESSAGE_DB
		redefine
			make
		end

create
	make

feature -- Initialisation

	make
		do
			create message_table.make (14)
			message_table.put ("[Exception caught]: Exception type $1 - trace:%N $2", ec_dt_unknown_error)
			message_table.put ("Mismatch in data and model for field $1 in type $2. Parsed data implies container type but is not in model", ec_container_type_mismatch)
			message_table.put ("Mismatch in data and model for generic parameter $1 in type $2. Expected $3 but got $4", ec_dt_container_gen_param_type_mismatch)
			message_table.put ("Mismatch in data and model for field $1 in type $2. Parsed data implies Interval<T> type but is not in model", ec_interval_type_mismatch)
			message_table.put ("Mismatch in data and model for field $1 in type $2. Parsed data implies List<Interval<T>> type but is not in model", ec_interval_list_type_mismatch)
			message_table.put ("Mismatch in data and model for field $1 in type $2. Parsed data implies atomic type but no conversion available", ec_atomic_type_mismatch)
			message_table.put ("Mismatch in data and model for field $1 in type $2. Parsed data implies primitive, sequence<primitive> or interval<primitive> type but model does not", ec_primitive_type_mismatch)
			message_table.put ("[Exception caught]: Mismatch between data and model for $1.$2. Expecting $3, read a $4", ec_dt_proc_arg_type_mismatch)
			message_table.put ("[Exception caught]: $1.$2 - writing primitive object of type $3 into argument of type $4", ec_populate_dt_proc_arg_type_mismatch)
			message_table.put ("non-existent path $1 in data tree structure", ec_non_existent_path)
			message_table.put ("non-existent path (in list) $1 in data tree structure", ec_non_existent_path_in_list)
			message_table.put ("[Exception caught]: Mismatch error - original recipient = $1", ec_dt_to_object_type_mismatch)
			message_table.put ("[Software exception]: Nested structure mismatch for type $1, attribute $2: DT structure is nested, object type is not", ec_dt_nested_type_mismatch)
			message_table.put ("Data source mentions unknown type $1 (object add failed)", ec_dt_unknown_type_in_source)
end	
end