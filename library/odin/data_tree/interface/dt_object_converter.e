note
	component:   "Eiffel Object Modelling Framework"
	description: "[
				 object birectional converter. Errors due to mismatching data and object 
				 model reported in last_op_fail and fail_reason.
				 ]"
	keywords:    "Data tree"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2005- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class DT_OBJECT_CONVERTER

inherit
	DT_FACTORY

	SHARED_DEBUG_HELPER
		export
			{NONE} all
		end

	EXCEPTIONS
		rename
			class_name as exc_class_name
		export
			{NONE} all
		end

	EOMF_COMPILED_MESSAGE_IDS

feature -- Definitions

	No_type: INTEGER = -10
			-- a safe invalid type number to use to represent 'no static type specified' for routine
			-- `populate_dt_from_object'

feature -- Modification

	add_dt_to_obj_agent (a_cvt_agent: FUNCTION [ANY, TUPLE[ANY], ANY]; dt_source_type_dyn_type: INTEGER)
			-- add an agent that can convert a DT primitive type to a type required in source object classes
			-- This is only needed for functions that map types like TERMINOLOGY_CODE, URI, ISO8601 date/time types
			-- to a different type that is considered a primitive in another type system
		require
			valid_dt_type: is_dt_primitive_type (dt_source_type_dyn_type)
		do
			dt_to_obj_agents.put (a_cvt_agent, dt_source_type_dyn_type)
		end

	add_obj_to_dt_agent (a_cvt_agent: FUNCTION [ANY, TUPLE[ANY], DT_OBJECT_LEAF]; eif_dyn_type: INTEGER)
			-- add an agent that can convert a source object to a DT primitive type
			-- This is only needed for functions that map types like TERMINOLOGY_CODE, URI, ISO8601 date/time types
			-- to a different type that is considered a primitive in another type system
		do
			obj_to_dt_agents.put (a_cvt_agent, eif_dyn_type)
		end

feature -- Access

	errors: ERROR_ACCUMULATOR
		once
			create Result.make
		end

feature -- Commands

	reset
		do
			errors.wipe_out
		end

feature -- Conversion

	object_to_dt (an_obj: ANY): DT_COMPLEX_OBJECT
			-- generate a DT_OBJECT from an Eiffel object; called only on top-level object
		do
			create Result.make_anonymous
			errors.wipe_out
			populate_dt_from_object (an_obj, Result, No_type)
		end

	populate_dt_from_root_object (an_obj: ANY; a_dt_co: DT_COMPLEX_OBJECT)
		do
			errors.wipe_out
			populate_dt_from_object (an_obj, a_dt_co, No_type)
		end

	dt_to_object_from_string (a_dt_co: DT_COMPLEX_OBJECT; a_type_name: STRING; make_args: detachable ARRAY[ANY]): detachable ANY
			-- make an object whose classes and attributes correspond to the structure
			-- of this DT_OBJECT
		do
			Result := dt_to_object (a_dt_co, dt_dynamic_type_from_string (a_type_name), make_args)
		end

	dt_to_object (a_dt_co: DT_COMPLEX_OBJECT; a_type_id: INTEGER; make_args: detachable ARRAY[ANY]): detachable ANY
			-- make an object whose classes and attributes correspond to the structure
			-- of this DT_OBJECT; should be called externally only on top-level DT structure;
			-- The main job of this routine is to set up cross references.
		local
			src_obj_fld: INTEGER
			path_list: SEQUENCE [OG_PATH]
		do
debug ("DT")
	io.put_string (indent_str + "---> DT_OBJECT_CONVERTER.dt_to_object: populating from a " +
		a_dt_co.generating_type + "%N")
	inc_indent
end
			errors.wipe_out

			-- wipe the reference list out if on a top-level object
			if a_dt_co.is_root then
				object_ref_list.wipe_out
			end

			-- make the object
			Result := create_object_from_dt (a_dt_co, a_type_id, make_args)

			-- if there were object references in the DT structure, process them now
			if a_dt_co.is_root and not object_ref_list.is_empty then
				across object_ref_list as obj_ref_csr loop
					if attached obj_ref_csr.item.source_object_ref as src_obj then
						src_obj_fld := obj_ref_csr.item.source_object_field_index
						if attached {DT_OBJECT_REFERENCE} obj_ref_csr.item as a_dt_obj_ref then
							if a_dt_co.has_path (a_dt_obj_ref.value.as_string) then
								if attached a_dt_co.node_at_path (a_dt_obj_ref.value.as_string) as att_dt_attr and then attached att_dt_attr.as_object_ref as targ_obj then
									if a_dt_obj_ref.is_source_object_container then
										if attached {HASH_TABLE [ANY, HASHABLE]} src_obj as a_hash_table and attached a_dt_obj_ref.hash_key as hk then
											a_hash_table.extend (targ_obj, hk)
										elseif attached {SEQUENCE [ANY]} src_obj as eif_seq then
											eif_seq.extend (targ_obj)
										end
									else
										set_reference_field (src_obj_fld, src_obj, targ_obj)
									end
								else
									-- should not arrive here
									raise ("dt_to_object software exception LOC #1")
								end
							else
								errors.add_error (ec_non_existent_path, <<a_dt_obj_ref.value.as_string>>, "dt_to_object")
							end
						elseif attached {DT_OBJECT_REFERENCE_LIST} obj_ref_csr.item as a_dt_obj_ref_list then
							-- make the generic container, it will be a SEQUENCE (some kind of list)
							if attached {SEQUENCE[ANY]} new_instance_of (field_static_type_of_type (src_obj_fld, dynamic_type (src_obj))) as a_sequence2 then
								-- do a reasonable make call on it
								if attached {ARRAYED_LIST[ANY]} a_sequence2 as an_arr_list then
									an_arr_list.make (0)
								end

								path_list := a_dt_obj_ref_list.value
								from path_list.start until path_list.off loop
									if a_dt_co.has_path (path_list.item.as_string) and attached a_dt_co.node_at_path (path_list.item.as_string) as dt_co_at_path and then
										attached dt_co_at_path.as_object_ref as seq_obj
									then
										a_sequence2.extend (seq_obj)
									else
										errors.add_error (ec_non_existent_path_in_list, <<path_list.item.as_string>>, "dt_to_object")
									end
									path_list.forth
								end

								-- now we detect if the whole thing is going inside another container, or a standard object
								if a_dt_obj_ref_list.is_source_object_container then
									if attached {HASH_TABLE [ANY, HASHABLE]} src_obj as a_hash_table2 and attached a_dt_obj_ref_list.hash_key as hk then
										a_hash_table2.extend (a_sequence2, hk)
									elseif attached {SEQUENCE [ANY]} src_obj as a_sequence3 then
										a_sequence3.extend (a_sequence2)
									end
								else
									set_reference_field (src_obj_fld, src_obj, a_sequence2)
								end
							end
						end
					end
				end
			end
debug ("DT")
	io.put_string (indent_str + "<--- DT_OBJECT_CONVERTER.dt_to_object: populating from a " +
		a_dt_co.generating_type + "%N")
	dec_indent
end
		rescue
			if assertion_violation then
				-- check that the original was set_reference_field () - this indicates a type mismatch
				if attached original_recipient_name as orn then
					errors.add_error (ec_dt_to_object_type_mismatch, <<orn>>, "dt_to_object")
				else
						errors.add_error (ec_dt_to_object_type_mismatch, <<"Original recipient name not available">>, "dt_to_object")
				end
			elseif attached exception_trace as et then
				errors.add_error (ec_dt_unknown_error, <<exception.out, et>>, "dt_to_object")
			else
				errors.add_error (ec_dt_unknown_error, <<exception.out, "no exception trace avalable">>, "dt_to_object")
			end
			retry
		end

feature {NONE} -- Implementation

	populate_dt_from_object (an_obj: ANY; a_dt_co: DT_COMPLEX_OBJECT; a_static_tid: INTEGER)
			-- make a data tree from an object; this routine is recursive. Compare `a_static_tid' to `an_obj' dynamic
			-- type; if different, set the `type_visible' flag on `a_dt_co'. During serialisation, the flag is used
			-- to decide to output the type information (unless full type marking is on). If `a_static_tid' is No_type
			-- then assume that it is the same as dynamic_type(an_obj).
			-- TODO: this routine will not work properly for any structure that is not a proper tree; any cycles will cause
		local
			a_dt_attr: DT_ATTRIBUTE
			fld_static_tid, fld_att_dyn_tid, i: INTEGER
			eif_fld_name: STRING
			fld_lst: detachable ARRAYED_LIST[STRING]
			dt_prim_ivl_list: DT_PRIMITIVE_OBJECT_INTERVAL_LIST
		do
debug ("DT")
	io.put_string (indent_str + "---> DT_OBJECT_CONVERTER.populate_dt_from_object: populating from a " +
		an_obj.generating_type)
	if a_static_tid = No_type then
		io.put_string ("; static type not specified (ROOT OBJECT) ")
	else
		io.put_string ("; static type = " + type_name_of_type (a_static_tid) + " (" + a_static_tid.out + ")")
	end
	inc_indent
end

			-- complex objects, including of container types, get their type names written in to the DT node here
			a_dt_co.set_im_type_name (an_obj.generating_type)

			-- if the static type is known, and different from the dynamic type of the object, set the visible flag
			if a_static_tid /= No_type and attached_type (a_static_tid) /= attached_type (dynamic_type (an_obj)) then
debug ("DT")
	io.put_string ("... setting TYPE VISIBLE flag")
end
				a_dt_co.set_type_visible
			end
debug ("DT")
	io.put_string ("%N")
end

			-- the first two cases here enable nested containers to be dealt with...
			-- object itself is a HASH_TABLE of non DT-primitive type, deal with by creating a DT_ATTRIBUTE representing the
			-- container, and DT_OBJECTs underneath
			if attached {HASH_TABLE [ANY, HASHABLE]} an_obj as eif_hash_obj then
debug ("DT")
	io.put_string (indent_str + "DT_OBJECT_CONVERTER.populate_dt_from_object: an_obj is a HASH_TABLE%N")
end
				if not eif_hash_obj.is_empty  then
					create a_dt_attr.make_nested_container
					a_dt_attr.set_im_type_name (an_obj.generating_type)
					if a_static_tid /= 0 and attached_type (a_static_tid) /= attached_type (dynamic_type (an_obj)) then
						a_dt_attr.set_type_visible
					end
					populate_dt_attr_from_eif_hash (a_dt_attr, eif_hash_obj, a_static_tid)
					a_dt_co.put_attribute (a_dt_attr)
				end

			-- object itself is a SEQUENCE of non DT-primitive type, deal with by creating a DT_ATTRIBUTE representing the
			-- container, and DT_OBJECTs underneath
			elseif attached {SEQUENCE[ANY]} an_obj as eif_seq_obj then
debug ("DT")
	io.put_string (indent_str + "DT_OBJECT_CONVERTER.populate_dt_from_object: an_obj is a SEQUENCE%N")
end
				if not eif_seq_obj.is_empty then
					create a_dt_attr.make_nested_container
					a_dt_attr.set_im_type_name (an_obj.generating_type)
					if a_static_tid /= 0 and attached_type (a_static_tid) /= attached_type (dynamic_type (an_obj)) then
						a_dt_attr.set_type_visible
					end
					populate_dt_attr_from_eif_sequence (a_dt_attr, eif_seq_obj, a_static_tid)
					a_dt_co.put_attribute (a_dt_attr)
				end

			-- Eiffel object is not a container
			else
				if attached {DT_CONVERTIBLE} an_obj as dt_conv then
					fld_lst := dt_conv.persistent_attributes
				end

				-- now deal with the fields of the object in turn
				from i := 1 until i > field_count (an_obj) loop
					eif_fld_name := field_name (i, an_obj)
debug ("DT")
	io.put_string (indent_str + "DT_OBJECT_CONVERTER.populate_dt_from_object: field_name = " + eif_fld_name + " ")
	if is_field_transient (i, an_obj) then
		io.put_string (" [EIFFEL TRANSIENT FIELD] ")
	end
end
					-- TODO: get rid of the fld_lst at some point
					if attached field (i, an_obj) as eif_fld_val and not is_field_transient (i, an_obj) and (not attached fld_lst or else fld_lst.has (eif_fld_name)) then
debug ("DT")
	io.put_string (indent_str + "DT_OBJECT_CONVERTER.populate_dt_from_object: field_name = " + eif_fld_name + "%N")
end
						fld_att_dyn_tid := attached_type (dynamic_type (eif_fld_val))
						fld_static_tid := field_static_type_of_type (i, dynamic_type (an_obj))

						-- the Eiffel object field is an INTERVAL[PART_COMPARABLE]; convert to DT_PRIMITIVE_OBJECT_INTERVAL
						if is_dt_primitive_interval_conforming_type (fld_att_dyn_tid) then
							if attached {INTERVAL[PART_COMPARABLE]} eif_fld_val as eif_prim_ivl then
								create a_dt_attr.make_single (eif_fld_name)
								a_dt_attr.put_child (create {DT_PRIMITIVE_OBJECT_INTERVAL}.make_anonymous (eif_prim_ivl))
								a_dt_co.put_attribute (a_dt_attr)
							end

						-- the Eiffel object field is a SEQUENCE[INTERVAL[PART_COMPARABLE]]; convert to DT_PRIMITIVE_OBJECT_INTERVAL_LIST
						elseif is_dt_primitive_sequence_interval_conforming_type (fld_att_dyn_tid) then
							if attached {SEQUENCE[INTERVAL[PART_COMPARABLE]]} eif_fld_val as eif_prim_seq_ivl and then not eif_prim_seq_ivl.is_empty then -- only include it if non-empty
								create a_dt_attr.make_single (eif_fld_name)
								if attached {ARRAYED_LIST[INTERVAL[PART_COMPARABLE]]} eif_prim_seq_ivl as eif_prim_al_ivl then
									create dt_prim_ivl_list.make_anonymous (eif_prim_al_ivl)
								else
									create dt_prim_ivl_list.make_anonymous (create {ARRAYED_LIST[INTERVAL[PART_COMPARABLE]]}.make (0))
									raise ("populate_dt_from_object software exception LOC #1")
								end
								a_dt_attr.put_child (dt_prim_ivl_list)
								a_dt_co.put_attribute (a_dt_attr)
							end

						-- the Eiffel object field is a SEQUENCE of some DT primitive type
						elseif is_dt_primitive_sequence_conforming_type (fld_att_dyn_tid) then
							if attached {SEQUENCE[ANY]} eif_fld_val as eif_prim_seq and then not eif_prim_seq.is_empty then -- only include it if non-empty
								create a_dt_attr.make_single (eif_fld_name)
								a_dt_attr.put_child (create {DT_PRIMITIVE_OBJECT_LIST}.make_anonymous (eif_prim_seq))
								a_dt_co.put_attribute (a_dt_attr)
							end

						-- the Eiffel object field is a DT primitive type then
						elseif is_dt_primitive_atomic_type (fld_att_dyn_tid) then
							create a_dt_attr.make_single (eif_fld_name)
							a_dt_attr.put_child (create {DT_PRIMITIVE_OBJECT}.make_anonymous (eif_fld_val))
							a_dt_co.put_attribute (a_dt_attr)

						-- the Eiffel object field is a complex object, or else a SEQUENCE or HASH_TABLE of a complex object
						else
debug ("DT")
	io.put_string (indent_str + "DT_OBJECT_CONVERTER.populate_dt_from_object: (complex or container type)%N")
end
							if attached {HASH_TABLE [ANY, HASHABLE]} eif_fld_val as eif_hash_fld_val then
debug ("DT")
	io.put_string (indent_str + "DT_OBJECT_CONVERTER.populate_dt_from_object: (HASH_TABLE type)%N")
end
								if not eif_hash_fld_val.is_empty  then
									create a_dt_attr.make_container (eif_fld_name)
									a_dt_attr.set_im_type_name (eif_fld_val.generating_type)
									if attached_type (fld_static_tid) /= attached_type (fld_att_dyn_tid) then
										a_dt_attr.set_type_visible
									end
									populate_dt_attr_from_eif_hash (a_dt_attr, eif_hash_fld_val, fld_static_tid)
									if not a_dt_attr.is_empty then
										a_dt_co.put_attribute (a_dt_attr)
									end
								end

							elseif attached {SEQUENCE[ANY]} eif_fld_val as eif_seq_fld_val then
debug ("DT")
	io.put_string (indent_str + "DT_OBJECT_CONVERTER.populate_dt_from_object: (SEQUENCE type)%N")
end
								if not eif_seq_fld_val.is_empty then
									create a_dt_attr.make_container (eif_fld_name)
									a_dt_attr.set_im_type_name (eif_fld_val.generating_type)
									if attached_type (fld_static_tid) /= attached_type (fld_att_dyn_tid) then
										a_dt_attr.set_type_visible
									end
									populate_dt_attr_from_eif_sequence (a_dt_attr, eif_seq_fld_val, fld_static_tid)
									if not a_dt_attr.is_empty then
										a_dt_co.put_attribute (a_dt_attr)
									end
								end
							else
debug ("DT")
	io.put_string (indent_str + "DT_OBJECT_CONVERTER.populate_dt_from_object: (normal complex type)%N")
end
								-- it's a normal complex object; we check if there is any type converter for it to a primitive type
								create a_dt_attr.make_single (eif_fld_name)
								if obj_to_dt_agents.has (fld_att_dyn_tid) then
									check attached obj_to_dt_agents.item (fld_att_dyn_tid) as obj_to_dt_agt then
										a_dt_attr.put_child (obj_to_dt_agt.item ([eif_fld_val]))
									end
								else
									populate_dt_from_object (eif_fld_val, create_complex_object_node (a_dt_attr, Void), fld_static_tid)
								end
								a_dt_co.put_attribute (a_dt_attr)
							end
						end
					else
debug ("DT")
	io.put_string (indent_str + "(NOT persistent or persistent but NOT attached) &&&&&&&&&&& %N")
end
					end
					i := i + 1
				end
			end
debug ("DT")
	io.put_string (indent_str + "<---DT_OBJECT_CONVERTER.populate_dt_from_object%N")
	dec_indent
end
		end

	create_object_from_dt (a_dt_co: DT_COMPLEX_OBJECT; a_type_id: INTEGER; make_args: detachable ARRAY[ANY]): ANY
			-- make an object whose classes and attributes correspond to the structure
			-- of this DT_OBJECT; recursive. Be careful of the 3 'kinds' of type id in Eiffel:
			-- an 'abstract type' is defined in INTERNAL; all ref types have one abstract type
			-- a 'static type' is the statically declared type id of a field in an object
			-- a 'dynamic type' is the actual type of an object at runtime;
			-- static and dynamic type numbers come from the same series;
			-- abstract type numbers are completely separate
--		require
--			object_from_dt_types_conform (a_dt_co, a_type_id)
		local
			fld_abstract_tid, fld_att_static_tid, dt_val_att_dyn_tid, i: INTEGER
			a_gen_field: detachable ANY
		do
debug ("DT")
	io.put_string (indent_str + "---> DT_OBJECT_CONVERTER.create_object_from_dt%N")
	inc_indent
end
			if is_special_any_type (a_type_id) then
				-- FIXME: how to determine the length of the SPECIAL?
debug ("DT")
	io.put_string (indent_str + "about to call new_special_any_instance ('" +
		type_name_of_type (a_type_id) + "')%N")
end
				Result := new_special_any_instance (a_type_id, 1)
			else
debug ("DT")
	io.put_string (indent_str + "about to call new_instance_of ('" +
		type_name_of_type (a_type_id) + "')%N")
end
				Result := new_instance_of (a_type_id)

				-- FIXME: the following is a hacker's attempt to
				-- reliably call a reasonable make function? Should call at least 'default_create'
				-- Eiffel does not allow this at the moment.
				if attached {DT_CONVERTIBLE} Result as a_dt_conv then
					a_dt_conv.make_dt (make_args)
				end
			end

			if not errors.has_errors then
				if generic_count_of_type (a_type_id) > 0 then
					-- we are on a container object, and the correspoding DT object must have a single attribute
					-- which is_generic and is_multiple we don't go through its fields, instead we just go to the
					-- next object level down in the DT tree
					if not a_dt_co.is_empty then
						if attached a_dt_co.first as a_dt_attr then
							if a_dt_attr.is_nested then
								populate_eif_container_from_dt (Result, a_dt_attr)
							else
								-- should never get here: it means that the DT data parsed as a
								-- nested generic, but that the corresponding object types are not
								errors.add_error (ec_dt_nested_type_mismatch, <<Result.generating_type, a_dt_attr.im_attr_name>>, "create_object_from_dt")
							end
						else
							raise ("create_object_from_dt software exception LOC #1")
						end

					else -- even if it is empty, we still have to create the generic object properly
						-- note that the invariants of the containing business object might easily not be satisfied
						if attached {HASH_TABLE [ANY, HASHABLE]} Result as a_hash_table then
							a_hash_table.make (0)
						elseif attached {ARRAYED_LIST [ANY]} Result as an_arrayed_list then
							an_arrayed_list.make (0)
						end
					end
				else
					-- for each field in the Eiffel object
					from i := 1 until i > field_count (Result) loop
						fld_name := field_name (i, Result)

						if a_dt_co.has_attribute (fld_name) and then attached a_dt_co.attribute_node (fld_name) as a_dt_attr then
							fld_att_static_tid := attached_type (field_static_type_of_type (i, a_type_id))

debug ("DT")
	io.put_string (indent_str + "Eiffel field '" + fld_name + "' (static type = " + fld_att_static_tid.out + ": '" + type_name_of_type (fld_att_static_tid) + "')%N")
end

							-- Test if DT object is a multiple-valued attribute of a complex type
							-- (i.e. not a list or hash of primitive types; see below for that)
							if a_dt_attr.is_container_type and not a_dt_attr.is_empty then
								-- see if Eiffel object field is also a container; create container object
								if is_eiffel_container_type (fld_att_static_tid) then
									-- create a new container if there was not already one created by the make_dt call
									if attached field (i, Result) as fld_val then
										a_gen_field := fld_val
									else
debug ("DT")
	io.put_string (indent_str +
	"DT type is multiple, and Eiffel field type is container; about to call (2) new_instance_of (" +
	type_name_of_type (fld_att_static_tid) + ")%N")
end
										a_gen_field := new_instance_of (fld_att_static_tid)
										set_reference_field (i, Result, a_gen_field)
debug ("DT")
	io.put_string (indent_str + "(return)%N")
end
									end

									-- FIXME: can only deal with one generic parameter for the moment
									populate_eif_container_from_dt (a_gen_field, a_dt_attr)

								-- type in parsed DT is container, but not in Eiffel class		
								else
									errors.add_error (ec_container_type_mismatch,
										<<type_name_of_type (fld_att_static_tid), type_name_of_type (a_type_id)>>, "create_object_from_dt")
								end

							-- according to DT tree, it is a single-valued attribute (note in DT,
							-- this can be a HASH or ARRAYED_LIST of a supported primitive types,
							-- because these are atomic in ODIN)
							else
								if attached {DT_OBJECT_LEAF} a_dt_attr.first_child as dt_leaf then
									a_dt_obj_leaf := dt_leaf

									-- In the DT tree, it is a REF; look up object that was created at
									-- target path of this reference in xref table
									if attached {DT_REFERENCE} a_dt_obj_leaf as a_dt_ref then
debug ("DT")
	io.put_string (indent_str + "DT_REFERENCE '" + a_dt_ref.as_string + "'%N")
end
										a_dt_ref.set_source_object_details (Result, i)
										object_ref_list.extend (a_dt_ref)

									-- it is a proper value field of some kind
									else
										fld_abstract_tid := field_type_of_type (i, a_type_id)

										-- Eiffel type of field must be an Eiffel primitive type; DT type should correspond
										-- This only deals with those types that Eiffel considers 'value' types, not the extended
										-- list that DT/ODIN consider as 'primitive' types, see below for that
										if fld_abstract_tid /= reference_type then
debug ("DT")
	io.put_string (indent_str + "Eiffel primitive field '" + fld_name + "' (abstract type = '" + fld_abstract_tid.out + "')%N")
end
											inspect fld_abstract_tid
											when character_8_type then -- = Character_type
												if attached {CHARACTER} a_dt_obj_leaf.value as v_typed then
													set_character_field (i, Result, v_typed)
												end
											when character_32_type then -- = Wide_character_type
												if attached {CHARACTER_32} a_dt_obj_leaf.value as v_typed then
													set_character_32_field (i, Result, v_typed)
												end

											when boolean_type then
												if attached {BOOLEAN} a_dt_obj_leaf.value as v_typed then
													set_boolean_field (i, Result, v_typed)
												end

											when integer_8_type then
												if attached {INTEGER_8} a_dt_obj_leaf.value as v_typed then
													set_integer_8_field (i, Result, v_typed)
												end
											when integer_16_type then
												if attached {INTEGER_16} a_dt_obj_leaf.value as v_typed then
													set_integer_16_field (i, Result, v_typed)
												end
											when integer_32_type then -- = Integer_type
												if attached {INTEGER_32} a_dt_obj_leaf.value as v_typed then
													set_integer_32_field (i, Result, v_typed)
												end
											when integer_64_type then
												if attached {INTEGER_64} a_dt_obj_leaf.value as v_typed then
													set_integer_64_field (i, Result, v_typed)
												end

											when natural_8_type then
												if attached {NATURAL_8} a_dt_obj_leaf.value as v_typed then
													set_natural_8_field (i, Result, v_typed)
												end
											when natural_16_type then
												if attached {NATURAL_16} a_dt_obj_leaf.value as v_typed then
													set_natural_16_field (i, Result, v_typed)
												end
											when natural_32_type then
												if attached {NATURAL_32} a_dt_obj_leaf.value as v_typed then
													set_natural_32_field (i, Result, v_typed)
												end
											when natural_64_type then
												if attached {NATURAL_64} a_dt_obj_leaf.value as v_typed then
													set_natural_64_field (i, Result, v_typed)
												end

											when real_32_type then -- = Real_type
												if attached {REAL_32} a_dt_obj_leaf.value as v_typed then
													set_real_32_field (i, Result, v_typed)
												end
											when real_64_type then -- = Double_type
												if attached {REAL_64} a_dt_obj_leaf.value as v_typed then
													set_real_64_field (i, Result, v_typed)
												end
											else
												-- unsupported: Pointer_type (0), Expanded_type (7), Bit_type (8)
												-- should never get here, because ODIN parser never generates these types
												raise ("create_object_from_dt software exception LOC #2")
											end

										-- Eiffel object field is an Eiffel reference type
										else
											dt_val_att_dyn_tid := attached_type (dynamic_type (a_dt_obj_leaf.value))

											-- figure out if it is an ARRAYED_LIST or HASH_TABLE in the DT structure; this only
											-- occurs for supported primitive types, i.e. a container of any complex object on
											-- the Eiffel side does not result in a container on a DT_OBJECT_LEAF, but instead a
											-- DT_COMPLEX_OBJECT with children. Further, the only possible containers used on the
											-- DT side are SEQUENCE or a HASH_TABLE. For both cases, special processing is needed.

											if attached {DT_PRIMITIVE_OBJECT_LIST} a_dt_obj_leaf then
												if is_eiffel_container_type (fld_att_static_tid) then -- Eiffel field type is compatible
													set_eif_primitive_sequence_field (i, Result, fld_att_static_tid, a_dt_obj_leaf.value)
												else -- type in parsed DT is container, but not in Eiffel class		
													errors.add_error (ec_container_type_mismatch,
														<<type_name_of_type (fld_att_static_tid), type_name_of_type (dt_val_att_dyn_tid)>>, "create_object_from_dt")
												end

											-- it is an INTERVAL[primitive type]
											elseif attached {DT_PRIMITIVE_OBJECT_INTERVAL} a_dt_obj_leaf as dt_po_ivl then
												-- Eiffel field type is directly compatible
												if is_eiffel_interval_type (fld_att_static_tid) then
													set_eif_object_primitive_interval_field (i, Result, fld_att_static_tid, dt_po_ivl.value)

												-- Eiffel type is a LIST [INTERVAL [G]] but the ODIN data only had one item and no continuation
												-- marker, so it has scanned as a DT_PRIMITIVE_OBJECT_INTERVAL rather than a DT_PRIMITIVE_OBJECT_INTERVAL_LIST
												elseif is_eiffel_interval_list_type (fld_att_static_tid) then
													set_eif_primitive_sequence_field (i, Result, fld_att_static_tid, dt_po_ivl.value)

												-- type in parsed DT is INTERVAL, but not in Eiffel class
												else
													errors.add_error (ec_interval_type_mismatch,
														<<type_name_of_type (fld_att_static_tid), type_name_of_type (dt_val_att_dyn_tid)>>, "create_object_from_dt")
												end

											-- it is an LIST [INTERVAL[primitive type]]
											elseif attached {DT_PRIMITIVE_OBJECT_INTERVAL_LIST} a_dt_obj_leaf as dt_po_ivl_list then
												-- Eiffel field type is compatible
												if is_eiffel_interval_list_type (fld_att_static_tid) then
													set_eif_primitive_sequence_field (i, Result, fld_att_static_tid, dt_po_ivl_list.value)
												-- type in parsed DT is INTERVAL, but not in Eiffel class
												else
													errors.add_error (ec_interval_list_type_mismatch,
														<<type_name_of_type (fld_att_static_tid), type_name_of_type (dt_val_att_dyn_tid)>>, "create_object_from_dt")
												end

											-- must be an atomic reference type
											else
												if field_conforms_to (dt_val_att_dyn_tid, fld_att_static_tid) then
													set_reference_field (i, Result, a_dt_obj_leaf.value)

												else -- take care of any type conversions required to match 'convert' statements in basic types
													-- first check we do is if the DT object is an atom, but the Eiffel type is actually
													-- a SEQUENCE; this can happen if the ODIN text does not follow the rules, and
													-- uses e.g. xxx = <val> for a list containing one value, instead of xxx = <val, ...>,
													-- which is the correct syntax; however, this is common, so we deal with it.
													if is_eiffel_container_type (fld_att_static_tid) then
														set_eif_primitive_sequence_field (i, Result, fld_att_static_tid, a_dt_obj_leaf.value)
													elseif attached cvt_dt_to_obj (a_dt_obj_leaf.value) as tc_val then
														set_reference_field (i, Result, tc_val)
													else
														errors.add_error (ec_atomic_type_mismatch,
															<<type_name_of_type (fld_att_static_tid), type_name_of_type (dt_val_att_dyn_tid)>>, "create_object_from_dt")
													end
												end
											end
										end
									end

								-- must be a reference type field of type DT_COMPLEX_OBJECT
								elseif attached {DT_COMPLEX_OBJECT} a_dt_attr.first_child as a_dt_co_fld then
									-- this is where the recursive call is
									-- first, check if the static type is overridden by a type specified in the DT tree
									if a_dt_attr.first_child.type_visible then
										fld_att_static_tid := dt_dynamic_type_from_string (a_dt_attr.first_child.im_type_name)
									end
									set_reference_field (i, Result, create_object_from_dt (a_dt_co_fld, fld_att_static_tid, Void))
								end
							end
						else
							-- TODO check on meaning of arriving here...it means that not all fields were present in the data.
						end
						i := i + 1
					end
				end
				if attached {DT_CONVERTIBLE} Result as a_dt_conv then
					-- FIXME: consider passing the error status or accumulator to this routine, so it can decide whether to run or not
					a_dt_conv.finalise_dt
				end
			end
debug ("DT")
	io.put_string (indent_str + "<--- DT_OBJECT_CONVERTER.create_object_from_dt%N")
	dec_indent
end
		rescue
			if dt_val_att_dyn_tid /= 0 then
				errors.add_error (ec_dt_proc_arg_type_mismatch,
					<<type_name_of_type (a_type_id), fld_name, type_name_of_type (fld_att_static_tid), type_name (a_dt_obj_leaf.value)>>, "create_object_from_dt")
			elseif attached exception_trace as et then
				errors.add_error (ec_dt_unknown_error, <<exception.out, et>>, "create_object_from_dt")
			else
				errors.add_error (ec_dt_unknown_error, <<exception.out, "no stack trace available">>, "create_object_from_dt")
			end
			retry
		end

	a_dt_obj_leaf: DT_OBJECT_LEAF
		attribute
			create {DT_PRIMITIVE_OBJECT} Result.make_anonymous ("")
		end

	fld_name: STRING
		attribute
			create Result.make_empty
		end

feature {NONE} -- Conversion to object

	set_eif_object_primitive_interval_field (eif_fld_idx: INTEGER; eif_obj: ANY; fld_att_static_tid:INTEGER; dt_ivl_value: INTERVAL [PART_COMPARABLE])
			-- set a field of a specific Eiffel type like INTERVAL[INTEGER_8] from the parsed form, which is always (currently)
			-- INTERVAL[INTEGER_32] (larger numbers will have to be parsed as INTERVAL[INTEGER_64]; same for large reals => REAL_64).
			-- This is currently a total hack, awaiting ES to implement INTEGER_GENERAL, REAL_GENERAL etc from the ECMA spec.
		require
			index_large_enough: eif_fld_idx >= 1
		do
			set_reference_field (eif_fld_idx, eif_obj, cvt_eif_interval (fld_att_static_tid, dt_ivl_value))
		end

	cvt_eif_interval (att_result_tid: INTEGER; dt_ivl: INTERVAL [PART_COMPARABLE]): INTERVAL [PART_COMPARABLE]
			-- generate a specific Eiffel type like INTERVAL[INTEGER_8] from the DT parsed form of the same kind of INTERVAL,
			-- which is always (currently) INTERVAL[INTEGER_32] (larger numbers will have to be parsed as INTERVAL[INTEGER_64];
			-- same for large reals => REAL_64).
			-- This is currently a total hack, awaiting ES to implement INTEGER_GENERAL, REAL_GENERAL etc from the ECMA spec.
		do
			-- perform required type conversions for Integers and Reals
			if attached {INTERVAL [INTEGER_32]} dt_ivl as src_ivl_int then
				if src_ivl_int.is_point then
					check attached {INTERVAL [PART_COMPARABLE]} new_instance_of (point_interval_type_ids.item (att_result_tid)) as ivl then
						Result := ivl
					end
					if attached {POINT_INTERVAL[INTEGER_8]} Result as targ_ivl_int_8 then
						targ_ivl_int_8.make (src_ivl_int.lower.as_integer_8)

					elseif attached {POINT_INTERVAL[INTEGER_16]} Result as targ_ivl_int_16 then
						targ_ivl_int_16.make (src_ivl_int.lower.as_integer_16)

					elseif attached {POINT_INTERVAL[INTEGER_32]} Result as targ_ivl_int_32 then
						targ_ivl_int_32.make (src_ivl_int.lower.as_integer_32)

					elseif attached {POINT_INTERVAL[INTEGER_64]} Result as targ_ivl_int_64 then
						targ_ivl_int_64.make (src_ivl_int.lower)

					elseif attached {POINT_INTERVAL[NATURAL_8]} Result as targ_ivl_nat_8 then
						targ_ivl_nat_8.make (src_ivl_int.lower.as_natural_8)

					elseif attached {POINT_INTERVAL[NATURAL_16]} Result as targ_ivl_nat_16 then
						targ_ivl_nat_16.make (src_ivl_int.lower.as_natural_16)

					elseif attached {POINT_INTERVAL[NATURAL_32]} Result as targ_ivl_nat_32 then
						targ_ivl_nat_32.make (src_ivl_int.lower.as_natural_32)

					elseif attached {POINT_INTERVAL[NATURAL_64]} Result as targ_ivl_nat_64 then
						targ_ivl_nat_64.make (src_ivl_int.lower.as_natural_64)
					end
				else
					check attached {INTERVAL[PART_COMPARABLE]} new_instance_of (proper_interval_type_ids.item (att_result_tid)) as ivl then
						Result := ivl
					end
					if attached {PROPER_INTERVAL[INTEGER_8]} Result as targ_ivl_int_8 then
						targ_ivl_int_8.make (src_ivl_int.lower.as_integer_8, src_ivl_int.upper.as_integer_8, src_ivl_int.lower_unbounded,
							src_ivl_int.upper_unbounded, src_ivl_int.lower_included, src_ivl_int.upper_included)

					elseif attached {PROPER_INTERVAL[INTEGER_16]} Result as targ_ivl_int_16 then
						targ_ivl_int_16.make (src_ivl_int.lower.as_integer_16, src_ivl_int.upper.as_integer_16, src_ivl_int.lower_unbounded,
							src_ivl_int.upper_unbounded, src_ivl_int.lower_included, src_ivl_int.upper_included)

					elseif attached {PROPER_INTERVAL[INTEGER_32]} Result as targ_ivl_int_32 then
						targ_ivl_int_32.make (src_ivl_int.lower.as_integer_32, src_ivl_int.upper.as_integer_32, src_ivl_int.lower_unbounded, src_ivl_int.upper_unbounded,
							src_ivl_int.lower_included, src_ivl_int.upper_included)

					elseif attached {PROPER_INTERVAL[INTEGER_64]} Result as targ_ivl_int_64 then
						targ_ivl_int_64.make (src_ivl_int.lower, src_ivl_int.upper, src_ivl_int.lower_unbounded, src_ivl_int.upper_unbounded,
							src_ivl_int.lower_included, src_ivl_int.upper_included)

					elseif attached {PROPER_INTERVAL[NATURAL_8]} Result as targ_ivl_nat_8 then
						targ_ivl_nat_8.make (src_ivl_int.lower.as_natural_8, src_ivl_int.upper.as_natural_8, src_ivl_int.lower_unbounded,
							src_ivl_int.upper_unbounded, src_ivl_int.lower_included, src_ivl_int.upper_included)

					elseif attached {PROPER_INTERVAL[NATURAL_16]} Result as targ_ivl_nat_16 then
						targ_ivl_nat_16.make (src_ivl_int.lower.as_natural_16, src_ivl_int.upper.as_natural_16, src_ivl_int.lower_unbounded,
							src_ivl_int.upper_unbounded, src_ivl_int.lower_included, src_ivl_int.upper_included)

					elseif attached {PROPER_INTERVAL[NATURAL_32]} Result as targ_ivl_nat_32 then
						targ_ivl_nat_32.make (src_ivl_int.lower.as_natural_32, src_ivl_int.upper.as_natural_32, src_ivl_int.lower_unbounded,
							src_ivl_int.upper_unbounded, src_ivl_int.lower_included, src_ivl_int.upper_included)

					elseif attached {PROPER_INTERVAL[NATURAL_64]} Result as targ_ivl_nat_64 then
						targ_ivl_nat_64.make (src_ivl_int.lower.as_natural_64, src_ivl_int.upper.as_natural_64, src_ivl_int.lower_unbounded,
							src_ivl_int.upper_unbounded, src_ivl_int.lower_included, src_ivl_int.upper_included)
					end
				end

			elseif attached {INTERVAL[REAL_32]} dt_ivl as src_ivl_real then
				if src_ivl_real.is_point then
					check attached {INTERVAL[PART_COMPARABLE]} new_instance_of (point_interval_type_ids.item (att_result_tid)) as ivl then
						Result := ivl
					end
					if attached {POINT_INTERVAL[REAL_32]} Result as targ_ivl_real_32 then
						targ_ivl_real_32.make (src_ivl_real.lower)

					elseif attached {POINT_INTERVAL[REAL_64]} Result as targ_ivl_int_64 then
						targ_ivl_int_64.make (src_ivl_real.lower)
					end
				else
					check attached {INTERVAL[PART_COMPARABLE]} new_instance_of (proper_interval_type_ids.item (att_result_tid)) as ivl then
						Result := ivl
					end
					if attached {PROPER_INTERVAL[REAL_32]} Result as targ_ivl_real_32 then
						targ_ivl_real_32.make (src_ivl_real.lower, src_ivl_real.upper, src_ivl_real.lower_unbounded, src_ivl_real.upper_unbounded,
							src_ivl_real.lower_included, src_ivl_real.upper_included)

					elseif attached {PROPER_INTERVAL[REAL_64]} Result as targ_ivl_int_64 then
						targ_ivl_int_64.make (src_ivl_real.lower, src_ivl_real.upper, src_ivl_real.lower_unbounded, src_ivl_real.upper_unbounded,
							src_ivl_real.lower_included, src_ivl_real.upper_included)
					end
				end

			-- check the case where it's an interval of dates (always parsed as ISO8601_XXX) but the declared Eiffel
			-- type is DATE, TIME, etc
			elseif attached {INTERVAL[ISO8601_TYPE]} dt_ivl as src_ivl_iso_val and then not
				field_conforms_to (att_result_tid, ({INTERVAL[ISO8601_TYPE]}).type_id)
			then
				if src_ivl_iso_val.is_point then
					check attached {INTERVAL[PART_COMPARABLE]} new_instance_of (point_interval_type_ids.item (att_result_tid)) as ivl then
						Result := ivl
					end
					if attached {POINT_INTERVAL[DATE]} Result as targ_ivl_date and
						attached {POINT_INTERVAL[ISO8601_DATE]} src_ivl_iso_val as src_ivl_iso_date and then
						attached src_ivl_iso_date.lower as iso_date
					then
						targ_ivl_date.make (iso_date.to_date)

					elseif attached {POINT_INTERVAL[TIME]} Result as targ_ivl_time and
						attached {POINT_INTERVAL[ISO8601_TIME]} src_ivl_iso_val as src_ivl_iso_time and then
						attached src_ivl_iso_time.lower as iso_time
					then
						targ_ivl_time.make (iso_time.to_time)

					elseif attached {POINT_INTERVAL[DATE_TIME]} Result as targ_ivl_date_time and
						attached {POINT_INTERVAL[ISO8601_DATE_TIME]} src_ivl_iso_val as src_ivl_iso_date_time and then
						attached src_ivl_iso_date_time.lower as iso_date_time
					then
						targ_ivl_date_time.make (iso_date_time.to_date_time)

					elseif attached {POINT_INTERVAL[DATE_TIME_DURATION]} Result as targ_ivl_duration and
						attached {POINT_INTERVAL[ISO8601_DURATION]} src_ivl_iso_val as src_ivl_iso_duration and then
						attached src_ivl_iso_duration.lower as iso_duration
					then
						targ_ivl_duration.make (iso_duration.to_date_time_duration)
					end
				else
					check attached {INTERVAL[PART_COMPARABLE]} new_instance_of (proper_interval_type_ids.item (att_result_tid)) as ivl then
						Result := ivl
					end
					if attached {PROPER_INTERVAL[DATE]} Result as targ_ivl_date and
						attached {POINT_INTERVAL[ISO8601_DATE]} src_ivl_iso_val as src_ivl_iso_date
					then
						targ_ivl_date.make (src_ivl_iso_date.lower, src_ivl_iso_date.upper,
							src_ivl_iso_date.lower_unbounded, src_ivl_iso_date.upper_unbounded,
							src_ivl_iso_date.lower_included, src_ivl_iso_date.upper_included)

					elseif attached {PROPER_INTERVAL[TIME]} Result as targ_ivl_time and
						attached {POINT_INTERVAL[ISO8601_TIME]} src_ivl_iso_val as src_ivl_iso_time
					then
						targ_ivl_time.make (src_ivl_iso_time.lower, src_ivl_iso_time.upper,
							src_ivl_iso_time.lower_unbounded, src_ivl_iso_time.upper_unbounded,
							src_ivl_iso_time.lower_included, src_ivl_iso_time.upper_included)

					elseif attached {PROPER_INTERVAL[DATE_TIME]} Result as targ_ivl_date_time and
						attached {POINT_INTERVAL[ISO8601_DATE_TIME]} src_ivl_iso_val as src_ivl_iso_date_time
					then
						targ_ivl_date_time.make (src_ivl_iso_date_time.lower, src_ivl_iso_date_time.upper,
							src_ivl_iso_date_time.lower_unbounded, src_ivl_iso_date_time.upper_unbounded,
							src_ivl_iso_date_time.lower_included, src_ivl_iso_date_time.upper_included)

					elseif attached {PROPER_INTERVAL[DATE_TIME_DURATION]} Result as targ_ivl_date_time and
						attached {POINT_INTERVAL[ISO8601_DURATION]} src_ivl_iso_val as src_ivl_iso_duration
					then
						targ_ivl_date_time.make (src_ivl_iso_duration.lower, src_ivl_iso_duration.upper,
							src_ivl_iso_duration.lower_unbounded, src_ivl_iso_duration.upper_unbounded,
							src_ivl_iso_duration.lower_included, src_ivl_iso_duration.upper_included)
					end
				end

			-- for all other types just use the value as is
			else
				check attached {INTERVAL[PART_COMPARABLE]} dt_ivl as ivl then
					Result := ivl
				end
			end
		end

	set_eif_primitive_sequence_field (eif_fld_idx: INTEGER; eif_object: ANY; fld_att_static_tid: INTEGER; dt_seq_value: ANY)
			-- set i-th field of an Eiffel object which is some kind of sequence of a DT primitive type,
			-- from a DT value which is either an ARRAYED_LIST or a single object like an INTEGER,
			-- which we want to turn into the member of a new sequence. The latter case caters for
			-- converting single values in ODIN syntax to SEQUENCE objects in Eiffel, for lists with
			-- only one member.
		require
			eif_fld_type_valid: fld_att_static_tid > 0
			index_large_enough: eif_fld_idx >= 1
		local
			converting_element_types: BOOLEAN
			eif_seq_ivl_item_tid, dt_seq_item_tid: INTEGER
		do
			-- if the DT object and the Eiffel object are of exactly the same types, then do a direct copy
			-- unless if there is already a container object there (set up due to a call to make_dt in an enclosing object)
			if not attached field (eif_fld_idx, eif_object) and dynamic_type (dt_seq_value) = fld_att_static_tid then
				set_reference_field (eif_fld_idx, eif_object, dt_seq_value)
			else
debug ("DT")
	io.put_string (indent_str + "---> DT_OBJECT_CONVERTER.set_eif_primitive_sequence_field: about to call new_instance_of (" +
		type_name_of_type (fld_att_static_tid) + ")%N")
	inc_indent
end
				-- if the Eiffel object field has not yet been created, create the container
				-- in a safe way
				if not attached field (eif_fld_idx, eif_object) then
					set_reference_field (eif_fld_idx, eif_object, new_instance_of (fld_att_static_tid))

					-- if it was an arrayed_list, call its make routine to get it into a decent state
					if attached {ARRAYED_LIST [ANY]} field (eif_fld_idx, eif_object) as al_field then
						al_field.make (0)
		-- can't do the following because 'make' isn't visible in ARRAYED_SET
		--			elseif attached {ARRAYED_SET [ANY]} field (eif_fld_idx, eif_object) as as_field then
		--				as_field.make (0)
					else
						-- FIXME should do something about other types
					end
				end
debug ("DT")
	io.put_string (indent_str + "(return)%N")
end
				-- now copy the values in
				if attached {SEQUENCE[INTERVAL[PART_COMPARABLE]]} field (eif_fld_idx, eif_object) as eif_seq_ivl then

					eif_seq_ivl_item_tid := generic_dynamic_type (eif_seq_ivl, 1)

					-- normally the ODIN data scanned as a DT_PRIMITIVE_OBJECT_INTERVAL_LIST,
					-- which means its value field is guaranteed to be an ARRAYED_LIST
					if attached {ARRAYED_LIST[INTERVAL [PART_COMPARABLE]]} dt_seq_value as dt_al then
						across dt_al as dt_al_csr loop
							eif_seq_ivl.extend (cvt_eif_interval (eif_seq_ivl_item_tid, dt_al_csr.item))
						end

					-- otherwise it means the ODIN scanned as a DT_PRIMITIVE_OBJECT - this happens with
					-- any list of one item. The ODIN syntax is to use "<xx, ...>" to
					-- show it is a list, but this is often forgotten
					-- So...we do a conversion, to fill the Eiffel list
					elseif attached {INTERVAL [PART_COMPARABLE]} dt_seq_value as dt_ivl_value then
						eif_seq_ivl.extend (cvt_eif_interval (eif_seq_ivl_item_tid, dt_ivl_value))

					else
						raise ("set_eif_primitive_sequence_field location #1")
					end

				elseif attached {SEQUENCE[ANY]} field (eif_fld_idx, eif_object) as eif_seq then
					-- check if element type in DT list conforms to that in object list; if not turn on flag to convert types
					if generic_count (dt_seq_value) > 0 then
						dt_seq_item_tid := generic_dynamic_type (dt_seq_value, 1)
					else
						dt_seq_item_tid := dynamic_type (dt_seq_value)
					end

					if not field_conforms_to (dt_seq_item_tid, generic_dynamic_type (eif_seq, 1))  then
						converting_element_types := True
					end

					-- normally the ODIN data scanned as a DT_PRIMITIVE_OBJECT_LIST,
					-- which means its value field is guaranteed to be an ARRAYED_LIST
					if attached {ARRAYED_LIST[ANY]} dt_seq_value as dt_al then
						across dt_al as dt_al_csr loop
							if converting_element_types then
								eif_seq.extend (cvt_dt_to_obj (dt_al_csr.item))
							else
								eif_seq.extend (dt_al_csr.item)
							end
						end

					-- otherwise it means the ODIN scanned as a DT_PRIMITIVE_OBJECT - this happens with
					-- any list of one item. The ODIN syntax is to use "<xx, ...>" to
					-- show it is a list, but this is often forgotten
					-- So...we do a conversion, to fill the Eiffel list
					else
						if converting_element_types then
							eif_seq.extend (cvt_dt_to_obj (dt_seq_value))
						else
							eif_seq.extend (dt_seq_value)
						end
					end
				end
			end
debug ("DT")
	io.put_string (indent_str + "<--- DT_OBJECT_CONVERTER.set_eif_primitive_sequence_field%N")
	dec_indent
end
		end

feature {NONE} -- Implementation

	object_ref_list: ARRAYED_LIST [DT_REFERENCE]
			-- list of DT_OBJECT_REFERENCE and DT_OBJECT_REFERENCE_LIST objects found in last top-level
			-- call to `dt_to_object'
		attribute
			create Result.make (0)
		end

	populate_eif_container_from_dt (eif_container_obj: ANY; a_dt_attr: DT_ATTRIBUTE)
			-- set generic values in a generic object, from a_dt_attr
			-- only deals with first generic parameter; generally safe for HASH_TABLE and LIST types
		require
			Dt_attr_node_multiple: a_dt_attr.is_container_type
		local
			att_static_cont_item_tid, att_result_obj_tid: INTEGER
		do
