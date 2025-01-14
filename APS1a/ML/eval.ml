open Ast

type value = InZ of int
            |InPrim of primitive
            |InF of fermeture
            |InFR of recFermeture
            |InA of adresse
            |InP of procFermeture
            |InPR of recProcFermeture
and fermeture = expr * string list * env
and recFermeture = expr * string * string list * env
and primitive = Not|Eq|Lt|Add|Sub|Mul|Div
and env = (string * value) list
and flux = int list
and adresse = int
and procFermeture = cmds * string list * env
and recProcFermeture = cmds * string * string list * env
and espace = None|Some of value | Any
and mem = (adresse * espace) list (*mémoire = adresse et dans cet adresse, son esoace = la value de cet espace*)

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

and getEnv env e =
  match env with
  | [] -> failwith "Not in env"
  | (s,v)::t -> if e = s then v else getEnv t e

and getMem mem adr =
  match mem with
  | [] -> failwith "Not in memory"
  | (ad,v)::t -> if ad = adr then v else getMem t adr

(*and getMem mem adr =
  match mem with
      [] -> failwith "Not in mem"
      |(k,v)::t when k = adr -> v
      |_::t -> getMem t adr*)

and newAdresse mem =( (*为了找到一个新的地址，该地址不在给定的内存中使用*)
  let rec aux mem adr =
    match mem with
    |[] -> InA (adr+1) (*如果内存为空，则返回一个新的地址*)
    |(ad,_)::t -> if ad > adr then aux t ad (*内存中剩余的地址列表 t 和地址 ad 作为参数传递, 如果内存中的第一个地址 ad 大于当前地址 a*)
                  else aux t adr
  in aux mem 0 )

and alloc_mem mem = 
  let adr = newAdresse mem in
    match adr with 
    |InA adr -> (adr, (adr,Any)::mem)
    |_ -> failwith "Error in allocation"

and replace_elem l x v = 
  let rec aux l x v acc =
    match l with
    |[] -> List.rev acc
    |h::t -> if h = x then aux t x v (v::acc) 
              else aux t x v (h::acc)
  in aux l x v []

(* and modifier_mem mem adr v =
  let rec aux mem adr v = 
    match mem with
    |[] -> failwith "Not in mem"
    |(ad,e)::t-> if ad = adr then replace_elem mem (ad,e) (ad,v) else aux t adr v 
  in aux mem adr v *)

and modifier_mem mem adr v =
  let rec aux m adr v =
    match m with
      [] -> failwith "Not in mem"
      |(k,e)::t when k = adr -> replace_elem mem (k,e) (k,v)
      |_::t -> aux t adr v
    in aux mem adr v


(*let args = [("a", 1); ("b", 2); ("c", 3)]
let result = eval_args args  --> ["a"; "b"; "c"]*)
and eval_args args = 
  List.map (fun (x, _) -> x) args

and eval_argp argp =
    match argp with
    ASTArgp(id, typ) -> id
    |ASTArgVarp(id, typ) -> id

and eval_argsp argsp = 
    match argsp with
    [] -> []
    |[argp] -> [eval_argp argp]
    |argp::tl -> (eval_argp argp) :: (eval_argsp tl) 

and eval_op_unary op v =
  match op, v with
  | InPrim(Not), InZ(0) -> InZ(1)
  | InPrim(Not), InZ(1) -> InZ(0)
  | InPrim(Not), _ -> failwith "Error in NOT argument"
  | _ -> failwith "It is not an unary operator"

(*|Eq|Lt|Add|Sub|Mul|Div*)
and eval_op_binary op v1 v2 = 
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


and eval_expr (env, mem) value=
  match value with
  (*ASTBool true -> InZ(1)
  |ASTBool false-> InZ(0)*)
  |ASTNum num-> InZ(num)
  |ASTId id -> (match (getEnv env id) with
                |InA a -> (match getMem mem a with
                          |Some v -> v
                          |Any -> InZ(0)
                          |_ -> failwith (id ^"not in memory") 
                          )
                |v -> v
                )
  |ASTIf (x1, x2, x3) -> let b = eval_expr (env, mem) x1 in 
                          if b = InZ(1) then eval_expr (env, mem) x2
                          else if b =InZ(0) then eval_expr (env, mem) x3
                          else failwith "Err in if"
                          
  |ASTAnd (e1, e2) -> if (eval_expr (env, mem) e1) = InZ(0) then InZ(0) 
                      else if (eval_expr (env, mem) e2) = InZ(0) then InZ(0)
                      else InZ(1)
  |ASTOr (e1, e2) -> if (eval_expr (env, mem) e1) = InZ(1) then InZ(1) 
                      else if (eval_expr (env, mem) e2) = InZ(1) then InZ(1)
                      else InZ(0)

  |ASTFunabs (args, e) -> InF(e, eval_args args, env) 
  |ASTApp (e,es)-> let v = eval_expr (env, mem) e in
                    let vs = List.map (fun x->eval_expr (env, mem) x) es in
                    match v with
                    InZ n -> failwith "App usage: (expr exprs)"
                    |InF(e_f, xs_f, env_f) -> 
                      let env_f_tmp = (List.combine xs_f vs)@env_f in
                            eval_expr (env_f_tmp, mem) e_f
                    |InFR(e_fr,x_fr,xs_fr, env_fr) ->
                      let env_f_tmp = (List.combine xs_fr vs)@env_fr in
                      let env_fr_tmp = (x_fr, InFR(e_fr, x_fr, xs_fr, env_fr))::env_f_tmp in
                        eval_expr (env_fr_tmp, mem) e_fr
                    |InPrim _ ->
                      match List.length es with
                      |1 -> eval_op_unary v (List.hd vs)
                      |2 -> eval_op_binary v (List.hd vs) (List.hd (List.tl vs))
                      |_ -> failwith "neither unary nor binary"                      

