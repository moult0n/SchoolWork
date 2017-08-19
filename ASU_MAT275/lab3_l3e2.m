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