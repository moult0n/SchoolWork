function [z, y] = forawrdEuler(f,h,x,y0)
% this is meant to be used on FODE, with 2 variables
% x is the mesh length, from x0 to the value to be approximated
% h is the mesh size
% f is the ODE

mesh = x(1):h:x(2);
[m n] = size(mesh);
y = zeros(m,n);
y(1) = y0;
mesh(1) = x(1);
for i=2:n
    y(i) = y(i-1)+h*f(mesh(i-1),y(i-1));
end
z = y(n);
end