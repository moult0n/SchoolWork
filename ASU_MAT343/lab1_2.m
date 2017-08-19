%% MAT 343 MATLAB Assignment 1 - Moulton Julien-Lehr TWTH 6:10
% 
%%
%
format short
%% Lab 1 Question 1
% 
A = [2 6; 3 9]
%%
B = [1 2; 3 4]
%%
C = [-5 5; 5 3]
%% Lab 1 Question 2
% *(a)*
X = A+B
%%
Y = B+A
%%
isequal(X,Y)% outputs 1 if true, 0 for false
%%
% *(b)*
X1 = (A+B)+C
%%
X2 = A+(B+C)
%%
isequal(X1,X2) % outputs 1 if true, 0 for false
%% 
% *(c)*
alpha = 5;
X3 = alpha*X
%%
X4 = alpha*Y
%%
isequal(X3,X4)% outputs 1 if true, 0 for false
%% 
% *(d)*
X5 = A*(B+C)
%%
X6 = (A*B)+(A*C)
%%
isequal(X5,X6)% outputs 1 if true, 0 for false
%% 
% *(E)  (i)*
X7 = A*B
%%
X8 = A*C
%%
isequal(X7, X8)% outputs 1 if true, 0 for false
%%
isequal(B, C)% outputs 1 if true, 0 for false
%% 
% *(E)  (ii)*
X9 = A*B
%%
X10 = B*A
%%
isequal(X9,X10)% outputs 1 if true, 0 for false
%% Lab 1 Question 3
%
M = zeros(2,3)
%% 
N = 5*eye(3)
%%
P = 3*ones(2)
%%
Q = triu(ones(3))
%% Lab 1 Question 4
%
G = [A, zeros(2), eye(2); zeros(2), B, zeros(2); eye(2), zeros(2), C]
%% Lab 1 Question 5
% *(a)*
H = zeros(4);
H(1:4,1:4) = G(1:4,1:4)
%%
% *(b)*
G(5,5) = 4
%%
% *(c)*
% The command *G( : , : )* grabs the entire matrix G and outputs it. The
% command *G( , )* outputs nothing.
%%
% *(d)*
%%
% The command *G(7)* grabs the 7th element from the matrix G. The command 
% *G(16)* grabs the 16th element from the matrix. 
G(16)
%%
% *(e)*
%%
% The command *G(12,1)* will produce an error that states that _Index exceeds
% matrix dimensions_.
%%
% *(f)*
%% 
% The *G(G>5)* returns each value in the matrix grater than 5. The command
% *G(G>5) = 100* replaces each value in G greater than 5 with 100. 
%% 
% *(g)*
G(6,:) = [];
G(:,3) = [];
G
%% Lab 1 Question 6
%
A = ones(20);
A(6:15,6:15) = 0;
spy(A)
%%
A(1:5,16:20) = 0;
A(16:20,1:5) = 0;
spy(A)
%% Lab 1 Question 7
A = diag(1:6) + diag(7:11, 1) + diag(12:15, 2)
A = A + triu(A,1)'
%% Lab 1 Question 8
%
A = rand(10);
%%
% *(a)*
A = A*100;
A = fix(A)
%%
% *(b)*
A(10>A) = 0
%%
% *(c)*
A(A>90) = inf
%%
% *(d)*
B = [A((A>30)&(50>A));]
%% Lab 2 Question 1
% *(a)*
n=1000;
A = floor(10*rand(n));
b = sum(A')';
z = ones(n,1);
%%
% The z vector is the exact solution to the Ax = b system because 
%%
%
tic, x = A\b;  toc
%%
%
tic, y = inv(A)*b;  toc
%%
% The method of dividing A by b is faster than inversing A and then 
% multiplying by b.
sum(abs(x-z))
%%
%
sum(abs(y-z))
%%
% Dividing A by b results in a more accurate result.
%% 
% *(b)*
n=2000;
A = floor(10*rand(n));
b = sum(A')';
z = ones(n,1);
tic, x = A\b;  toc
%%
%
tic, y = inv(A)*b;  toc
%%
%
sum(abs(x-z))
%%
%
sum(abs(y-z))
%%
% Dividing A by b is faster and gives a more accurate result for n = 2000.   
%%
%
n=5000;
A = floor(10*rand(n));
b = sum(A')';
z = ones(n,1);
tic, x = A\b;  toc
%%
%
tic, y = inv(A)*b;  toc
%%
%
sum(abs(x-z))
%%
%
sum(abs(y-z))
%%
% Dividing A by b is faster and gives a more accurate result for n = 5000.
%% Lab 2 Question 2
%
n = 100;
A = eye(n,n) - triu(ones(n,n),1);
b = sum(A')';
z = ones(n, 1);
tic, x = A\b; toc
%%
%
tic, y = inv(A)*b; toc
%%
%
sum(abs(x-z))
%%
%
sum(abs(y-z))
%%
% Using the divide method resulted in no difference from z, 100% accuracy, 
% while the inverse method had a difference of 45, 55% accuracy.The method 
% of dividing is more accurate and take less time to complete. 
%% Lab 2 Question 3
%
A = floor(10*rand(6)); 
b = floor(20*rand(6,1))-10;
%%
% *(a)*
x = A\b
%%
% *(b)*
U = [A b];
U = rref(U)
%%
% *(c)*
% The values are rounded to the fourth place to remove very small errors
% from the values for the sake of comparison. The amount of error is
% reflected in the sum of the differences.
j = round(U(:,7),4);
k = round(x,4);
isequal(j, k) %outputs 1 if true, 0 for false
%%
% 
sum(abs(U(:,7)) -  abs(x))
%%
% *(d)*
A(:,3) = A(:,1:2)*[4,3]';
rref([A b])
%%
% There will be no solutions to the problem as the the last row of the
% matrix equals 1 when all of the columns in the row are zero.
%%
% *(e)*
y = floor(20*rand(6,1)) - 10; 
c = A*y;
%%
% We know that the system Ax = c must be consistent because 
%%
%
U = [A c];
rref(U)
%%
% The system will have infinitly many solutions as the the first and second
% rows are the are a combination of the variable for column 3.
%% Lab 2 Question 4
%
A = rand(5);
x = rand(5,1);
functionOutput = myrowproduct(A,x)
%%
%
type myrowproduct.m
%% Lab 2 Question 5
% *(a)*
A = rand(3,4);
B = rand(4,5);
functionOutput1 = rowproduct(A,B)
%%
%
isequal(round(functionOutput1, 5), round((A*B),5))%Rounds matrices to 5 places and then compares the two; 1 for true, 0 for false
%%
% 
type rowproduct.m
%%
% *(b)*
functionOutput2 = columnproduct(A,B)
%%
%
isequal(round(functionOutput2, 5), round((A*B),5)) %Rounds matrices to 5 places and then compares the two; 1 for true, 0 for false
%%
% 
type columnproduct.m











