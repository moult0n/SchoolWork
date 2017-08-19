%% Moulton Julien-Lehr MAT423 Lab 1
%
%% Problem 1
% 
format long
%%
% *(i)*
%%
p=3.141592;
p0=3.14;
AbsoluteError= abs(p-p0) % absolute error
%%
RelativeError=abs((p-p0)/p)*100 % relative error
%%
% *(ii)*
%%
p=1000000;
p0=999996;
AbsoluteError= p-p0 % absolute error
%%
RelativeError=((p-p0)/p)*100 % relative error
%%
% *(iiI)*
%%
p=0.000012;
p0=0.000009;
AbsoluteError= p-p0 % absolute error
%%
RelativeError=((p-p0)/p)*100 % relative error
%% Problem 2
%
format long
f = @(x) x.^3-5*x.^2+6*x+.55;
%%
% *(a)*
x=2.73;
FirstTerm = [x^3; 20.3];
SecondTerm = [5*x^2; 37.2];
ThirdTerm = [6*x; 16.3];
fourthTerm = [0.55; 0.55];
rownames = {'exact'; 'chopped'};
T = table(FirstTerm, SecondTerm, ThirdTerm, fourthTerm, 'RowNames', rownames)
y=f(x);
z=-0.05;
RelativeError = abs((y-z)/y)*100
%%
% *(b)*
f1 = @(x) [(x-5)*x+6]*x+.55;
y=f1(x);
z=0.4;
RelativeError = abs((y-z)/y)*100
%%
% *(c)*
%%
% The relative error for part (b) is smaller than the error for part (a).
% Raising x to a power increses the amount of error with in the equation.
%% Problem 3
%
format long
f3 = @(x) ((1/x)-(1/(x+1)));
f4 = @(x) (1/(x*(x+1)));
x=int64(10^16);
%%
% The result of the calcution is zero. You can keep the denomenator seperated 
% out in order to have the greatest possible accuracy. The calculation done
% in double precision yields the same result in MatLab as the correct
% answer (10^-48) is very close to 0.
f3(x)
%%
f4(x)
%% Problem 4
%
%%
% In order to use Newton's Method on the equation exp(-x)sqrt(x^4+1) to
% find the local maximum you have to take the first and second derivative;
% repectively (-(x^4-2x^3+1)exp(-x))/(sqrt(x^4+1)) and 
% (exp(-x)((x(x(((x-4)x+2)x^2+2)-4)+6)x^2+1))/(x^4+1)^(3/2). Since
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
%% Problem 5
%
%%
% *(a)*
%%
% To check if g(x)=9-12/(x^2) will converge near x=1 we need to see if
% absolute value of g'(x) is less than 1. However g'(x)=24/(x^3) which is not less than 1 near x=1.
% This g(x) converges to a false root of 9.
%%
% *(b)*
%%
% Fisrt we check if g(x)=-12/(x^2-9x) will converge near x=1 by looking
% at first derivative. Since g'(x)=24x-108/((x-9)^2*x^2)  and for x=1 
% the absolute value of g'(x) is greater than 1 we know that g(x) will not converge to a root
% near x=1.
%%
% *(c)*
%%
% First we check if g(x)=sqrt(12/(9-x)) will converge near x=1 by
% checking the first derative. Since g'(x)=sqrt(3)*(1/(9-x))^(3/2) and
% for x=1 the absolute value of g'(x) is sqrt(3/2)/16 or ~0.0765466 we now that g(x) will
% converge to a root.
f = @(x) sqrt(12/(9-x));
fixedpoint(10^-4,.9,f)
%%
% Code used for *(c)*
type fixedpoint.m
%% Problem 6
%
f = @(x) x^6-x-1;
a=1;b=2;
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
% Code used. the autonomous function passed into the method are defined
% above.
type BisectionMethod.m
%% Problem 7
%
%%
% In order to find where y=cot(x) and y=x intersect we can use the equation
% f(x)=cot(x)-x=0 and find the roots. Since we are looking for the first
% three positive roots and cot(x) is periodic bound between two asymptotes,
% we can use the first three periods; 0 to pi, pi to 2pi, and 2pi to 3pi.
% Using the bisection method to find the roots with those bounds. However 
% we need to account for the asymptotic behavior of cot(x)-x near 0, pi, 2pi, ..., n*pi. 
% This will break the bisection method and cause it to find a root at an asymptote. 
% Thus the bounds for the second and third root are close to their root.
a=0;b=pi+.1; % bounds of first root
c=3.24;d=3.5; % bounds of second root
e=6.38;g=6.5; % bounds of third root
limit = 10^-5;
f = @(x) cot(x)+(-x);
[x1,s1] = BisectionMethod([a,b],limit,f);
[x2,s2] = BisectionMethod([c,d],limit,f);
[x3,s3] = BisectionMethod([e,g],limit,f);
%% 
% The first root and the rumber of steps to reach it was:
x1
%%
s1
%% 
% The second root and the rumber of steps to reach it was:
x2
%%
s2
%% 
% The third root and the rumber of steps to reach it was:
x3
%%
s3
%%
% The code used for this section is the same for problem 6. The autonomous
% functions passed into the method are defined above.
type BisectionMethod.m