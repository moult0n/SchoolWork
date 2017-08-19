f = @(x) log(1+x.^2);
a = 0; b = 1;
lim = 10^-5;
actN = ((((b-a)^3)*(1/12)*(2))/lim)^(1/2)
N = round(actN)+1%guarentee round up
[sol,ueb, fXi] = TrapezoidMethod(f, a,b, N)
approx = integral(f,0,1)
err = abs(approx-sol)