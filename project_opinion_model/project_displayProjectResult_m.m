function displayProjectResult_m(c,p,x0)
% cnx = .03; cny = .03; cyx = .02; cxy = .01; 
% c = [cnx cny cxy cyx];
% p = 10000;
% x0 = [500, 500];
g = @(t,x) model1(x,c,p);

hold off
figure(4)
[tout1,yout1] = ode45(g,[0 1000],x0);
u1 = p-yout1(:,1)-yout1(:,2);
for i=1:length(u1)   
    plot(tout1,yout1(i,1),tout1,yout1(i,2),tout1,u1(i))
    hold on
    title(['time t=' num2str(tout1(i),'%1.2f')])
    pause(.001)
end   
grid on
legend('x','y','undecided')
end

function sol = model1(x,c,p)
sol = [c(1)*(x(1)/(x(1)+x(2)))*(p-x(1)-x(2))+(c(3)*(x(2)/(x(1)+x(2))))*(x(1))-(c(4)*(x(1)/(x(1)+x(2))))*(x(2));...
    (c(2)*(x(2)/(x(1)+x(2))))*(p-x(2)-x(1))-(c(3)*(x(2)/(x(1)+x(2))))*(x(1))+(c(4)*(x(1)/(x(1)+x(2))))*(x(2))];
end