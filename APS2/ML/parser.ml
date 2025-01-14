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
  | VARP
  | ADR
  | ALLOC
  | LEN
  | NTH
  | VSET
  | VEC

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

# 51 "parser.ml"
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
  282 (* VARP *);
  283 (* ADR *);
  284 (* ALLOC *);
  285 (* LEN *);
  286 (* NTH *);
  287 (* VSET *);
  288 (* VEC *);
    0|]

let yytransl_block = [|
  257 (* NUM *);
  258 (* IDENT *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\003\000\003\000\003\000\004\000\004\000\004\000\
\004\000\004\000\004\000\005\000\005\000\005\000\005\000\006\000\
\006\000\007\000\008\000\008\000\009\000\009\000\010\000\010\000\
\011\000\011\000\011\000\011\000\011\000\016\000\016\000\012\000\
\012\000\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
\012\000\012\000\013\000\013\000\014\000\014\000\015\000\015\000\
\000\000"

let yylen = "\002\000\
\001\000\003\000\001\000\003\000\003\000\004\000\007\000\008\000\
\003\000\006\000\007\000\001\000\001\000\004\000\005\000\001\000\
\003\000\003\000\001\000\003\000\003\000\004\000\001\000\003\000\
\002\000\003\000\004\000\003\000\003\000\001\000\005\000\001\000\
\001\000\006\000\005\000\005\000\004\000\004\000\004\000\004\000\
\005\000\006\000\001\000\002\000\001\000\004\000\001\000\002\000\
\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\049\000\001\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\032\000\033\000\000\000\000\000\025\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\030\000\000\000\000\000\
\000\000\000\000\002\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\012\000\013\000\000\000\000\000\000\000\000\000\009\000\
\000\000\000\000\000\000\026\000\028\000\000\000\045\000\000\000\
\029\000\004\000\005\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\006\000\000\000\000\000\027\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\048\000\000\000\000\000\
\000\000\039\000\040\000\000\000\000\000\044\000\037\000\018\000\
\020\000\038\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\035\000\
\036\000\041\000\000\000\014\000\017\000\000\000\000\000\000\000\
\021\000\000\000\024\000\010\000\000\000\031\000\046\000\034\000\
\042\000\015\000\007\000\000\000\022\000\011\000\008\000"

let yydgoto = "\002\000\
\004\000\005\000\015\000\016\000\081\000\082\000\047\000\048\000\
\089\000\090\000\017\000\045\000\076\000\064\000\065\000\032\000"

let yysindex = "\005\000\
\005\255\000\000\128\255\000\000\000\000\051\255\010\255\002\255\
\051\255\019\255\011\255\041\255\051\255\022\255\025\255\028\255\
\044\255\000\000\000\000\113\255\053\255\000\000\042\255\042\255\
\057\255\005\255\042\255\055\255\059\255\000\000\035\255\051\255\
\005\255\075\255\000\000\128\255\128\255\051\255\051\255\051\255\
\051\255\051\255\051\255\051\255\051\255\050\255\054\255\064\255\
\008\255\000\000\000\000\051\255\069\255\042\255\005\255\000\000\
\003\255\074\255\041\255\000\000\000\000\082\255\000\000\075\255\
\000\000\000\000\000\000\051\255\051\255\051\255\077\255\078\255\
\051\255\051\255\051\255\084\255\042\255\053\255\051\255\042\255\
\076\255\079\255\000\000\053\255\087\255\000\000\080\255\092\255\
\081\255\091\255\003\255\051\255\097\255\000\000\051\255\099\255\
\101\255\000\000\000\000\102\255\051\255\000\000\000\000\000\000\
\000\000\000\000\115\255\042\255\042\255\111\255\053\255\042\255\
\104\255\003\255\005\255\116\255\119\255\120\255\122\255\000\000\
\000\000\000\000\123\255\000\000\000\000\124\255\051\255\130\255\
\000\000\042\255\000\000\000\000\005\255\000\000\000\000\000\000\
\000\000\000\000\000\000\051\255\000\000\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\131\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\134\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\014\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\125\255\000\000\000\000\000\000\000\000\000\000\
\133\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\139\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\231\255\011\000\000\000\251\255\022\000\000\000\187\255\
\000\000\167\255\000\000\250\255\073\000\000\000\090\000\096\000"

let yytablesize = 155
let yytable = "\022\000\
\055\000\116\000\026\000\024\000\087\000\001\000\033\000\061\000\
\105\000\003\000\049\000\023\000\028\000\025\000\110\000\050\000\
\051\000\052\000\053\000\047\000\027\000\056\000\029\000\034\000\
\131\000\060\000\047\000\063\000\088\000\086\000\035\000\068\000\
\069\000\070\000\071\000\072\000\073\000\074\000\075\000\080\000\
\036\000\128\000\030\000\031\000\049\000\083\000\066\000\067\000\
\085\000\050\000\051\000\018\000\019\000\020\000\046\000\021\000\
\037\000\063\000\054\000\057\000\058\000\095\000\096\000\097\000\
\059\000\077\000\100\000\101\000\075\000\079\000\078\000\104\000\
\106\000\084\000\107\000\018\000\019\000\062\000\091\000\021\000\
\098\000\099\000\018\000\019\000\020\000\117\000\021\000\103\000\
\119\000\132\000\108\000\111\000\109\000\113\000\123\000\112\000\
\115\000\114\000\118\000\038\000\039\000\040\000\120\000\126\000\
\121\000\122\000\129\000\142\000\093\000\041\000\042\000\043\000\
\044\000\018\000\019\000\020\000\127\000\021\000\124\000\130\000\
\139\000\133\000\134\000\135\000\141\000\136\000\137\000\138\000\
\043\000\125\000\038\000\039\000\040\000\143\000\006\000\140\000\
\003\000\007\000\008\000\019\000\041\000\042\000\043\000\044\000\
\023\000\009\000\016\000\102\000\010\000\011\000\012\000\013\000\
\014\000\094\000\092\000"

let yycheck = "\006\000\
\026\000\091\000\009\000\002\001\002\001\001\000\013\000\033\000\
\078\000\005\001\003\001\002\001\002\001\012\001\084\000\008\001\
\009\001\023\000\024\000\006\001\002\001\027\000\012\001\002\001\
\114\000\032\000\013\001\034\000\026\001\055\000\006\001\038\000\
\039\000\040\000\041\000\042\000\043\000\044\000\045\000\032\001\
\013\001\111\000\002\001\003\001\003\001\052\000\036\000\037\000\
\054\000\008\001\009\001\001\001\002\001\003\001\002\001\005\001\
\013\001\064\000\002\001\005\001\002\001\068\000\069\000\070\000\
\030\001\016\001\073\000\074\000\075\000\006\001\017\001\077\000\
\079\000\005\001\080\000\001\001\002\001\003\001\005\001\005\001\
\004\001\004\001\001\001\002\001\003\001\092\000\005\001\004\001\
\095\000\115\000\015\001\005\001\014\001\002\001\101\000\016\001\
\006\001\017\001\002\001\018\001\019\001\020\001\004\001\109\000\
\004\001\004\001\112\000\133\000\027\001\028\001\029\001\030\001\
\031\001\001\001\002\001\003\001\006\001\005\001\004\001\016\001\
\127\000\006\001\004\001\004\001\130\000\004\001\004\001\004\001\
\004\001\108\000\018\001\019\001\020\001\140\000\007\001\006\001\
\006\001\010\001\011\001\006\001\028\001\029\001\030\001\031\001\
\006\001\018\001\014\001\075\000\021\001\022\001\023\001\024\001\
\025\001\064\000\059\000"

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
  VARP\000\
  ADR\000\
  ALLOC\000\
  LEN\000\
  NTH\000\
  VSET\000\
  VEC\000\
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
# 49 "parser.mly"
                                                     ( _1 )
# 266 "parser.ml"
               : Ast.prog))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Ast.cmds) in
    Obj.repr(
# 52 "parser.mly"
                                                     ( _2 )
# 273 "parser.ml"
               : Ast.block))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Ast.stat) in
    Obj.repr(
# 56 "parser.mly"
                                                    ( ASTStat(_1) )
# 280 "parser.ml"
               : Ast.cmds))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.def) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.cmds) in
    Obj.repr(
# 57 "parser.mly"
                                                    ( Def(_1, _3))
# 288 "parser.ml"
               : Ast.cmds))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.stat) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.cmds) in
    Obj.repr(
# 58 "parser.mly"
                                                    ( Stat(_1, _3))
# 296 "parser.ml"
               : Ast.cmds))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : Ast.typ) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 63 "parser.mly"
                                                    ( ConstDef(_2, _3, _4) )
