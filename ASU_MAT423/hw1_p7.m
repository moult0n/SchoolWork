%%
% In order to find where y=cot(x) and y=x intersect we can use the equation
% f(x)=cot(x)-x=0 and find the roots. Since we are looking for the first
% three positive roots and cot(x) is periodic bound between two asymptotes,
% we can use the first three periods; 0 to pi, pi to 2pi, and 2pi to 3pi.
% Using the bisection method. However we need to account for the fact that
% we are subtracting two numbers that are very close to each other. along
% with the asymptotic behavior of cot(x)-x near 0, pi, 2pi, ..., n*pi. If
% the bounds are too broad the bisection method gets caught at one of the
% asymptotes bounding each root.
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