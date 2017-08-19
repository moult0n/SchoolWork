f = @(x) atan(x.^2+sin(log(1+x.^2)));
a = 0; b = 2;
lim = 10^-4;
N = round(((6/16)*10^4)^(1/2))+1%guarentee round up
[sol,ueb,k] = TrapezoidMethod(f, a,b, N)
approx = integral(f,0,2)
