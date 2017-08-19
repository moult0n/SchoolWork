function [z, y] = nystromsMethod(f,h,x,y0,y1)

mesh = x(1):h:x(2);
[m, n] = size(mesh);
y = zeros(m,n);
y(1) = y0;
y(2) = y1;
mesh(1) = x(1);
for i = 3:n
    y(i) = y(i-2)+2*h*f(mesh(i-1),y(i-1));
end
z = y(n);
end