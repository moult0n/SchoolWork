function [omega, x] = linearFinDiff(tspan, bc, n)
p = @(x) -2./x;
q = @(x) 2./(x.^2);
r = @(x) sin(log(x))./(x.^2);
a = tspan(1);
b = tspan(2);
alpha = bc(1);
beta = bc(2);
h = (b-a)/(n+1);
x = a+h;
a(1) = 2+h^2*q(x);
b(1) = -1+(h/2)*p(x);
d(1) = -h^2*r(x)+(1+(h/2)*p(x))*alpha;
for i=2:n-1
    x = a+i*h;
    a(i) = 2+h^2*q(x);
    b(i) = -1+(h/2)*p(x);
    c(i) = -1-(h/2)*p(x);
    d(i) = -h^2*r(x);
end
x = b-h;
a(n) = -1+(h/2)*p(x);
c(i) = -1-(h/2)*p(x);
d(i) = -h^2*r(x)+(1+(h/2)*p(x))*beta;
l(1) = a(1);
u(1) = b(1)/a(1);
z(1) = d(1)/l(1);
for i = 2:n-1
    l(i) = a(i)-c(i)*u(i-1);
    u(i) = b(i)/l(i);
    z(i) = (d(i)-c(i)*z(i-1))/l(i);    
end
l(n) = a(n)-c(n)*u(n-1);
z(n) = (d(n)-c(n)*z(n-1))/l(n);
omega(1) = alpha;
omega(n+1) = beta;
omega(n) = z(n);
for i = n-1:-1:1
    omega(i) = z(i)-u(i)*omega(i+1);
end
x = alpha:h:beta;
end