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
/*tester liste type de argp*/
test_LPtype(_,[],[]).
test_LPtype(Ctx, [E|ListE], [T|ListT]):- test_LPtype(Ctx,ListE,ListT), 
                                        type_expar(Ctx,E,T).

/*tester liste arg-type*/
test_LArg([],[]).
test_LArg([(_,T)|Args],[T|ListT]):-test_LArg(Args,ListT).

/*tester liste argp-type*/
test_LArgP([],[]).
test_LArgP([(_,T)|Args],[T|ListT]):-test_LArg(Args,ListT).
test_LArgP([(_,ref(T))|Args],[T|ListT]):-test_LArg(Args,ListT).

/*Expressions*/
/*type_expr(_,true,bool).
type_expr(_,false,bool).*/
type_expr(_,N,int):-integer(N).
type_expr(G,id(X),T):-env_get(G,X,ref(T)).
type_expr(G,id(X),T):-env_get(G,X,T).
type_expr(G,if(E1,E2,E3),T):- type_expr(G,E1,bool),
                            type_expr(G,E2,T),
                            type_expr(G,E3,T).
type_expr(G,and(E1,E2),bool):- type_expr(G,E1,bool),
                            type_expr(G,E2,bool).
type_expr(G,or(E1,E2),bool):- type_expr(G,E1,bool),
                            type_expr(G,E2,bool).
type_expr(G,app(E,Es),T):- type_expr(G,E,fleche(Ts,T)), test_Ltype(G, Es, Ts) .
type_expr(G,funabs(Xs,E), fleche(Ts,T)):- test_LArg(Xs,Ts), append(Xs,G,G2), type_expr(G2,E,T).
type_expr(G,alloc(E),vec(_)):- type_expr(G,E,int).
type_expr(G,nth(E1,E2),T):- type_expr(G,E1,vec(T)), type_expr(G,E2,int).
type_expr(G,len(E),int):- type_expr(G,E,vec(T)).
type_expr(G,vset(E1,E2,E3),vec(T)):- type_expr(G,E1,vec(T)), type_expr(G,E2,int), type_expr(G,E3,T).



/*Paramètres d'appel*/
type_expar(G,adr(X),ref(T)):- env_get(G,X,ref(T)).
type_expar(G,E,T):- type_expr(G, E, T).


/*Intruction*/
statType(G, echo(E), void):- type_expr(G, E, int).
statType(G, set(X, E), void):- type_expr(G, X, T), type_expr(G, E, T).
statType(G, ifstat(E, Bk1, Bk2), void):- type_expr(G, E, bool), blockType(G, Bk1, void), blockType(G, Bk2, void).
statType(G, while(E, Bk), void):- type_expr(G, E, bool), blockType(G, Bk, void).
statType(G, call(X, Es), void):- test_LPtype(G, Es, Ts), env_get(G, X, fleche(Ts,void)).

/*Definition*/
defType(G, const(X,T,E), [(X,T)|G]):- type_expr(G,E,T).
defType(G, fun(X, T, Xs, E), [(X,fleche(Ts, T))|G]):- test_LArg(Xs,Ts),
                                                    append(Xs, G, NG),
                                                    type_expr(NG, E, T).
defType(G, funrec(X, T, Xs, E), [(X,fleche(Ts, T))|G]):- test_LArg(Xs, Ts),
                                                    append(Xs,G,NG),
                                                    NNG = [(X,fleche(Ts,T))|NG],
                                                    type_expr(NNG,E,T).                                             
defType(G, var(X, int), [(X, ref(int))|G]).
defType(G, var(X, bool), [(X, ref(bool))|G]).
defType(G, proc(X, Ps, Bk), [(X, fleche(Ts,void))|G]):- test_LArgP(Ps, Ts),
                                                        append(Ps, G, NG), 
                                                        blockType(NG,Bk,void).
defType(G, procrec(X, Ps, Bk), [(X, fleche(Ts,void))|G]):- test_LArgP(Ps, Ts), 
                                                           append(Ps, G, NG), 
                                                           NNG = [(X,fleche(Ts,void))|NG],
                                                           blockType(NNG,Bk,void).


/*Suite de commandes*/
cmdsType(_,[],void).
/*cmdsType(G,[S],void):-statType(G,S,void).*/   
cmdsType(G,[D|Cs], void):- defType(G, D, NG), 
                        cmdsType(NG, Cs, void).
cmdsType(G,[S|Cs], void):- statType(G, S, void), 
                        cmdsType(G, Cs , void).


/*Blocs*/
blockType(G,block(Cs),void):- cmdsType(G, Cs ,void).

/*Programmes*/
/*progType(prog([echo(43)]),void).*/
/*progType(prog([echo(add(15,add(3,42)))]),void).*/
progType(prog(Bk),void):- g0(G),cmdsType(G, Bk ,void).

/*Tester*/
/*prog([const(x,int,21),const(y,bool,false),echo(32)])*/
programme:-
    nl,write('Saisir une instance:'),
    read(R), progType(R,void),
    print(R),
    nl.

main :-
    read(user_input, Input),
    progType(Input, Output), 
    write(Output),
    nl.

