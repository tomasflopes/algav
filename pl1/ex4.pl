% 4a) 
pow(_,0) :- 
  !, 
  write(1).
pow(X,1) :- 
  !, 
  write(X).
pow(X,-1) :- 
  !, 
  X1 is 1/X, 
  write(X1).
pow(X,Y) :- 
  Y>0, 
  X1 is X*X, 
  Y1 is Y-1, 
  pow(X,Y1,X1).
pow(X,Y) :- 
  Y<0, 
  X1 is X*X, 
  Y1 is Y+1, 
  pow(X,Y1,X1).
pow(_,1,Z) :- 
  !, 
  write(Z).
pow(_,-1,Z) :- 
  !,
  Z1 is 1/Z,
  write(Z1).
pow(X,Y,Z) :- 
  Y>0,
  X1 is X*Z, 
  Y1 is Y-1,
  pow(X,Y1,X1).
pow(X,Y,Z) :- 
  Y<0, 
  X1 is X*Z, 
  Y1 is Y+1,
  pow(X,Y1,X1).

% 4b)
fac(X,1) :- 
  !, 
  write(X).
fac(X,Y) :- 
  X1 is X*Y, 
  Y1 is Y-1, 
  fac(X1,Y1).
fac(0) :- 
  !, 
  write(1).
fac(1) :- 
  !, 
  write(1).
fac(X) :- 
  X1 is X-1, 
  fac(X,X1).

% 4c)
sum(X,Y) :- 
  Y >= X, Z is X+Y, 
  Y1 is Y-1, 
  sum(X,Y1,Z).
sum(_,_,Z) :- 
  !, 
  write(Z).
sum(X,Y,Z) :- 
  Z1 is Z+Y, 
  Y1 is Y-1, 
  sum(X,Y1,Z1).

% 4d)
div(X,Y) :- div(X,Y,X,0).
div(_,Y,W,Z) :- 
  W<Y,
  !,
  write("Resultado="),write(Z),nl,
  write("Resto="),write(W).
div(X,Y,W,Z) :- 
  W1 is W-Y,
  Z1 is Z+1, 
  div(X,Y,W1,Z1).
