function [sol] = N2fd(f,x0,h)
sol = (2*f(x0+h)-(3/2)*f(x0)-(1/2)*f(x0+2*h))/(h);
end