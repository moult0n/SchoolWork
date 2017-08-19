%%
% In order to use Newton's Method on the equation $e^-x*sqrt(x^4+1)$ to
% find the local maximum you have to take the first and second derivative;
% repectively $(-(x^4-2*x^3+1)*exp(-x))/(sqrt(x^4+1))$ and 
% $(e^(-x)*((x*(x*(((x-4)*x+2)*x^2+2)-4)+6)*x^2+1))/(x^4+1)^(3/2)$. Since
% local maximums are roots of the first derivative, you can use Newton's
% Method on the first derivative to find the local maximum.
f = @(x) (-(x^4-2*x^3+1)*exp(-x))/(sqrt(x^4+1));
fd = @(x) ((exp(-x)*((x*(x*(((x-4)*x+2)*x^2+2)-4)+6)*x^2+1))/(x^4+1)^(3/2));
[x,step] = NewtonsMethod((10^-5), 1.7, f, fd);
%%
% The number of steps to reach the local maximum:
step
%%
% The local maximum:
x
%%
% Newtons Method code:
type NewtonsMethod.m
