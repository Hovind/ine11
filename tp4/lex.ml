(* Remember: main: Lexing.lexbuf -> type-of-actions *)
(* Get first token in string s *)
let get_tokens filename =
	try
		let input = open_in filename in
		let lexbuf = Lexing.from_channel input in
		let rec get_token lexbuf =
			let token = lex.next_token lexbuf
			match token with
					EOF -> close_in input; []
					| t -> t::get_token lexbuf
	with
	| Sys_error msg -> Printf.eprintf "Cannot open \"%s\" (%s)\n%!" filename msg
	| err -> Printf.eprintf "Exception unexpected %s\n%!" (Printexc.to_string err)

