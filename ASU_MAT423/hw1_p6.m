f = @(x) x^6-x-1;
a=1,b=2;
[x,step] = BisectionMethod([a,b],10^-3,f);
%%
% In order to use the bisection method we have to check that there is a
% sign change between a and b.
f(a)
%%
f(b)
%%
% Since f(a) and f(b) have different signs we know by the intermediate value 
% theorem that the equation must have a root in [a,b] since f is
% continuous.
%%
% Number of steps:
step
%%
% Root:
x
%%
% Code used
type BisectionMethod.m