debug ("DT")
	io.put_string (indent_str + "---> DT_OBJECT_CONVERTER.populate_eif_container_from_dt%N")
	inc_indent
end
			att_static_cont_item_tid := attached_type (generic_dynamic_type (eif_container_obj, 1))

			-- determine dynamic type of generic type
			if attached {HASH_TABLE [ANY, HASHABLE]} eif_container_obj as a_hash_table then -- eif static type is a HASH_TABLE
				a_hash_table.make (0)
				across a_dt_attr as a_dt_attr_csr loop
					if attached {DT_REFERENCE} a_dt_attr_csr.item as a_dt_ref then
debug ("DT")
	io.put_string (indent_str + "DT_REFERENCE (inside HASH_TABLE DT_ATTRIBUTE)" + a_dt_ref.as_string + "%N")
end
						a_dt_ref.set_hash_table_source_object_details (a_hash_table, a_dt_attr_csr.item.id)
						object_ref_list.extend (a_dt_ref)

					-- the static type may be overridden by a type specified in the DT tree
					else
						if a_dt_attr_csr.item.type_visible then
							att_result_obj_tid := dt_dynamic_type_from_string (a_dt_attr_csr.item.im_type_name)
							if att_result_obj_tid <= 0 then
								errors.add_error (ec_dt_unknown_type_in_source, <<a_dt_attr_csr.item.im_type_name>>, "populate_eif_container_from_dt")
							end
						else
							att_result_obj_tid := att_static_cont_item_tid
						end
						if att_result_obj_tid > 0 then -- and then type_conforms_to (att_result_obj_tid, att_static_cont_item_tid) then
