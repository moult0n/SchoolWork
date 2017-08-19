syms z
x = [1 2 3 5 6];
y = [4.75 4 5.25 19.75 36];
%%
% 2,3,5
a=4*[((z-3)*(z-5))/((2-3)*(2-5))]
b=5.25*[((z-2)*(z-5))/((3-2)*(3-5))]
c=19.75*[((z-2)*(z-3))/((5-2)*(5-3))]
p1s=a+b+c
p1=double(subs(p1s,z,4))
%%
figure(1)
plot(x,y,'Linewidth',2);
hold on
fplot(p1s,[1 6])
hold off
%%
% 3,5,6
d=5.25*[((z-5)*(z-6))/((3-5)*(3-5))]
e=19.75*[((z-3)*(z-6))/((5-3)*(5-6))]
f=36*[((z-3)*(z-5))/((6-3)*(6-5))]
p1s=d+e+f
p1=double(subs(p1s,z,4))
%%
figure(2)
plot(x,y,'Linewidth',2);
hold on
fplot(p1s,[1 6])
hold off