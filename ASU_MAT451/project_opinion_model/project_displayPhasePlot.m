function displayPhasePlot(c, p, x0)
g = @(t,x) model1(x,c,p);
[tout1,yout1] = ode45(g,[0 100],x0);
plot(yout1(:,1),yout1(:,2))
hold on 
b = [0 p 0 p];
title('Trajectory Plots')
xlabel('X')
ylabel('Y')
grid on
[u, v, x, y] = gen_matrix(p,b,10,c);
quiver(x,y,u,v)
title(['Phase plot: Cnx=' num2str(c(1),'%1.2f'), ' Cny=' num2str(c(2),'%1.2f'),' Cyx=' num2str(c(3),'%1.2f'),' Cxy=' num2str(c(4),'%1.2f')])
xlabel('X')
ylabel('Y')
grid on
axis(b)
end

function sol = model1(x,c,p)
sol = [c(1)*(x(1)/(x(1)+x(2)))*(p-x(1)-x(2))+(c(3)*(x(2)/(x(1)+x(2))))*(x(1))-(c(4)*(x(1)/(x(1)+x(2))))*(x(2));...
    (c(2)*(x(2)/(x(1)+x(2))))*(p-x(2)-x(1))-(c(3)*(x(2)/(x(1)+x(2))))*(x(1))+(c(4)*(x(1)/(x(1)+x(2))))*(x(2))];
end