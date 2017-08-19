syms a x y
F1=x^2+y^2-1;
F2=((x-2)^2/4)+((y-2)^2/9)-a;
F3=a+(3*x^2)/4+x+(8*y^2)/9+(4*y)/9-22/9 ;
limit = 10^(-6);
x_i = [.87,.49,.57];
eq=[F1;F2;F3];
var=[x,y,a];

J = jacobian(eq, var)
x_old=(ones(size(x_i))*1000)
x_old=x_i
J_s=double(subs(J,var,x_i))
f_s=double(subs(eq,var,x_i))
z=(J_s^-1)*(-f_s)
x=transpose(z)+x_old