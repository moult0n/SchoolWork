function [z, y, t] = RK4P(f,h,x,y0)
%% Runge-Kutta Order 4 (Portable Version)
% To use passing in a function, initial condition, step size and bounds
%
% INPUT
% f: function (needs to variables in the form (t,y)
% h: initial condition
% x: bounds, pass in as [initial condition, final point]
% y0: initial condition
%
% OUTPUT
% z: solution at final point
% y: y solutions
% mesh: x solution

t = x(1):h:x(2);
[m n] = size(t);
y = zeros(m,n);
y(:,1) = y0;
t(1) = x(1);
for i=2:n
    k1 = h*f(t(i-1),y(:,i-1));
    k2 = h*f(t(i-1)+.5*h,y(:,i-1)+.5*k1);
    k3 = h*f(t(i-1)+.5*h,y(:,i-1)+.5*k2);
    k4 = h*f(t(i-1), y(:,i-1)+k3);
    y(i) = y(:,i-1)+(1/6)*(k1+2*k2+2*k3+k4);
end
z = y(:,n);
end
