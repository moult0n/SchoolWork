p = [3,1,2,5,4];
E = eye(length(p));
E = E(p,:)
A = floor(10*rand(5))
%%
% *(a)*
E*A
%%
% The elementary matrix switched row 1 with row 3, switched row 2 with row 
% 1, and switched row 4 with row 5. Left multiplication with the elementary 
% therefore affects the rows of A.
%%
%
A*E
%%
% The elementary matrix switched column 1 with column 3, switched column 2 with column 
% 1, and switched column 4 with column 5. Right multiplication with the 
% elemntary matrix therefore affects the columns of A.
%%
% *(b)*
Ei = inv(E)
%%
%
Et = E.'
%%
% The inverse matrix of E is the same as the transpose matrix of E.