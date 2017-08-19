%WARNING HUGE OVERHEAD 
f = @(n,x,r,k) (r.^n.*(x))/(1+((r.^n-1)./k).*(x));
g = @(n,x,r,k) (r.^(-n).*(1./x))+((r-1)./(r.*k)).*((1-r.^(-n))./(1-(1./r)));

rf = @(n) f(n,5000, 2, 7000);
rg = @(n) g(n,5000, 2, 7000);

n1 = 0:1:5000;
n1 = n1';
nrf = rf(n1);
nrg = rg(n1);
plot(n1,nrf,n1,nrg)

