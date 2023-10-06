% 1a.
avg([]) :- write(0).
avg([H|T]) :- avg([H|T], 0, 0).
avg([], S, N) :- 
  R is S / N,
  !,
  write(R).
avg([H|T], S, N) :- 
  S1 is S+H,
  N1 is N+1, 
  avg(T,S1,N1).

% 1b.
min([H], H).
min([H|T], M) :-
  min(T,M),
  M < H, !.
min([H|_],H).

% 1c.
count([H],1,0) :- 0 is mod(H,2).
count([H],0,1) .
count([H|T],P,I) :-
  0 is mod(H,2), !,
  count(T,P1,I),
  P is P1+1.
count([H|T],P,I) :-
  count(T,P,I1), !,
  I is I1+1.

% 1d. (Minumum To Front)
mtf([H], H, R).
mtf([H|T], M, R) :-
  min(T,M),
  M < H,
  !.
mtf([H|_],H).

