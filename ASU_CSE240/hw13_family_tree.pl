/* Database for family. It consists of facts and rules. */

/* Facts */
male(michael).
male(thomas).
	male(ed).
	male(joshua).
	male(aaron).
	female(lindsay).
female(jennifer).
female(lisa).
	female(allison).
	femail(mary).
father_of(mark, beth). /* mark is the father of beth */
	father_of(joshua, ed). 
	father_of(aaron, allison). 
	father_of(ed, jennifer). 
	father_of(ed, michael). 
mother_of(jen, tom). /* jen is the mother of tom */
	mother_of(lindsay, ed). 
	mother_of(mary, allison). 
	mother_of(allison, jennifer). 
	mother_of(allison, michael).


/* Rules */
/* Question 1.0 */
is_male(X) :-
	male(X);
	father_of(X, _).

/*Question 1.2 */
is_female(X) :-
        female(X);
        mother_of(X, _).

/* Question 1.5 */
parent_of(X, Y) :- father_of(X,Y); mother_of(X, Y).

/* Question 1.3 */
grandmother_of(X, Z) :- mother_of(X, Y),
	parent_of(Y, Z).

grandfather_of(X, Z) :- parent_of(Y, Z), father_of(X, Y).
	
/* Question 1.4 */
sibling_of(X, Y) :- parent_of(Z, Y), parent_of(Z, X).

/* Question 1.6 */
descendent_of(X, Y) :-
	parent_of(Y, X).
descendent_of(X, Y) :- 
	parent_of(Y, Z),
	descendent_of(X, Z).

