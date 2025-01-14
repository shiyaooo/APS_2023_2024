(* ========================================================================== *)
(* == UPMC/master/info/4I506 -- Janvier 2016/2017/2018                     == *)
(* == SU/FSI/master/info/MU4IN503 -- Janvier 2020/2021/2022                == *)
(* == Analyse des programmes et sémantiques                                == *)
(* ========================================================================== *)
(* == hello-APS Syntaxe ML                                                 == *)
(* == Fichier: ast.ml                                                      == *)
(* ==  Arbre de syntaxe abstraite                                          == *)
(* ========================================================================== *)

type prog = block

and block = cmds

and cmds =
  ASTStat of stat
  |Def of def * cmds
  |Stat of stat * cmds

and def = 
  ConstDef of string * typ * expr
  | FunDef of string * typ * arg list * expr
  | FunRecDef of string * typ * arg list * expr
  | VarDef of string * typ
  | ProcDef of string * arg list * block
  | ProcRecDef of string * arg list * block

and typ = 
  TypeBool                         (*comme une feuille , c'est valeur*)
  |TypeInt
  |Types of typ list * typ

and arg =
  string * typ

and stat = 
  Echo of expr
  | Set of string * expr
  | IfStat of expr * block * block
  | While of expr * block
  | Call of string * expr list

and expr =
  |ASTNum of int
  |ASTId of string
  |ASTIf of expr * expr * expr 
  |ASTAnd of expr * expr
  |ASTOr of expr * expr
  |ASTFunabs of arg list * expr
  |ASTApp of expr * expr list
