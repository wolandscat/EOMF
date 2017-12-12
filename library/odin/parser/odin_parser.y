%{
note
	component:   "Eiffel Object Modelling Framework"
	description: "Parser for Object Data Instance Notation (ODIN)"
	keywords:    "ODIN, data syntax"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2004- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class ODIN_PARSER

inherit
	PARSER_VALIDATOR
		rename
			reset as validator_reset,
			make as make_parser_skeleton
		redefine
			output
		end

	OG_DEFINITIONS
		export
			{NONE} all
		end

	SHARED_MESSAGE_DB
		export
			{NONE} all
		end

	ISO8601_ROUTINES
		export
			{NONE} all
		end

	ODIN_SCANNER
		rename
			make as make_scanner
		redefine
			reset
		end

	ODIN_MESSAGES_IDS
		export
			{NONE} all
		end

create
	make

%}

%token <INTEGER> V_INTEGER 
%token <REAL> V_REAL 
%token <STRING> V_TYPE_IDENTIFIER V_GENERIC_TYPE_IDENTIFIER V_ATTRIBUTE_IDENTIFIER V_STRING
%token <STRING> V_ISO8601_EXTENDED_DATE V_ISO8601_EXTENDED_TIME V_ISO8601_EXTENDED_DATE_TIME V_ISO8601_DURATION
%token <STRING> V_CADL_BLOCK
%token <STRING> V_QUALIFIED_TERM_CODE_REF V_TERMINOLOGY_ID
%token <STRING> V_URI
%token <CHARACTER> V_CHARACTER

%token SYM_START_DBLOCK SYM_END_DBLOCK	-- value block
%token SYM_EQ SYM_ELLIPSIS SYM_LIST_CONTINUE SYM_INTERVAL_DELIM

%token SYM_TRUE SYM_FALSE
%left SYM_LT SYM_GT SYM_LE SYM_GE

%token ERR_CHARACTER ERR_STRING ERR_CADL_MISPLACED
%token <STRING> ERR_V_QUALIFIED_TERM_CODE_REF

%left UNARY_MINUS

%type <STRING> type_identifier
%type <INTEGER> integer_value
%type <REAL> real_value
%type <BOOLEAN> boolean_value
%type <CHARACTER> character_value
%type <ISO8601_DATE> date_value
%type <ISO8601_DATE_TIME> date_time_value
%type <ISO8601_TIME> time_value
%type <ISO8601_DURATION> duration_value
%type <TERMINOLOGY_CODE> term_code
%type <URI> uri_value

%type <DT_COMPLEX_OBJECT> single_attr_object_block, untyped_single_attr_object_block
%type <DT_COMPLEX_OBJECT> container_attr_object_block, untyped_container_attr_object_block
%type <DT_COMPLEX_OBJECT> complex_object_block
%type <DT_OBJECT_LEAF> untyped_primitive_object_block, primitive_object_block object_reference_block
%type <DT_OBJECT_LEAF> absolute_path_object_value primitive_object
%type <ANY> primitive_value

%type <OG_PATH> absolute_path relative_path
%type <OG_PATH_ITEM> path_segment
%type <ARRAYED_LIST[OG_PATH]> absolute_path_list

%type <STRING> string_value
%type <ARRAYED_LIST[STRING]> string_list
%type <ARRAYED_LIST[INTEGER]> integer_list
%type <ARRAYED_LIST[REAL]> real_list
%type <ARRAYED_LIST[CHARACTER]> character_list
%type <ARRAYED_LIST[BOOLEAN]> boolean_list
%type <ARRAYED_LIST[ISO8601_DATE]> date_list
%type <ARRAYED_LIST[ISO8601_TIME]> time_list
%type <ARRAYED_LIST[ISO8601_DATE_TIME]> date_time_list
%type <ARRAYED_LIST[ISO8601_DURATION]> duration_list
%type <ARRAYED_LIST[TERMINOLOGY_CODE]> term_code_list
%type <ARRAYED_LIST[ANY]> primitive_list

%type <INTERVAL[INTEGER]> integer_interval
%type <INTERVAL[REAL]> real_interval
%type <INTERVAL[ISO8601_TIME]> time_interval
%type <INTERVAL[ISO8601_DATE]> date_interval
%type <INTERVAL[ISO8601_DATE_TIME]> date_time_interval
%type <INTERVAL[ISO8601_DURATION]> duration_interval
%type <INTERVAL[PART_COMPARABLE]> primitive_interval

%type <ARRAYED_LIST [INTERVAL[INTEGER]]> integer_interval_list
%type <ARRAYED_LIST [INTERVAL[REAL]]> real_interval_list
%type <ARRAYED_LIST [INTERVAL[ISO8601_TIME]]> time_interval_list
%type <ARRAYED_LIST [INTERVAL[ISO8601_DATE]]> date_interval_list
%type <ARRAYED_LIST [INTERVAL[ISO8601_DATE_TIME]]> date_time_interval_list
%type <ARRAYED_LIST [INTERVAL[ISO8601_DURATION]]> duration_interval_list
%type <ARRAYED_LIST [INTERVAL[PART_COMPARABLE]]> primitive_interval_list

%%

input: attr_vals	-- anonymous object
		{
			output := complex_object_nodes.item
debug("ODIN_parse")
	io.put_string("Object data definition validated (non-delimited)%N")
end
			accept
		}
	| complex_object_block
		{
			output := $1
debug("ODIN_parse")
	io.put_string("Object data definition validated%N")
end
			accept
		}
	| error
		{
debug("ODIN_parse")
	io.put_string("ODIN text NOT validated%N")
end
			abort
		}
	;


---------------------- body ---------------------

attr_vals: attr_val
		{
debug("ODIN_parse")
	io.put_string(indent + "attr_val complete%N")
end
		}
	| attr_vals attr_val
		{
debug("ODIN_parse")
	io.put_string(indent + "attr_val complete%N")
end
		}
	| attr_vals ';' attr_val
		{
debug("ODIN_parse")
	io.put_string(indent + "attr_val complete%N")
end
		}
	;


