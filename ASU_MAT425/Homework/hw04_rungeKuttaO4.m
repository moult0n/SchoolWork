function [z, y, mesh] = rungeKuttaO4(f,h,x,y0)
mesh = x(1):h:x(2);
[m n] = size(mesh);
y = zeros(m,n);
y(1) = y0;
mesh(1) = x(1);
for i=2:n
    k1 = h*f(mesh(i-1),y(i-1));
    k2 = h*f(mesh(i-1)+.5*h,y(i-1)+.5*k1);
    k3 = h*f(mesh(i-1)+.5*h,y(i-1)+.5*k2);
    k4 = h*f(mesh(i-1), y(i-1)+k3);
    y(i) = y(i-1)+(1/6)*(k1+2*k2+2*k3+k4);
end
z = y(n);
end