debug ("DT")
	io.put_string (indent_str + "..........> entering a_dt_attr_csr.item.as_object (" + type_name_of_type (att_result_obj_tid) + "%N")
end
							if attached a_dt_attr_csr.item.as_object (att_result_obj_tid, Void) as val then
								if field_conforms_to (dynamic_type (val), att_static_cont_item_tid) then
									a_hash_table.extend (val, a_dt_attr_csr.item.id)
								else
									errors.add_error (ec_dt_container_gen_param_type_mismatch,
										<<(1).out, a_hash_table.generating_type, type_name_of_type (att_static_cont_item_tid),
											val.generating_type>>, "populate_eif_container_from_dt")
								end
							end
						end
					end
				end

			-- must be a SEQUENCE
			elseif attached {SEQUENCE[ANY]} eif_container_obj as eif_seq then
				-- if the SEQUENCE is an ARRAYED_LIST, call its make routine to set it up properly
 				if attached {ARRAYED_LIST[ANY]} eif_seq as an_arrayed_list then
					an_arrayed_list.make (0)
				end
				across a_dt_attr as a_dt_attr_csr loop

					-- it's a reference, represented by a path
					if attached {DT_REFERENCE} a_dt_attr_csr.item as a_dt_ref2 then
debug ("DT")
	io.put_string (indent_str + "DT_REFERENCE (inside SEQUENCE DT_ATTRIBUTE)" + a_dt_ref2.as_string + "%N")