attr_val: attr_id SYM_EQ object_block -- could be a single or multiple attr
		{
debug("ODIN_parse")
	io.put_string(indent + "attr_val: POP attr node (" +  attr_nodes.item.im_attr_name+ ")%N")
	indent.remove_tail(1)
end
			attr_nodes.remove
		}
	;

attr_id: V_ATTRIBUTE_IDENTIFIER
		{
			-- create first anonymous object
			if complex_object_nodes.is_empty then
debug("ODIN_parse")
	io.put_string(indent + "attr_id: create complex_object_node.make_anonymous%N")
	io.put_string(indent + "attr_id: PUSH Object node%N")
	indent.append("%T")
end
				create complex_object_node.make_anonymous
				complex_object_nodes.extend(complex_object_node)
			end

debug("ODIN_parse")
	io.put_string(indent + "attr_id: create_attr_node.make_single(<<" + $1 + ">>)%N")
end
			create attr_node.make_single($1)

debug("ODIN_parse")
	io.put_string(indent + "attr_id: complex_object_nodes.item(" + complex_object_nodes.item.id + 
			").put_attribute(<<" + attr_node.im_attr_name + ">>)%N")
end
			if not complex_object_nodes.item.has_attribute(attr_node.im_attr_name) then
				complex_object_nodes.item.put_attribute(attr_node)
			else
				abort_with_error (ec_VDATU, <<attr_node.im_attr_name>>)
			end

debug("ODIN_parse")
	io.put_string(indent + "attr_id: PUSH attr node%N")
	indent.append("%T")
end
			attr_nodes.extend(attr_node)
			create obj_key.make_empty
		}
	| V_ATTRIBUTE_IDENTIFIER error
		{
			abort_with_error (ec_SDAT, Void)
		}
	;

--
-- An object_block is any block enclosed in <> with optional leading type name
--
object_block: complex_object_block
		{
			-- if object_block was an empty object then get rid of it from parent attribute
			if complex_object_nodes.item.is_empty then
				attr_nodes.item.remove_child (complex_object_nodes.item)
			end
		}
	| primitive_object_block
	| object_reference_block
	| SYM_START_DBLOCK SYM_END_DBLOCK -- empty object
		{
			-- for single-valued attributes, remove the attribute
			if obj_key.is_empty then
				complex_object_nodes.item.remove_attribute (attr_node.im_attr_name)
			end
		}
	;

complex_object_block: single_attr_object_block
		{
			$$ := $1
		}
	| container_attr_object_block
		{
			$$ := $1
		}
	;

--
-- --------------------------- multiple attr objects -------------------------------
--
container_attr_object_block: untyped_container_attr_object_block 
		{
			$$ := $1
		}
	| type_identifier untyped_container_attr_object_block
		{
			-- probably should set type name on owning attribute - it doesn't belong on each 
			-- object, since it is essentially a constraint
			$$ := $2
		}
	;

--
-- An untyped_container_attr_object_block is a block of the form:
--	<
--		[key1] = <...>
--		[key2] = <...>
--		[keyN] = <...>
--	>
--
-- Here we pop the current attribute node off if it was a synthesised container node,
-- i.e. created by a call DT_ATTRIBUTE.make_nested_container
--
untyped_container_attr_object_block: container_attr_object_block_head keyed_objects SYM_END_DBLOCK
		{
			$$ := complex_object_nodes.item

			-- if the keyed_objects were all empty, then the attribute can be thrown away 
			-- as well, since we don't create void object structures
			if attr_nodes.item.is_empty and attached attr_nodes.item.parent as att_dt_obj then
				att_dt_obj.remove_attribute (attr_nodes.item.im_attr_name)
			end

			-- if the current C_ATTRIBUTE_NODE is a synthesised one, under a keyed object,
			-- then pop it off the attribute stack, and also pop off its parent object
			if complex_object_nodes.item.is_addressable and attr_nodes.item.is_nested then
				-- pop the generic attr node
debug("ODIN_parse")
	io.put_string(indent + "container_attr_object_block: POP attr node (" +  
		attr_nodes.item.im_attr_name+ ")%N")
	indent.remove_tail(1)
end
				attr_nodes.remove

debug("ODIN_parse")
	io.put_string(indent + "container_attr_object_block: POP Object node(" + 
		complex_object_nodes.item.id + ")%N")
	indent.remove_tail(1)
end
				complex_object_nodes.remove
			end
		}
	;

--
-- This rule supports nestings of container types in ODIN of the form:
--
--	xxx = <
--		[key1] = <
--			[keyA] = <...>
--			[keyB] = <...>
--			[keyZ] = <...>
--		>
--		[key2] = <...>
--			[keyA] = <...>
--			[keyB] = <...>
--		>
--	>
-- 
-- The above corresponds to the type structure:
-- 	class X
--		xxx: CONTAINER_TYPE [CONTAINER_TYPE [LEAF_TYPE]]
--	end
--
--	Where CONTAINER_TYPE is typically ARRAYED_LIST, HASH_TABLE etc
--
container_attr_object_block_head: SYM_START_DBLOCK
		{
			-- if obj_key is set, it means we are inside a keyed object, and we have hit more keyed objects
			if not obj_key.is_empty then
				create complex_object_node.make_identified (obj_key)
				if not attr_nodes.item.has_child_with_id (complex_object_node.id) then
debug("ODIN_parse")
	io.put_string(indent + "container_attr_object_block_head; attr_nodes(<<" + 
		attr_nodes.item.im_attr_name + ">>).item.put_child(complex_object_node(" + 
		complex_object_node.id + "))%N")
end
					attr_nodes.item.put_child (complex_object_node)
				else
					abort_with_error (ec_VOKU, <<complex_object_node.id, attr_nodes.item.im_attr_name >>)
				end

debug("ODIN_parse")
	io.put_string(indent + "container_attr_object_block_head: PUSH Obj node%N")
	indent.append("%T")
end
				complex_object_nodes.extend(complex_object_node)

				-- now create a generic attribute node to stand for the hidden attribute of the 
				-- generic object, e.g. it might be List<T>.items or whatever
debug("ODIN_parse")
	io.put_string(indent + "container_attr_object_block_head: create_attr_node.make_nested_container%N")
end
				create attr_node.make_nested_container

debug("ODIN_parse")
	io.put_string(indent + "container_attr_object_block_head: complex_object_node(" + 
			complex_object_node.id + ").put_attribute(" + attr_node.im_attr_name + ")%N")
end
				complex_object_node.put_attribute(attr_node)

debug("ODIN_parse")
	io.put_string(indent + "container_attr_object_block_head: PUSH attr node%N")
	indent.append("%T")
end
				attr_nodes.extend(attr_node)
			end
		}
	;

