function [y, t, sol] = RK3(f,dt,tspan,y0)
t = tspan(1):dt:tspan(2);
[m n] = size(t);
y = zeros(m,n);
y(1) = y0;
t(1) = tspan(1);
for i=2:n
    k1 = dt*f(t(i-1),y(i-1));
    k2 = dt*f(t(i-1)+.5*dt,y(i-1)+.5*k1);
    k3 = dt*f(t(i-1)+dt,y(i-1)-k1+2*k2);
    y(i) = y(i-1)+(1/6)*(k1+4*k2+k3);
end
sol = y(n);
end