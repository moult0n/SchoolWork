function [sol, y] = backwardEuler(f,h,x,y0)
% this is meant to be used on FODE, with 2 variables
% x is the mesh length, from x0 to the value to be approximated
% h is the mesh size
% f is the solved for implicit method, use symbolic lab to solve for if
%   needed
% y_{i+1}=y_i+h*f(x_{i+1},y_{i+1})

mesh = x(1):h:x(2);
[m n] = size(mesh);
y = zeros(m,n);
y(1) = y0;
mesh(1) = x(1);
for i=2:n
   y(i) = f(mesh(i-1),y(i-1)); 
end
sol = y(n);
end