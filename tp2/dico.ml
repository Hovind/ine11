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

let rec dico_de = function
 	  []    -> Vide
	| c::cs -> Entrees{
		lettre = c;
		fin = cs == [];
		suite = dico_de cs;
		sinon = Vide }
;;

let rec taille = function
	   Vide -> 0
	| Entrees{ lettre; fin; suite; sinon } ->
		(if fin then 1 else 0) + taille suite + taille sinon
;;

let rec insere mot dico =
	match (mot, dico) with | (_, Vide) -> dico_de mot
	| ([], _)  -> dico
	| (c::cs, Entrees{ lettre; fin; suite; sinon }) ->
		if c == l then
		begin
			if cs == [] then Entrees{ lettre = lettre; fin = true; suite = suite;
			sinon = sinon }
			else Entrees{ lettre = lettre; fin = fin; suite = insere cs suite; sinon =
			sinon }
		end
		else Entrees{ lettre = lettre; fin = fin; suite = suite; sinon = insere mot
		sinon }
;;

let lire_mot ic =
	let inp = input_line ic in
	explode inp
;;

let rec imprime_dico n prfx dico =
	match dico, n with
	| (Vide, _) | (_, 0) -> n
	| (Entrees{ lettre; fin; suite; sinon }, _) ->
		let prfxlettre = List.append prfx [lettre] in
		let m =	if fin then (print_endline (implode prfxlettre); n-1) else n in
		let o = imprime_dico m prfxlettre suite in
		imprime_dico o prfx sinon
;;

let rec recherche mot d =
	match (mot, d) with
	| (_, Vide) | ([], _) -> None
	| (c::cs, Entrees{ lettre; fin; suite; sinon }) ->
		if c == lettre then
		begin
			if fin && cs == [] then Some Vide
			else if cs == [] then Some suite
			else recherche cs suite
		end
		else recherche mot sinon
;;

let _ =
	let ic = open_in Sys.argv.(1) in
	let dico = fold_until_eof (fun dico -> insere (lire_mot ic) dico) Vide in
	try
		while true do
			print_string "Chercher: ";
			flush stdout;
			let mot = lire_mot stdin in
			match recherche mot dico with
			| None -> print_endline "Non"
			| Some Vide -> print_endline "Oui"
			| Some suite ->
					let n = taille suite in
					let _ = if n == 1 then print_string "Il s'agit peut-être de: "
					else (print_string "Il y a "; print_int n; print_endline " mots commencant par ce préfixe: ") in
					ignore (imprime_dico 10 mot suite)
		done
	with End_of_file ->
		close_in_noerr ic;
		print_endline "Bye";
		exit 0
;;
