a = 1; b = 2;
limit = 10^-4;
f = @(x) x^2-3;
[x,step,fa,fb,fm] = BisectionM( a,b,limit,f );
%%
x
%%
step
%% 
fm
%%
fa
%%
fb