end
						a_dt_ref2.set_sequence_source_object_details (eif_seq)
						object_ref_list.extend (a_dt_ref2)

					-- it's a normal object
					else
						-- the static type may be overridden by a type specified in the DT tree
						if a_dt_attr_csr.item.type_visible then
							att_result_obj_tid := dt_dynamic_type_from_string (a_dt_attr_csr.item.im_type_name)
							if att_result_obj_tid <= 0 then
								errors.add_error (ec_dt_unknown_type_in_source, <<a_dt_attr_csr.item.im_type_name>>, "populate_eif_container_from_dt")
							end
						else
							att_result_obj_tid := att_static_cont_item_tid
						end

						-- now we know the dynamic type id to use
						if att_result_obj_tid > 0 then
							if attached a_dt_attr_csr.item.as_object (att_result_obj_tid, Void) as val then
								if field_conforms_to (dynamic_type (val), att_static_cont_item_tid) then
									eif_seq.extend (val)
								else
									errors.add_error (ec_dt_container_gen_param_type_mismatch,
										<<(1).out, eif_seq.generating_type, type_name_of_type (att_static_cont_item_tid),
											val.generating_type>>, "populate_eif_container_from_dt")
								end
							end
						end
					end
				end

			else -- something else; should fail in some way here
debug ("DT")
	io.put_string (indent_str + ">>>>>>>>>>>> set_container_object_data_from_dt reached forbidden 'else'<<<<<<<<<<<<<<<<<%N")
