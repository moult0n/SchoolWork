format long
limit = eps;
f = @(x) exp(-x^2)-1/(1+4*x^2);
df = @(x) (8*x)/((4*x^2+1)^2)-2*exp(-x^2)*x;
x0 = 1;
[x, step] = NewtonsMethod(limit, x0, f, df);
x1 = x
%%
step
%%
disp('Professors Code ')
[x2, step1] = newton(x0);
x2
%%
step1
%%
difference = abs(x-x1)
