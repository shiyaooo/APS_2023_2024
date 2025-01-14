%{
(* ========================================================================== *)
(* == UPMC/master/info/4I506 -- Janvier 2016/2017                          == *)
(* == SU/FSI/master/info/MU4IN503 -- Janvier 2020/2021/2022                == *)
(* == Analyse des programmes et sémantiques                                == *)
(* ========================================================================== *)
(* == hello-APS Syntaxe ML                                                 == *)
(* == Fichier: parser.mly                                                  == *)
(* == Analyse syntaxique                                                   == *)
(* ========================================================================== *)

open Ast

%}


%token <int> NUM
%token <string> IDENT
%token LPAR RPAR 
%token LBRA RBRA
%token ECHO

%token BOOL INT CONST FUN REC PV IMP TIMES COLON COMMA IF AND OR

%type <Ast.prog> prog
%type <Ast.cmds> cmds
%type <Ast.def> def
%type <Ast.typ> typ
%type <Ast.typ list> types
%type <Ast.arg> arg
%type <Ast.arg list> args
%type <Ast.stat> stat
%type <Ast.expr> expr
%type <Ast.expr list> exprs


%start prog

%%

prog: LBRA cmds RBRA                                { $2 }
;

cmds: 
    stat                                            { ASTStat($1) }  
|   def PV cmds                                     { ASTDef($1, $3) }
;


def:
    CONST IDENT typ expr                            { ConstDef($2, $3, $4) }
|   FUN IDENT typ LBRA args RBRA expr               { FunDef($2, $3, $5, $7) }
|   FUN REC IDENT typ LBRA args RBRA expr           { FunRecDef($3, $4, $6, $8) }
;


typ:
    BOOL                                            { TypeBool }
|   INT                                             { TypeInt }
|   LPAR types IMP typ RPAR                         { Types( $2, $4) } 
;

types:
    typ                                             { [$1] }
|   typ TIMES types                                  { $1::$3 }
;

arg: 
    IDENT COLON typ                                 { $1,$3 }
;

args:
    arg                                             { [$1] }
|   arg COMMA args                                  { $1::$3 }   
;


stat:
    ECHO expr                                       { ASTEcho($2) }
;

expr:
|   NUM                                             { ASTNum($1) }
|   IDENT                                           { ASTId($1) }
|   LPAR IF expr expr expr RPAR                     { ASTIf($3, $4, $5) }
|   LPAR AND expr expr RPAR                         { ASTAnd($3, $4) }    
|   LPAR OR expr expr RPAR                          { ASTOr($3, $4) }
|   LPAR expr exprs RPAR                            { ASTApp($2, $3) }
|   LBRA args RBRA expr                             { ASTFunabs($2, $4) }
;

exprs:
    expr                                            { [$1] }
|   expr exprs                                      { $1::$2 }
;