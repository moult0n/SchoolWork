f = @(t,y) (cos(y-t))/(10^-3+(cos(t)).^2);
y0 = 0;
tspan = [0,5];
eps = 10^-2;
dt = 10^-1;

tic
[TOUT,YOUT] = ode45(f,tspan,y0);
toc

tic
[y,t] = IEdyn(f, dt, y0, tspan, eps);
toc

tic
[yE,tE] = forawrdEuler(f,.01,tspan,y0);
toc

tic
[yE1,tE1] = forawrdEuler(f,dt,tspan,y0);
toc

plot(TOUT,YOUT,'k-',t,y,'r-',tE,yE,'-',tE1,yE1,'-')
axis([0 5 0 7])
legend('ODE45','Dynamic Improved Euler','Forward Euler h = .01','Forward Euler h = .1','Location','southeast')

