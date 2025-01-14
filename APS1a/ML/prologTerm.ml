(* ========================================================================== *)
(* == UPMC/master/info/4I506 -- Janvier 2016/2017/2018                     == *)
(* == SU/FSI/master/info/MU4IN503 -- Janvier 2020/2021/2022                == *)
(* == Analyse des programmes et sémantiques                                == *)
(* ========================================================================== *)
(* == hello-APS Syntaxe ML                                                 == *)
(* == Fichier: prologTerm.ml                                               == *)
(* ==  Génération de termes Prolog                                         == *)
(* ========================================================================== *)
open Ast

(*make YACC_ML=ocamlyacc*)

(*./prologTerm ../Samples1a/test2.aps*)

let rec print_prog p =
  "prog([" ^ print_cmds p ^ "])"

and print_block bk =
  "block([" ^ print_cmds bk ^ "])"

and print_cmds cmds = 
  match cmds with
    ASTStat(stat) -> print_stat stat
    |Def(def, cmds) -> (print_def def) ^ "," ^ (print_cmds cmds)
    |Stat(stat, cmds) -> (print_stat stat) ^ "," ^ (print_cmds cmds)

and print_def def =
  match def with
  ConstDef(id, ty, e) -> "const(" ^ id ^ "," ^ (print_type ty) ^ "," ^ (print_expr e) ^ ")"
  |FunDef(id, ty, args, e) -> "fun(" ^ id ^ "," ^ (print_type ty) ^ ",[" ^ (print_args args) ^ "]," ^ (print_expr e) ^ ")" 
  |FunRecDef(id, ty, args, e) -> "funrec(" ^ id ^ "," ^ (print_type ty) ^ ",[" ^ print_args args ^ "]," ^ (print_expr e) ^ ")" 
  |VarDef(id,t) -> "var(" ^ id ^ "," ^ (print_type t) ^ ")" 
  |ProcDef(id, argsp, bk) -> "proc(" ^ id ^ ",[" ^ (print_argsp argsp) ^ "]," ^ (print_block bk) ^ ")"
  |ProcRecDef(id, argsp, bk) -> "procrec(" ^ id ^ ",[" ^ (print_argsp argsp) ^ "]," ^ (print_block bk) ^ ")"

and print_type ty = 
  match ty with
      TypeBool -> "bool"
    |TypeInt -> "int"
    |Types(ts, t) -> "fleche([" ^ print_types ts ^ "], " ^ print_type t ^ ")"

and print_types ts = 
  match ts with 
      [] -> ""
    |[t] -> print_type t
    |t::res -> print_type t ^ "," ^ print_types res

and print_arg arg =
  match arg with
    (id, ty) -> "(" ^ id ^ "," ^ print_type ty ^ ")"
  
and print_args args =
  match args with
      [] -> ""
    |[a] -> print_arg a
    |a::t -> print_arg a ^ "," ^ print_args t

and print_argp argp =
  match argp with
    ASTArgp(id, ty) -> "(" ^ id ^ "," ^ print_type ty ^ ")"
    |ASTArgVarp(id,ty) -> "(" ^ id ^ ",ref(" ^ print_type ty ^ "))"
  
and print_argsp argsp =
  match argsp with
      [] -> ""
    |[a] -> print_argp a
    |a::t -> print_argp a ^ "," ^ print_argsp t
    
and print_stat s =
  match s with
    Echo e -> "echo(" ^ (print_expr e) ^ ")"
    |Set(id, e)  -> "set(" ^ id ^ "," ^ (print_expr e) ^ ")"
    |IfStat(e, bk1, bk2) -> "ifstat(" ^ (print_expr e) ^ "," ^ (print_block bk1) ^ "," ^ (print_block bk2) ^ ")"
    |While(e, bk) -> "while(" ^ (print_expr e) ^ "," ^ (print_block bk) ^ ")"
    |Call(id, es) -> "call(" ^ id ^ ",[" ^ (print_exprsp es) ^ "])"

and print_expr e =
  match e with
      ASTNum n -> string_of_int n
    | ASTId x -> "id(" ^ x ^ ")"
    | ASTIf (c, t, s) -> "if(" ^ (print_expr c) ^ "," ^ (print_expr t) ^ "," ^ (print_expr s) ^")"
    | ASTAnd (c, t) -> "and(" ^ (print_expr c) ^ "," ^ (print_expr t) ^ ")"
    | ASTOr (c, t) -> "or(" ^ (print_expr c) ^ "," ^ (print_expr t) ^ ")"
    | ASTFunabs (args, c) ->"funabs([" ^ (print_args args) ^ "]," ^ (print_expr c) ^ ")"
    | ASTApp(c, es) -> "app(" ^ (print_expr c) ^ ",[" ^ (print_exprs es) ^ "])"

and print_exprs es =
  match es with
      [] -> ""
    | [e] -> print_expr e
    | e::es -> (print_expr e) ^ "," ^	(print_exprs es)

and print_exprp e =
  match e with
      ASTExpr e -> print_expr e
    | ASTAdr x -> "adr(" ^ x ^ ")"

and print_exprsp es =
  match es with
      [] -> ""
    | [e] -> print_exprp e
    | e::es -> (print_exprp e) ^ "," ^	(print_exprsp es)
  
;;
	
let fname = Sys.argv.(1) in
let ic = open_in fname in
  try
    let lexbuf = Lexing.from_channel ic in
    let p = Parser.prog Lexer.token lexbuf in
      print_string(print_prog p);
      print_string ".\n"
  with Lexer.Eof ->
    exit 0
      