# 305 "parser.ml"
               : Ast.def))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 5 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 4 : Ast.typ) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : Ast.arg list) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 64 "parser.mly"
                                                    ( FunDef(_2, _3, _5, _7) )
# 315 "parser.ml"
               : Ast.def))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 5 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 4 : Ast.typ) in
    let _6 = (Parsing.peek_val __caml_parser_env 2 : Ast.arg list) in
    let _8 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 65 "parser.mly"
                                                    ( FunRecDef(_3, _4, _6, _8) )
# 325 "parser.ml"
               : Ast.def))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.typ) in
    Obj.repr(
# 66 "parser.mly"
                                                    ( VarDef(_2, _3) )
# 333 "parser.ml"
               : Ast.def))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : Ast.argp list) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : Ast.block) in
    Obj.repr(
# 67 "parser.mly"
                                                    ( ProcDef(_2, _4, _6) )
# 342 "parser.ml"
               : Ast.def))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : Ast.argp list) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : Ast.block) in
    Obj.repr(
# 68 "parser.mly"
                                                    ( ProcRecDef(_3, _5, _7) )
# 351 "parser.ml"
               : Ast.def))
; (fun __caml_parser_env ->
    Obj.repr(
# 73 "parser.mly"
                                                    ( TypeBool )
# 357 "parser.ml"
               : Ast.typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 74 "parser.mly"
                                                    ( TypeInt )
# 363 "parser.ml"
               : Ast.typ))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : Ast.typ) in
    Obj.repr(
# 75 "parser.mly"
                                                    ( TypeVec(_3) )
# 370 "parser.ml"
               : Ast.typ))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : Ast.typ list) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : Ast.typ) in
    Obj.repr(
# 76 "parser.mly"
                                                    ( Types( _2, _4))
# 378 "parser.ml"
               : Ast.typ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Ast.typ) in
    Obj.repr(
# 80 "parser.mly"
                                                    ( [_1] )
# 385 "parser.ml"
               : Ast.typ list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.typ) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.typ list) in
    Obj.repr(
# 81 "parser.mly"
                                                     ( _1::_3 )
# 393 "parser.ml"
               : Ast.typ list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.typ) in
    Obj.repr(
# 85 "parser.mly"
                                                    ( _1,_3 )
# 401 "parser.ml"
               : Ast.arg))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Ast.arg) in
    Obj.repr(
# 89 "parser.mly"
                                                    ( [_1] )
# 408 "parser.ml"
               : Ast.arg list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.arg) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.arg list) in
    Obj.repr(
# 90 "parser.mly"
                                                    ( _1::_3 )
# 416 "parser.ml"
               : Ast.arg list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.typ) in
    Obj.repr(
# 94 "parser.mly"
                                                    ( ASTArgp(_1,_3) )
# 424 "parser.ml"
               : Ast.argp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : Ast.typ) in
    Obj.repr(
# 95 "parser.mly"
                                                    ( ASTArgVarp(_2,_4) )
# 432 "parser.ml"
               : Ast.argp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Ast.argp) in
    Obj.repr(
# 99 "parser.mly"
                                                     ( [_1] )
# 439 "parser.ml"
               : Ast.argp list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.argp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.argp list) in
    Obj.repr(
# 100 "parser.mly"
                                                     ( _1::_3 )
# 447 "parser.ml"
               : Ast.argp list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 104 "parser.mly"
                                                    ( Echo(_2) )
# 454 "parser.ml"
               : Ast.stat))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Ast.lval) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 105 "parser.mly"
                                                    ( Set(_2, _3) )
