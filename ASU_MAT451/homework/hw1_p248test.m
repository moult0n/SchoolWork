syms  n x u r k 
f = (r^n*(x))/(1+((r^n-1)/k)*(x))
g = (r^(-n)*(1/x))+((r-1)/(r*k))*((1-r^(-n))/(1-(1/r)))

assume(n > 0)
assume(k > 0)
assume(r > 0)
assume(x > 0)

isequaln(f,1/g)

var = [n,x,r,k];
con = [100, 5000, 2, 7000];
sol1 = subs(f,var,con)
sol2 = subs(g,var,con)
sol1*sol2