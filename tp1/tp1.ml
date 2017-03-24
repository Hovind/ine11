let head list = match list with
	| x::xs -> x
	| _ -> raise(Failure "too short")

let rec tail list = match list with
	| x::[] -> x
	| x::xs -> tail xs
	| _ -> raise(Failure "too short")

let rec semitail list = match list with
	| x::y::[] -> x
	| x::xs -> semitail xs
	| _ -> raise(Failure "too short")

let rec index list i =
	match (list, i) with
	| (x::xs, 0) -> x
	| (x::xs, _) -> index xs (i-1)
 	| _          -> raise(Failure "too short");;

let rec indexopt list i =
	match (list, i, i > 0) with
	| (x::xs, 0, _)     -> x
	| (x::xs, _, true)  -> index xs (i-1)
 	| _                 -> None
let rec rev list =
	match list with
	| x::[] -> x
	| x::xs ->  List.append (rev xs) [x]

let main =
	let sargs =
		List.tl (Array.to_list Sys.argv)
	in
	let iargs =
		List.map int_of_string sargs
	in
	List.iter (Printf.printf "%d ") iargs;
	Printf.printf "\n%i\n" (rev iargs);
	exit 0;;

main;;
