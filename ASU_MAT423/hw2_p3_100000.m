n=10000;
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