end
					raise ("populate_eif_container_from_dt software exception LOC #1")
			end
debug ("DT")
	io.put_string (indent_str + "<--- DT_OBJECT_CONVERTER.populate_eif_container_from_dt%N")
	dec_indent
end
		end

	populate_dt_attr_from_eif_hash (a_dt_attr: DT_ATTRIBUTE; a_hash_table: HASH_TABLE [ANY, HASHABLE]; a_static_tid: INTEGER)
			-- populate DT_ATTRIBUTE with DT_OBJECT child nodes corresponding to members of `a_hash_table';
			-- if those members are themselves DT-primitive type (including INTERVAL or SEQUENCE), use DT_PRIMITIVE_* types;
			-- if those members are themselves normal complex objects, call `populate_dt_from_object'
		local
			dynamic_hash_item_type, static_hash_item_tid: INTEGER
		do
			dynamic_hash_item_type := generic_dynamic_type (a_hash_table, 1)

			-- it is a Hash of INTERVALs[some primitive or leaf type]; convert to DT_PRIMITIVE_OBJECT_INTERVAL
			if is_dt_primitive_interval_conforming_type (dynamic_hash_item_type) then
				across a_hash_table as ht_csr loop
debug ("DT")
	io.put_string (indent_str + "---> DT_OBJECT_CONVERTER.populate_dt_attr_from_eif_hash (Hash of INTERVAL[DT primitive type]): from_obj_proc.call ([DT_ATTRIBUTE_NODE (" +
		a_dt_attr.im_attr_name + "), " + ht_csr.item.generating_type + ", " + ht_csr.key.out + ")%N")
	inc_indent
