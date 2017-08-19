function [sol, ueb, fXi] = TrapezoidMethod(f, a,b, N)
h = (b-a)/N;
map1 = a:h:b-h; % mapping for xi
map2 = a+h:h:b; % mapping for xi+1
sol = sum(arrayfun(f,map1)+arrayfun(f,map2))*h*.5; % sum the values of f(xi)+f(xi+1) and multiply by h/2
fXi = max(abs(arrayfun(@(x) midpoint(f, x, h), a:h:b)));
ueb = fXi*((b-a))*(1/12)*h^2;
end

function [sol] = midpoint(fun,x0,step) % midpoint approx of second derivative
sol = (fun(x0+step)-2*fun(x0)+fun(x0-step))/(step^2);
end