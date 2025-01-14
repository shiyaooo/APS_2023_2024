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
%token VAR PROC SET WHILE CALL
%token VARP ADR
%token ALLOC LEN NTH VSET VEC

%type <Ast.prog> prog
%type <Ast.block> block
%type <Ast.cmds> cmds
%type <Ast.def> def
%type <Ast.typ> typ
%type <Ast.typ list> types
%type <Ast.arg> arg
%type <Ast.arg list> args
%type <Ast.argp> argp
%type <Ast.argp list> argsp
%type <Ast.stat> stat
%type <Ast.expr> expr
%type <Ast.expr list> exprs
%type <Ast.exprp> exprp
%type <Ast.exprp list> exprsp
%type <Ast.lval> lval

%start prog

%%
prog:
    block                                            { $1 }
;

block: LBRA cmds RBRA                                { $2 }
;

cmds: 
    stat                                            { ASTStat($1) }  
|   def PV cmds                                     { Def($1, $3)}
|   stat PV cmds                                    { Stat($1, $3)}
;


def:
    CONST IDENT typ expr                            { ConstDef($2, $3, $4) }
|   FUN IDENT typ LBRA args RBRA expr               { FunDef($2, $3, $5, $7) }
|   FUN REC IDENT typ LBRA args RBRA expr           { FunRecDef($3, $4, $6, $8) }
|   VAR IDENT typ                                   { VarDef($2, $3) }
|   PROC IDENT LBRA argsp RBRA block                { ProcDef($2, $4, $6) }
|   PROC REC IDENT LBRA argsp RBRA block            { ProcRecDef($3, $5, $7) }
;


typ:
    BOOL                                            { TypeBool }
|   INT                                             { TypeInt }
|   LPAR VEC typ RPAR                               { TypeVec($3) }
|   LPAR types IMP typ RPAR                         { Types( $2, $4)} 
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

argp: 
    IDENT COLON typ                                 { ASTArgp($1,$3) }
|   VARP IDENT COLON typ                            { ASTArgVarp($2,$4) }
;

argsp:
    argp                                             { [$1] }
|   argp COMMA argsp                                 { $1::$3 }   
;

stat:
     ECHO expr                                      { Echo($2) }
|    SET lval expr                                  { Set($2, $3) }
|    IF expr block block                            { IfStat($2, $3, $4) }
|    WHILE expr block                               { While($2, $3) }  
|    CALL IDENT exprsp                              { Call($2, $3) } 
;

lval:
    IDENT                                           { ASTValId($1) }
|   LPAR NTH lval expr RPAR                         { AstValNth($3, $4) }
;

expr:
|   NUM                                             { ASTNum($1) }
|   IDENT                                           { ASTId($1) }
|   LPAR IF expr expr expr RPAR                     { ASTIf($3, $4, $5) }
|   LPAR AND expr expr RPAR                         { ASTAnd($3, $4) }    
|   LPAR OR expr expr RPAR                          { ASTOr($3, $4) }
|   LPAR expr exprs RPAR                            { ASTApp($2, $3) }
|   LBRA args RBRA expr                             { ASTFunabs($2, $4) }
|   LPAR ALLOC expr RPAR                            { ASTAlloc($3) }
|   LPAR LEN expr RPAR                              { ASTLen($3) }
|   LPAR NTH expr expr RPAR                         { ASTNth($3, $4) }
|   LPAR VSET expr expr expr RPAR                   { ASTVset($3, $4, $5) }
;

exprs:
    expr                                            { [$1] }
|   expr exprs                                      { $1::$2 }
;

exprp:
   expr                                             { ASTExpr($1) }
|  LPAR ADR IDENT RPAR                              { ASTAdr($3) }
;

exprsp:
    exprp                                           { [$1] }
|   exprp exprsp                                    { $1::$2 }
;