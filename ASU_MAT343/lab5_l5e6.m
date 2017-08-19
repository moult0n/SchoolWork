B = [-1 -1; 1 1];
A = [zeros(2) eye(2); eye(2) B];
%%
% *(a)*
rref(A-eye(4))
%%
%
rref(A+eye(4))
%%
% The dimensions for the eigenspaces are 4x3.
%%
% *(b)*
null(B, 'rat')
%%
% *(c)*
trace(A)
%%
%
det(A)
%%
% A is not defective. The trace and determinant show that A is linearly
% independent but the eigenvalues are linearly dependent.
%%
% *(d)*
format long
c = eig(A)
format short
%%
% The computed values are accurate to 8 digits.
%%
%
[X D] = eig(A);
cond(X)
%%
%
log10(cond(X))
%%
% *(e)*
rank(X)
%%
% No the computed eigenvalues are not independent.
%%
% 
inv(X)*A*X
%%
% The computed matrix X does diagonalize A.