end
					if attached {INTERVAL[PART_COMPARABLE]} ht_csr.item as eif_prim_ivl then
						a_dt_attr.put_child (create {DT_PRIMITIVE_OBJECT_INTERVAL}.make_identified (eif_prim_ivl, ht_csr.key.out))
					end
				end

			-- it is a Hash of SEQUENCEs of some DT primitive type
			elseif is_dt_primitive_sequence_conforming_type (dynamic_hash_item_type) then
				across a_hash_table as ht_csr loop
debug ("DT")
	io.put_string (indent_str + "DT_OBJECT_CONVERTER.populate_dt_attr_from_eif_hash (Hash of SEQUENCE): from_obj_proc.call ([DT_ATTRIBUTE_NODE (" +
		a_dt_attr.im_attr_name + "), " + ht_csr.item.generating_type + ", " + ht_csr.key.out + ")%N")
end
					if attached {SEQUENCE[ANY]} ht_csr.item as eif_prim_seq then
						a_dt_attr.put_child (create {DT_PRIMITIVE_OBJECT_LIST}.make_identified (eif_prim_seq, ht_csr.key.out))
					end
				end

			-- it is a Hash of a DT primitive type then
			elseif is_dt_primitive_atomic_type (dynamic_hash_item_type) then
				across a_hash_table as ht_csr loop
