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

# 46 "parser.ml"
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
    0|]

let yytransl_block = [|
  257 (* NUM *);
  258 (* IDENT *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\003\000\003\000\003\000\004\000\004\000\004\000\
\004\000\004\000\004\000\005\000\005\000\005\000\006\000\006\000\
\007\000\008\000\008\000\009\000\009\000\010\000\010\000\011\000\
\011\000\011\000\011\000\011\000\012\000\012\000\012\000\012\000\
\012\000\012\000\012\000\013\000\013\000\014\000\014\000\015\000\
\015\000\000\000"

let yylen = "\002\000\
\001\000\003\000\001\000\003\000\003\000\004\000\007\000\008\000\
\003\000\006\000\007\000\001\000\001\000\005\000\001\000\003\000\
\003\000\001\000\003\000\003\000\004\000\001\000\003\000\002\000\
\003\000\004\000\003\000\003\000\001\000\001\000\006\000\005\000\
\005\000\004\000\004\000\001\000\002\000\001\000\004\000\001\000\
\002\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\042\000\001\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\029\000\030\000\000\000\000\000\024\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\002\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\012\000\013\000\000\000\000\000\000\000\
\000\000\009\000\000\000\000\000\025\000\027\000\000\000\038\000\
\000\000\028\000\004\000\005\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\006\000\000\000\
\000\000\026\000\000\000\000\000\000\000\000\000\000\000\000\000\
\041\000\000\000\000\000\000\000\037\000\034\000\017\000\019\000\
\035\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\032\000\033\000\016\000\000\000\
\000\000\000\000\020\000\000\000\023\000\010\000\000\000\039\000\
\031\000\014\000\007\000\000\000\021\000\011\000\008\000"

let yydgoto = "\002\000\
\004\000\005\000\015\000\016\000\069\000\070\000\041\000\042\000\
\077\000\078\000\017\000\039\000\065\000\057\000\058\000"

let yysindex = "\008\000\
\010\255\000\000\063\255\000\000\000\000\089\255\019\255\000\255\
\089\255\026\255\011\255\037\255\089\255\039\255\055\255\030\255\
\040\255\000\000\000\000\047\255\061\255\000\000\051\255\051\255\
\062\255\010\255\051\255\064\255\066\255\089\255\010\255\099\255\
\000\000\063\255\063\255\089\255\089\255\089\255\089\255\067\255\
\054\255\071\255\051\255\000\000\000\000\089\255\073\255\051\255\
\010\255\000\000\012\255\074\255\000\000\000\000\017\255\000\000\
\099\255\000\000\000\000\000\000\089\255\089\255\089\255\089\255\
\076\255\051\255\061\255\089\255\078\255\081\255\000\000\061\255\
\092\255\000\000\082\255\101\255\088\255\100\255\012\255\105\255\
\000\000\089\255\104\255\107\255\000\000\000\000\000\000\000\000\
\000\000\051\255\051\255\103\255\061\255\051\255\096\255\012\255\
\010\255\108\255\109\255\111\255\000\000\000\000\000\000\112\255\
\089\255\113\255\000\000\051\255\000\000\000\000\010\255\000\000\
\000\000\000\000\000\000\089\255\000\000\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\114\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\115\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\004\255\000\000\000\000\000\000\000\000\000\000\000\000\118\255\
\000\000\000\000\000\000\000\000\110\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\117\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\241\255\011\000\000\000\237\255\027\000\000\000\190\255\
\000\000\202\255\000\000\250\255\054\000\000\000\068\000"

let yytablesize = 125
let yytable = "\022\000\
\088\000\024\000\026\000\046\000\047\000\092\000\031\000\050\000\
\001\000\040\000\049\000\025\000\028\000\075\000\003\000\054\000\
\040\000\018\000\019\000\020\000\023\000\021\000\029\000\053\000\
\098\000\056\000\106\000\027\000\073\000\061\000\062\000\063\000\
\064\000\074\000\036\000\037\000\038\000\076\000\030\000\071\000\
\032\000\109\000\034\000\080\000\059\000\060\000\087\000\018\000\
\019\000\020\000\056\000\021\000\035\000\043\000\082\000\083\000\
\084\000\064\000\044\000\045\000\033\000\089\000\040\000\048\000\
\036\000\037\000\038\000\052\000\051\000\006\000\067\000\104\000\
\007\000\008\000\107\000\100\000\068\000\072\000\079\000\086\000\
\009\000\110\000\066\000\010\000\011\000\012\000\013\000\014\000\
\117\000\018\000\019\000\020\000\090\000\021\000\091\000\118\000\
\093\000\094\000\115\000\018\000\019\000\055\000\095\000\021\000\
\096\000\097\000\099\000\101\000\105\000\119\000\102\000\108\000\
\112\000\111\000\113\000\114\000\103\000\085\000\116\000\003\000\
\018\000\036\000\022\000\015\000\081\000"

let yycheck = "\006\000\
\067\000\002\001\009\000\023\000\024\000\072\000\013\000\027\000\
\001\000\006\001\026\000\012\001\002\001\002\001\005\001\031\000\
\013\001\001\001\002\001\003\001\002\001\005\001\012\001\030\000\
\079\000\032\000\093\000\002\001\048\000\036\000\037\000\038\000\
\039\000\049\000\018\001\019\001\020\001\026\001\002\001\046\000\
\002\001\096\000\013\001\027\001\034\000\035\000\066\000\001\001\
\002\001\003\001\057\000\005\001\013\001\003\001\061\000\062\000\
\063\000\064\000\008\001\009\001\006\001\068\000\002\001\002\001\
\018\001\019\001\020\001\002\001\005\001\007\001\017\001\091\000\
\010\001\011\001\094\000\082\000\006\001\005\001\005\001\004\001\
\018\001\097\000\016\001\021\001\022\001\023\001\024\001\025\001\
\108\000\001\001\002\001\003\001\015\001\005\001\014\001\111\000\
\005\001\016\001\105\000\001\001\002\001\003\001\002\001\005\001\
\017\001\006\001\002\001\004\001\006\001\116\000\004\001\016\001\
\004\001\006\001\004\001\004\001\090\000\064\000\006\001\006\001\
\006\001\004\001\006\001\014\001\057\000"

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
# 48 "parser.mly"
                                                     ( _1 )
# 232 "parser.ml"
               : Ast.prog))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Ast.cmds) in
    Obj.repr(
# 51 "parser.mly"
                                                     ( _2 )
# 239 "parser.ml"
               : Ast.block))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Ast.stat) in
    Obj.repr(
# 55 "parser.mly"
                                                    ( ASTStat(_1) )
# 246 "parser.ml"
               : Ast.cmds))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.def) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.cmds) in
    Obj.repr(
# 56 "parser.mly"
                                                    ( Def(_1, _3) )
# 254 "parser.ml"
               : Ast.cmds))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.stat) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.cmds) in
    Obj.repr(
# 57 "parser.mly"
                                                    ( Stat(_1, _3) )
# 262 "parser.ml"
               : Ast.cmds))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : Ast.typ) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 62 "parser.mly"
                                                    ( ConstDef(_2, _3, _4) )
