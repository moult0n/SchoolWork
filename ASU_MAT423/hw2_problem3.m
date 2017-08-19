%%
% First part of the problem with n=2000.
n=2000;
[A, b] = createMatrix(n);
x=zeros(n,1);
%%
% 
tic, [k1, l1] = guassSeidel(A,b,x,(10^(-6))); toc;
l1
%%
% 
tic, [k2, l2] = jacobi(A,b,x,(10^(-6))); toc;
l2
%%
% 
tic, [k3, l3] = gaussianPivoted(A,b); toc;
13
%%
n=10000;
[A, b] = createMatrix(n);
x=zeros(n,1);
%%
% Part 2 of the problem. Both of these take several minutes to run.
%tic, [k4, l4] = guassSeidel(A,b,x,(10^(-6))); toc;
%l4
%%
% 
%tic, [k5, l5] = jacobi(A,b,x,(10^(-6))); toc;
%l5

