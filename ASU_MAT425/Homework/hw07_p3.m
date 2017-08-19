tspan = [1,2];
bc = [1/2,1/3];
n=100;
tol = 10^-3;

[t,w] = nlsm(tspan, tol, bc,n);
y = (1+t).^(-1);

plot(t,y,t,w(1,:))
legend('Exact','y(x)')
title('Non-linear Shooting method vs Exact Solution')