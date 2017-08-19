f = @(t,y) cos(t);
y0 = 0;
tspan = [0 2*pi];
dt = [.1, .01, .001];

[y,t] = ImprovedEuler(f,y0,tspan,dt(1));
[yE,tE] = forawrdEuler(f,dt(1),tspan,y0);
tExact = 0:dt(1):2*pi; yExact = sin(tExact);

plot(tE, yE, t,y,tExact,yExact,'k-')
axis([0 2*pi -1.2 1.2])
legend('Forward Euler','Improved Euler','Exact Solution')
xlabel('t')
ylabel('Y(t)')
%%

i=1;
[y] = ImprovedEuler(f,y0,tspan,dt(i));
[yE] = forawrdEuler(f,dt(i),tspan,y0);
tExact1 = 0:dt(i):2*pi; 
yExact = sin(tExact1);
ieE1 = abs(yExact-y);
feE1 = abs(yExact-yE);

i=2;
[y] = ImprovedEuler(f,y0,tspan,dt(i));
[yE] = forawrdEuler(f,dt(i),tspan,y0);
tExact2 = 0:dt(i):2*pi; 
yExact = sin(tExact2);
ieE2 = abs(yExact-y);
feE2 = abs(yExact-yE);

i=3;
[y] = ImprovedEuler(f,y0,tspan,dt(i));
[yE] = forawrdEuler(f,dt(i),tspan,y0);
tExact3 = 0:dt(i):2*pi; 
yExact = sin(tExact3);
ieE3 = abs(yExact-y);
feE3 = abs(yExact-yE);

plot(tExact1, ieE1, tExact1,feE1,tExact2, ieE2, tExact2,feE2,tExact3, ieE3, tExact3,feE3)
legend('IE .1','FE .1','IE .01','FE .01','IE .001','FE .001')
xlabel('T')
ylabel('Error')
axis([0 2*pi 0 .1])

