% 4a) 
pow(X,0) :- !, write(1).
pow(X,1) :- !, write(X).
pow(_,1,Z) :- !, write(Z).
pow(X,Y,Z) :- Y1 is Y-1, X1 is X*Z, pow(X,Y1,X1).
pow(X,Y,Z) :- Y<0,Y1 is Y+1, X1 is Z/X, pow(X,Y1,X1).
pow(X,Y) :- Y1 is Y-1, X1 is X*X, pow(X,Y1,X1).

% 4b)
fac(X,1) :- !, write(X).
fac(X,Y) :- X1 is X*Y, Y1 is Y-1, fac(X1,Y1).
fac(0) :- !, write(1).
fac(1) :- !, write(1).
fac(X) :- X1 is X-1, fac(X,X1).

% 4c)
sum(X,Y) :- X>Y, sum(Y,X).
sum(X,Y) :- Z is X+Y, Y1 is Y-1, sum(X,Y1,Z).
sum(X,X,Z) :- !, write(Z).
sum(X,Y,Z) :- Z1 is Z+Y, Y1 is Y-1, sum(X,Y1,Z1).

% 4d)
div(X,Y) :- div(X,Y,X,0).
div(X,Y,W,Z) :- W<Y,!,write("Resultado="),write(Z),nl,write("Resto="),write(W).
div(X,Y,W,Z) :- W1 is W-Y,Z1 is Z+1, div(X,Y,W1,Z1).
