%{
  open Pcfast;;

  let rec mkfun params expr = match params with
  | [] -> expr
  | p :: prms -> EFun(p, mkfun prms expr)
  ;;
%}

%token <int> INT
%token <string> IDENT
%token TRUE FALSE
%token <string> STRING
%token PLUS MINUS MULT DIV EQUAL GREATER SMALLER GREATEREQUAL SMALLEREQUAL
%token LPAR RPAR SEMICOLON
%token LET REC IN FUN ARROW
%token IF THEN ELSE
%left EQUAL GREATER SMALLER GREATEREQUAL SMALLEREQUAL
%left PLUS MINUS
%left MULT DIV

%start main
%type <Pcfast.expr> main

%%

main: expr SEMICOLON { $1 }
    | SEMICOLON main { $2 }
;

/* Grammaire ci-dessous a finir */

expr: INT                                             { EInt($1) }
		| IDENT                                           { EIdent($1) }
		| LPAR expr RPAR                                  { $2 }
		| LET IDENT EQUAL expr IN expr                    { ELet($2, $4, $6) }
		| LET REC IDENT IDENT seqident EQUAL expr IN expr { ELetrec($3, $4, (mkfun
		$5 $7), $9) }
		| FUN IDENT ARROW expr                            { EFun($2, $4) } 
;

seqident: IDENT seqident { $1::$2 }
		| /* rien */         { []     }
;

arith_expr:
		  application { $1 }
		| arith_expr EQUAL arith_expr { EBinop("=", $1, $3) }
		| arith_expr PLUS arith_expr { EBinop("+", $1, $3) }
;

application:
		  atom { $1 }
		| MINUS atom { EMonop("-", $2) }
		| application atom { EApp($1, $2) }
;


atom:
		  INT { EInt($1) }
		| IDENT  { EIdent($1) }
		| LPAR expr RPAR { $2 }
;