debug ("DT")
	io.put_string (indent_str + "DT_OBJECT_CONVERTER.populate_dt_attr_from_eif_hash (hash of DT primitive type): from_obj_proc.call ([DT_ATTRIBUTE_NODE (" +
		a_dt_attr.im_attr_name + "), " + ht_csr.item.generating_type +
		", " + ht_csr.key.out + ")%N")
end
					a_dt_attr.put_child (create {DT_PRIMITIVE_OBJECT}.make_identified (ht_csr.item, ht_csr.key.out))
				end

			-- it is a Hash of complex objects
			else
				static_hash_item_tid := generic_dynamic_type_of_type (a_static_tid, 1)
				across a_hash_table as ht_csr loop
debug ("DT")
	io.put_string (indent_str + "DT_OBJECT_CONVERTER.populate_dt_attr_from_eif_hash (Hash of complex objects): from_obj_proc.call ([DT_ATTRIBUTE_NODE (" +
		a_dt_attr.im_attr_name + "), " + ht_csr.item.generating_type +
		", " + ht_csr.key.out + ")%N")
end
					populate_dt_from_object (ht_csr.item,
						create_complex_object_node (a_dt_attr, ht_csr.key.out), static_hash_item_tid)
				end
			end
debug ("DT")
	io.put_string (indent_str + "<--- DT_OBJECT_CONVERTER.populate_dt_attr_from_eif_hash%N")
	dec_indent
