type dico =
	| Vide
	| Entrees of {     (* entrées du dictionnaire *)
		lettre : char; (* commençant par cette lettre *)
		fin : bool;    (* cette lettre est-elle une fin de mot ? *)
		suite : dico;  (* suivie de *)
		sinon : dico   (* ou alors ... *)
	}
;;


(* explode : string -> char list *)
let explode str =
	let rec expl acc i =
		if i < 0 then acc
		else expl (str.[i] :: acc) (i - 1) in
	expl [ ] (String.length str - 1)
;;

(* implode : char list -> string *)
let implode chars =
	let n = List.length chars in
	let str = Bytes.create n in
	let _ = List.iteri (fun i c -> Bytes.set str i c) chars in
	Bytes.to_string str
;;

(* fonction auxiliaire pour
la lecture des mots *)
(* fold_until_eof : ('a ->
'a) -> 'a -> 'a *)
let fold_until_eof f accu =
	let result = ref accu in begin
	try
		while true do result := f (!result) done
	with End_of_file -> ()
	end;
	!result
;;

let rec dico_de mot =
	match mot with
	| []    -> Vide
	| c::cs -> Entrees{
		lettre = c;
		fin = cs == [];
		suite = dico_de cs;
		sinon = Vide }
;;

let rec insere mot dico =
	match (mot, dico) with
	| ([], _)  -> dico
	| (_, Vide) -> dico_de mot
	| (c::cs, Entrees{ lettre = l ; fin = f; suite = s; sinon = sn; _ }) ->
		if c == l then
			if cs == [] then Entries{ l; true; s; sn }
			else Entreees{l; f; insere cs dico s; sn }
		else Entrees{l; f; s; insere mot sn}
;;

let rec lire_mot ch
	let inp = input_line ch in
	let rec str_to_list str =
		let len = String.length str in
		if len == 1 then
			[str.[0]]
		else
			str.[0]::str_to_list (String.sub str 1 (len - 1))
	in str_to_list inp 
;;

let rec existe mot dico =
	match (mot, dico) with
	| (_, Vide) -> false
	| (c::cs, Entries{ lettre = l; fin = f; suite = s; sinon = sn } ->
		if c == l then
			if f then
				true
			else	
				existe cs s
		else
			existe mot sn
;;

let main =
	let ch =
		open Sys.argv[1]
	in
	let dico =
		fold_until_eof (fun dico -> insere (lire_mot canal) dico) Vide
	in

	try
		while true do
			let li = read_line () in
			if existe mot dico then
				print_string "Oui;
			else
				print_string "Non";
				
			print_newline ()
		done
	with End_of_file -> ();
	print_string "Bye\n";
	exit 0
;;
	

(*
let main =
	let dict =
		get_dict Sys.argv[1]
	in
	try
		while true do
			let li = read_line () in
			print_string (find_in dict li);
			print_newline ()
		done
	with End_of_file -> ();
	print_string "Bye\n";
	exit 0;;

main;; *)
