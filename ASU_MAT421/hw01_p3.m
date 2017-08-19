%% Notes
%
format long
r = @(m,n) m*(2^n);
m1 = 1;
n1 = 127;
realmax = r(m1, n1)
%%
m2 = .5;
n2 = -128;
realmin = r(m2,n2)
%%
eps = 2^-54
%%
m3 = (1-eps)*1;
n3 = 127;
realmax2 = r(m3,n3)
