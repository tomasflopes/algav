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
