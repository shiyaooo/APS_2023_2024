(* ========================================================================== *)
(* == UPMC/master/info/4I506 -- Janvier 2016/2017/2018                     == *)
(* == SU/FSI/master/info/MU4IN503 -- Janvier 2020/2021/2022                == *)
(* == Analyse des programmes et sémantiques                                == *)
(* ========================================================================== *)
(* == hello-APS Syntaxe ML                                                 == *)
(* == Fichier: lexer.mll                                                   == *)
(* ==  Lexique                                                             == *)
(* ========================================================================== *)

{
  open Parser        (* The type token is defined in parser.mli *)
  exception Eof

}
rule token = parse
    [' ' '\t' '\n']       { token lexbuf }     (* skip blanks *)
| '['              { LBRA }
| ']'              { RBRA }  
| '('              { LPAR }
| ')'              { RPAR }
| "ECHO"           { ECHO }  
| "SET"            { SET }  
| "IF"             { IF }  
| "WHILE"          { WHILE }  
| "CALL"           { CALL }  
| ';'              { PV }
| "->"             { IMP }
| '*'              { TIMES }
| ':'              { COLON }
| ','              { COMMA }
| "bool"           { BOOL }
| "int"            { INT }
| "CONST"          { CONST }
| "FUN"            { FUN }
| "REC"            { REC }
| "VAR"            { VAR }
| "PROC"           { PROC }
| "if"             { IF }
| "and"            { AND }
| "or"             { OR }
| "var"            { VARP }
| "adr"            { ADR }
| "alloc"          { ALLOC }
| "len"            { LEN }
| "nth"            { NTH }
| "vset"           { VSET }
| "vec"            { VEC }
| ['0'-'9']+('.'['0'-'9'])? as lxm { NUM(int_of_string lxm) }
| ['a'-'z']['a'-'z''A'-'Z''0'-'9']* as lxm { IDENT(lxm) }
| eof              { raise Eof }
