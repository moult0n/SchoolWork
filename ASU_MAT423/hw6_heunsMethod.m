function [sol,y] = heunsMethod(f,h,x,y0)
mesh = x(1):h:x(2);
[m n] = size(mesh);
y = zeros(m,n);
y(1) = y0;
mesh(1) = x(1);
for i=2:n
    a = f(mesh(i-1), y(i-1));
    y(i) = y(i-1)+(h/2)*(a+f(mesh(i),y(i-1)+h*a));
end
sol = y(n);
end