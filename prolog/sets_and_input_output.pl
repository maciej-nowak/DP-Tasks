/** Intersection */
product([], _, []).
product([H|T], L, W) :- member(H, L), (W = [H|R]), !, product(T, L, R). 
product([_|T], L, R) :- product(T, L, R).

/** Union */
total([], L, L) :- !.
total([H|T], L, S) :- member(H, L), !, total(T, L, S).
total([H|T], L, [H|S]) :- total(T, L, S).

/** Subtract */
difference([], _, []).
difference([H|T], L, R) :- member(H, L), !, difference(T, L, R).
difference([H|T], L, [H|R]) :- difference(T, L, R).

/** Input output program */
menu_main :-
				write('Commands: '),
				nl,
				write('write_student - add new student'),
				nl,
				write('delete_student - delete studenta'),
				nl,
				write('show_student - display all students'),
				nl.

write_student :-
				write('Name: '),
				read(Name),
				write('Surname: '),
				read(Surname),
				write('Index number: '),
				read(Index),
				append('plik.pl'),
				write(student(Name,Surname,Index)),
				write(.),
				nl,
				told.

delete_student :- 
				write('Name: '),
				read(Name),
				write('Surname: '),
				read(Surname),
				write('Index number: '),
				read(Index),
				consult('plik.pl'),
				retractall(student(Name, Surname, Index)),
				tell('plik.pl'),
				listing(student),
				told.


read_student(L) :- L='end_of_file', !.
read_student(L) :-
					write(L),
					read(X),
					nl,
					read_student(X).

show_student :- 
				write('List of all students: '),
				nl,
				see('plik.pl'),
				read(_),
				read(X),
				read_student(X),
				seen.