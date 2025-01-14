type token =
  | NUM of (int)
  | IDENT of (string)
  | LPAR
  | RPAR
  | LBRA
  | RBRA
  | ECHO
  | BOOL
  | INT
  | CONST
  | FUN
  | REC
  | PV
  | IMP
  | TIMES
  | COLON
  | COMMA
  | IF
  | AND
  | OR
  | VAR
  | PROC
  | SET
  | WHILE
  | CALL

open Parsing;;
let _ = parse_error;;
# 2 "parser.mly"
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

# 44 "parser.ml"
let yytransl_const = [|
  259 (* LPAR *);
  260 (* RPAR *);
  261 (* LBRA *);
  262 (* RBRA *);
  263 (* ECHO *);
  264 (* BOOL *);
  265 (* INT *);
  266 (* CONST *);
  267 (* FUN *);
  268 (* REC *);
  269 (* PV *);
  270 (* IMP *);
  271 (* TIMES *);
  272 (* COLON *);
  273 (* COMMA *);
  274 (* IF *);
  275 (* AND *);
  276 (* OR *);
  277 (* VAR *);
  278 (* PROC *);
  279 (* SET *);
  280 (* WHILE *);
  281 (* CALL *);
    0|]

let yytransl_block = [|
  257 (* NUM *);
  258 (* IDENT *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\003\000\003\000\003\000\004\000\004\000\004\000\
\004\000\004\000\004\000\005\000\005\000\005\000\006\000\006\000\
\007\000\008\000\008\000\009\000\009\000\009\000\009\000\009\000\
\010\000\010\000\010\000\010\000\010\000\010\000\010\000\011\000\
\011\000\000\000"

let yylen = "\002\000\
\001\000\003\000\001\000\003\000\003\000\004\000\007\000\008\000\
\003\000\006\000\007\000\001\000\001\000\005\000\001\000\003\000\
\003\000\001\000\003\000\002\000\003\000\004\000\003\000\003\000\
\001\000\001\000\006\000\005\000\005\000\004\000\004\000\001\000\
\002\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\034\000\001\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\025\000\026\000\000\000\000\000\020\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\002\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\012\000\013\000\000\000\000\000\000\000\
\000\000\009\000\000\000\000\000\021\000\023\000\000\000\024\000\
\004\000\005\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\006\000\000\000\000\000\022\000\000\000\
\000\000\033\000\000\000\000\000\000\000\030\000\017\000\019\000\
\031\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\028\000\029\000\016\000\000\000\000\000\000\000\010\000\000\000\
\027\000\014\000\007\000\000\000\011\000\008\000"

let yydgoto = "\002\000\
\004\000\005\000\015\000\016\000\066\000\067\000\041\000\042\000\
\017\000\055\000\056\000"

let yysindex = "\001\000\
\017\255\000\000\068\255\000\000\000\000\065\255\011\255\006\255\
\065\255\021\255\008\255\023\255\065\255\024\255\027\255\022\255\
\026\255\000\000\000\000\042\255\035\255\000\000\049\255\049\255\
\039\255\017\255\049\255\037\255\044\255\065\255\017\255\065\255\
\000\000\068\255\068\255\065\255\065\255\065\255\065\255\032\255\
\046\255\043\255\049\255\000\000\000\000\065\255\051\255\049\255\
\017\255\000\000\035\255\060\255\000\000\000\000\065\255\000\000\
\000\000\000\000\065\255\065\255\065\255\069\255\049\255\035\255\
\065\255\057\255\062\255\000\000\035\255\072\255\000\000\074\255\
\035\255\000\000\065\255\077\255\078\255\000\000\000\000\000\000\
\000\000\049\255\049\255\079\255\035\255\017\255\082\255\080\255\
\000\000\000\000\000\000\091\255\065\255\090\255\000\000\017\255\
\000\000\000\000\000\000\065\255\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\092\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\093\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\015\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\083\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\234\255\227\255\000\000\244\255\018\000\000\000\221\255\
\000\000\250\255\218\255"

let yytablesize = 100
let yytable = "\022\000\
\062\000\001\000\026\000\049\000\057\000\058\000\031\000\024\000\
\054\000\028\000\046\000\047\000\023\000\039\000\050\000\072\000\
\074\000\025\000\032\000\029\000\032\000\003\000\027\000\053\000\
\030\000\032\000\071\000\032\000\080\000\059\000\060\000\061\000\
\033\000\084\000\034\000\070\000\040\000\087\000\035\000\068\000\
\048\000\051\000\018\000\019\000\020\000\052\000\021\000\063\000\
\065\000\094\000\079\000\043\000\075\000\076\000\077\000\069\000\
\044\000\045\000\081\000\036\000\037\000\038\000\064\000\095\000\
\073\000\018\000\019\000\020\000\088\000\021\000\092\000\082\000\
\078\000\101\000\006\000\083\000\085\000\007\000\008\000\086\000\
\089\000\090\000\000\000\097\000\093\000\009\000\099\000\096\000\
\010\000\011\000\012\000\013\000\014\000\102\000\098\000\100\000\
\015\000\003\000\018\000\091\000"

let yycheck = "\006\000\
\039\000\001\000\009\000\026\000\034\000\035\000\013\000\002\001\
\031\000\002\001\023\000\024\000\002\001\020\000\027\000\051\000\
\055\000\012\001\004\001\012\001\006\001\005\001\002\001\030\000\
\002\001\002\001\049\000\013\001\064\000\036\000\037\000\038\000\
\006\001\069\000\013\001\048\000\002\001\073\000\013\001\046\000\
\002\001\005\001\001\001\002\001\003\001\002\001\005\001\016\001\
\006\001\085\000\063\000\003\001\059\000\060\000\061\000\005\001\
\008\001\009\001\065\000\018\001\019\001\020\001\017\001\086\000\
\005\001\001\001\002\001\003\001\075\000\005\001\083\000\015\001\
\004\001\096\000\007\001\014\001\005\001\010\001\011\001\006\001\
\004\001\004\001\255\255\004\001\006\001\018\001\093\000\006\001\
\021\001\022\001\023\001\024\001\025\001\100\000\004\001\006\001\
\014\001\006\001\006\001\082\000"

let yynames_const = "\
  LPAR\000\
  RPAR\000\
  LBRA\000\
  RBRA\000\
  ECHO\000\
  BOOL\000\
  INT\000\
  CONST\000\
  FUN\000\
  REC\000\
  PV\000\
  IMP\000\
  TIMES\000\
  COLON\000\
  COMMA\000\
  IF\000\
  AND\000\
  OR\000\
  VAR\000\
  PROC\000\
  SET\000\
  WHILE\000\
  CALL\000\
  "

let yynames_block = "\
  NUM\000\
  IDENT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Ast.block) in
    Obj.repr(
# 43 "parser.mly"
                                                     ( _1 )
# 212 "parser.ml"
               : Ast.prog))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Ast.cmds) in
    Obj.repr(
# 46 "parser.mly"
                                                     ( _2 )
# 219 "parser.ml"
               : Ast.block))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Ast.stat) in
    Obj.repr(
# 50 "parser.mly"
                                                    ( ASTStat(_1) )
# 226 "parser.ml"
               : Ast.cmds))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.def) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.cmds) in
    Obj.repr(
# 51 "parser.mly"
                                                    ( Def(_1, _3) )
# 234 "parser.ml"
               : Ast.cmds))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.stat) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.cmds) in
    Obj.repr(
# 52 "parser.mly"
                                                    ( Stat(_1, _3) )
# 242 "parser.ml"
               : Ast.cmds))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : Ast.typ) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 57 "parser.mly"
                                                    ( ConstDef(_2, _3, _4) )
