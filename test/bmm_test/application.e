note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 This application demonstrates loading a set of BMM (basic meta-model) schemas into memory and
				 accessing them using the BMM classes. 
				 
				 NB: check the contents of the .cfg file, they should look something like the following:
				 
					rm_schemas = <
						load_list = <"acme_maritime_1.0.0", ...>
					>
					rm_schema_directories = <"C:\\dev\\wolandscat\\EOMF\\resources\\rm_schemas", ...>
					
				 Add other schema names to the load_list to load more schemas, or remove it, and all schemas
				 in the resources/rm_schemas directory will be loaded.
				 ]"
	keywords:    "BMM, reflection, meta-model"
	author:      "Thomas Beale"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class
	APPLICATION

inherit
	SHARED_TEST_ENV

create
	make

feature -- Initialization

	make
		do
			-- add in EOMF error message DB to main message DB
			message_db.add_table (create {DT_MESSAGES_DB}.make)
			message_db.add_table (create {ODIN_MESSAGES_DB}.make)
			message_db.add_table (create {BMM_MESSAGES_DB}.make)
			message_db.add_table (create {GENERAL_MESSAGES_DB}.make)

			-- BMM initialisation
			bmm_env_setup
			app_cfg.save
			if not has_errors then
			--	run_mso_tests
				run_openehr_tests
			end
		end

	run_mso_tests
		do
			rm_schema_cache.put (rm_schemas_access.schema_for_rm_closure ("acme-maritime"))
		end

	run_openehr_tests
		do
		--	rm_schema_cache.put (rm_schemas_access.schema_for_rm_closure ("openehr-ehr"))

			io.put_string ("---------------- rm_schema.has_property_path() --------------%N")
			io.put_string ("CARE_ENTRY has /protocol: " + rm_schema.has_property_path ("CARE_ENTRY", "/protocol").out + "%N")
			io.put_string ("CARE_ENTRY has /data/events/data: " + rm_schema.has_property_path ("CARE_ENTRY", "/data/events/data").out + "%N")
			io.put_string ("OBSERVATION has /data/events/data: " + rm_schema.has_property_path ("OBSERVATION", "/data/events/data").out + "%N")
			io.put_string ("OBSERVATION has /data/events/data/items: " + rm_schema.has_property_path ("OBSERVATION", "/data/events/data/items").out + "%N")
			io.put_string ("OBSERVATION has /data/events[at0003]/math_function: " + rm_schema.has_property_path ("OBSERVATION", "/data/events[at0003]/math_function").out + "%N")
			io.put_string ("OBSERVATION has /protocol: " + rm_schema.has_property_path ("OBSERVATION", "/protocol").out + "%N")
			io.put_string ("OBSERVATION has /data/events[at0002]/data/items[at0.76]/items: " + rm_schema.has_property_path ("OBSERVATION", "/data/events[at0002]/data/items[at0.76]/items").out + "%N" + "%N")
			io.put_string ("OBSERVATION not has /data/events[at0002]/data/itemsXX[at0.76]/items: " + (not rm_schema.has_property_path ("OBSERVATION", "/data/events[at0002]/data/itemsXX[at0.76]/items")).out + "%N")
			io.put_string ("COMPOSITION not has /xxxx: " + (not rm_schema.has_property_path ("COMPOSITION", "/xxxx")).out + "%N")
			io.put_string ("CLUSTER has /items/items/items: " + rm_schema.has_property_path ("CLUSTER", "/items/items/items").out + "%N")
			io.new_line

			io.put_string ("---------------- rm_schema.rm_schema.is_descendant_of() --------------%N")
			io.put_string ("COMPOSITION is a subclass of LOCATABLE: " + rm_schema.is_descendant_of ("COMPOSITION", "LOCATABLE").out + "%N")
			io.put_string ("LOCATABLE is not subclass of COMPOSITION" + (not rm_schema.is_descendant_of ("LOCATABLE", "COMPOSITION")).out + "%N")
			io.new_line

			io.put_string ("---------------- rm_schema.rm_schema.suppliers --------------%N")
			io.put_string ("All supplier classes of COMPOSITION: %N")
			across rm_schema.class_definition ("COMPOSITION").suppliers as supps_csr loop
				io.put_string (supps_csr.item + "%N")
			end
			io.new_line

			io.put_string ("---------------- rm_schema.enumeration types --------------%N")
			io.put_string ("Enumeration types: %N")
			across rm_schema.enumeration_types as enum_csr loop
				io.put_string (enum_csr.item)
				if attached {BMM_ENUMERATION [COMPARABLE]} rm_schema.enumeration_definition (enum_csr.item) as enum_int then
					io.put_string ("; underlying type = " + enum_int.underlying_type_name + "; values: %N")
					across enum_int.item_names as names_csr loop
						io.put_string ("%T" + names_csr.item + " = " + enum_int.item_values.i_th (names_csr.target_index).out + "%N")
					end
				end
				io.put_string ("%N")
			end
			io.new_line
		end

end
