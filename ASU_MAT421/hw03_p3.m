clear
clc

format long
syms z

x = [1 2 4 5];
y = [0 2 12 21];

a = y(1)*[((z-x(2))*(z-x(3))*(z-x(4)))/((x(1)-x(2))*(x(1)-x(3))*(x(1)-x(4)))]
b = y(2)*[((z-x(1))*(z-x(3))*(z-x(4)))/((x(2)-x(1))*(x(2)-x(3))*(x(2)-x(4)))]
c = y(3)*[((z-x(1))*(z-x(2))*(z-x(4)))/((x(3)-x(1))*(x(3)-x(2))*(x(3)-x(4)))]
d = y(4)*[((z-x(1))*(z-x(2))*(z-x(3)))/((x(4)-x(1))*(x(4)-x(2))*(x(4)-x(3)))]

p1s=a+b+c+d
p1=double(subs(p1s,z,1))
p2=double(subs(p1s,z,2))
p3sol=double(subs(p1s,z,4))
p4=double(subs(p1s,z,5))
sol=double(subs(p1s,z,3))
