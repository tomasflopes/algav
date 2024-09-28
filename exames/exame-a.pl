% voo(IDvoo, O, D, Partida, Chegada).
voo(fr5483,porto,madrid,500,620). 
voo(fr131,porto,colonia,505,690). 
voo(fr8862,porto,malaga,505,635). 
voo(fr9135,porto,paris,550,720). 
voo(fr8348,porto,londres,1085,1210). 
voo(fr1225,madrid,colonia,725,860). 
voo(fr5995,madrid,londres,785,870). 
voo(fr5493,madrid,milao,810,950). 
voo(fr2508,colonia,barcelona,885,995). 
voo(fr8518,colonia,milao,940,1005). 
voo(fr2817,colonia,londres,1015,1015). 
voo(fr4195,milao,londres,1070,1120). 

encontra_voos(Origem,Destino,T,[V]) :- 
  voo(V,Origem,Destino,P,_),
  P =< T.
encontra_voos(Origem,Destino,T,L):-
  voo(V,Origem,X,P,C),
  P =< T,
  T1 is C + 60,
  encontra_voos(X,Destino,T1,L),
  L.append(V).
