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
  | ProcDef of string * argp list * block
  | ProcRecDef of string * argp list * block 

and typ = 
  TypeBool                         (*comme une feuille , c'est valeur*)
  |TypeInt
  |TypeVec of typ
  |Types of typ list * typ

and arg =
  string * typ

and argp =
  ASTArgp of string * typ
  |ASTArgVarp of string * typ 

and stat = 
  Echo of expr
  | Set of lval * expr
  | IfStat of expr * block * block
  | While of expr * block
  | Call of string * exprp list

and lval =
  ASTValId of string
  |AstValNth of lval * expr

and exprp =
  ASTExpr of expr
  |ASTAdr of string

and expr =
  |ASTNum of int
  |ASTId of string
  |ASTIf of expr * expr * expr 
  |ASTAnd of expr * expr
  |ASTOr of expr * expr
  |ASTFunabs of arg list * expr
  |ASTApp of expr * expr list
  |ASTAlloc of expr
  |ASTLen of expr 
  |ASTNth of expr * expr
  |ASTVset of expr * expr * expr