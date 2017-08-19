%% Lab 2 - Moulton Julien-Lehr - MTuWThF 11:50 AM - 1:10 PM
%
%%
%
format compact
%% Exercise 1
%
A = [1 4 2;2 5 8; 3 6 9];
B = [1 2 3; 4 5 6; 7 8 9];
b = [4 23 27]';
c = [4 3 2];
d = [1 2 3]';
%%
% *(a)*
A*B
%%
%
B*A
%%
%
c*B
%%
% 
A*d
%%
% *(b)*
C = [A B]
%%
%
D = [ B; c]
%%
% *(c)*
x=b\A
%%
% *(d)*
A(2,3) = 0
%%
% *(e)*
A(3,:)
%%
% *(f)*
B(3,:)=[]

%% Exercise 2
%
%%
% *(a)*
type l2e2a.m
l2e2a(3,.5,10)
%%
% *(b)*
type l2e2b.m
l2e2b(3,.5,10)
%% Exercise 3
%
%%
% *(a)*
type l2e3a.m
run l2e3a.m
%%
% *(b)*
prod(linspace(1,19,10))
%% Exercise 4
%
type l2e4s.m
run l2e4s.m
%% Exercise 5
%
type f.m
%%
%
f(1)
%%
%
f(4)
%%
%
f(7)
%%
%
f(10)

