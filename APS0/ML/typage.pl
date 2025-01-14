/*environnemnt initial*/
g0([(true,bool),
     (false, bool),
     (not,fleche([bool],bool)),
     (eq,fleche([int,int],bool)),
     (lt,fleche([int,int],bool)),
     (add,fleche([int,int],int)),
     (sub,fleche([int,int],int)),
     (mul,fleche([int,int],int)),
     (div,fleche([int,int],int))]).

/*env_get(contexte,var,type)*/
/* env_get([(x,int),(y,bool),(z,int)],y,bool).*/
env_get([(V,T)|_],V,T).
env_get([(_,_)|Ctx],V,T):-env_get(Ctx,V,T).

/*tester liste type*/
test_Ltype(_,[],[]).
test_Ltype(Ctx, [E|ListE], [T|ListT]):- test_Ltype(Ctx,ListE,ListT), 
                                        type_expr(Ctx,E,T).

/*tester liste arg-type*/
test_LArg([],[]).
test_LArg([(_,T)|Args],[T|ListT]):-test_LArg(Args,ListT).

/*Expressions*/
/*type_expr(_,true,bool).
type_expr(_,false,bool).*/
type_expr(_,N,int):-integer(N).
type_expr(G,id(X),T):-env_get(G,X,T).
type_expr(G,if(E1,E2,E3),T):- type_expr(G,E1,bool),
                            type_expr(G,E2,T),
                            type_expr(G,E3,T).
type_expr(G,and(E1,E2),bool):- type_expr(G,E1,bool),
                            type_expr(G,E2,bool).
type_expr(G,or(E1,E2),bool):- type_expr(G,E1,bool),
                            type_expr(G,E2,bool).
/*type_expr(G,not(E),bool):-type_expr(G,E,bool).
type_expr(G,eq(E1,E2),bool):-type_expr(G,E1,int),type_expr(G,E2,int).
type_expr(G,lt(E1,E2),bool):-type_expr(G,E1,int),type_expr(G,E2,int).
type_expr(G,add(E1,E2),int):-type_expr(G,E1,int),type_expr(G,E2,int).
type_expr(G,sub(E1,E2),int):-type_expr(G,E1,int),type_expr(G,E2,int).
type_expr(G,mul(E1,E2),int):-type_expr(G,E1,int),type_expr(G,E2,int).
type_expr(G,div(E1,E2),int):-type_expr(G,E1,int),type_expr(G,E2,int).*/
type_expr(G,app(E,Es),T):- type_expr(G,E,fleche(Ts,T)), test_Ltype(G, Es, Ts) .
type_expr(G,funabs(Xs,E), fleche(Ts,T)):- test_LArg(Xs,Ts), append(Xs,G,G2), type_expr(G2,E,T).

/*Intruction*/
statType(G, echo(E), void):- type_expr(G, E, _).

/*Definition*/
defType(G, const(X,T,E), [(X,T)|G]):- type_expr(G,E,T).
defType(G, fun(X, T, Xs, E), [(X,fleche(Ts, T))|G]):- test_LArg(Xs,Ts),
                                                    append(Xs, G, NG),
                                                    type_expr(NG, E, T).
defType(G, funrec(X, T, Xs, E), [(X,fleche(Ts, T))|G]):- test_LArg(Xs, Ts),
                                                    append(Xs,G,NG),
                                                    NNG = [(X,fleche(Ts,T))|NG],
                                                    type_expr(NNG,E,T).                                             

/*Suite de commandes*/
cmdsType(_,[],void).
cmdsType(G,[S],void):-statType(G,S,void).
cmdsType(G,[D|Cs], void):- defType(G, D, NG), 
                        cmdsType(NG, Cs, void).

/*Programmes*/
/*progType(prog([echo(43)]),void).*/
progType(prog(Cs),void):- g0(G),cmdsType(G,Cs ,void).

/*Tester*/
/*prog([const(x,int,21),const(y,bool,id(false)),echo(32)])*/
/*prog([echo(app(id(add),[5,42]))]).*/
programme:-
    nl,write('Saisir une instance:'),
    read(R), progType(R,void),
    print(R),
    nl.

main:-
    read(user_input, Input),
    progType(Input, Output), 
    write(Output),
    nl.

/*longeur*/
longeur([],0).
longeur([_|T],N):-longeur(T,M),M=N+1;

meme_longeur([],[]).
meme_longeur([_|T1],[_|T2]):-meme_longeur(T1,T2).