# 462 "parser.ml"
               : Ast.stat))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : Ast.block) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : Ast.block) in
    Obj.repr(
# 106 "parser.mly"
                                                    ( IfStat(_2, _3, _4) )
# 471 "parser.ml"
               : Ast.stat))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Ast.expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.block) in
    Obj.repr(
# 107 "parser.mly"
                                                    ( While(_2, _3) )
# 479 "parser.ml"
               : Ast.stat))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.exprp list) in
    Obj.repr(
# 108 "parser.mly"
                                                    ( Call(_2, _3) )
# 487 "parser.ml"
               : Ast.stat))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 112 "parser.mly"
                                                    ( ASTValId(_1) )
# 494 "parser.ml"
               : Ast.lval))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : Ast.lval) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : Ast.expr) in
    Obj.repr(
# 113 "parser.mly"
                                                    ( AstValNth(_3, _4) )
# 502 "parser.ml"
               : Ast.lval))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 117 "parser.mly"
                                                    ( ASTNum(_1) )
# 509 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 118 "parser.mly"
                                                    ( ASTId(_1) )
# 516 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : Ast.expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : Ast.expr) in
    Obj.repr(
# 119 "parser.mly"
                                                    ( ASTIf(_3, _4, _5) )
# 525 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : Ast.expr) in
    Obj.repr(
# 120 "parser.mly"
                                                    ( ASTAnd(_3, _4) )
# 533 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : Ast.expr) in
    Obj.repr(
# 121 "parser.mly"
                                                    ( ASTOr(_3, _4) )
# 541 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : Ast.expr list) in
    Obj.repr(
# 122 "parser.mly"
                                                    ( ASTApp(_2, _3) )
# 549 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : Ast.arg list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 123 "parser.mly"
                                                    ( ASTFunabs(_2, _4) )
# 557 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : Ast.expr) in
    Obj.repr(
# 124 "parser.mly"
                                                    ( ASTAlloc(_3) )
# 564 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : Ast.expr) in
    Obj.repr(
# 125 "parser.mly"
                                                    ( ASTLen(_3) )
# 571 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : Ast.expr) in
    Obj.repr(
# 126 "parser.mly"
                                                    ( ASTNth(_3, _4) )
# 579 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : Ast.expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : Ast.expr) in
    Obj.repr(
# 127 "parser.mly"
                                                    ( ASTVset(_3, _4, _5) )
# 588 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 131 "parser.mly"
                                                    ( [_1] )
# 595 "parser.ml"
               : Ast.expr list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Ast.expr) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr list) in
    Obj.repr(
# 132 "parser.mly"
                                                    ( _1::_2 )
# 603 "parser.ml"
               : Ast.expr list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 136 "parser.mly"
                                                    ( ASTExpr(_1) )
# 610 "parser.ml"
               : Ast.exprp))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 137 "parser.mly"
                                                    ( ASTAdr(_3) )
# 617 "parser.ml"
               : Ast.exprp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Ast.exprp) in
    Obj.repr(
# 141 "parser.mly"
                                                    ( [_1] )
# 624 "parser.ml"
               : Ast.exprp list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Ast.exprp) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Ast.exprp list) in
    Obj.repr(
# 142 "parser.mly"
                                                    ( _1::_2 )
# 632 "parser.ml"
               : Ast.exprp list))
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