keyed_objects: keyed_object
		{
debug("ODIN_parse")
	io.put_string(indent + "one keyed object%N")
end
		}
	| keyed_objects keyed_object
		{
debug("ODIN_parse")
	io.put_string(indent + "multiple keyed objects%N")
end
		}
	;

keyed_object: object_key SYM_EQ object_block
		{
debug("ODIN_parse")
	io.put_string(indent + "(keyed object)%N")
end
		}
	;

object_key: '[' primitive_value ']'
		{
			obj_key := $2.out

debug("ODIN_parse")
		io.put_string(indent + "object_key: " + obj_key + 
			" (setting " + attr_nodes.item.im_attr_name + " to Multiple)%N")
end
			if obj_key.is_empty then
				abort_with_error (ec_SOBK, <<attr_nodes.item.path>>)
			else
				if not attr_nodes.is_empty then
					attr_nodes.item.set_container_type
				else
					abort_with_error (ec_SGEE, <<attr_nodes.item.path>>)
				end
			end
		}
	;

--
-- --------------------------- single attr objects -------------------------------
--

single_attr_object_block: untyped_single_attr_object_block
		{
debug("ODIN_parse")
	io.put_string(indent + "untyped single_attr_object_block%N")
end
			$$ := $1
		}
	| type_identifier untyped_single_attr_object_block
		{
debug("ODIN_parse")
	io.put_string(indent + "typed single_attr_object_block; type = " + $1 + "%N")
end
			$2.set_visible_im_type_name($1)
			$$ := $2
		}
	;

--
-- An untyped_single_attr_object_block is any block of the form:
--	<
--		attr1 = <...>
--		attr2 = <...>
--		attrN = <...>
--	>
--
untyped_single_attr_object_block: single_attr_object_complex_head attr_vals SYM_END_DBLOCK
		{
debug("ODIN_parse")
	io.put_string(indent + "single_attr_object_complex_block: POP Object node(" + 
		complex_object_nodes.item.id + ")%N")
	indent.remove_tail(1)
end
			$$ := complex_object_nodes.item
			complex_object_nodes.remove
		}
	;

single_attr_object_complex_head: SYM_START_DBLOCK
		{
			-- if parent attr is not multiple, create an anon object; else an object identified by a key
			if attr_nodes.is_empty or else not attr_nodes.item.is_container_type then
debug("ODIN_parse")
	io.put_string(indent + "single_attr_object_complex_head: create complex_object_node.make_anonymous%N")
end
				create complex_object_node.make_anonymous
			else
debug("ODIN_parse")
	io.put_string(indent + "single_attr_object_complex_head: create complex_object_node.make (" + obj_key + ")%N")
end
				create complex_object_node.make_identified (obj_key)
				create obj_key.make_empty
			end

			-- now put the new object under its attribute, if one exists
			if not attr_nodes.is_empty then
				if not attr_nodes.item.has_child_with_id (complex_object_node.id) then
debug("ODIN_parse")
	io.put_string(indent + "single_attr_object_complex_head: attr_nodes(<<" + 
		attr_nodes.item.im_attr_name + ">>).item.put_child(complex_object_node(" + 
		complex_object_node.id + "))%N")
end
					attr_nodes.item.put_child(complex_object_node)
				else
					abort_with_error (ec_VOKU, <<complex_object_node.id, attr_nodes.item.im_attr_name >>)
				end
			end

			-- finally, put the new object on the object stack
debug("ODIN_parse")
	io.put_string(indent + "single_attr_object_complex_head: PUSH Obj node%N")
	indent.append("%T")
end
			complex_object_nodes.extend(complex_object_node)
		}
	;

--
-- ------------------------- primitive objects ---------------------
--
primitive_object_block: untyped_primitive_object_block
		{
debug("ODIN_parse")
	io.put_string(indent + "untyped primitive_object_block%N")
end
			$$ := $1
		}
	| type_identifier untyped_primitive_object_block
		{
debug("ODIN_parse")
	io.put_string(indent + "typed primitive_object_block; type = " + $1 + "%N")
end
			$2.set_visible_im_type_name ($1)
			$$ := $2
		}
	;
 
--
-- untyped primitive blocks can only be of the following types
--	
--
untyped_primitive_object_block: SYM_START_DBLOCK primitive_object SYM_END_DBLOCK
		{
			$$ := $2
			create obj_key.make_empty
debug("ODIN_parse")
	io.put_string(indent + "untyped_primitive_object_block; attr_nodes(<<" + 
			attr_nodes.item.im_attr_name + ">>).item.put_child(<<" + 
			$$.as_string + ">>)%N")
end
			if not attr_nodes.item.has_child_with_id ($$.id) then
				attr_nodes.item.put_child ($$)
			else
				abort_with_error (ec_VOKU, <<$$.id, attr_nodes.item.im_attr_name >>)
			end
		}
	;

primitive_object: primitive_value
		{
			if not obj_key.is_empty then
				create {DT_PRIMITIVE_OBJECT} $$.make_identified ($1, obj_key)
			else
				create {DT_PRIMITIVE_OBJECT} $$.make_anonymous ($1)
			end
		}
	| primitive_list
		{
			if not obj_key.is_empty then
				create {DT_PRIMITIVE_OBJECT_LIST} $$.make_identified ($1, obj_key)
			else
				create {DT_PRIMITIVE_OBJECT_LIST} $$.make_anonymous ($1)
			end
		}
	| primitive_interval
		{
			if not obj_key.is_empty then
				create {DT_PRIMITIVE_OBJECT_INTERVAL} $$.make_identified ($1, obj_key)
			else
				create {DT_PRIMITIVE_OBJECT_INTERVAL} $$.make_anonymous ($1)
			end
		}
	| primitive_interval_list
		{
			if not obj_key.is_empty then
				create {DT_PRIMITIVE_OBJECT_INTERVAL_LIST} $$.make_identified ($1, obj_key)
			else
				create {DT_PRIMITIVE_OBJECT_INTERVAL_LIST} $$.make_anonymous ($1)
			end
		}
	| term_code
		{
			if not obj_key.is_empty then
				create {DT_PRIMITIVE_OBJECT} $$.make_identified ($1, obj_key)
			else
				create {DT_PRIMITIVE_OBJECT} $$.make_anonymous ($1)
			end
		}
	| term_code_list
		{
			if not obj_key.is_empty then
				create {DT_PRIMITIVE_OBJECT_LIST} $$.make_identified ($1, obj_key)
			else
				create {DT_PRIMITIVE_OBJECT_LIST} $$.make_anonymous ($1)
			end
		}
	;

