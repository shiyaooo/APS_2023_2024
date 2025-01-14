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

val prog :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.prog
