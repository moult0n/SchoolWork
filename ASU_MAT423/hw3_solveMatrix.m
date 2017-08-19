function [y]=solveMatrix(y,a,x)
%%
% The function solveMatrix solves the equation sum(a(j)*exp(j*x(i)) for j=1
% to j=5. This function will only solve for the problem 4 from homework 4
% and only up to the 5th equation. However it can be modified to solve past
% the fifth equation by adding to line 8 and changing the passed in o
% vector from the diver file. The function works on the basis that any j
% value grater than k i s0 in the o vector.
for i=1:901
    y(i)=a(1)*exp(x(i))+a(2)*exp(2*x(i))+a(3)*exp(3*x(i))+a(4)*exp(4*x(i))+a(5)*exp(5*x(i));
end
end