# 271 "parser.ml"
               : Ast.def))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 5 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 4 : Ast.typ) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : Ast.arg list) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 63 "parser.mly"
                                                    ( FunDef(_2, _3, _5, _7) )
# 281 "parser.ml"
               : Ast.def))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 5 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 4 : Ast.typ) in
    let _6 = (Parsing.peek_val __caml_parser_env 2 : Ast.arg list) in
    let _8 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 64 "parser.mly"
                                                    ( FunRecDef(_3, _4, _6, _8) )
# 291 "parser.ml"
               : Ast.def))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.typ) in
    Obj.repr(
# 65 "parser.mly"
                                                    ( VarDef(_2, _3) )
# 299 "parser.ml"
               : Ast.def))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : Ast.argp list) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : Ast.block) in
    Obj.repr(
# 66 "parser.mly"
                                                    ( ProcDef(_2, _4, _6) )
# 308 "parser.ml"
               : Ast.def))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : Ast.argp list) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : Ast.block) in
    Obj.repr(
# 67 "parser.mly"
                                                    ( ProcRecDef(_3, _5, _7) )
# 317 "parser.ml"
               : Ast.def))
; (fun __caml_parser_env ->
    Obj.repr(
# 72 "parser.mly"
                                                    ( TypeBool )
# 323 "parser.ml"
               : Ast.typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 73 "parser.mly"
                                                    ( TypeInt )
# 329 "parser.ml"
               : Ast.typ))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : Ast.typ list) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : Ast.typ) in
    Obj.repr(
# 74 "parser.mly"
                                                    ( Types( _2, _4) )
# 337 "parser.ml"
               : Ast.typ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Ast.typ) in
    Obj.repr(
# 78 "parser.mly"
                                                    ( [_1] )
# 344 "parser.ml"
               : Ast.typ list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.typ) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.typ list) in
    Obj.repr(
# 79 "parser.mly"
                                                     ( _1::_3 )
# 352 "parser.ml"
               : Ast.typ list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.typ) in
    Obj.repr(
# 83 "parser.mly"
                                                    ( _1,_3 )
# 360 "parser.ml"
               : Ast.arg))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Ast.arg) in
    Obj.repr(
# 87 "parser.mly"
                                                    ( [_1] )
# 367 "parser.ml"
               : Ast.arg list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.arg) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.arg list) in
    Obj.repr(
# 88 "parser.mly"
                                                    ( _1::_3 )
# 375 "parser.ml"
               : Ast.arg list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.typ) in
    Obj.repr(
# 92 "parser.mly"
                                                    ( ASTArgp(_1,_3) )
# 383 "parser.ml"
               : Ast.argp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : Ast.typ) in
    Obj.repr(
# 93 "parser.mly"
                                                    ( ASTArgVarp(_2,_4) )
# 391 "parser.ml"
               : Ast.argp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Ast.argp) in
    Obj.repr(
# 97 "parser.mly"
                                                     ( [_1] )
# 398 "parser.ml"
               : Ast.argp list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.argp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.argp list) in
    Obj.repr(
# 98 "parser.mly"
                                                     ( _1::_3 )
# 406 "parser.ml"
               : Ast.argp list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 102 "parser.mly"
                                                    ( Echo(_2) )
# 413 "parser.ml"
               : Ast.stat))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 103 "parser.mly"
                                                    ( Set(_2, _3) )
