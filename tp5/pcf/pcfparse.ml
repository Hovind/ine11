type token =
  | INT of (int)
  | IDENT of (string)
  | TRUE
  | FALSE
  | STRING of (string)
  | PLUS
  | MINUS
  | MULT
  | DIV
  | EQUAL
  | GREATER
  | SMALLER
  | GREATEREQUAL
  | SMALLEREQUAL
  | LPAR
  | RPAR
  | SEMICOLON
  | LET
  | REC
  | IN
  | FUN
  | ARROW
  | IF
  | THEN
  | ELSE

open Parsing;;
let _ = parse_error;;
# 2 "pcfparse.mly"
  open Pcfast;;

  let rec mkfun params expr = match params with
  | [] -> expr
  | p :: prms -> EFun(p, mkfun prms expr)
  ;;
# 38 "pcfparse.ml"
let yytransl_const = [|
  259 (* TRUE *);
  260 (* FALSE *);
  262 (* PLUS *);
  263 (* MINUS *);
  264 (* MULT *);
  265 (* DIV *);
  266 (* EQUAL *);
  267 (* GREATER *);
  268 (* SMALLER *);
  269 (* GREATEREQUAL *);
  270 (* SMALLEREQUAL *);
  271 (* LPAR *);
  272 (* RPAR *);
  273 (* SEMICOLON *);
  274 (* LET *);
  275 (* REC *);
  276 (* IN *);
  277 (* FUN *);
  278 (* ARROW *);
  279 (* IF *);
  280 (* THEN *);
  281 (* ELSE *);
    0|]

let yytransl_block = [|
  257 (* INT *);
  258 (* IDENT *);
  261 (* STRING *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\002\000\002\000\002\000\002\000\002\000\002\000\
\003\000\003\000\004\000\004\000\004\000\005\000\005\000\005\000\
\006\000\006\000\006\000\000\000"

let yylen = "\002\000\
\002\000\002\000\001\000\001\000\003\000\006\000\009\000\004\000\
\002\000\000\000\001\000\003\000\003\000\001\000\002\000\002\000\
\001\000\001\000\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\003\000\004\000\000\000\000\000\000\000\000\000\
\020\000\000\000\000\000\002\000\000\000\000\000\000\000\001\000\
\005\000\000\000\000\000\000\000\000\000\000\000\008\000\000\000\
\000\000\000\000\006\000\009\000\000\000\000\000\000\000\007\000"

let yydgoto = "\002\000\
\009\000\010\000\026\000\000\000\000\000\000\000"

let yysindex = "\001\000\
\010\255\000\000\000\000\000\000\002\255\010\255\255\254\003\255\
\000\000\245\254\247\254\000\000\254\254\007\255\244\254\000\000\
\000\000\002\255\012\255\002\255\252\254\019\255\000\000\002\255\
\019\255\020\255\000\000\000\000\002\255\009\255\002\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\022\255\000\000\000\000\
\022\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\016\000\251\255\008\000\000\000\000\000\000\000"

let yytablesize = 33
let yytable = "\011\000\
\013\000\001\000\003\000\004\000\015\000\016\000\017\000\018\000\
\019\000\020\000\003\000\004\000\021\000\022\000\023\000\024\000\
\005\000\014\000\027\000\007\000\025\000\012\000\008\000\030\000\
\005\000\032\000\006\000\007\000\031\000\029\000\008\000\010\000\
\028\000"

let yycheck = "\005\000\
\002\001\001\000\001\001\002\001\002\001\017\001\016\001\010\001\
\002\001\022\001\001\001\002\001\018\000\002\001\020\000\020\001\
\015\001\019\001\024\000\018\001\002\001\006\000\021\001\029\000\
\015\001\031\000\017\001\018\001\020\001\010\001\021\001\010\001\
\025\000"

let yynames_const = "\
  TRUE\000\
  FALSE\000\
  PLUS\000\
  MINUS\000\
  MULT\000\
  DIV\000\
  EQUAL\000\
  GREATER\000\
  SMALLER\000\
  GREATEREQUAL\000\
  SMALLEREQUAL\000\
  LPAR\000\
  RPAR\000\
  SEMICOLON\000\
  LET\000\
  REC\000\
  IN\000\
  FUN\000\
  ARROW\000\
  IF\000\
  THEN\000\
  ELSE\000\
  "

let yynames_block = "\
  INT\000\
  IDENT\000\
  STRING\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 27 "pcfparse.mly"
                     ( _1 )
# 157 "pcfparse.ml"
               : Pcfast.expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Pcfast.expr) in
    Obj.repr(
# 28 "pcfparse.mly"
                     ( _2 )
# 164 "pcfparse.ml"
               : Pcfast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 33 "pcfparse.mly"
                                                      ( EInt(_1) )
# 171 "pcfparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 34 "pcfparse.mly"
                                                    ( EIdent(_1) )
# 178 "pcfparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 35 "pcfparse.mly"
                                                    ( _2 )
# 185 "pcfparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 36 "pcfparse.mly"
                                                    ( ELet(_2, _4, _6) )
# 194 "pcfparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 6 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 5 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 4 : 'seqident) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _9 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 37 "pcfparse.mly"
                                                    ( ELetrec(_3, _4, (mkfun
		_5 _7), _9) )
# 206 "pcfparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 39 "pcfparse.mly"
                                                    ( EFun(_2, _4) )
# 214 "pcfparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'seqident) in
    Obj.repr(
# 42 "pcfparse.mly"
                         ( _1::_2 )
# 222 "pcfparse.ml"
               : 'seqident))
; (fun __caml_parser_env ->
    Obj.repr(
# 43 "pcfparse.mly"
                       ( []     )
# 228 "pcfparse.ml"
               : 'seqident))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'application) in
    Obj.repr(
# 47 "pcfparse.mly"
                ( _1 )
# 235 "pcfparse.ml"
               : 'arith_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arith_expr) in
    Obj.repr(
# 48 "pcfparse.mly"
                                ( EBinop("=", _1, _3) )
# 243 "pcfparse.ml"
               : 'arith_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'arith_expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arith_expr) in
    Obj.repr(
# 49 "pcfparse.mly"
                               ( EBinop("+", _1, _3) )
# 251 "pcfparse.ml"
               : 'arith_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'atom) in
    Obj.repr(
# 53 "pcfparse.mly"
         ( _1 )
# 258 "pcfparse.ml"
               : 'application))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'atom) in
    Obj.repr(
# 54 "pcfparse.mly"
               ( EMonop("-", _2) )
# 265 "pcfparse.ml"
               : 'application))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'application) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'atom) in
    Obj.repr(
# 55 "pcfparse.mly"
                     ( EApp(_1, _2) )
# 273 "pcfparse.ml"
               : 'application))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 60 "pcfparse.mly"
        ( EInt(_1) )
# 280 "pcfparse.ml"
               : 'atom))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 61 "pcfparse.mly"
           ( EIdent(_1) )
# 287 "pcfparse.ml"
               : 'atom))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 62 "pcfparse.mly"
                   ( _2 )
# 294 "pcfparse.ml"
               : 'atom))
(* Entry main *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let main (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Pcfast.expr)
