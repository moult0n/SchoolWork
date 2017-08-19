tspan = [0,1];
bc = [0,2];
n=1000;

tic
[omega, mesh] = lsm(tspan, bc, n);
toc

y = (exp(2)/(exp(4)-1))*(exp(2.*mesh)-exp(-2.*mesh))+mesh;

figure
plot(mesh, y, mesh, omega(1,:), mesh, omega(2,:))
legend('exact','y(x)','dy(x)');
title('Solution')

figure
error = abs(y-omega(1,:));
plot(mesh, error)
legend('Error')
title('Error vs Time')