function [x,step] = fixedpoint(limit, x,f)
%%
% Finds the root of equation using fixed point iteration. The limit is the 
% accuracy of the solution, x is the inital point, and f is autonomous 
% function that you want to the root of.
step=0;
x_old = 100;
while abs(x_old-x) > limit && x ~= 0
    x_old = x;
    x = f(x);
    step = step+1;
    residual = abs(x_old-x)
end
end

