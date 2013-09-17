note
	component:   "Eiffel Object Modelling Framework"
	description: "Factory class for creating Data Tree nodes"
	keywords:    "Data Tree"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class DT_FACTORY

inherit
	DT_TYPES

feature -- Access

	create_complex_object_node (a_parent: DT_ATTRIBUTE; a_node_id: detachable STRING): DT_COMPLEX_OBJECT
		require
			a_node_id_valid: attached a_node_id implies not a_node_id.is_empty
		do
			if attached a_node_id then
				create Result.make_identified(a_node_id)
			else
				create Result.make_anonymous
			end
			a_parent.put_child(Result)
		end

	create_attribute_node (a_parent: DT_COMPLEX_OBJECT; a_rel_name: STRING; is_multiple: BOOLEAN): DT_ATTRIBUTE
			-- create a rel_node with a simple name like "text" or "description"
			-- is_multiple flag indicates if multiple cardinality
		do
			if is_multiple then
				create Result.make_container (a_rel_name)
			else
				create Result.make_single (a_rel_name)
			end
			a_parent.put_attribute(Result)
		end

	create_dt_primitive_object (a_parent: DT_ATTRIBUTE; an_item: ANY; a_node_id: detachable STRING): DT_PRIMITIVE_OBJECT
			-- an_item must be STRING, INTEGER, REAL, DOUBLE, BOOLEAN, CHARACTER,
			-- DATE, TIME, DATE_TIME, DATE_TIME_DURATION
		require
			an_item_valid: has_dt_primitive_atomic_type (an_item)
			a_node_id_valid: attached a_node_id implies not a_node_id.is_empty
		do
			if attached a_node_id then
				create Result.make_identified (an_item, a_node_id)
			else
				create Result.make_anonymous (an_item)
			end
			a_parent.put_child(Result)
		end

	create_primitive_object_list (a_parent: DT_ATTRIBUTE; an_item: LIST [ANY]; a_node_id: detachable STRING): DT_PRIMITIVE_OBJECT_LIST
			-- an_item must conform to LIST of STRING, INTEGER, REAL, DOUBLE, BOOLEAN, CHARACTER,
			-- DATE, TIME, DATE_TIME, DATE_TIME_DURATION
		require
			an_item_valid: has_dt_primitive_sequence_type(an_item)
			a_node_id_valid: attached a_node_id implies not a_node_id.is_empty
		do
			if attached a_node_id then
				create Result.make_identified(an_item, a_node_id)
			else
				create Result.make_anonymous(an_item)
			end
			a_parent.put_child(Result)
		end

	create_primitive_object_term (a_parent: attached DT_ATTRIBUTE; a_qualified_code: attached STRING; a_node_id: STRING): DT_PRIMITIVE_OBJECT
			-- an_item must be in the form TERMINOLOGY_ID::CODE
		require
			a_qualified_code_valid: not a_qualified_code.is_empty
			a_node_id_valid: a_node_id /= Void implies not a_node_id.is_empty
		do
			if a_node_id /= Void then
				create Result.make_identified (create {TERMINOLOGY_CODE}.make_from_string(a_qualified_code), a_node_id)
			else
				create Result.make_anonymous (create {TERMINOLOGY_CODE}.make_from_string(a_qualified_code))
			end
			a_parent.put_child(Result)
		end

	create_primitive_object_term_list (a_parent: attached DT_ATTRIBUTE; an_item: attached LIST [ANY]; a_node_id: STRING): DT_PRIMITIVE_OBJECT_LIST
			-- an_item must conform to LIST of STRINGs representing terms
		require
			an_item_valid: has_dt_primitive_sequence_type(an_item)
			a_node_id_valid: a_node_id /= Void implies not a_node_id.is_empty
		do
			Result := create_primitive_object_list(a_parent, an_item, a_node_id)
		end

end