and eval_expar (env, mem) exprp =
    match exprp with
    |ASTExpr e -> eval_expr (env, mem) e
    |ASTAdr ad_e  -> let v = getEnv env ad_e in v

and eval_instr (env, mem, flux) stat =
  match stat with
  |Echo e-> (match (eval_expr (env, mem) e) with
            | InZ i -> (mem, (i::flux))
            | _ -> failwith "Error ECHO" )
  |Set (x, e) -> let v = eval_expr (env, mem) e in
                (match getEnv env x with
                  |InA a ->let new_mem = modifier_mem mem a (Some(v)) in (new_mem, flux)
                  | _ -> failwith (x^" not in mem" )
                  )
  |IfStat (e, bk1, bk2) -> (match (eval_expr (env, mem) e) with
                            |InZ(1) -> let (mem_f, flux_f) = eval_block (env, mem, flux) bk1 in (mem_f, flux_f)
                            |InZ(0) -> let (mem_f, flux_f) = eval_block (env, mem, flux) bk2 in (mem_f, flux_f)
                            | _ -> failwith "Error in if condition" 
                          )
  |While (e, bk) -> (match (eval_expr (env, mem) e) with
                        |InZ(0) -> (mem, flux)
                        |InZ(1) -> let (mem_tmp, flux_tmp) = eval_block (env, mem, flux) bk in 
                                    let (mem_f, flux_f) = eval_instr (env, mem_tmp, flux_tmp) (While (e,bk))
                                    in (mem_f, flux_f)
                        | _ -> failwith "Error in while condition" 
                      )       
  |Call (id, es) -> let p = getEnv env id and
                      vals = (List.map (fun e ->eval_expar (env, mem) e) es) in
                    match p with
                    |InP(bk, xs_p, env_p) -> 
                      let env_p_tmp = (List.combine xs_p vals)@env_p in 
                        eval_block (env_p_tmp, mem, flux) bk
                    |InPR(bk,x_pr, xs_pr, env_pr) -> 
                      let env_p_tmp = (List.combine xs_pr vals)@env_pr in
                      let env_pr_tmp = (x_pr, InPR(bk, x_pr, xs_pr, env_pr))::env_p_tmp in
                        eval_block (env_pr_tmp, mem, flux) bk

and eval_defs (env,mem) def =
  match def with 
  |ConstDef(x, _, e) -> ((x, eval_expr (env,mem) e)::env,mem)
  |FunDef(x, _, args, e) -> ((x,InF(e, eval_args args, env))::env,mem)
  |FunRecDef(x, _, args, e) -> ((x, InFR(e,x,eval_args args, env))::env,mem)
  |VarDef(x, _)-> let (a,new_mem) = alloc_mem mem in 
                    ((x,InA(a))::env,new_mem)
  |ProcDef(x, args, bk) -> ((x,InP(bk, eval_argsp args, env))::env,mem)
  |ProcRecDef(x, args, bk) -> ((x, InPR(bk,x,eval_argsp args, env))::env,mem)

and eval_cmds (env, mem, flux) cs =
  match cs with
  |ASTStat s -> eval_instr (env, mem, flux) s 
  |Stat (s,cs') -> let (mem_s, flux_s) = eval_instr (env, mem, flux) s in
                    eval_cmds (env, mem_s, flux_s) cs'
  |Def (d,cs') ->  let (env_d, mem_d) = eval_defs (env, mem) d in
                    eval_cmds (env_d, mem_d, flux) cs'

and eval_block (env, mem, flux) bk = eval_cmds (env, mem, flux) bk
  (*let (new_mem, new_flux) = eval_cmds env mem flux bk in (new_mem, new_flux)*)


and eval_prog p = 
  let (env, flux) = eval_block (env0, [], []) p in (env,flux)
;;
  (*用于从命令行参数中读取文件名，然后打开该文件进行解析。如果文件打开成功，则调用Lexer模块中的token函数生成词法记号，然后将其传递给Parser模块中的prog函数进行语法分析。接着，它调用print_prog函数打印解析结果，并在末尾添加句号。如果文件已经到达末尾（End of File），则退出程序。*)
  let rec print_list l =
    match l with
    [] -> ()
    |h::t -> print_int h; print_string " "; print_list t; print_string "\n";
  
  ;;
  
  let fname = Sys.argv.(1) in
  let ic = open_in fname in
  try
    let lexbuf = Lexing.from_channel ic in
    let e = Parser.prog Lexer.token lexbuf in
    let (_, flux) = eval_prog e in
    print_list(flux);
  with Lexer.Eof ->
    exit 0