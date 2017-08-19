%%
% Newton
syms x y
F1=x^2+y^2-1;
F2=((x-2)^2/4)+((y-2)^2/9)-1;
limit = 10^(-6);
x_i = [.1,1];
eq=[F1;F2];
var=[x,y];
[p, iter] = nonlinearNewton(x_i, eq, var, limit)
%%
x_i = [.9,-.5];
[p, iter] = nonlinearNewton(x_i, eq, var, limit)
%%
% Chord
x_i = [.1,1];
[p, iter] = chord(x_i, eq, var, limit)
%%
x_i = [.9,-.5];
[p, iter] = chord(x_i, eq, var, limit)
%%
% Time Analysis
tic, [p, iter] = chord(x_i, eq, var, limit); toc;
tic, [p, iter] = nonlinearNewton(x_i, eq, var, limit); toc;
