syms x
z = [1 2 3 5 6];
y = [4.75 4 5.25 19.75 36];
plot(z,y,'Linewidth', 2)
hold on
a=4.75*[((x-2)*(x-3)*(x-5))/((1-2)*(1-3)*(1-5))]
b=4*[((x-1)*(x-3)*(x-5))/((2-1)*(2-3)*(2-5))]
c=5.25*[((x-1)*(x-2)*(x-5))/((3-1)*(3-2)*(3-5))]
d=19.75*[((x-1)*(x-2)*(x-3))/((5-1)*(5-2)*(5-3))]
p=a+b+c+d
fplot(p, [1 6])
hold off
