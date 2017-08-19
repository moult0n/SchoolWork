format long 
limit = 10^-4;
f = @(x) sqrt(x+1);
x=1;
[x, step] = fixedpoint(limit, x,f);
x
step