primitive_value: string_value
		{ 
			$$ := $1
		}
	| integer_value
		{ 
			$$ := $1
		}
	| real_value
		{ 
			$$ := $1
		}
	| boolean_value
		{ 
			$$ := $1
		}
	| character_value
		{ 
			$$ := $1
		}
	| date_value
		{ 
			$$ := $1
		}
	| time_value
		{ 
			$$ := $1
		}
	| date_time_value
		{ 
			$$ := $1
		}
	| duration_value
		{ 
			$$ := $1
		}
	| uri_value
		{ 
			$$ := $1
		}
	;

primitive_list: string_list
		{ 
			$$ := $1
		}
	| integer_list
		{ 
			$$ := $1
		}
	| real_list
		{ 
			$$ := $1
		}
	| boolean_list
		{ 
			$$ := $1
		}
	| character_list
		{ 
			$$ := $1
		}
	| date_list
		{ 
			$$ := $1
		}
	| time_list
		{ 
			$$ := $1
		}
	| date_time_list
		{ 
			$$ := $1
		}
	| duration_list
		{ 
			$$ := $1
		}
	;

primitive_interval: integer_interval
		{ 
			$$ := $1
		}
	| real_interval
		{ 
			$$ := $1
		}
	| date_interval
		{ 
			$$ := $1
		}
	| time_interval
		{ 
			$$ := $1
		}
	| date_time_interval
		{ 
			$$ := $1
		}
	| duration_interval
		{ 
			$$ := $1
		}
	;

primitive_interval_list: integer_interval_list
		{ 
			$$ := $1
		}
	| real_interval_list
		{ 
			$$ := $1
		}
	| date_interval_list
		{ 
			$$ := $1
		}
	| time_interval_list
		{ 
			$$ := $1
		}
	| date_time_interval_list
		{ 
			$$ := $1
		}
	| duration_interval_list
		{ 
			$$ := $1
		}
	;

type_identifier: '(' V_TYPE_IDENTIFIER ')'
		{
			$$ := $2
		}
	| '(' V_GENERIC_TYPE_IDENTIFIER ')'
		{
			$$ := $2
		}
	| V_TYPE_IDENTIFIER
		{
			$$ := $1
		}
	| V_GENERIC_TYPE_IDENTIFIER
		{
			$$ := $1
		}
	;

---------------------- BASIC DATA VALUES -----------------------


string_value: V_STRING
		{
			$$ := $1
		}
	;

string_list: V_STRING ',' V_STRING
		{
			create $$.make(0)
			$$.extend($1)
			$$.extend($3)
		}
	| string_list ',' V_STRING
		{
			$1.extend($3)
			$$ := $1
		}
	--
	-- FIXME: the following only for badly formed lists with superfluous continue marks
	--
	| string_list ',' SYM_LIST_CONTINUE
		{
			$$ := $1
		}
	| V_STRING ',' SYM_LIST_CONTINUE
		{
			create $$.make (0)
			$$.extend ($1)
		}
	;

integer_value: V_INTEGER {
			$$ := $1
		}
	| '+' V_INTEGER {
			$$ := $2
		}
	| '-' V_INTEGER {
			$$ := - $2
		}
	;

integer_list: integer_value ',' integer_value
		{
			create $$.make(0)
			$$.extend($1)
			$$.extend($3)
		}
	| integer_list ',' integer_value
		{
			$1.extend($3)
			$$ := $1
		}
	| integer_value ',' SYM_LIST_CONTINUE
		{
			create $$.make(0)
			$$.extend($1)
		}
	;

integer_interval: SYM_INTERVAL_DELIM integer_value SYM_ELLIPSIS integer_value SYM_INTERVAL_DELIM
		{
			if $2 <= $4 then
				create {PROPER_INTERVAL [INTEGER]} $$.make_bounded($2, $4, True, True)
			else
				abort_with_error (ec_VIVLO, <<$2.out, $4.out>>)
			end
		}
	| SYM_INTERVAL_DELIM SYM_GT integer_value SYM_ELLIPSIS integer_value SYM_INTERVAL_DELIM
		{
			if $3 <= $5 then
				create {PROPER_INTERVAL [INTEGER]} $$.make_bounded($3, $5, False, True)
			else
				abort_with_error (ec_VIVLO, <<$3.out, $5.out>>)
			end
		}
	| SYM_INTERVAL_DELIM integer_value SYM_ELLIPSIS SYM_LT integer_value SYM_INTERVAL_DELIM
		{
			if $2 <= $5 then
				create {PROPER_INTERVAL [INTEGER]} $$.make_bounded($2, $5, True, False)
			else
				abort_with_error (ec_VIVLO, <<$2.out, $5.out>>)
			end
		}
	| SYM_INTERVAL_DELIM SYM_GT integer_value SYM_ELLIPSIS SYM_LT integer_value SYM_INTERVAL_DELIM
		{
			if $3 <= $6 then
				create {PROPER_INTERVAL [INTEGER]} $$.make_bounded ($3, $6, False, False)
			else
				abort_with_error (ec_VIVLO, <<$3.out, $6.out>>)
			end
		}
	| SYM_INTERVAL_DELIM SYM_LT integer_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [INTEGER]} $$.make_lower_unbounded ($3, False)
		}
	| SYM_INTERVAL_DELIM SYM_LE integer_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [INTEGER]} $$.make_lower_unbounded ($3, True)
		}
	| SYM_INTERVAL_DELIM SYM_GT integer_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [INTEGER]} $$.make_upper_unbounded ($3, False)
		}
	| SYM_INTERVAL_DELIM SYM_GE integer_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [INTEGER]} $$.make_upper_unbounded ($3, True)
		}
	| SYM_INTERVAL_DELIM integer_value SYM_INTERVAL_DELIM
		{
			create {POINT_INTERVAL [INTEGER]} $$.make ($2)
		}
	;

