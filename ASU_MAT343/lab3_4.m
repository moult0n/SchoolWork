%% MAT 343 MATLAB Assignment 2 - Moulton Julien-Lehr TWTH 6:10
%
%% Lab 3 Exercise 1
%
E1 = eye(4);
E1([1,3],:) =  E1([3,1],:);
E2 = eye(4);
E2(2,2) = 5;
E3 = eye(4);
E3(4,1) = 7;
%%
%
a = floor(10*rand(4,3))
%%
% The E1 elemtary matrix flip the first and thrid values in each column.
E1*a
%%
% The E2 elementary matrix multiplies every value in the second row by
% five.
E2*a
%%
% The E3 elementary matrix adds seven times the first row to the third row.
E3*a
%% 
% In general the elementary matrices do some kind of operation on the
% original matrix.
%% Lab 3 Exercise 2
%
%%
% *(a)*
A = [1 -2 3; 2 -6 5; -1 -4 0];
E1 = eye(3);
E1(3,1) = 1;
E2 = eye(3);
E2(2,1) = -2;
E3 = eye(3);
E3(3,2) = -3;
U = E3*E2*E1*A
%%
% *(b)*
L = inv(E1)*inv(E2)*inv(E3)
%%
%
L*U
%%
%
isequal(A, L*U) % 1 for true, 0 for false
%% Lab 3 Exercise 3
%
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
%% Lab 3 Exercise 4
%
A = [2 2 4 6; 1 2 1 4; -4 -3 -7 -8; 2 1 3 3];
b = [6;8;-11;3];
x = [-1;8;1;-2];
%%
% *(a)*
[L,U,P] = lu(A)
%%
%
isequal(P*A, L*U) %Ture is 1 and false is 0
%%
% *(b)*
y = L\(P*b);
x_lu = U\y
%%
% *(c)*
norm(x_lu - x)
%% Lab 3 Exercise 5
%
A = rand(500);
x = ones(500,1);
b = A*x;
%%
% *(a)*
tic; R = rref([A,b]); x_rref = R(:,end); toc
%%
% *(b)* 
tic; [L,U,P] = lu(A); y = L\(P*b); x_lu = U\y; toc
%%
% *(c)*
norm(x_rref - x)
%%
%
norm(x_lu - x)
%%
% Both the solutions from are extremely accurate, but x_lu is slightly more
% accurate.
%% Lab 4 Exercise 1
%
syms x 
p = cos([0:5]'*x)
%%
%
q = expand(p)
%% Lab 4 Exercise 2
%
%%
% By definition a matrix is linearly independent iff the only solution to
% the homogenous matrix is the trivial one. The theorem is true because V
% is subspace of Rn. Therefore in order for all of the functions to exist
% in V all of there corresponding homogenous solution must be with in V by
% definition of a subspace. 
%% Lab 4 Exercise 3
%
%%
% The matrix formed from these vectors must also be linearly independent.
%% Lab 4 Exercise 4
%
syms x 
p = cos([0:5]'*x)
q = expand(p)
%%
%
subs(p,x,2*pi*rand(1))
%%
%
double(subs(p,x,2*pi*rand(1)))
%%
% The soultion shows that none of the values are zero. Therefore the vector
% are linearly independent.
%% Lab 4 Exercise 5
%
syms x 
v = cos([0:5]'*x);
q = expand(p)
f1 = [1 0 0 0 0 0];
f2 = [0 1 0 0 0 0];
f3 = [-1 0 2 0 0 0];
f4 = [0 -3 0 4 0 0];
f5 = [1 0 8 0 8 0];
f6 = [0 5 0 -20 0 16];
f = [f1' f2' f3' f4' f5' f6']
%% Lab 4 Exercise 6
%