/* Rule */
count3([X], P, Z, N) :-
	X =:= 0 -> P=P+1;
	X > 0 -> Z=Z+1;
	X < 0 -> N=N+1.
count3([H|T], P, Z, N):-
	count3(H,P,Z,N),
	count3(T,P,Z,N).