integer_interval_list: integer_interval ',' integer_interval
		{
			create $$.make(0)
			$$.extend($1)
			$$.extend($3)
		}
	| integer_interval_list ',' integer_interval
		{
			$1.extend($3)
			$$ := $1
		}
	| integer_interval ',' SYM_LIST_CONTINUE
		{
			create $$.make(0)
			$$.extend($1)
		}
	;

real_value: V_REAL 
		{
			$$ := $1
		}
	| '+' V_REAL %prec UNARY_MINUS
		{
			$$ := $2
		}
	| '-' V_REAL %prec UNARY_MINUS
		{
			$$ := - $2
		}
	;

real_list: real_value ',' real_value
		{
			create $$.make(0)
			$$.extend($1)
			$$.extend($3)
		}
	| real_list ',' real_value
		{
			$1.extend($3)
			$$ := $1
		}
	| real_value ',' SYM_LIST_CONTINUE
		{
			create $$.make(0)
			$$.extend($1)
		}
	;

real_interval: SYM_INTERVAL_DELIM real_value SYM_ELLIPSIS real_value SYM_INTERVAL_DELIM
		{
			if $2 <= $4 then
				create {PROPER_INTERVAL [REAL]} $$.make_bounded($2, $4, True, True)
			else
				abort_with_error (ec_VIVLO, <<$2.out, $4.out>>)
			end
		}
	| SYM_INTERVAL_DELIM SYM_GT real_value SYM_ELLIPSIS real_value SYM_INTERVAL_DELIM
		{
			if $3 <= $5 then
				create {PROPER_INTERVAL [REAL]} $$.make_bounded($3, $5, False, True)
			else
				abort_with_error (ec_VIVLO, <<$3.out, $5.out>>)
			end
		}
	| SYM_INTERVAL_DELIM real_value SYM_ELLIPSIS SYM_LT real_value SYM_INTERVAL_DELIM
		{
			if $2 <= $5 then
				create {PROPER_INTERVAL [REAL]} $$.make_bounded($2, $5, True, False)
			else
				abort_with_error (ec_VIVLO, <<$2.out, $5.out>>)
			end
		}
	| SYM_INTERVAL_DELIM SYM_GT real_value SYM_ELLIPSIS SYM_LT real_value SYM_INTERVAL_DELIM
		{
			if $3 <= $6 then
				create {PROPER_INTERVAL [REAL]} $$.make_bounded($3, $6, False, False)
			else
				abort_with_error (ec_VIVLO, <<$3.out, $6.out>>)
			end
		}
	| SYM_INTERVAL_DELIM SYM_LT real_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [REAL]} $$.make_lower_unbounded($3, False)
		}
	| SYM_INTERVAL_DELIM SYM_LE real_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [REAL]} $$.make_lower_unbounded($3, True)
		}
	| SYM_INTERVAL_DELIM SYM_GT real_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [REAL]} $$.make_upper_unbounded($3, False)
		}
	| SYM_INTERVAL_DELIM SYM_GE real_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [REAL]} $$.make_upper_unbounded($3, True)
		}
	| SYM_INTERVAL_DELIM real_value SYM_INTERVAL_DELIM
		{
			create {POINT_INTERVAL [REAL]} $$.make($2)
		}
	;

real_interval_list: real_interval ',' real_interval
		{
			create $$.make(0)
			$$.extend($1)
			$$.extend($3)
		}
	| real_interval_list ',' real_interval
		{
			$1.extend($3)
			$$ := $1
		}
	| real_interval ',' SYM_LIST_CONTINUE
		{
			create $$.make(0)
			$$.extend($1)
		}
	;

boolean_value: SYM_TRUE
		{
			$$ := True
		}
	| SYM_FALSE
		{
			$$ := False
		}
	;

boolean_list: boolean_value ',' boolean_value
		{
			create $$.make(0)
			$$.extend($1)
			$$.extend($3)
		}
	| boolean_list ',' boolean_value
		{
			$1.extend($3)
			$$ := $1
		}
	| boolean_value ',' SYM_LIST_CONTINUE
		{
			create $$.make(0)
			$$.extend($1)
		}
	;

character_value: V_CHARACTER
		{
			$$ := $1
		}
	;

character_list: character_value ',' character_value
		{
			create $$.make(0)
			$$.extend($1)
			$$.extend($3)
		}
	| character_list ',' character_value
		{
			$1.extend($3)
			$$ := $1
		}
	| character_value ',' SYM_LIST_CONTINUE
		{
			create $$.make(0)
			$$.extend($1)
		}
	;

date_value: V_ISO8601_EXTENDED_DATE -- in ISO8601 form yyyy-MM-dd
		{
			if valid_iso8601_date($1) then
				create $$.make_from_string($1)
			else
				abort_with_error (ec_VIDV, <<$1>>)
			end
		}
	;

date_list: date_value ',' date_value
		{
			create $$.make(0)
			$$.extend ($1)
			$$.extend ($3)
		}
	| date_list ',' date_value
		{
			$1.extend ($3)
			$$ := $1
		}
	| date_value ',' SYM_LIST_CONTINUE
		{
			create $$.make(0)
			$$.extend ($1)
		}
	;

