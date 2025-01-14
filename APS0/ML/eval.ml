open Ast

type value = InZ of int
            |InPrim of primitive
            |InF of fermeture
            |InFR of recFermeture
and fermeture = expr * string list * env
and recFermeture = expr * string * string list * env
and primitive = Not|Eq|Lt|Add|Sub|Mul|Div
and env = (string * value) list
and flux = int list

let env0 = [ 
  ("true", InZ(1));
  ("false", InZ(0));
  ("not", InPrim (Not));
  ("eq", InPrim (Eq));
  ("lt", InPrim (Lt));
  ("add", InPrim (Add));
  ("sub", InPrim (Sub));
  ("mul", InPrim (Mul));
  ("div", InPrim (Div))
]
let rec int_of_value v =
  match v with
  | InZ i -> i
  | _ -> failwith "It's not an integer"
;;

let rec getEnv env e =
  match env with
  | [] -> failwith "Not in env"
  | (s,v)::t -> if e = s then v else getEnv t e
;;

(*let args = [("a", 1); ("b", 2); ("c", 3)]
let result = eval_args args  --> ["a"; "b"; "c"]*)
let eval_args args = 
  List.map (fun (x, _) -> x) args
;;

let eval_op_unary op v =
  match op, v with
  | InPrim(Not), InZ(0) -> InZ(1)
  | InPrim(Not), InZ(1) -> InZ(0)
  | InPrim(Not), _ -> failwith "Error in NOT argument"
  | _ -> failwith "It is not an unary operator"

(*|Eq|Lt|Add|Sub|Mul|Div*)
let eval_op_binary op v1 v2 = 
  match op with
  |InPrim(Eq) -> let n1 = int_of_value v1 and n2 = int_of_value v2 in
                  if n1 == n2 then InZ(1) else InZ(0)
  |InPrim(Lt) -> let n1 = int_of_value v1 and n2 = int_of_value v2 in
                  if n1 < n2 then InZ(1) else InZ(0)
  |InPrim(Add) -> let n1 = int_of_value v1 and n2 = int_of_value v2 in
                  InZ(n1 + n2)
  |InPrim(Sub) -> let n1 = int_of_value v1 and n2 = int_of_value v2 in
                  InZ(n1 - n2)
  |InPrim(Mul) -> let n1 = int_of_value v1 and n2 = int_of_value v2 in
                  InZ(n1 * n2)
  |InPrim(Div) -> let n1 = int_of_value v1 and n2 = int_of_value v2 in
                  if n2 == 0 then failwith "Division by zero" else InZ(n1 / n2)
  |_ -> failwith "It is not an binary operator"
;;

let rec eval_expr env value=
  match value with
  (*ASTBool true -> InZ(1)
  |ASTBool false-> InZ(0)*)
  |ASTNum num-> InZ(num)
  |ASTId id -> getEnv env id
  |ASTIf (x1, x2, x3) -> let b = eval_expr env x1 in 
                          if b = InZ(1) then eval_expr env x2
                          else if b =InZ(0) then eval_expr env x3
                          else failwith "Err in if"
  |ASTAnd (e1, e2) -> if (eval_expr env e1) = InZ(0) then InZ(0) 
                      else if (eval_expr env e2) = InZ(0) then InZ(0)
                      else InZ(1)
  |ASTOr (e1, e2) -> if (eval_expr env e1) = InZ(1) then InZ(1) 
                      else if (eval_expr env e2) = InZ(1) then InZ(1)
                      else InZ(0)

  |ASTFunabs (args, e) -> InF(e, eval_args args, env) 
  |ASTApp (e,es)-> let v = eval_expr env e in
                    let vs = List.map (fun x->eval_expr env x) es in
                    match v with
                    InZ n -> failwith "App usage: (expr exprs)"
                    |InF(e_f, xs_f, env_f) -> 
                      let env_f_tmp = (List.combine xs_f vs)@env_f in
                            eval_expr env_f_tmp e_f
                    |InFR(e_fr,x_fr,xs_fr, env_fr) ->
                      let env_f_tmp = (List.combine xs_fr vs)@env_fr in
                      let env_fr_tmp = (x_fr, InFR(e_fr, x_fr, xs_fr, env_fr))::env_f_tmp in
                        eval_expr env_fr_tmp e_fr
                    |InPrim _ ->
                      match List.length es with
                      |1 -> eval_op_unary v (List.hd vs)
                      |2 -> eval_op_binary v (List.hd vs) (List.hd (List.tl vs))
                      |_ -> failwith "neither unary nor binary"                      
;;


let rec eval_instr env flux stat =
  match stat with
  |ASTEcho e-> (match (eval_expr env e) with
            | InZ i -> (i::flux)
            | _ -> failwith "Error ECHO" )
;;

let rec eval_defs env def =
  match def with 
  |ConstDef(x, _, e) -> (x, eval_expr env e)::env
  |FunDef(x, _, args, e) -> (x,InF(e, eval_args args, env))::env
  |FunRecDef(x, _, args, e) -> (x, InFR(e,x,eval_args args, env))::env 
;;

let rec eval_cmds env flux cs =
  match cs with
  |ASTStat s -> eval_instr env flux s
  |ASTDef (d,cs') ->  let env_def =  eval_defs env d 
                      in eval_cmds env_def flux cs'


let rec eval_prog p= eval_cmds env0 [] p

  (*用于从命令行参数中读取文件名，然后打开该文件进行解析。如果文件打开成功，则调用Lexer模块中的token函数生成词法记号，然后将其传递给Parser模块中的prog函数进行语法分析。接着，它调用print_prog函数打印解析结果，并在末尾添加句号。如果文件已经到达末尾（End of File），则退出程序。*)
  let rec print_list l =
    match l with
    [] -> ()
    |h::t -> print_int h; print_string "\n";print_list t
  
  ;;
  
  let fname = Sys.argv.(1) in
  let ic = open_in fname in
  try
    let lexbuf = Lexing.from_channel ic in
    let e = Parser.prog Lexer.token lexbuf in
    print_list(eval_prog e);
  with Lexer.Eof ->
    exit 0