end
		end

	populate_dt_attr_from_eif_sequence (a_dt_attr: DT_ATTRIBUTE; an_eif_seq: SEQUENCE[ANY]; a_static_tid: INTEGER)
			-- Create an appropriate DT object from an Eiffel SEQUENCE object
			-- FIXME: only deal with the 1st generic param at the moment
		local
			static_seq_item_tid, dyn_seq_item_tid: INTEGER
			dt_prim_ivl_list: DT_PRIMITIVE_OBJECT_INTERVAL_LIST
		do
			dyn_seq_item_tid := attached_type (generic_dynamic_type (an_eif_seq, 1))

			-- contained type is an INTERVAL[PART_COMPARABLE];
			-- convert to DT_PRIMITIVE_OBJECT_INTERVAL_LIST
			if is_dt_primitive_interval_conforming_type (dyn_seq_item_tid) then
				if attached {ARRAYED_LIST[INTERVAL[PART_COMPARABLE]]} an_eif_seq as eif_al_ivl then
					create dt_prim_ivl_list.make_anonymous (eif_al_ivl)
				else
					create dt_prim_ivl_list.make_anonymous (create {ARRAYED_LIST[INTERVAL[PART_COMPARABLE]]}.make (0))
					raise ("populate_dt_attr_from_eif_sequence software exception LOC #1")
				end
				a_dt_attr.put_child (dt_prim_ivl_list)
--				from an_eif_seq.start until an_eif_seq.off loop
--debug ("DT")
--	io.put_string (indent_str + "---> DT_OBJECT_CONVERTER.populate_dt_attr_from_eif_sequence (SEQUENCE of INTERVAL [DT primitive]): from_obj_proc.call ([DT_ATTRIBUTE_NODE (" +
--		a_dt_attr.im_attr_name + "), " + an_eif_seq.item.generating_type + ", " + an_eif_seq.index.out + ")%N")
--	inc_indent
--end
--					if attached {INTERVAL[PART_COMPARABLE]} an_eif_seq.item as v_typed then
--						a_dt_attr.put_child (create {DT_PRIMITIVE_OBJECT_INTERVAL}.make_identified (v_typed, an_eif_seq.index.out))
--					end
--					an_eif_seq.forth
--				end

			-- contained type is a SEQUENCE of some DT primitive type
			elseif is_dt_primitive_sequence_conforming_type (dyn_seq_item_tid) then
				from an_eif_seq.start until an_eif_seq.off loop
debug ("DT")
	io.put_string (indent_str + "DT_OBJECT_CONVERTER.populate_dt_attr_from_eif_sequence (SEQUENCE of DT primitive): from_obj_proc.call ([DT_ATTRIBUTE_NODE ('" +
		a_dt_attr.im_attr_name + "'), '" + an_eif_seq.item.generating_type + "', " + an_eif_seq.index.out + ")%N")
end
					if attached {SEQUENCE[ANY]} an_eif_seq.item as v_typed then
						a_dt_attr.put_child (create {DT_PRIMITIVE_OBJECT_LIST}.make_identified (v_typed, an_eif_seq.index.out))
					end
					an_eif_seq.forth
				end

			-- contained type is a DT primitive type
			elseif is_dt_primitive_atomic_type (dyn_seq_item_tid) then
				from an_eif_seq.start until an_eif_seq.off loop
debug ("DT")
	io.put_string (indent_str + "DT_OBJECT_CONVERTER.populate_dt_attr_from_eif_sequence (SEQUENCE of DT primitive): from_obj_proc.call ([DT_ATTRIBUTE_NODE ('" +
		a_dt_attr.im_attr_name + "'), '" + an_eif_seq.item.generating_type + "', " + an_eif_seq.index.out + ")%N")
end
					a_dt_attr.put_child (create {DT_PRIMITIVE_OBJECT}.make_identified (an_eif_seq.item, an_eif_seq.index.out))
					an_eif_seq.forth
				end

			-- contained type is a complex type; recurse
			else
				static_seq_item_tid := generic_dynamic_type_of_type (a_static_tid, 1)
				from an_eif_seq.start until an_eif_seq.off loop
debug ("DT")
	io.put_string (indent_str + "DT_OBJECT_CONVERTER.populate_dt_attr_from_eif_sequence (SEQUENCE of complex objects): from_obj_proc.call ([DT_ATTRIBUTE_NODE ('" +
		a_dt_attr.im_attr_name + "'), '" + an_eif_seq.item.generating_type + "', " + an_eif_seq.index.out + ")%N")
end
					populate_dt_from_object (an_eif_seq.item, create_complex_object_node (a_dt_attr, an_eif_seq.index.out), static_seq_item_tid)
					an_eif_seq.forth
				end
			end
debug ("DT")
	io.put_string (indent_str + "<--- DT_OBJECT_CONVERTER.populate_dt_attr_from_eif_sequence%N")
	dec_indent
end
		end

	cvt_dt_to_obj (dt_val: ANY): ANY
			-- infer some other type that dt_val must be. For now, the mappings are 1:1, e.g.
			-- ISO8601_DATE => DATE, but in the future more field information may be needed to make
			-- the correct inference. If no type match can be made, Result is Void
		local
			dt: INTEGER
		do
			if attached {ISO8601_DATE} dt_val as iso_date then
				Result := iso_date.to_date
			elseif attached {ISO8601_TIME} dt_val as iso_time then
				Result := iso_time.to_time
			elseif attached {ISO8601_DATE_TIME} dt_val as iso_date_time then
				Result := iso_date_time.to_date_time
			elseif attached {ISO8601_DURATION} dt_val as iso_duration then
				Result := iso_duration.to_date_time_duration
			else
				dt := attached_type (dynamic_type (dt_val))
				if dt_to_obj_agents.has (dt) and then attached dt_to_obj_agents.item (dt) as dt_to_obj_agt then
					Result := dt_to_obj_agt.item ([dt_val])
				else
					Result := "unconverted"
				end
			end
		end

feature {SHARED_DT_OBJECT_CONVERTER} -- Implementation

	dt_to_obj_agents: HASH_TABLE [FUNCTION [ANY, TUPLE[ANY], ANY], INTEGER]
			-- table of conversion functions that will convert a DT primitive type to some other type needed by object classes
		once
			create Result.make (0)
		end

	obj_to_dt_agents: HASH_TABLE [FUNCTION [ANY, TUPLE[ANY], DT_OBJECT_LEAF], INTEGER]
			-- table of conversion functions that will convert an object type into a DT primitive type, keyed by Eiffel object dynamic type
		once
			create Result.make (0)
		end

end


