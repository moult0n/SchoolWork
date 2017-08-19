/* Facts */
event(halloween).
event(thanksgiving).
entre(halloween, chocolate).
entre(thanksgiving, turkey).
side(halloween, candy).
side(halloween, soda).
side(thanksgiving, bread).
side(thanksgiving, pumpkinpie).
ingredient(candy, sugar).
ingredient(candy, foodcoloring).
ingredient(bread, egg).
ingredient(bread, flour).
ingredient(soda, water).
ingredient(soda, syrup).
ingredient(pumpkinpie, pumpkin).
ingredient(pumpkinpie, pie).



/* Rules */
meal(X, Y) :- 
	entre(X, Y);
	side(X, Y).

shoppinglist(X, Y) :-
	meal(X, Z),
	ingredient(Z, Y). 
