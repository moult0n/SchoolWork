syms x
t = [0 10 30 40];
p = [3.04 3.71 5.28 6.08];
x0 = 35;
x1 = 47;
y0 = (t(2)-x)/(t(2)-t(1))*p(1)+(x-t(1))/(t(2)-t(1))*p(2)
y1 = (t(3)-x)/(t(3)-t(2))*p(2)+(x-t(2))/(t(3)-t(2))*p(3)
y2 = (t(4)-x)/(t(4)-t(3))*p(3)+(x-t(3))/(t(4)-t(3))*p(4)
y0s = double(subs(y2,x0))
y1s = double(subs(y2,x1))

