format long
syms z
xi=[1 3 5 7 10];
y=[2.2 5 5.5 6.1 6.6];
plot(xi,y,'Linewidth', 2)
hold on
A = [1 -2.2; 3 -5; 5 -5.5; 7 -6.1;10 -6.6]
b = [2.2 15 27.5 42.7 66]'

x=(A'*A)\(A'*b)
eq = (x(1)*z)/(x(2)+z);
fplot([eq], [1,10])
hold off