# 251 "parser.ml"
               : Ast.def))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 5 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 4 : Ast.typ) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : Ast.arg list) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 58 "parser.mly"
                                                    ( FunDef(_2, _3, _5, _7) )
# 261 "parser.ml"
               : Ast.def))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 5 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 4 : Ast.typ) in
    let _6 = (Parsing.peek_val __caml_parser_env 2 : Ast.arg list) in
    let _8 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 59 "parser.mly"
                                                    ( FunRecDef(_3, _4, _6, _8) )
# 271 "parser.ml"
               : Ast.def))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.typ) in
    Obj.repr(
# 60 "parser.mly"
                                                    ( VarDef(_2, _3) )
# 279 "parser.ml"
               : Ast.def))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : Ast.arg list) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : Ast.block) in
    Obj.repr(
# 61 "parser.mly"
                                                    ( ProcDef(_2, _4, _6) )
# 288 "parser.ml"
               : Ast.def))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : Ast.arg list) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : Ast.block) in
    Obj.repr(
# 62 "parser.mly"
                                                    ( ProcRecDef(_3, _5, _7) )
# 297 "parser.ml"
               : Ast.def))
; (fun __caml_parser_env ->
    Obj.repr(
# 67 "parser.mly"
                                                    ( TypeBool )
# 303 "parser.ml"
               : Ast.typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 68 "parser.mly"
                                                    ( TypeInt )
# 309 "parser.ml"
               : Ast.typ))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : Ast.typ list) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : Ast.typ) in
    Obj.repr(
# 69 "parser.mly"
                                                    ( Types( _2, _4) )
# 317 "parser.ml"
               : Ast.typ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Ast.typ) in
    Obj.repr(
# 73 "parser.mly"
                                                    ( [_1] )
# 324 "parser.ml"
               : Ast.typ list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.typ) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.typ list) in
    Obj.repr(
# 74 "parser.mly"
                                                     ( _1::_3 )
# 332 "parser.ml"
               : Ast.typ list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.typ) in
    Obj.repr(
# 78 "parser.mly"
                                                    ( _1,_3 )
# 340 "parser.ml"
               : Ast.arg))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Ast.arg) in
    Obj.repr(
# 82 "parser.mly"
                                                    ( [_1] )
# 347 "parser.ml"
               : Ast.arg list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.arg) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.arg list) in
    Obj.repr(
# 83 "parser.mly"
                                                    ( _1::_3 )
# 355 "parser.ml"
               : Ast.arg list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 88 "parser.mly"
                                                    ( Echo(_2) )
# 362 "parser.ml"
               : Ast.stat))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 89 "parser.mly"
                                                    ( Set(_2, _3) )
