clear
clc
format long
fy = @(t,v) v;
dv = @(t,y,v) -2*t^2*v-y+t;
%%
% Exact Solution
syms y(t)
[V] = odeToVectorField(diff(y, 2) == (-2*t^2)*diff(y) - y + t);
M = matlabFunction(V,'vars', {'t','Y'});
[t, y]  = ode45(M,[0 .2],[0 1]);
exactSol = y(:,2);
disp('Matlab ode45 solution')
exactSol(length(exactSol))
%%
% Forward Euler
disp('Forward Euler Solution')
h = .1;
y0 = 0;
dy0 = 1;
x = [0 .2];
mesh = x(1):h:x(2);
[m, n] = size(mesh);
y = zeros(m,n);
dy = zeros(m,n);
y(1) = y0;
dy(1) = dy0;
mesh(1) = x(1);
for i=2:n
   y(i) = y(i-1)+h*fy(mesh(i-1),y(i-1));
   dy(i) = dy(i-1)+h*dv(mesh(i-1), dy(i-1), y(i-1));
end
y; % y solution
dy; %dy solution (solution to problem)
%%
disp('Derivitive solution')
soly = y(n)
disp('Solution')
soldy = dy(n)
%%
% Backward Solution