date_interval: SYM_INTERVAL_DELIM date_value SYM_ELLIPSIS date_value SYM_INTERVAL_DELIM
		{
			if $2 <= $4 then
				create {PROPER_INTERVAL [ISO8601_DATE]} $$.make_bounded($2, $4, True, True)
			else
				abort_with_error (ec_VIVLO, <<$2.out, $4.out>>)
			end
		}
	| SYM_INTERVAL_DELIM SYM_GT date_value SYM_ELLIPSIS date_value SYM_INTERVAL_DELIM
		{
			if $3 <= $5 then
				create {PROPER_INTERVAL [ISO8601_DATE]} $$.make_bounded($3, $5, False, True)
			else
				abort_with_error (ec_VIVLO, <<$3.out, $5.out>>)
			end
		}
	| SYM_INTERVAL_DELIM date_value SYM_ELLIPSIS SYM_LT date_value SYM_INTERVAL_DELIM
		{
			if $2 <= $5 then
				create {PROPER_INTERVAL [ISO8601_DATE]} $$.make_bounded($2, $5, True, False)
			else
				abort_with_error (ec_VIVLO, <<$2.out, $5.out>>)
			end
		}
	| SYM_INTERVAL_DELIM SYM_GT date_value SYM_ELLIPSIS SYM_LT date_value SYM_INTERVAL_DELIM
		{
			if $3 <= $6 then
				create {PROPER_INTERVAL [ISO8601_DATE]} $$.make_bounded($3, $6, False, False)
			else
				abort_with_error (ec_VIVLO, <<$3.out, $6.out>>)
			end
		}
	| SYM_INTERVAL_DELIM SYM_LT date_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [ISO8601_DATE]} $$.make_lower_unbounded($3, False)
		}
	| SYM_INTERVAL_DELIM SYM_LE date_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [ISO8601_DATE]} $$.make_lower_unbounded($3, True)
		}
	| SYM_INTERVAL_DELIM SYM_GT date_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [ISO8601_DATE]} $$.make_upper_unbounded($3, False)
		}
	| SYM_INTERVAL_DELIM SYM_GE date_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [ISO8601_DATE]} $$.make_upper_unbounded($3, True)
		}
	| SYM_INTERVAL_DELIM date_value SYM_INTERVAL_DELIM
		{
			create {POINT_INTERVAL [ISO8601_DATE]} $$.make ($2)
		}
	;

date_interval_list: date_interval ',' date_interval
		{
			create $$.make(0)
			$$.extend($1)
			$$.extend($3)
		}
	| date_interval_list ',' date_interval
		{
			$1.extend($3)
			$$ := $1
		}
	| date_interval ',' SYM_LIST_CONTINUE
		{
			create $$.make(0)
			$$.extend($1)
		}
	;

time_value: V_ISO8601_EXTENDED_TIME
		{
			if valid_iso8601_time($1) then
				create $$.make_from_string($1)
			else
				abort_with_error (ec_VITV, <<$1>>)
			end
		}
	;

time_list: time_value ',' time_value
		{
			create $$.make(0)
			$$.extend($1)
			$$.extend($3)
		}
	| time_list ',' time_value
		{
			$1.extend($3)
			$$ := $1
		}
	| time_value ',' SYM_LIST_CONTINUE
		{
			create $$.make(0)
			$$.extend($1)
		}
	;

time_interval: SYM_INTERVAL_DELIM time_value SYM_ELLIPSIS time_value SYM_INTERVAL_DELIM
		{
			if $2 <= $4 then
				create {PROPER_INTERVAL [ISO8601_TIME]} $$.make_bounded($2, $4, True, True)
			else
				abort_with_error (ec_VIVLO, <<$2.out, $4.out>>)
			end
		}
	| SYM_INTERVAL_DELIM SYM_GT time_value SYM_ELLIPSIS time_value SYM_INTERVAL_DELIM
		{
			if $3 <= $5 then
				create {PROPER_INTERVAL [ISO8601_TIME]} $$.make_bounded($3, $5, False, True)
			else
				abort_with_error (ec_VIVLO, <<$3.out, $5.out>>)
			end
		}
	| SYM_INTERVAL_DELIM time_value SYM_ELLIPSIS SYM_LT time_value SYM_INTERVAL_DELIM
		{
			if $2 <= $5 then
				create {PROPER_INTERVAL [ISO8601_TIME]} $$.make_bounded($2, $5, True, False)
			else
				abort_with_error (ec_VIVLO, <<$2.out, $5.out>>)
			end
		}
	| SYM_INTERVAL_DELIM SYM_GT time_value SYM_ELLIPSIS SYM_LT time_value SYM_INTERVAL_DELIM
		{
			if $3 <= $6 then
				create {PROPER_INTERVAL [ISO8601_TIME]} $$.make_bounded($3, $6, False, False)
			else
				abort_with_error (ec_VIVLO, <<$3.out, $6.out>>)
			end
		}
	| SYM_INTERVAL_DELIM SYM_LT time_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [ISO8601_TIME]} $$.make_lower_unbounded($3, False)
		}
	| SYM_INTERVAL_DELIM SYM_LE time_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [ISO8601_TIME]} $$.make_lower_unbounded($3, True)
		}
	| SYM_INTERVAL_DELIM SYM_GT time_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [ISO8601_TIME]} $$.make_upper_unbounded($3, False)
		}
	| SYM_INTERVAL_DELIM SYM_GE time_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [ISO8601_TIME]} $$.make_upper_unbounded($3, True)
		}
	| SYM_INTERVAL_DELIM time_value SYM_INTERVAL_DELIM
		{
			create {POINT_INTERVAL [ISO8601_TIME]} $$.make ($2)
		}
	;

time_interval_list: time_interval ',' time_interval
		{
			create $$.make(0)
			$$.extend($1)
			$$.extend($3)
		}
	| time_interval_list ',' time_interval
		{
			$1.extend($3)
			$$ := $1
		}
	| time_interval ',' SYM_LIST_CONTINUE
		{
			create $$.make(0)
			$$.extend($1)
		}
	;

date_time_value: V_ISO8601_EXTENDED_DATE_TIME
		{
			if valid_iso8601_date_time($1) then
				create $$.make_from_string($1)
			else
				abort_with_error (ec_VIDTV, <<$1>>)
			end
		}
	;

date_time_list: date_time_value ',' date_time_value
		{
			create $$.make(0)
			$$.extend($1)
			$$.extend($3)
		}
	| date_time_list ',' date_time_value
		{
			$1.extend($3)
			$$ := $1
		}
	| date_time_value ',' SYM_LIST_CONTINUE
		{
			create $$.make(0)
			$$.extend($1)
		}
	;

