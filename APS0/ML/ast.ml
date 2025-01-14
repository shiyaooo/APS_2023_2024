(* ========================================================================== *)
(* == UPMC/master/info/4I506 -- Janvier 2016/2017/2018                     == *)
(* == SU/FSI/master/info/MU4IN503 -- Janvier 2020/2021/2022                == *)
(* == Analyse des programmes et sémantiques                                == *)
(* ========================================================================== *)
(* == hello-APS Syntaxe ML                                                 == *)
(* == Fichier: ast.ml                                                      == *)
(* ==  Arbre de syntaxe abstraite                                          == *)
(* ========================================================================== *)

type typ = 
    TypeBool                         (*comme une feuille , c'est valeur*)
    |TypeInt
    |Types of typ list * typ

type arg =
    string * typ

type expr =
    |ASTNum of int
    |ASTId of string
    |ASTIf of expr * expr * expr 
    |ASTAnd of expr * expr
    |ASTOr of expr * expr
    |ASTFunabs of arg list * expr
    |ASTApp of expr * expr list

  type stat = 
    ASTEcho of expr

type def = 
    ConstDef of string * typ * expr
    | FunDef of string * typ * arg list * expr
    | FunRecDef of string * typ * arg list * expr

type cmds =
    ASTStat of stat
    |ASTDef of def * cmds

type prog = cmds





  

	
