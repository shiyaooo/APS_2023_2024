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
(*./prologTerm ../Samples0/test2.aps*)   

let rec print_type ty = 
  match ty with
      TypeBool -> "bool"
    |TypeInt -> "int"
    |Types(ts, t) -> "(types([" ^ print_types ts ^ "]) -> " ^ print_type t ^ ")"

and print_types ts = 
  match ts with 
      [] -> ""
    |[t] -> print_type t
    |t::res -> print_type t ^ "," ^ print_types res

let rec print_arg arg =
  match arg with
    (id, ty) -> "(" ^ id ^ "," ^ print_type ty ^ ")"
  
and print_args args =
  match args with
      [] -> ""
    |[a] -> print_arg a
    |a::t -> print_arg a ^ "," ^ print_args t

let rec print_expr e =
  match e with
    (*ASTBool true -> "true"
    | ASTBool false -> "false"*)
     ASTNum n -> string_of_int n
    | ASTId x -> "id(" ^ x ^ ")"
    | ASTIf (c, t, s) -> "if(" ^ (print_expr c) ^ "," ^ (print_expr t) ^ "," ^ (print_expr s) ^")"
    | ASTAnd (c, t) -> "and(" ^ (print_expr c) ^ "," ^ (print_expr t) ^ ")"
    | ASTOr (c, t) -> "or(" ^ (print_expr c) ^ "," ^ (print_expr t) ^ ")"
    (**| ASTOp (s, es) -> s^"("^(print_exprs es)^")"**)
    | ASTFunabs (args, c) ->"funabs([" ^ (print_args args) ^ "]," ^ (print_expr c) ^ ")"
    | ASTApp(c, es) -> "app(" ^ (print_expr c) ^ ",[" ^ (print_exprs es) ^ "])"

and print_exprs es =
  match es with
      [] -> ""
    | [e] -> print_expr e
    | e::es -> (print_expr e) ^ "," ^	(print_exprs es)

let rec print_def def =
  match def with
  ConstDef(id, ty, e) -> "const(" ^ id ^ "," ^ (print_type ty) ^ "," ^ (print_expr e) ^ ")"
  |FunDef(id, ty, args, e) -> "fun(" ^ id ^ "," ^ (print_type ty) ^ ",[" ^ (print_args args) ^ "]," ^ (print_expr e) ^ ")" 
  |FunRecDef(id, ty, args, e) -> "funrec(" ^ id ^ "," ^ (print_type ty) ^ ",[" ^ print_args args ^ "]," ^ (print_expr e) ^ ")" 


let print_stat s =
  match s with
      ASTEcho e -> ("echo(" ^ (print_expr e) ^ ")")
      

let rec print_cmds cmds = 
  match cmds with
    |ASTStat(stat) -> print_stat stat
    |ASTDef(def, cmds) -> print_def def ^ "," ^ print_cmds cmds
   
let print_prog p =
  "prog([" ^ print_cmds p ^ "])"
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
      
