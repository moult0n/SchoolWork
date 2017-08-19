clear
clc
format short
format compact

f1 = @(x) sin(x);
f2 = @(x) tan(x);
f3 = @(x) sin(x)./x;
lim = 10^(-6);
disp('A.)');
f1sol = romberg(f1,0,pi/2,lim)
%%
disp('B.)');
f2sol = romberg(f2,0,1.553343, lim)
%%
disp('C.)');
f3sol = romberg(f3,.00001, pi, lim)

integral(f3, 0, pi)