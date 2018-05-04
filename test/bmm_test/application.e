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
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011- The openEHR Foundation <http://www.openEHR.org>"
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
			-- BMM initialisation
			bmm_env_setup
			app_cfg.save
			if not has_errors then
				run_openehr_tests
			end
		end

	run_openehr_tests
		do
			bmm_model_cache.put (bmm_model ("openEHR_task_planning"))

			io.put_string ("---------------- rm_schema.has_property --------------%N")
			output_ancestors ("CONTEXT_VALUE", 0)
			output_class_properties ("CONTEXT_VALUE", True)
			output_class_properties ("CONTEXT_VALUE", False)

			output_ancestors ("CONTEXT_EXPRESSION", 0)
			output_class_properties ("CONTEXT_EXPRESSION", True)
			output_class_properties ("CONTEXT_EXPRESSION", False)

			output_ancestors ("CONTEXT_EXPRESSION<TYPE_DEF_BOOLEAN>", 0)
			output_class_properties ("CONTEXT_EXPRESSION<TYPE_DEF_BOOLEAN>", True)
			io.put_string ("CONTEXT_EXPRESSION<TYPE_DEF_BOOLEAN> has property expression: " + rm_schema.has_property ("CONTEXT_EXPRESSION<TYPE_DEF_BOOLEAN>", "expression").out + "%N")

			output_ancestors ("STATE_VARIABLE", 0)
			output_class_properties ("STATE_VARIABLE", True)
			output_class_properties ("STATE_VARIABLE", False)

			output_ancestors ("DISPATCHABLE_TASK", 0)
			output_class_properties ("DISPATCHABLE_TASK", True)
			output_class_properties ("DISPATCHABLE_TASK", False)

			output_ancestors ("TIMER_WAIT", 0)
			output_class_properties ("TIMER_WAIT", True)
			output_class_properties ("TIMER_WAIT", False)

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

			io.put_string ("---------------- rm_schema.is_descendant_of() --------------%N")
			io.put_string ("COMPOSITION is a subclass of LOCATABLE: " + rm_schema.is_descendant_of ("COMPOSITION", "LOCATABLE").out + "%N")
			io.put_string ("LOCATABLE is not subclass of COMPOSITION" + (not rm_schema.is_descendant_of ("LOCATABLE", "COMPOSITION")).out + "%N")
			io.new_line

			io.put_string ("---------------- rm_schema.class_definition.properties --------------%N")
			io.put_string ("Generic class and properties, showing generic type substitutions %N")
			output_class_properties ("CONTACT", False)

			io.put_string ("---------------- rm_schema.class_definition.suppliers --------------%N")
			io.put_string ("All supplier classes of COMPOSITION: %N")
			across rm_schema.class_definition ("COMPOSITION").suppliers as supps_csr loop
				io.put_string (supps_csr.item + "%N")
			end
			io.new_line

			io.put_string ("---------------- rm_schema.enumeration_definition types --------------%N")
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

			output_class_properties ("PARAMETER_MAPPING", True)
			output_class_properties ("QUERY_CALL", True)

			bmm_model_cache.put (bmm_model ("openEHR_generics"))

			io.put_string ("======================= inheritance structure =======================%N")
			output_ancestors ("GENERIC_CHILD_CLOSED", 0)
			output_ancestors ("GENERIC_CHILD_OPEN_U", 0)
			output_ancestors ("GENERIC_CHILD_OPEN_T", 0)
			output_ancestors ("GENERIC_PARENT<T,SUPPLIER_B>", 0)
			output_ancestors ("GENERIC_PARENT<SUPPLIER_A,U>", 0)

			io.put_string ("======================= generic inheritance =======================%N")
			io.put_string ("......... generic inheritance - source form ..........%N")
			output_class_properties ("SUPPLIER", False)
			output_class_properties ("SUPPLIER_A", False)
			output_class_properties ("SUPPLIER_B", False)
			output_class_properties ("GENERIC_PARENT", False)
			output_class_properties ("GENERIC_CHILD_OPEN_T", False)
			output_class_properties ("GENERIC_CHILD_OPEN_U", False)
			output_class_properties ("GENERIC_CHILD_CLOSED", False)

			io.put_string ("......... generic inheritance - flat form ..........%N")
			output_class_properties ("SUPPLIER", True)
			output_class_properties ("SUPPLIER_A", True)
			output_class_properties ("SUPPLIER_B", True)
			output_class_properties ("GENERIC_PARENT", True)
			output_class_properties ("GENERIC_CHILD_OPEN_T", True)
			output_class_properties ("GENERIC_CHILD_OPEN_U", True)
			output_class_properties ("GENERIC_CHILD_CLOSED", True)

		end

feature {NONE} -- Implementation

	output_class_properties (a_class_name: STRING; show_flat: BOOLEAN)
		local
			properties: STRING_TABLE [BMM_PROPERTY [BMM_TYPE]]
		do
			io.put_string (a_class_name + " - properties " + if show_flat then "(flat)" else "(source)" end + "%N")
			if show_flat then
				properties := rm_schema.class_definition (a_class_name).flat_properties
			else
				properties := rm_schema.class_definition (a_class_name).properties
			end
			across properties as props_csr loop
				io.put_string ("    " + props_csr.item.name + ": " + props_csr.item.bmm_type.type_name + "%N")
			end
			io.new_line
		end

	output_ancestors (a_class_name: STRING; depth: INTEGER)
		do
			io.put_string (a_class_name + " - ancestors%N")
			do_output_ancestors (a_class_name, depth)
			io.put_string ("%N")
		end

	do_output_ancestors (a_class_name: STRING; depth: INTEGER)
		local
			str: STRING
			class_def: BMM_CLASS
		do
			class_def := rm_schema.type_class_definition (a_class_name)
			across class_def.ancestors as ancs_csr loop
				create str.make_filled ('%T', depth + 1)
				io.put_string (str + ancs_csr.key + "%N")
				do_output_ancestors (ancs_csr.key.as_string_8, depth + 1)
			end
		end

end
