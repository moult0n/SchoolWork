g = @(t,x,a,b,y) [x(1)*(1-a*x(1))-b*x(1)*x(2); y*x(1)*x(2)-x(2)];
u0 = .8; v0 = .8;
ti = 0; tf = 30;
tspan = [ti tf];
ic = [u0, v0];
a = [1 1 0 1];
b = [1 1 .1 1];
y = [1 5 1 50];
for i = 1:4
    figure
    [t,x] = ode45(@(t,x) g(t,x,a(i),b(i),y(i)), tspan, ic);
    plot(t,x(:,1),'y-',t,x(:,2),'b-')
    p = sprintf('\\alpha = %d, \\beta = %d, \\gamma = %d', a(i), b(i), y(i));
    title(p)
    grid on
    figure
    plot(x(:,1),x(:,2),'-')
    p = sprintf('Phase Plot %d', i);
    title(p)
    grid on
end


