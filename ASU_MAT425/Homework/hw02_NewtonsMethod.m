function [x,step,sol] = NewtonsMethod(limit,x,f,fd)
%%
% Finds the roots of an equation using Newton's Method. Limit is the
% accuarcy of the solution, x is the initial x value, f is the equation
% that you want to find the root for (needs to be an autonomous function)
% , and fd is the first derivative of the function f (need to be an 
% autonomous function).
x_old = 100; %%initial value, needs to not be near the root
step = 0;
sol = x;
while abs(x_old-x) > limit && x ~= 0
    x_old = x;
    x = x-(f(x)/fd(x));  
    step = step + 1; 
    sol = [sol, x];
end
end

