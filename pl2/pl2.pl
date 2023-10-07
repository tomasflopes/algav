% 1a. (Average)
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

% 1b. (Minumum)
min([H], H).
min([H|T], M) :-
  min(T,M),
  M < H, !.
min([H|_],H).

% 1c. (Count even & odd for list)
count([H],1,0) :- 0 is mod(H,2).
count([_],0,1) .
count([H|T],P,I) :-
  0 is mod(H,2), !,
  count(T,P1,I),
  P is P1+1.
count([_|T],P,I) :-
  count(T,P,I1), !,
  I is I1+1.

% 1d. (Minumum To Front)
mtf(L,R) :- 
  min(L,M),
  mtf(L,M,R1),
  R = [M|R1].
mtf([H|T],M,R) :-
  member(M,T),
  mtf(T,M,R),
  R = T.
mtf(L,_,L).

% 2. (Join)
join([],L,L).
join([H|T],L,[H|T1]) :- join(T,L,T1).

% 3. (Invert)
invert(L,L1) :- invert(L,[],L1).
invert([],L,L).
invert([H|T],L2,L3) :- invert(T,[H|L2],L3).

% 4. (Remove)
remove(_,[],[]).
remove(X,[X|T],M) :- !, remove(X,T,M).
remove(X,[Y|T],[Y|M]) :- remove(X,T,M).

% 5. (Replace)
replace(_,_,[],[]).
replace(X,Y,[X|T],R) :- replace(X,Y,T,R1), R = [Y|R1], !.
replace(X,Y,[H|T],R) :- replace(X,Y,T,R1), R = [H|R1].

% 6. (Insert)
insert(X,I,L,R) :- insert(X,I,L,R,0).
insert(X,I,[H|T],R,I) :- R = [X|[H|T]], !.
insert(X,I,[H|T],R,C) :- C1 is C+1, insert(X,I,T,R1,C1), R = [H|R1].

