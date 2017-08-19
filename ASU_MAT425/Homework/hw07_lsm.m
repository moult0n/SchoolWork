function [omega, mesh] = lsm(tspan, bc, n)
p = @(x) 0;
q = @(x) 4;
r = @(x) -4*x;
a = tspan(1);
b = tspan(2);
alpha = bc(1);
beta = bc(2);
dx = (b-a)/(n+1);
u = zeros(2, n+1);
v = zeros(2, n+1);
omega = zeros(2, n+1);
mesh = zeros(1,n+1);
u(1,1) = alpha;
u(2,1) = 0;
v(1,1) = alpha;
v(2,1) = 1;
k = zeros(4,2);
m = zeros(4,2);

for i=1:n
    x = a+i*dx;
    
    k(1,1) = dx*u(2,i);
    k(1,2) = dx*(p(x)*u(2,i)+q(x)*u(1,i)+r(x));
    k(2,1) = dx*(u(2,i)+.5*k(1,2));
    k(2,2) = dx*(p(x+.5*dx)*(u(2,i)+.5*k(1,2))+q(x+.5*dx)*(u(1,i)+.5*k(1,1))+r(x+.5*dx));
    k(3,1) = dx*(u(2,i)+.5*k(2,2));
    k(3,2) = dx*(p(x+.5*dx)*(u(2,i)+.5*k(2,2))+q(x+.5*dx)*(u(1,i)+.5*k(2,1))+r(x+.5*dx));
    k(4,1) = dx*(u(2,i)+k(3,2));
    k(4,2) = dx*(p(x+dx)*(u(2,i)+k(3,2))+q(x+dx)*(u(1,i)+k(3,1))+r(x+dx));
    
    u(1,i+1) = u(1,i)+(1/6)*(k(1,1)+2*k(2,1)+2*k(3,1)+k(4,1));
    u(2,i+1) = u(2,i)+(1/6)*(k(1,2)+2*k(2,2)+2*k(3,2)+k(4,2));
    
    m(1,1) = dx*v(2,i);
    m(1,2) = dx*(p(x)*v(2,i)+q(x)*v(1,i)+r(x));
    m(2,1) = dx*(v(2,i)+.5*m(1,2));
    m(2,2) = dx*(p(x+.5*dx)*(v(2,i)+.5*m(1,2))+q(x+.5*dx)*(v(1,i)+.5*m(1,1)));
    m(3,1) = dx*(v(2,i)+.5*m(2,2));
    m(3,2) = dx*(p(x+.5*dx)*(v(2,i)+.5*m(2,2))+q(x+.5*dx)*(v(1,i)+.5*m(2,1)));
    m(4,1) = dx*(v(2,i)+m(3,2));
    m(4,2) = dx*(p(x+dx)*(v(2,i)+m(3,2))+q(x+dx)*(v(1,i)+m(3,1)));
    
    v(1,i+1) = v(1,i)+(1/6)*(m(1,1)+2*m(2,1)+2*m(3,1)+m(4,1));
    v(2,i+1) = v(2,i)+(1/6)*(m(1,2)+2*m(2,2)+2*m(3,2)+m(4,2));  
end

omega(1,1) = alpha;
omega(2,1) = (beta-u(1,n+1))/(v(1,n+1));
mesh(1) = a;

for j=2:n+1
    omega(1,j) = u(1,j)+omega(2,1)*v(1,j);
    omega(2,j) = u(2,j)+omega(2,1)*v(2,j);
    mesh(j) = a+j*dx;
end
end