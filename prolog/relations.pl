/** Family relations */
father(X,Y) :- (man(X), parent(X,Y)).
mother(X,Y) :- (woman(X), parent(X,Y)).
grandpa(X,Y) :- man(X), ((father(X,Z), father(Z,Y)) ;(father(X,Z), mother(Z,Y))).
granma(X,Y) :- woman(X), ((mother(X,Z), mother(Z,Y)) ; (mother(X,Z), father(Z,Y))).
siblings(X,Y) :- ((mother(X,Z), mother(Z,Y)) ; (mother(X,Z), father(Z,Y))).
sister(X,Y) :- woman(X), ((mother(Z,X), mother(Z,Y)) ; (father(Z,X), father(Z,Y))).
brother(X,Y) :- man(X), ((mother(Z,X), mother(Z,Y)) ; (father(Z,X), father(Z,Y))).
cousin(X,Y) :- man(X), (sister(mother(Z,X),mother(W,Y)) ; sister(mother(Z,X),father(W,Y)) ; brother(father(Z,X),mother(W,Y)) ; brother(father(Z,X),father(W,Y))).
uncle(X,Y) :- man(X), ((parent(Z,Y), brother(X,Z))).
ancestor(X,Y) :- (parent(X,Y)) ; (grandpa(X,Y)) ; (granma(X,Y)).

/** Age relations */
sameage(X,Y) :- age(X, Z), age(Y, W), (Z==W).
older(X,Y) :- age(X, Z), age(Y, W), (Z > W).
younger(X,Y) :- age(X, Z), age(Y, W), (Z < W).

/** Students details relations */
studentpoznan(X, Y) :- student(X, Y, C, D, E, F), (E=poznan).
studentpoznanit(X, Y) :- student(X, Y, C, D, E, F), (C=it), (E=poznan), (F<1994).
studentuniversity(X, Y) :- student(X, Y, C, D, E, F), (C=it), ((D=pp) ; (D=pg)).
studentmath(D) :- student(X, Y, C, D, E, F), (C=math).

/** Math relations */
bigger(X, Y, Z) :- ((X > Y), (Z = X)) ; ((X < Y), (Y = Z)).
totality(X, Y, Z) :- (Z is X+Y).

gcd(X, 0, X).
gcd(X, Y, Z):- (not(Y == 0)), (W is X mod Y), (gcd(Y, W, Q)), (Z is Q).


/** People rules */
vegetarian(ola).
vegetarian(ewa).
vegetarian(jan).
vegetarian(pawel).

dosport(iza).
dosport(ola).
dosport(piotr).
dosport(pawel).

drinkcoffee(iza).
drinkcoffee(piotr).
drinkcoffee(pawel).

readbooks(ola).
readbooks(iza).
readbooks(pawel).

/** Friends relationships */
like(ola, X) :- vegetarian(X), dosport(X), (X \=  ola).
like(ewa, X) :- vegetarian(X), not(drinkcoffee(X)), (X \=  ewa).
like(iza, X) :- readbooks(X) ; (dosport(X), not(drinkcoffee(X))), (X \=  iza).
like(janek, X) :- dosport(X), (X \=  janek).
like(piotr, X) :- (dosport(X), vegetarian(X)) ; (readbooks(X)), (X \=  piotr).
like(pawel, X) :- vegetarian(X), dosport(X), readbooks(X), (X \=  pawel).
friends(X, Y) :- like(X, Y), like(Y, X), X \= Y.

memberk(E, [E|_]).
memberk(E, [_|T]) :- memberk(E, T).