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
  H \== M,
  mtf(T,M,R1), !,
  R = [H|R1].
mtf([_|T],_,T).

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

% 7. (Union)
union([],L,L).
union([X|L1],L2,LU) :- member(X,L2), union(L1,L2,LU).
union([X|L1],L2,[X|LU]) :- union(L1,L2,LU).

% 8. (Intersection)
intersection([],_,[]).
intersection([X|L1],L2,[X|LI]) :- member(X,L2), !, intersection(L1,L2,LI).
intersection([_|L1],L2,LI) :- intersection(L1,L2,LI).

% 9. (Diff)
diff([],_,[]).
diff([H|T],L,R) :- member(H,L), diff(T,L,R).
diff([H|T],L,[H|R]) :- diff(T,L,R), !.

% 10. (Flatten)
flatten([H|T],R) :- \+is_list(H), flatten(T,R1), !,R = [H|R1].
flatten([H|T],R) :- join(H,T,Z), flatten(Z,R).
flatten([],[]).

% 11. (Combinations)
% Comentário: Não dá todas as combinações porque tem em conta a ordem
combinations(0,_,[]) :- !.
combinations(N,[H|T],[H|R]) :-
  N1 is N-1,
  combinations(N1,T,R).
combinations(N,[_|T],R) :-
  combinations(N,T,R).

% 12. (Permutação)
perm([],[]).
perm(L,[H|R]) :- 
  member(H,L),
  delete(L,H,Z),
  perm(Z,R).

