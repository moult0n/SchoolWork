function [y,t] = ImprovedEuler(f,y0,tspan,h)
t = tspan(1):h:tspan(2);
[m n] = size(t);
y = zeros(m,n);
y(1) = y0;
t(1) = tspan(1);
for i=2:n
    k1 = f(t(i-1),y(i-1));
    k2 = f(t(i),y(i-1)+h*k1);
    y(i) = y(i-1)+.5*h*(k1+k2);
end
end