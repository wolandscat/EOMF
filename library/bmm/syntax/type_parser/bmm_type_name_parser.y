%{
note
	component:   "Eiffel Object Modelling Framework"
	description: "Parser for type-names"
	keywords:    "BMM, types"
	author:      "Thomas Beale <thomas.beale@openehr.org>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2017- The openEHR Foundation <http://www.openEHR.org>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class BMM_TYPE_NAME_PARSER

inherit
	BMM_TYPE_NAME_SCANNER
		rename
			make as make_scanner
		redefine
			reset
		end

	YY_PARSER_SKELETON
		rename
		    make as make_parser_skeleton
		end

	KL_SHARED_EXCEPTIONS
	KL_SHARED_ARGUMENTS

create
	make

%}

%token SYM_GEN_OPEN SYM_GEN_CLOSE SYM_TYPE_CONSTRAIN_SEP SYM_COMMA
%token <STRING> V_TYPE_ID V_GENERIC_TYPE_PARAM_ID

%type <BMM_TYPE_NAME> type_name, simple_type_name, generic_type_name, generic_formal_parameter_type
%type <ARRAYED_LIST[BMM_TYPE_NAME]> generic_type_params

%%

input: type_name
		{
			output := $1
			accept
		}
	| error
		{
			abort
		}
	;

--
-- any kind of classifier, which is either a simple type name, a generic type name
-- or a generic type parameter name
--
type_name: simple_type_name
		{
		    $$ := $1
		}
	| generic_formal_parameter_type
		{
		    $$ := $1
		}
	| generic_type_name
		{
		    $$ := $1
		}
	;

--
-- generic type names used in property definitions; may have open formal parameters
--
generic_type_name: simple_type_name SYM_GEN_OPEN generic_type_params SYM_GEN_CLOSE
		{
			$1.set_generic_parameters ($3)
			$$ := $1
		}
	;

--
-- type parameter for a generic type, which may be either a formal parameter
-- of any other kind of type name
--
generic_type_params: type_name
		{
			create $$.make (0)
			$$.extend ($1)
		}
	| generic_type_params SYM_COMMA type_name
		{
			$1.extend ($3)
			$$ := $1
		}
	;

--
-- ordinary single-word name
--
simple_type_name: V_TYPE_ID
		{
			create $$.make_simple ($1)
		}
	;

--
-- formal type parameter, assumed to be single character name like 'T', 'U' etc.
-- May have a constrainer part, which can be any type.
--
generic_formal_parameter_type: V_GENERIC_TYPE_PARAM_ID
		{
			create $$.make_formal_parameter ($1)
		}
	| V_GENERIC_TYPE_PARAM_ID SYM_TYPE_CONSTRAIN_SEP type_name
		{
			create $$.make_formal_parameter_constrained ($1, $3)
		}
	;

%%

feature {NONE} -- Initialization

	make
			-- Create a new parser.
		do
			make_scanner
			make_parser_skeleton
		end

feature -- Commands

	reset
		do
			output := Void
			accept
		end

	execute (in_text:STRING)
		do
			reset
			set_input_buffer (new_string_buffer (in_text))
			parse
		end

feature -- Access

	output: detachable BMM_TYPE_NAME
			-- parsed structure

end
