format long
syms a x y
F1=x^2+y^2-1;
F2=((x-2)^2/4)+((y-2)^2/9)-a;
F3=a+(3*x^2)/4+x+(8*y^2)/9+(4*y)/9-22/9 ;
limit = 10^(-8);
x_i = [.87,.48,.57];
eq=[F1;F2;F3];
var=[x,y,a];
[p, iter] = nonlinearNewton(x_i, eq, var, limit);
p

%%
b=0.571464843750000;
F1=x^2+y^2-1;
F2=((x-2)^2/4)+((y-2)^2/9)-b;
limit = 10^(-6);
x_i = [1,.5];
eq=[F1;F2];
var=[x,y];
[p, iter] = nonlinearNewton(x_i, eq, var, limit)