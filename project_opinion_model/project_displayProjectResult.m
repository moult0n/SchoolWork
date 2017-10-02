function displayProjectResult(c,p,x0)
g = @(t,x) model1(x,c,p);
[tout1,yout1] = ode45(g,[0 100],x0);
u1 = p-yout1(:,1)-yout1(:,2);
plot(tout1,yout1(:,1),tout1,yout1(:,2),tout1,u1)
title('Solution')
xlabel('Time')
ylabel('Population')
grid on
legend('x','y','undecided')
end

function sol = model1(x,c,p)
sol = [c(1)*(x(1)/(x(1)+x(2)))*(p-x(1)-x(2))+(c(3)*(x(2)/(x(1)+x(2))))*(x(1))-(c(4)*(x(1)/(x(1)+x(2))))*(x(2));...
    (c(2)*(x(2)/(x(1)+x(2))))*(p-x(2)-x(1))-(c(3)*(x(2)/(x(1)+x(2))))*(x(1))+(c(4)*(x(1)/(x(1)+x(2))))*(x(2))];
end