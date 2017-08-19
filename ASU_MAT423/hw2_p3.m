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
tic, [k3, l3] = gaussianPivoted(A,b,6); toc;
13