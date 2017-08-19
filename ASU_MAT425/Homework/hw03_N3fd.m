function [sol] = N3fd(f, x0, h)
sol = [.25*f(x0+4*h)-2*f(x0+2*h)+4*f(x0+h)-(9/4)*f(x0)]/h;
end