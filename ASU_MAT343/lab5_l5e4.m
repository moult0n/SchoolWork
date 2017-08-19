format long
A = ones(10)+eye(10);
%%
% *(a)*
%%
% The rank of A-I is one because A-I is just a ten by ten matrix of ones
% thus there will be 9 free variables resulting in a rank of 1.
%%
rank(A-eye(10))
%%
% *(b)*
%%
% The nullity of A-I will be 9. This tells us that there are infinitely
% many solutions to the matrix and 
%%
% *(c)*
%%
% You know that the last eigenvalue must be 11 because based on the rank
% there are nine free variables each with a value of 1. Since the trace of
% A equalled 20 the last eigenvalue will equal 11.
%%
%
trace(A)
%%
% *(d)*
%%
% The eigenvalues are calculated out to 15 digits
e = eig(A)
%%
%
det(A)
%%
% *(e)*
%%
% The product of the eigenvalues is the determinant of A.
%%
%
prod(e)
%%
%
det(a)
%%
% *(f)*
p = poly(A);
%%
%
r = roots(p)
%%
% The computed results are acurate to the tens digit.Using the eig function
% is far more accurate than find the roots of the characteristic
% polynomial.
