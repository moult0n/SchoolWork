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