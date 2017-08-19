%% Lab  - Moulton Julien-Lehr - MTuWThF 11:50 AM - 1:10 PM
%
%% Exercise 1
%
f=inline('2*y','t','y');
t=linspace(0,.5,100); y=3*exp(2*t); % defines the exact solution of the ODE
[t50,y50]=euler(f,[0,.5],3, 50); % solves the ODE using Euler with 50 steps
%%
% *(a)*
[t5,y5]=euler(f,[0,.5],3, 5);
[t500,y500]=euler(f,[0,.5],3, 500);
[t5000,y5000]=euler(f,[0,.5],3, 5000);
approximation = [y5(end) y50(end) y500(end) y5000(end)]'; % for table approximation column
N = [5 50 500 5000]'; % for table rows
e5 = (y(end) - y5(end));
e50 = (y(end) - y50(end));
e500 = (y(end) - y500(end));
e5000 = (y(end) - y5000(end));
error = [e5, e50, e500, e5000]'; % for table error column
ratio = [0, e5/e50, e50/e500, e500/e5000]';
T = table(N, approximation, error, ratio) % generates a table with the data
%%
% *(b)*
% Every time the number of steps is increased by 10 the ratio stays about
% the same; around 10. This means that every the step size is divided by 10, so is the error.
% This confirms that Euler's method is of "order h".
%%
% *(c)*
% Euler's method underestimates the solution in this solution because e
% grows exponentially. Thus anytime you predict the next point by using the
% tangent line at the current point you will be getting an underestmation
% of the next point.
%% Exercise 2
%
%%
% *(a)*
figure 
t = 0:.45:10; y = -30:6:42 ; % define grid of values in t and y direction
[T,Y]=meshgrid(t,y); % creates 2d matrices of points in the ty-plane
dT = ones(size(T)); % dt=1 for all points
dY = -2*Y; % dy = -2*y; this is the ODE
quiver(T,Y,dT,dY) % draw arrows (t,y)->(t+dt, t+dy)
axis tight % adjust look
hold on
%%
% *(b)*
tValues = linspace(0,10,200);
yValues = 3*exp(-2.*tValues);
plot(tValues,yValues, 'k-', 'linewidth', 2)
title('Exact Solution')
hold on
%%
% *(c)*
f=inline('-2*y','t','y');
[t8,y8]=euler(f,[0,10],3, 8);
plot(t8,y8,'ro-','linewidth', 2)
axis([0 10 -30 42]) % force axis to match previous graphs
title('Euler’s approximation with N=8')
%%
% *(d)*
figure  
t = 0:.45:10; y = -1:.5:3 ; % define grid of values in t and y direction
[T,Y]=meshgrid(t,y); % creates 2d matrices of points in the ty-plane
dT = ones(size(T)); % dt=1 for all points
dY = -2*Y; % dy = -2*y; this is the ODE
quiver(T,Y,dT,dY); % draw arrows (t,y)->(t+dt, t+dy)
hold on
tValues = linspace(0,10,200);
yValues = 3*exp(-2.*tValues);
f=inline('-2*y','t','y');
[t16,y16]=euler(f,[0,10],3, 16);
plot(tValues,yValues, 'k-', t16,y16,'ro-','linewidth', 2)
axis([0 10 -1 3]) % force axis to match direction field
title('Euler’s approximation with N=16')
%% Exercise 3
%
type impeuler.m
%%
%
f=inline('2*y','t','y');
[t5,y5] = impeuler(f,[0,.5],3,5);
%%
%
[t5,y5]
%% Exercise 4
%
%%
% *(a)*
f=inline('2*y','t','y');
t=linspace(0,.5,100); 
y=3*exp(2*t); 
[t5,y5]=impeuler(f,[0,.5],3, 5);
[t50,y50]=impeuler(f,[0,.5],3, 50);
[t500,y500]=impeuler(f,[0,.5],3, 500);
[t5000,y5000]=impeuler(f,[0,.5],3, 5000);
approximation = [y5(end) y50(end) y500(end) y5000(end)]'; % for table approximation column
N = [5 50 500 5000]'; % for table rows
e5 = (y(end) - y5(end));
e50 = (y(end) - y50(end));
e500 = (y(end) - y500(end));
e5000 = (y(end) - y5000(end));
error = [e5, e50, e500, e5000]'; % for table error column
ratio = [0, e5/e50, e50/e500, e500/e5000]';
T = table(N, approximation, error, ratio) % generates a table with the data
%%
% *(b)*
% Every time the number of steps is multiplied by 10 the ratio stay about
% the same at 100. Therefore every time the step size is divided by 10
% the error is divided by 100. This confirms that improved Euler's method
% is of order h sqaured.
%% Exercise 5
%
%%
% *(a)*
figure 
t = 0:.45:10; y = -30:6:42 ; % define grid of values in t and y direction
[T,Y]=meshgrid(t,y); % creates 2d matrices of points in the ty-plane
dT = ones(size(T)); % dt=1 for all points
dY = -2*Y; % dy = -2*y; this is the ODE
quiver(T,Y,dT,dY) % draw arrows (t,y)->(t+dt, t+dy)
axis tight % adjust look
hold on
%%
% *(b)*
tValues = linspace(0,10,200);
yValues = 3*exp(-2.*tValues);
plot(tValues,yValues, 'k-', 'linewidth', 2)
title('Exact Solution')
hold on
%%
% *(c)*
f=inline('-2*y','t','y');
[t8,y8]=impeuler(f,[0,10],3, 8);
plot(t8,y8,'ro-','linewidth', 2)
axis([0 10 -30 42]) % force axis to match previous graphs
title('Improved Euler’s approximation with N=8')
%%
% *(d)*
figure  
t = 0:.45:10; y = -1:.5:3 ; 
[T,Y]=meshgrid(t,y); 
dT = ones(size(T)); 
dY = -2*Y; 
quiver(T,Y,dT,dY); 
hold on
tValues = linspace(0,10,200);
yValues = 3*exp(-2.*tValues);
f=inline('-2*y','t','y');
[t16,y16]=impeuler(f,[0,10],3, 16);
plot(tValues,yValues, 'k-', t16,y16,'ro-','linewidth', 2)
axis([0 10 -1 3]) % force axis to match direction field
title('Improved Euler’s approximation with N=16')
%%
% *Comparison*
% The results from N=8 are wildly off, while the results from N=16 are
% significantly more accurate than there counterpart using Euler's method.
