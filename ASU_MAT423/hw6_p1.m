clear
clc
format long
syms yn yn1 tn tn1
f = @(x,y) -100*y+x;
y0 = 1;
h = .1;
x = [0 .3];
[solf, yf] = forawrdEuler(f,h,x,y0)
%%
% backward
fun = @(x,y) (y+h*(x+h))/(11);
[solb, yb] = backwardEuler(fun, h, x, y0)
%%
%
t = .3;
disp('Actual Sol')
actSol = ((100*t)+10001*exp(-100*t)-1)/(10000)
disp('Relative Error forward eulers')
frer = (abs(actSol-solf))/actSol*100
disp('Relative Error backward eulers')
brer = (abs(actSol-solb))/actSol*100
disp('Forward t = 1')
x = [0 1];
[solf1, yf1] = forawrdEuler(f,h,x,y0);
solf1
disp('Backward t=1')
[solb1, yb1] = backwardEuler(fun, h, x, y0);
solb1
disp('Exact solution for t=1')
t=1;
actSol = ((100*t)+10001*exp(-100*t)-1)/(10000)