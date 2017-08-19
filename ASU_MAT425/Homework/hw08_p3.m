tol = 10^-6;
tspan = [1,2];
bc = [1/2,1/3];
n = 1000;
F = @(y) y.^3+y.^2;
DF = @(y) diag(3*y.^2+2*y);
tic
[xNLSM,yNLSM] = nlsm(tspan, tol, bc,n);
toc

tic
[yFDMNL, xFDMNL] = FDM_nonlinear_fun(F,DF, bc, tspan,n);
toc

figure
plot(xNLSM, yNLSM(1,:))
hold on
plot(xFDMNL, yFDMNL)

figure
yError = abs(yNLSM(1,:)-yFDMNL);
plot(xNLSM, yError)

n = [10,100,1000];
[xNLSM,yNLSM] = nlsm(tspan, tol, bc,n(1));
[yFDMNL, xFDMNL] = FDM_nonlinear_fun(F,DF, bc, tspan,n(1));
yErrorStore1 = abs(yNLSM(1,:)-yFDMNL);
xStore1 = xNLSM; 
[xNLSM,yNLSM] = nlsm(tspan, tol, bc,n(2));
[yFDMNL, xFDMNL] = FDM_nonlinear_fun(F,DF, bc, tspan,n(2));
yErrorStore2 = abs(yNLSM(1,:)-yFDMNL);
xStore2 = xNLSM;
[xNLSM,yNLSM] = nlsm(tspan, tol, bc,n(3));
[yFDMNL, xFDMNL] = FDM_nonlinear_fun(F,DF, bc, tspan,n(3));
yErrorStore3 = abs(yNLSM(1,:)-yFDMNL);
xStore3 = xNLSM; 

figure
plot(xStore1,yErrorStore1)
hold on
plot(xStore2,yErrorStore2)
plot(xStore3,yErrorStore3)