date_time_interval: SYM_INTERVAL_DELIM date_time_value SYM_ELLIPSIS date_time_value  SYM_INTERVAL_DELIM
		{
			if $2 <= $4 then
				create {PROPER_INTERVAL [ISO8601_DATE_TIME]} $$.make_bounded($2, $4, True, True)
			else
				abort_with_error (ec_VIVLO, <<$2.out, $4.out>>)
			end
		}
	| SYM_INTERVAL_DELIM SYM_GT date_time_value SYM_ELLIPSIS date_time_value SYM_INTERVAL_DELIM
		{
			if $3 <= $5 then
				create {PROPER_INTERVAL [ISO8601_DATE_TIME]} $$.make_bounded($3, $5, False, True)
			else
				abort_with_error (ec_VIVLO, <<$3.out, $5.out>>)
			end
		}
	| SYM_INTERVAL_DELIM date_time_value SYM_ELLIPSIS SYM_LT date_time_value SYM_INTERVAL_DELIM
		{
			if $2 <= $5 then
				create {PROPER_INTERVAL [ISO8601_DATE_TIME]} $$.make_bounded($2, $5, True, False)
			else
				abort_with_error (ec_VIVLO, <<$2.out, $5.out>>)
			end
		}
	| SYM_INTERVAL_DELIM SYM_GT date_time_value SYM_ELLIPSIS SYM_LT date_time_value SYM_INTERVAL_DELIM
		{
			if $3 <= $6 then
				create {PROPER_INTERVAL [ISO8601_DATE_TIME]} $$.make_bounded($3, $6, False, False)
			else
				abort_with_error (ec_VIVLO, <<$3.out, $6.out>>)
			end
		}
	| SYM_INTERVAL_DELIM SYM_LT date_time_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [ISO8601_DATE_TIME]} $$.make_lower_unbounded($3, False)
		}
	| SYM_INTERVAL_DELIM SYM_LE date_time_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [ISO8601_DATE_TIME]} $$.make_lower_unbounded($3, True)
		}
	| SYM_INTERVAL_DELIM SYM_GT date_time_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [ISO8601_DATE_TIME]} $$.make_upper_unbounded($3, False)
		}
	| SYM_INTERVAL_DELIM SYM_GE date_time_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [ISO8601_DATE_TIME]} $$.make_upper_unbounded($3, True)
		}
	| SYM_INTERVAL_DELIM date_time_value SYM_INTERVAL_DELIM
		{
			create {POINT_INTERVAL [ISO8601_DATE_TIME]} $$.make ($2)
		}
	;

date_time_interval_list: date_time_interval ',' date_time_interval
		{
			create $$.make(0)
			$$.extend($1)
			$$.extend($3)
		}
	| date_time_interval_list ',' date_time_interval
		{
			$1.extend($3)
			$$ := $1
		}
	| date_time_interval ',' SYM_LIST_CONTINUE
		{
			create $$.make(0)
			$$.extend($1)
		}
	;

duration_value: V_ISO8601_DURATION
		{
			if valid_iso8601_duration($1) then
				create $$.make_from_string($1)
			else
				abort_with_error (ec_VIDUV, <<$1>>)
			end
		}
	;

duration_list: duration_value ',' duration_value
		{
			create $$.make(0)
			$$.extend($1)
			$$.extend($3)
		}
	| duration_list ',' duration_value
		{
			$1.extend($3)
			$$ := $1
		}
	| duration_value ',' SYM_LIST_CONTINUE
		{
			create $$.make(0)
			$$.extend($1)
		}
	;

duration_interval: SYM_INTERVAL_DELIM duration_value SYM_ELLIPSIS duration_value SYM_INTERVAL_DELIM
		{
			if $2 <= $4 then
				create {PROPER_INTERVAL [ISO8601_DURATION]} $$.make_bounded($2, $4, True, True)
			else
				abort_with_error (ec_VIVLO, <<$2.out, $4.out>>)
			end
		}
	| SYM_INTERVAL_DELIM SYM_GT duration_value SYM_ELLIPSIS duration_value SYM_INTERVAL_DELIM
		{
			if $3 <= $5 then
				create {PROPER_INTERVAL [ISO8601_DURATION]} $$.make_bounded($3, $5, False, True)
			else
				abort_with_error (ec_VIVLO, <<$3.out, $5.out>>)
			end
		}
	| SYM_INTERVAL_DELIM duration_value SYM_ELLIPSIS SYM_LT duration_value SYM_INTERVAL_DELIM
		{
			if $2 <= $5 then
				create {PROPER_INTERVAL [ISO8601_DURATION]} $$.make_bounded($2, $5, True, False)
			else
				abort_with_error (ec_VIVLO, <<$2.out, $5.out>>)
			end
		}
	| SYM_INTERVAL_DELIM SYM_GT duration_value SYM_ELLIPSIS SYM_LT duration_value SYM_INTERVAL_DELIM
		{
			if $3 <= $6 then
				create {PROPER_INTERVAL [ISO8601_DURATION]} $$.make_bounded($3, $6, False, False)
			else
				abort_with_error (ec_VIVLO, <<$3.out, $6.out>>)
			end
		}
	| SYM_INTERVAL_DELIM SYM_LT duration_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [ISO8601_DURATION]} $$.make_lower_unbounded($3, False)
		}
	| SYM_INTERVAL_DELIM SYM_LE duration_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [ISO8601_DURATION]} $$.make_lower_unbounded($3, True)
		}
	| SYM_INTERVAL_DELIM SYM_GT duration_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [ISO8601_DURATION]} $$.make_upper_unbounded($3, False)
		}
	| SYM_INTERVAL_DELIM SYM_GE duration_value SYM_INTERVAL_DELIM
		{
			create {PROPER_INTERVAL [ISO8601_DURATION]} $$.make_upper_unbounded($3, True)
		}
	| SYM_INTERVAL_DELIM duration_value SYM_INTERVAL_DELIM
		{
			create {POINT_INTERVAL [ISO8601_DURATION]} $$.make ($2)
		}
	;

duration_interval_list: duration_interval ',' duration_interval
		{
			create $$.make(0)
			$$.extend($1)
			$$.extend($3)
		}
	| duration_interval_list ',' duration_interval
		{
			$1.extend($3)
			$$ := $1
		}
	| duration_interval ',' SYM_LIST_CONTINUE
		{
			create $$.make(0)
			$$.extend($1)
		}
	;

