let head list = match list with
	| x::xs -> x
	| _ -> raise(Failure "too short");;

let rec tail list = match list with
	| x::[] -> x
	| x::xs -> tail xs
	| _ -> raise(Failure "too short");;

let rec semitail list = match list with
	| x::y::[] -> x
	| x::xs -> semitail xs
	| _ -> raise(Failure "too short");;

let rec index list i =
	match (list, i) with
	| (x::xs, 0) -> x
	| (x::xs, _) -> index xs (i-1)
 	| _          -> raise(Failure "too short");;

let rec indexopt list i =
	match (list, i, i > 0) with
	| (x::xs, 0, _)     -> x
	| (x::xs, _, true)  -> index xs (i-1)
 	| _                 -> None;;
let rec rev list =
	match list with
	| x::[] -> [x]
	| x::xs ->  List.append (rev xs) [x]
	| []    -> [];;

let rec clean_consecutives list =
	match list with
	| x::y::xs -> if x == y
								then clean_consecutives (x::xs)
								else x::clean_consecutives (y::xs)
	| _        -> list;;


let main =
	let args =
		List.map int_of_string (List.tl (Array.to_list Sys.argv))
	in
	(*List.iter (Printf.printf "%d ") (rev args);*)
	List.iter (Printf.printf "%d ") (clean_consecutives args);
	exit 0;;

main;;
