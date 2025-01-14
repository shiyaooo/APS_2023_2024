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

# 39 "parser.ml"
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
    0|]

let yytransl_block = [|
  257 (* NUM *);
  258 (* IDENT *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\003\000\003\000\003\000\004\000\004\000\
\004\000\005\000\005\000\006\000\007\000\007\000\008\000\009\000\
\009\000\009\000\009\000\009\000\009\000\009\000\010\000\010\000\
\000\000"

let yylen = "\002\000\
\003\000\001\000\003\000\004\000\007\000\008\000\001\000\001\000\
\005\000\001\000\003\000\003\000\001\000\003\000\002\000\001\000\
\001\000\006\000\005\000\005\000\004\000\004\000\001\000\002\000\
\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\025\000\000\000\000\000\000\000\000\000\
\000\000\002\000\016\000\017\000\000\000\000\000\015\000\000\000\
\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\007\000\008\000\000\000\000\000\
\000\000\003\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\004\000\000\000\000\000\000\000\
\000\000\000\000\024\000\021\000\012\000\014\000\022\000\000\000\
\000\000\000\000\000\000\000\000\019\000\020\000\011\000\000\000\
\000\000\000\000\018\000\009\000\005\000\000\000\006\000"

let yydgoto = "\002\000\
\004\000\008\000\009\000\043\000\044\000\026\000\027\000\010\000\
\038\000\039\000"

let yysindex = "\001\000\
\007\255\000\000\038\255\000\000\037\255\011\255\255\254\008\255\
\006\255\000\000\000\000\000\000\004\255\019\255\000\000\026\255\
\026\255\023\255\000\000\038\255\037\255\037\255\037\255\037\255\
\017\255\024\255\030\255\026\255\000\000\000\000\037\255\041\255\
\026\255\000\000\037\255\037\255\037\255\037\255\043\255\026\255\
\019\255\037\255\035\255\039\255\000\000\019\255\046\255\037\255\
\048\255\050\255\000\000\000\000\000\000\000\000\000\000\026\255\
\026\255\049\255\019\255\052\255\000\000\000\000\000\000\053\255\
\037\255\055\255\000\000\000\000\000\000\037\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\056\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\054\255\000\000\000\000\
\000\000\000\000\045\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\043\000\000\000\243\255\008\000\000\000\225\255\000\000\
\251\255\028\000"

let yytablesize = 66
let yytable = "\015\000\
\017\000\001\000\031\000\032\000\011\000\012\000\013\000\024\000\
\014\000\054\000\018\000\003\000\016\000\019\000\058\000\035\000\
\036\000\037\000\020\000\047\000\025\000\021\000\022\000\023\000\
\033\000\045\000\053\000\066\000\028\000\048\000\049\000\050\000\
\040\000\029\000\030\000\042\000\055\000\011\000\012\000\013\000\
\041\000\014\000\060\000\064\000\005\000\046\000\052\000\006\000\
\007\000\056\000\059\000\061\000\057\000\062\000\065\000\067\000\
\068\000\023\000\010\000\069\000\070\000\013\000\034\000\063\000\
\071\000\051\000"

let yycheck = "\005\000\
\002\001\001\000\016\000\017\000\001\001\002\001\003\001\013\000\
\005\001\041\000\012\001\005\001\002\001\006\001\046\000\021\000\
\022\000\023\000\013\001\033\000\002\001\018\001\019\001\020\001\
\002\001\031\000\040\000\059\000\003\001\035\000\036\000\037\000\
\016\001\008\001\009\001\006\001\042\000\001\001\002\001\003\001\
\017\001\005\001\048\000\057\000\007\001\005\001\004\001\010\001\
\011\001\015\001\005\001\004\001\014\001\004\001\006\001\004\001\
\004\001\004\001\014\001\065\000\006\001\006\001\020\000\056\000\
\070\000\038\000"

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
  "

let yynames_block = "\
  NUM\000\
  IDENT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Ast.cmds) in
    Obj.repr(
# 41 "parser.mly"
                                                    ( _2 )
# 175 "parser.ml"
               : Ast.prog))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Ast.stat) in
    Obj.repr(
# 45 "parser.mly"
                                                    ( ASTStat(_1) )
# 182 "parser.ml"
               : Ast.cmds))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.def) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.cmds) in
    Obj.repr(
# 46 "parser.mly"
                                                    ( ASTDef(_1, _3) )
# 190 "parser.ml"
               : Ast.cmds))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : Ast.typ) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 51 "parser.mly"
                                                    ( ConstDef(_2, _3, _4) )
# 199 "parser.ml"
               : Ast.def))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 5 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 4 : Ast.typ) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : Ast.arg list) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 52 "parser.mly"
                                                    ( FunDef(_2, _3, _5, _7) )
# 209 "parser.ml"
               : Ast.def))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 5 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 4 : Ast.typ) in
    let _6 = (Parsing.peek_val __caml_parser_env 2 : Ast.arg list) in
    let _8 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 53 "parser.mly"
                                                    ( FunRecDef(_3, _4, _6, _8) )
# 219 "parser.ml"
               : Ast.def))
; (fun __caml_parser_env ->
    Obj.repr(
# 58 "parser.mly"
                                                    ( TypeBool )
# 225 "parser.ml"
               : Ast.typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 59 "parser.mly"
                                                    ( TypeInt )
# 231 "parser.ml"
               : Ast.typ))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : Ast.typ list) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : Ast.typ) in
    Obj.repr(
# 60 "parser.mly"
                                                    ( Types( _2, _4) )
# 239 "parser.ml"
               : Ast.typ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Ast.typ) in
    Obj.repr(
# 64 "parser.mly"
                                                    ( [_1] )
# 246 "parser.ml"
               : Ast.typ list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.typ) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.typ list) in
    Obj.repr(
# 65 "parser.mly"
                                                     ( _1::_3 )
# 254 "parser.ml"
               : Ast.typ list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.typ) in
    Obj.repr(
# 69 "parser.mly"
                                                    ( _1,_3 )
# 262 "parser.ml"
               : Ast.arg))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Ast.arg) in
    Obj.repr(
# 73 "parser.mly"
                                                    ( [_1] )
# 269 "parser.ml"
               : Ast.arg list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.arg) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.arg list) in
    Obj.repr(
# 74 "parser.mly"
                                                    ( _1::_3 )
# 277 "parser.ml"
               : Ast.arg list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 79 "parser.mly"
                                                    ( ASTEcho(_2) )
# 284 "parser.ml"
               : Ast.stat))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 83 "parser.mly"
                                                    ( ASTNum(_1) )
# 291 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 84 "parser.mly"
                                                    ( ASTId(_1) )
# 298 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 3 : Ast.expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : Ast.expr) in
    Obj.repr(
# 85 "parser.mly"
                                                    ( ASTIf(_3, _4, _5) )
# 307 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : Ast.expr) in
    Obj.repr(
# 86 "parser.mly"
                                                    ( ASTAnd(_3, _4) )
# 315 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : Ast.expr) in
    Obj.repr(
# 87 "parser.mly"
                                                    ( ASTOr(_3, _4) )
# 323 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : Ast.expr list) in
    Obj.repr(
# 88 "parser.mly"
                                                    ( ASTApp(_2, _3) )
# 331 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : Ast.arg list) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 89 "parser.mly"
                                                    ( ASTFunabs(_2, _4) )
# 339 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 93 "parser.mly"
                                                    ( [_1] )
# 346 "parser.ml"
               : Ast.expr list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Ast.expr) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr list) in
    Obj.repr(
# 94 "parser.mly"
                                                    ( _1::_2 )
# 354 "parser.ml"
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
