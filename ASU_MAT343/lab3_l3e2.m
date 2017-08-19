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