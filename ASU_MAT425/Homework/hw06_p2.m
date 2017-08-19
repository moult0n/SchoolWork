E = @(y,x) .5.*x.^2+.5.*y.^2; 
[t,y]=ode45(@(t,y) [y(2);-y(1)],[0 2*pi],[1 0]);
plot(t,y)
%%
e = E(y(:,1),y(:,2));
plot(t,e)
xlabel('T')
ylabel('E')
%%
plot(y(:,1),y(:,2))
hold on
[t,y]=ode45(@(t,y) [y(2);-y(1)],[0 2*pi],[10 0]);
plot(y(:,1),y(:,2))
[t,y]=ode45(@(t,y) [y(2);-y(1)],[0 2*pi],[5 0]);
plot(y(:,1),y(:,2))
[t,y]=ode45(@(t,y) [y(2);-y(1)],[0 2*pi],[1 1]);
plot(y(:,1),y(:,2))
hold off
legend('E = .5','E = 50','E = 12.5','E = 1')
axis([-10 10 -10 10])
grid on
xlabel('dx')
ylabel('dy')