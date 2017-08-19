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


