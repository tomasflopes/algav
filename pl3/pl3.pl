% liga(a,c).
% liga(c,g).

% a)
liga(a,b).
liga(a,c).
liga(a,d).
liga(b,e).
liga(b,f).
liga(c,f).
liga(c,g).
liga(d,a).
liga(d,g).
liga(d,h).
liga(d,i).
liga(e,j).
liga(f,a).
liga(f,j).
liga(f,k).
liga(g,f).
liga(g,o).
liga(g,h).
liga(h,d).
liga(h,l).
liga(i,l).
liga(j,m).
liga(j,n).
liga(k,n).
liga(k,p).
liga(l,p).

% b)
dfs(O,D,R) :- dfs(O,D,[O],R).
dfs(O,O,_,[O]).
dfs(O,D,V,[O|R]) :-
  liga(O,X),
  \+member(X,V),
  dfs(X,D,[X|V],R).

% d)
alldfs(O,D,L) :- findall(R,dfs(O,D,R),L).

% e)
best(O,D,L) :-
  alldfs(O,D,R),
  minL(R,L).

minL([L],L).
minL([L|T],R) :-
  minL(T,R), !,
  length(R,L1),
  length(L,L2),
  L1 < L2.
minL([L|_],L).

% f)
dfsN(O,D,N,R) :- dfsN(O,D,[O],N,R).
dfsN(O,O,_,_,[O]).
dfsN(O,D,V,N,[O|R]) :-
  N > 1,
  liga(O,X),
  \+member(X,V),
  N1 is N - 1,
  dfsN(X,D,[X|V],N1,R).

% g
nei(N,R) :- findall(X,liga(N,X),R).

bfs(O,D,L) :- 
  nei(O,N),
  bfs(O,D,N,[],L).
bfs(O,O,_,_,[O]).
bfs(O,D,N,V,[O|R]) :-
  delete(N,O,N1),

