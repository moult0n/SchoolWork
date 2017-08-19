a     = 0;
b     = 1;
alpha = 2;
beta  = 2;
p = @(x) -1./(x+1);
q = @(x) 2 + 0*x;
r = @(x) (1-x.^2).*exp(-x);
N  = 10-1;
dx = (b-a)/(N+1);
x  = a+dx*(1:N);
A = diag(2+q(x)*dx^2) + diag(-(1-p(x(1:N-1))*dx/2),1) + diag(-(1+p(x(2:N))*dx/2),-1);
vecB = -dx^2*r(x');
vecB(1) = vecB(1)+(1+(p(x(1))/2)*dx)*alpha;
vecB(N) = vecB(N)+(1-(p(x(N))/2)*dx)*beta;
Y = A\vecB;
y_sol = [alpha; Y; beta];
plot([a x b],y_sol')
xlabel('x')
ylabel('y')
title('y''''=p y + q y'' + r, y(a)=alpha,y(b)=beta')