term_code: V_QUALIFIED_TERM_CODE_REF
		{
			create $$.make_from_string ($1)
		}
	| V_TERMINOLOGY_ID
		{
			abort_with_error (ec_STNC, <<$1>>)
		}
	| ERR_V_QUALIFIED_TERM_CODE_REF
		{
			abort_with_error (ec_STCV, <<$1>>)
		}
	;

term_code_list: term_code ',' term_code
		{
			create $$.make(0)
			$$.extend($1)
			$$.extend($3)
		}
	| term_code_list ',' term_code
		{
			$1.extend($3)
			$$ := $1
		}
	| term_code ',' SYM_LIST_CONTINUE
		{
			create $$.make(0)
			$$.extend($1)
		}
	;

uri_value: V_URI
		{
			create $$.make_from_string($1)
		}
	;


--
-- ------------------------- object reference ---------------------
--
object_reference_block: SYM_START_DBLOCK absolute_path_object_value SYM_END_DBLOCK
		{
debug("ODIN_parse")
	io.put_string(indent + "object_reference_block; attr_nodes(<<" + 
			attr_nodes.item.im_attr_name + ">>).item.put_child(<<" + 
			$2.as_string + ">>)%N")
end
			if not attr_nodes.item.has_child_with_id ($2.id) then
				attr_nodes.item.put_child ($2)
				$$ := $2
			else
				abort_with_error (ec_VOKU, <<$2.id, attr_nodes.item.im_attr_name >>)
			end
		}
	;

absolute_path_object_value: absolute_path
		{
			if not obj_key.is_empty then
				create {DT_OBJECT_REFERENCE} $$.make_identified($1, obj_key)
				create obj_key.make_empty
			else
				create {DT_OBJECT_REFERENCE} $$.make_anonymous($1)
			end
		}
	| absolute_path_list
		{
			if not obj_key.is_empty then
				create {DT_OBJECT_REFERENCE_LIST} $$.make_identified($1, obj_key)
				create obj_key.make_empty
			else
				create {DT_OBJECT_REFERENCE_LIST} $$.make_anonymous($1)
			end
		}
	;


absolute_path_list: absolute_path ',' absolute_path
		{
			create $$.make(0)
			$$.extend($1)
			$$.extend($3)
		}
	| absolute_path_list ',' absolute_path
		{
			$1.extend($3)
			$$ := $1
		}
	| absolute_path ',' SYM_LIST_CONTINUE
		{
			create $$.make(0)
			$$.extend($1)
		}
	;

--------------------------------------------------------------------------------------------------
--------------- THE FOLLOWING SOURCE TAKEN FROM OG_PATH_VALIDATOR.Y - DO NOT MODIFY  -------------
--------------- except to remove movable_path ----------------------------------------------------
--------------------------------------------------------------------------------------------------

absolute_path: '/'
		{
			create $$.make_root
debug("OG_PATH_parse")
	io.put_string("....absolute_path (root); %N")
end
		}
	|'/' relative_path
		{
			$$ := $2
			$$.set_absolute
debug("OG_PATH_parse")
	io.put_string("....absolute_path; %N")
end
		}
	| absolute_path '/' relative_path
		{
			$$ := $1
			$$.append_path($3)
debug("OG_PATH_parse")
	io.put_string("....absolute_path (appended relative path); %N")
end
		}
	;

relative_path: path_segment
		{
			create $$.make_relative($1)
		}
	| relative_path '/' path_segment
		{
			$$ := $1
			$$.append_segment($3)
		}
	;

path_segment: V_ATTRIBUTE_IDENTIFIER '[' V_STRING ']'
		{
			create $$.make_with_object_id($1, $3)
debug("OG_PATH_parse")
	io.put_string("...path_segment: " + $1 + "[" + $3 + "]%N")
end
		}
	| V_ATTRIBUTE_IDENTIFIER
		{
			create $$.make($1)
debug("OG_PATH_parse")
	io.put_string("...path_segment: " + $1 + "%N")
end
		}
	;

--------------------------------------------------------------------------------------------------
-------------------------------- END SOURCE TAKEN FROM OG_PATH_VALIDATOR.Y ----------------------
--------------------------------------------------------------------------------------------------

%%

feature {NONE} -- Initialization

	make
			-- Create a new parser.
		do
			make_scanner
			make_parser_skeleton
			create time_vc
			create date_vc
			create complex_object_nodes.make(0)
			create attr_nodes.make(0)
			create indent.make(0)
			create obj_key.make_empty

			create complex_object_node.make_anonymous
			create attr_node.make_single("xxx")
		end

feature -- Commands

	reset
		do
			precursor
			validator_reset
			accept -- ensure no syntax errors lying around from previous invocation
		end

	execute (in_text:STRING; a_source_start_line: INTEGER)
		do
			reset

			source_start_line := a_source_start_line

			indent.wipe_out
			complex_object_nodes.wipe_out
			attr_nodes.wipe_out

			create time_vc
			create date_vc
	
			set_input_buffer (new_string_buffer (in_text))
			parse
		end

	error_loc: STRING
		do
			create Result.make_empty
			if attached {YY_FILE_BUFFER} input_buffer as f_buffer then
				Result.append (f_buffer.file.name + ", ")
			end
			Result.append ("line " + (in_lineno + source_start_line).out)
			Result.append(" [last token = " + token_name (last_token) + "]")
		end

feature -- Access

	source_start_line: INTEGER
			-- offset of source in other document, else 0

	output: detachable DT_COMPLEX_OBJECT
			-- parsed structure

feature {NONE} -- Parse Tree

	complex_object_nodes: ARRAYED_STACK [DT_COMPLEX_OBJECT]
	complex_object_node: DT_COMPLEX_OBJECT

	attr_nodes: ARRAYED_STACK [DT_ATTRIBUTE]
	attr_node: DT_ATTRIBUTE

	obj_key: STRING
			-- qualifier of last rel name; use for next object creation

	time_vc: TIME_VALIDITY_CHECKER
	date_vc: DATE_VALIDITY_CHECKER

feature {NONE} -- Implementation 
	
	indent: STRING

end
