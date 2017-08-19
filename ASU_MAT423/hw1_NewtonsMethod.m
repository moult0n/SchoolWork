function [x,step] = NewtonsMethod(limit,x,f,fd)
%%
% Finds the roots of an equation using Newton's Method. Limit is the
% accuarcy of the solution, x is the initial x value, f is the equation
% that you want to find the root for (needs to be an autonomous function)
% , and fd is the first derivative of the function f (need to be an 
% autonomous function).
x_old = 100; %%initial value, needs to not be near the root
step = 0;
while abs(x_old-x) > limit && x ~= 0
    x_old = x;
    x = x-(f(x)/fd(x));  
    step = step + 1;    
    % fprintf('Iteration %d: x=%.20f\n', step, x); % used to look at every
    % step of the iteration
end
end

