{ type token = PLUS | MINUS | MUL | DIV | OPAREN | CPAREN | INT of int |
IDENT of string | EOF }

let space = [' ' '\t']
let newline = ['\n']
let whitespace = space | newline

let digit = ['0'-'9']
let int = digit+

let miniscule = ['a'-'z']
let ident = miniscule+

let open_comment = "/*"
let close_comment = "*/"

rule next_token = parse
    eof          { EOF }
	| int as str   { INT (int_of_str str) }
	|	ident as str { IDENT str }
	| '('            { OPAREN }
	| ')'            { CPAREN }
	| '+'            { PLUS }
	| '-'            { MINUS }
	| '*'            { MUL }
	| '/'            { DIV }
	| open_comment { comment lexbuf }
	| whitespace   { next_token lexbuf }
	| _            { Raise Failure "next_token" }
	  
and comment = parse
	  close_comment { next_token lexbuf }
	| _             { comment lexbuf }

{}
