let space = [' ' '\t']
let newline = ['\n']
let whitespace = space | newline

rule count nbchars nbwords nblines =
	parse eof  { (nbchars, nbwords, nblines) }
	| newline  { count nbchars nbwords (nblines+1) lexbuf}
	| space    { count nbchars (nbwords+1) nblines lexbuf}
	| _        { count (nbchars+1) nbwords nblines lexbuf}

