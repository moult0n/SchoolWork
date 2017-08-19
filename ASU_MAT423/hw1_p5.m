%%
% *(a)*
%%
% To check if $g(x)=9-12/(x^2)$ will converge near x=1 we need to see if
% |g'(x)|<1. However $g'(x)=24/(x^3)$ which is not less than 1 near x=1.
% This g(x) converges to a false root of 9.
%%
% *(b)*
%%
% Fisrt we check if $g(x)=-12/(x^2-9x)$ will converge near x=1 by looking
% at first derivative. Since $g'(x)=24x-108/((x-9)^2*x^2)$  and for x=1 
% |g'(x)| is greater than 1 we know that g(x) will not converge to the root
% near x=1.
%%
% *(c)*
%%
% First we check if $g(x)=sqrt(12/(9-x))$ will converge near x=1 by
% checking the first derative. Since $g'(x)=sqrt(3)*(1/(9-x))^(3/2)$ and
% for x=1 |g'(x)| is $sqrt(3/2)/16$ or ~0.0765466 we now that g(x) will
% converge to a root.
f = @(x) sqrt(12/(9-x));
fixedpoint(10^-4,.9,f)
%%
% Code used for *(c)*
type fixedpoint.m
