function [sol] = N1fd(f,x0,h)
sol = (f(x0+h)-f(x0))/(h);
end