# 421 "parser.ml"
               : Ast.stat))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : Ast.block) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : Ast.block) in
    Obj.repr(
# 104 "parser.mly"
                                                    ( IfStat(_2, _3, _4) )
# 430 "parser.ml"
               : Ast.stat))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Ast.expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.block) in
    Obj.repr(
# 105 "parser.mly"
                                                    ( While(_2, _3) )
# 438 "parser.ml"
               : Ast.stat))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.exprp list) in
    Obj.repr(
# 106 "parser.mly"
                                                    ( Call(_2, _3) )
# 446 "parser.ml"
               : Ast.stat))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 110 "parser.mly"
                                                    ( ASTNum(_1) )
# 453 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 111 "parser.mly"
                                                    ( ASTId(_1) )
# 460 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : Ast.expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : Ast.expr) in
    Obj.repr(
# 112 "parser.mly"
                                                    ( ASTIf(_3, _4, _5) )
# 469 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : Ast.expr) in
    Obj.repr(
# 113 "parser.mly"
                                                    ( ASTAnd(_3, _4) )
# 477 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : Ast.expr) in
    Obj.repr(
# 114 "parser.mly"
                                                    ( ASTOr(_3, _4) )
# 485 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : Ast.expr list) in
    Obj.repr(
# 115 "parser.mly"
                                                    ( ASTApp(_2, _3) )
# 493 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : Ast.arg list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 116 "parser.mly"
                                                    ( ASTFunabs(_2, _4) )
# 501 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 120 "parser.mly"
                                                    ( [_1] )
# 508 "parser.ml"
               : Ast.expr list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Ast.expr) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr list) in
    Obj.repr(
# 121 "parser.mly"
                                                    ( _1::_2 )
# 516 "parser.ml"
               : Ast.expr list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 125 "parser.mly"
                                                    ( ASTExpr(_1) )
# 523 "parser.ml"
               : Ast.exprp))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 126 "parser.mly"
                                                    ( ASTAdr(_3) )
# 530 "parser.ml"
               : Ast.exprp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Ast.exprp) in
    Obj.repr(
# 130 "parser.mly"
                                                    ( [_1] )
# 537 "parser.ml"
               : Ast.exprp list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Ast.exprp) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Ast.exprp list) in
    Obj.repr(
# 131 "parser.mly"
                                                    ( _1::_2 )
# 545 "parser.ml"
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
