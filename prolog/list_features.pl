/** Max element */
max([B], B).
max([H|T], B) :- max(T, W), (H > W -> B = H ; B = W).

/** Find element at x position */
findelement([H|T], 1, H).
findelement([H|T], E, M) :- (E1 is E-1), findelement(T, E1, M).

/** Is list beginning of the another list */
beginning([], _).
beginning([H1|T1], [H2|T2]) :- (H1 = H2), beginning(T1, T2).

/** Find last element of the list */
lastelement([X], X).
lastelement([H|T], X) :- lastelement(T, X).

/** Find position of the typed element */
elementposition(E, [E|T], 1).
elementposition(E, [H|T], X) :- elementposition(E, T, X1), (X is X1+1).

/** Is list growing */
growing([H1,H2]) :- (H1 < H2).
growing([H1,H2|T]) :- (H1 < H2), growing([H2|T]).


/** Difference of the lists */
difference([], _, []).
difference([H|T], L, R) :- member(H, L), !, difference(T, L, R).
difference([H|T], L, [H|R]) :- difference(T, L, R).

/** Length of the list */
listlength([], 0).
listlength([H|T], N) :- listlength(T, N1), N is N1+1.