# 370 "parser.ml"
               : Ast.stat))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : Ast.block) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : Ast.block) in
    Obj.repr(
# 90 "parser.mly"
                                                    ( IfStat(_2, _3, _4) )
# 379 "parser.ml"
               : Ast.stat))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Ast.expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.block) in
    Obj.repr(
# 91 "parser.mly"
                                                    ( While(_2, _3) )
# 387 "parser.ml"
               : Ast.stat))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr list) in
    Obj.repr(
# 92 "parser.mly"
                                                    ( Call(_2, _3) )
# 395 "parser.ml"
               : Ast.stat))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 96 "parser.mly"
                                                    ( ASTNum(_1) )
# 402 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 97 "parser.mly"
                                                    ( ASTId(_1) )
# 409 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : Ast.expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : Ast.expr) in
    Obj.repr(
# 98 "parser.mly"
                                                    ( ASTIf(_3, _4, _5) )
# 418 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : Ast.expr) in
    Obj.repr(
# 99 "parser.mly"
                                                    ( ASTAnd(_3, _4) )
# 426 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : Ast.expr) in
    Obj.repr(
# 100 "parser.mly"
                                                    ( ASTOr(_3, _4) )
# 434 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : Ast.expr list) in
    Obj.repr(
# 101 "parser.mly"
                                                    ( ASTApp(_2, _3) )
# 442 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : Ast.arg list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 102 "parser.mly"
                                                    ( ASTFunabs(_2, _4) )
# 450 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 106 "parser.mly"
                                                    ( [_1] )
# 457 "parser.ml"
               : Ast.expr list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Ast.expr) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr list) in
    Obj.repr(
# 107 "parser.mly"
                                                    ( _1::_2 )
# 465 "parser.ml"
               : Ast.expr list))
(* Entry prog *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let prog (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Ast.prog)
