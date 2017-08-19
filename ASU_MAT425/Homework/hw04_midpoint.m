function [sol] = midpoint(fun,x0,step) % midpoint approx of second derivative
sol = (fun(x0+step)-2*fun(x0)+fun(x0-step))/(step^2);
end